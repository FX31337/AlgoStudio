/*����� ��������� ������ over 1kkk*/


extern bool OneTradeMode		=false;
extern string G1				="----------";
extern bool AllTradeMode		=true;
extern bool op_buyBlock			=true;
extern bool op_sellBlock		=true;
extern bool op_buyLimitBlock	=true;
extern bool op_sellLimitBlock	=true;
extern bool op_buyStopBlock		=true;
extern bool op_sellStopBlock	=true;
extern string G2				="----------";
extern bool writeMatchingArr	=true;

string 		WritePath="C:\\Program Files (x86)\\MetaTrader 4\\tester\\files\\TestAS";
//string 		WritePath="TestMT";

string 		posiStatus;

int 		allCounter			=0, //������� ����������� ������. ������������ ��� �������������� �������� ����������.
			failCounter			=0, //������� ����������� ������� �� ���� ��������.������������ ��� ����� �� ��������.
			setCounter			=0, //������� ����������� ������� �� ���� ��������.������������ ��� ����� �� ��������.
			writeFile, 
			file,
			ticker;

//������� ��� ���� �������� ������
int			paramBidAsk,
			matchType,
			matchLots,		
			matchOpenPrice,
			matchStopLoss,
			matchTakeProfit,
			matchProfit,
			matchClosePrice;

//������� ��� ����������.
double 		arrMatchType[],
			arrMatchLots[],
			arrMatchOpenPrice[],
			arrMatchStopLoss[],
			arrMatchTakeProfit[],
			arrMatchProfit[],
			arrMatchClosePrice[];

//������ ��� ����������			
string 		strMatchType="",
			strMatchLots="",
			strMatchOpenPrice="",
			strMatchStopLoss="",
			strMatchTakeProfit="",
			strMatchProfit="",
			strMatchClosePrice="";

double		openTime,
			closeTime;

//������� � ����������� OrderSend
double 		coeficient[]		={ 0,-1000,-10, -0.99, -0.001, 0.001, 0.99, 10, 1000};
double 		SLTPArray[18]; 		//���� ������ �������� ������.
string 		symbolArray[1];		//���� ���� ������, ���� ����� ����� ��������� ����������.
int 		cmdArary[]			={0,1,2,3,4,5};	//OP_BUY=0,	OP_SELL=1, OP_BUYLIMIT=2,OP_SELLLIMIT=3, OP_BUYSTOP=4,OP_SELLSTOP=5
double 		volumeArray[]		={-100, -1.0, -0.99, -0.1, -0.00001, 0, 0.00001, 0.001, 0.1, 0.99, 1,100};
double 		priceArray[]		={ 0, 0, -100, -1, -0.99, -0.0000001, 0, 0.0000001, 0.99, 1, 100};
int			slippageArray[]		={-100,-1,-0,0,1,100,12354};
string 		commentArray		="";
int 		magicArray			=0;
datetime	expirationArray		=0;
color 		arrow_colorArray	=Black;

int exceptionArray[][];	

int init()
{
	symbolArray[0]	=Symbol();
	priceArray[0]	=Bid;
	priceArray[1]	=Ask;
	
	//�������� ������ ��� ������ �������� ��������� ��� ���� ������.
	if(writeMatchingArr && AllTradeMode)
	{
		paramBidAsk		=FileOpen(WritePath+"paramBidAsk.csv"		,FILE_CSV|FILE_WRITE|FILE_READ,';');
		matchType		=FileOpen(WritePath+"matchType.csv"			,FILE_CSV|FILE_WRITE|FILE_READ,';');
		matchLots		=FileOpen(WritePath+"matchLots.csv"			,FILE_CSV|FILE_WRITE|FILE_READ,';');
		matchOpenPrice	=FileOpen(WritePath+"matchOpenPrice.csv"	,FILE_CSV|FILE_WRITE|FILE_READ,';');
		matchStopLoss	=FileOpen(WritePath+"matchStopLoss.csv"		,FILE_CSV|FILE_WRITE|FILE_READ,';');
		matchTakeProfit	=FileOpen(WritePath+"matchTakeProfit.csv"	,FILE_CSV|FILE_WRITE|FILE_READ,';');
		matchProfit		=FileOpen(WritePath+"matchProfit.csv"		,FILE_CSV|FILE_WRITE|FILE_READ,';');
		matchClosePrice	=FileOpen(WritePath+"matchClosePrice.csv"	,FILE_CSV|FILE_WRITE|FILE_READ,';');
	}
	
	//����������� ������� ��� �� ��...������ �� ��������
	for(int AskArrayIndex=0; AskArrayIndex<ArraySize(coeficient); AskArrayIndex++)
	{
		SLTPArray[AskArrayIndex]=2 + coeficient[AskArrayIndex] * Point;
	}
	for(int BidArrayIndex=ArraySize(coeficient); BidArrayIndex<(ArraySize(coeficient)*2);BidArrayIndex++)
	{
		SLTPArray[BidArrayIndex]=1 + coeficient[BidArrayIndex - ArraySize(coeficient)] * Point;
	}
	
	if(AllTradeMode)
		allTrade();
	if(OneTradeMode)
		oneTrade(0,0,11,10,6,16,0) ;
}

void deinit()
{
	//������ ������ � ����� ��� ���� ������.(������� ������� �������� ��� ��� ������� �� ������������ ��-�� ������)
	int writeParamBidAsk	=FileWrite(paramBidAsk,priceArray[0]+";"+priceArray[0]);
	int writeMatchType		=FileWrite(matchType,strMatchType);
	int writeMatchLots		=FileWrite(matchLots,strMatchLots);
	int writeMatchOpenPrice	=FileWrite(matchOpenPrice,strMatchOpenPrice);
	int writeMatchStopLoss	=FileWrite(matchStopLoss,strMatchStopLoss);
	int writeMatchTakeProfit=FileWrite(matchTakeProfit,strMatchTakeProfit);
	int writeMatchProfit	=FileWrite(matchProfit,strMatchProfit);
	int writeMatchClosePrice=FileWrite(matchClosePrice,strMatchClosePrice);
	
	//Close fle block
	FileClose(paramBidAsk);
	FileClose(matchType);
	FileClose(matchLots);
	FileClose(matchOpenPrice);
	FileClose(matchStopLoss);
	FileClose(matchTakeProfit);
	FileClose(matchProfit);
	FileClose(matchClosePrice);
	FileClose(file);
}

//����� ������� ���������� ����� �� �������� �������
//---------------------------------------------
void oneTrade(int symbolIndex, int cmdIndex, int volumeIndex, int  priceIndex, int slippageIndex, int stopLossIndex, int takeProfitIndex)
{
	string 		symbolOne		=symbolArray[symbolIndex];	
	int 		cmdOne			=cmdArary[cmdIndex];
	double 		volumeOne		=volumeArray[volumeIndex];
	double 		priceOne		=priceArray[priceIndex];
	int 		slippageOne		=slippageArray[slippageIndex];
	double 		stoplossOne		=NormalizeDouble(SLTPArray[stopLossIndex],5);
	double 		takeprofitOne	=NormalizeDouble(SLTPArray[takeProfitIndex],5);
	string 		commentOne		="";
	int 		magicOne		=0;
	datetime 	expirationOne	=0;
	color 		arrow_colorOne	=Black;
								
	ticker=OrderSend(symbolOne, cmdOne, volumeOne, priceOne, slippageOne, stoplossOne, takeprofitOne, commentOne, magicOne, expirationOne, arrow_colorOne);
	errorLog("set");

	if(ticker>0)
	{
		openTime=TimeLocal();
		positionInfo(symbolOne, cmdOne, volumeOne, priceOne, slippageOne, stoplossOne, takeprofitOne, commentOne, magicOne, expirationOne, arrow_colorOne);
		posiStatus="SET(";
		setCounter++;
	}
	
	if(ticker<=0)
	{
		posiStatus="FAIL(";
		failCounter++;
	}
	Print(posiStatus + symbolIndex + "," + cmdIndex + "," + volumeIndex + "," + priceIndex + "," + slippageIndex + "," + stopLossIndex+
						","+takeProfitIndex+") \t"+symbolOne+", "+cmdOne+", "+DoubleToStr(volumeOne,4)+", "+/*price+", "+*/slippageOne+", "+DoubleToStr(stoplossOne,5)+
						", "+DoubleToStr(takeprofitOne,5)+", "+commentOne+", "+magicOne+", "+expirationOne+", "+arrow_colorOne+"\n");
}
//---------------------------------------------

//����� ������� ���������� ��� �������� ������
//---------------------------------------------
void allTrade()
{
	//����������� ������� ��� �� ��...������ �� ��������
	//������� ����� �������
//	for(int AskArrayIndex=0; AskArrayIndex<ArraySize(coeficient); AskArrayIndex++)
//	{
//		SLTPArray[AskArrayIndex]=2 + coeficient[AskArrayIndex] * Point;
//	}
//	for(int BidArrayIndex=ArraySize(coeficient); BidArrayIndex<(ArraySize(coeficient)*2);BidArrayIndex++)
//	{
//		SLTPArray[BidArrayIndex]=1 + coeficient[BidArrayIndex - ArraySize(coeficient)] * Point;
//	}
	
	for(int symbolIndex=0; symbolIndex<ArraySize(symbolArray); symbolIndex++)
	{
		for(int cmdIndex=0; cmdIndex<ArraySize(cmdArary); cmdIndex++)
		{
			//�������� ��� ����������� ������������ �� ������
			if(cmdIndex==0 && !op_buyBlock)			continue;
			if(cmdIndex==1 && !op_sellBlock)		continue;
			if(cmdIndex==2 && !op_buyLimitBlock)	continue;
			if(cmdIndex==3 && !op_sellLimitBlock)	continue;
			if(cmdIndex==4 && !op_buyStopBlock)		continue;
			if(cmdIndex==5 && !op_sellStopBlock)	continue;
			
			FileClose(file);
			file= FileOpen(WritePath+cmdIndex+".csv",FILE_CSV|FILE_WRITE|FILE_READ,';');

			for(int volumeIndex=0; volumeIndex<ArraySize(volumeArray); volumeIndex++)	
			{
				for(int priceIndex=0; priceIndex<ArraySize(priceArray); priceIndex++)	
				{
					for(int slippageIndex=0; slippageIndex<ArraySize(slippageArray); slippageIndex++)
					{
						for(int stopLossIndex=0; stopLossIndex<ArraySize(SLTPArray);stopLossIndex++)
						{
							for(int takeProfitIndex=0; takeProfitIndex<ArraySize(SLTPArray);takeProfitIndex++)
							{	
								string 		symbol		=symbolArray[symbolIndex];	
								int 		cmd			=cmdArary[cmdIndex];
								double 		volume		=volumeArray[volumeIndex];
								double 		price		=priceArray[priceIndex];
								int 		slippage	=slippageArray[slippageIndex];
								double 		stoploss	=NormalizeDouble(SLTPArray[stopLossIndex],5);
								double 		takeprofit	=NormalizeDouble(SLTPArray[takeProfitIndex],5);
								string 		comment		="";
								int 		magic		=0;
								datetime 	expiration	=0;
								color 		arrow_color	=Black;
								
								ticker=OrderSend(symbol, cmd, volume, price, slippage, stoploss, takeprofit, comment, magic, expiration, arrow_color);
								errorLog("set");
								
								if(ticker>0)
								{
									openTime=TimeLocal();
									positionInfo(symbol, cmd, volume, price, slippage, stoploss, takeprofit, comment, magic, expiration, arrow_color);
									posiStatus="SET(";
									setCounter++;
								}
								
								if(ticker<=0)
								{
									posiStatus="FAIL(";
									failCounter++;
								}
								writeFile=FileWrite(file, posiStatus + symbolIndex + "," + cmdIndex + "," + volumeIndex + "," + priceIndex + "," + slippageIndex + "," + stopLossIndex+
													","+takeProfitIndex+") \t"+symbol+", "+cmd+", "+DoubleToStr(volume,4)+", "+/*price+", "+*/slippage+", "+DoubleToStr(stoploss,5)+
													", "+DoubleToStr(takeprofit,5)+", "+comment+", "+magic+", "+expiration+", "+arrow_color+"\n");
							}
						}
					}
				}
			}
			Print("All iteration= " + (setCounter+failCounter) + " Orders set= " + setCounter+ " Orders failed= " + failCounter);
			writeFile=FileWrite(file, "All iteration= " + (setCounter+failCounter) + " Orders set= " + setCounter+ " Orders failed= "+failCounter);
			setCounter=0;
			failCounter=0;
		}
	}
}
//---------------------------------------------

//� ���� ������ ����� ����� ��������� ���������� �� ��������.
//---------------------------------------------
bool exception(int symbolIndex, int cmdIndex, int volumeIndex, int  priceIndex, int slippageIndex, int stopLossIndex, int takeProfitIndex)
{

} 
//---------------------------------------------

//���� ������� ���������� ��� �������� ���������
//�������� �� slippage ���, �� �� ����� �������, �� ������ ������.
//arrow_color ���� �������, �� ���� ���� �����.
//---------------------------------------------
void positionInfo(string symbol, int cmd, double volume, double price, double slippage, double stoploss, double takeprofit, string comment, double magic, double expiration, double arrow_color)
{
		allCounter++;
		//�������� ������ ��������������� �������� ��� ���� ������
		ArrayResize(arrMatchType,		allCounter+1);
		ArrayResize(arrMatchLots,		allCounter+1);
		ArrayResize(arrMatchOpenPrice, 	allCounter+1);
		ArrayResize(arrMatchStopLoss, 	allCounter+1);
		ArrayResize(arrMatchTakeProfit, allCounter+1);
		ArrayResize(arrMatchProfit,		allCounter+1);
		ArrayResize(arrMatchClosePrice, allCounter+1);

		bool inforSelect=OrderSelect(ticker, SELECT_BY_TICKET);
		errorLog("select");
		if(!inforSelect)
			errorOutput(StringConcatenate("Mismatch in operation SELECT ORDER, expected ",true+" real result ",false));
			
		//���������� ������������ ����������� ����������� ��� �������� ���������� ������.
		string infoSymb=OrderSymbol();
		errorLog("symbol");
		if(symbol!=infoSymb)
			errorOutput(StringConcatenate("Mismatch in operation SYMBOL, expected ",symbol+" real result ",infoSymb));
		
		//���������� ��� �������� �������� ���������� ������
		int infoType=OrderType();
		errorLog("type");
		arrMatchType[allCounter]		= cmd;
		strMatchType 					= strMatchType + cmd + ";";
		if(cmd!=infoType)
			errorOutput(StringConcatenate("Mismatch in operation TYPE, expected ",cmd+" real result ",infoType));
		
		//���������� ���������� ����� ��� ���������� ������.
		double infoLot=OrderLots();
		errorLog("lots");
		arrMatchLots[allCounter]		= volume;
		strMatchLots					= strMatchLots+volume+";";
		if(volume!=infoLot)
			errorOutput(StringConcatenate("Mismatch in operation AMOUNT, expected ",volume," real result ",infoLot));
		
		//���������� ���� �������� ��� ���������� ������.
		double infoClPr=OrderOpenPrice();
		errorLog("open price");
		arrMatchOpenPrice[allCounter]	= price;
		strMatchOpenPrice				= strMatchOpenPrice+price+";";
		if(price!=infoClPr)
			errorOutput(StringConcatenate("Mismatch in operation OPENPRICE, expected ",price," real result ",infoClPr));
				
		//���������� �������� ���� �������� ������� ��� ���������� ������ ����������� (stop loss) ��� �������� ���������� ������.
		double infoStopLoss=OrderStopLoss();
		errorLog("stop loss");
		arrMatchStopLoss[allCounter]	= stoploss;
		strMatchStopLoss				= strMatchStopLoss+stoploss+";";
		if(stoploss!=infoStopLoss)
			errorOutput(StringConcatenate("Mismatch in operation STOPLOSS, expected ",stoploss," real result ",infoStopLoss));
		
		//���������� �������� ���� �������� ������� ��� ���������� ������ ������������ (take profit) ��� �������� ���������� ������
		double infoTakeProfit=OrderTakeProfit();
		errorLog("take profit");
		arrMatchTakeProfit[allCounter]	= takeprofit;
		strMatchTakeProfit				= strMatchTakeProfit+takeprofit+";";
		if(takeprofit!=infoTakeProfit)
			errorOutput(StringConcatenate("Mismatch in operation TAKEPROFIT, expected ",takeprofit," real result ",infoTakeProfit));
		
//		//�� ���� ���� ��� ���������
//		//���������� �������� ����� ��� �������� ���������� ������.
//		double infoSwap=OrderSwap();
//		errorLog();
		
		//���������� ����� ���������� �������� � ���������� �������.
		int infoTotal=OrdersTotal();
		errorLog("orders quantity");
		if(infoTotal!=1)
			errorOutput(StringConcatenate("Mismatch in ORDERS QUANTITY, expected ",0," real result ",infoTotal));
		
//		//�� ���� ���� ��� ���������
//		//���������� ���������� �������� ������� � ��������� ������� � ������� �������� �����, ����������� � ���������� ���������.
//		int infoAccTotal=OrdersHistoryTotal();
//		errorLog();
		
		int infoTicket=OrderTicket();
		errorLog("ticket");
		if(ticker!=infoTicket)
			errorOutput(StringConcatenate("Mismatch in ORDER TICKET, expected ",ticker," real result ",infoTicket));
		
		//���������� �������� ������ ������� (��� ����� ������ � ��������) ��� ���������� j��������� ������ ������.
		double infoProfit=OrderProfit();
		errorLog("profit");
		double profit;
		//�������� �� ��� ������. ������ ���� ����� ������� ������ ��� ������ �������. ��� ��������� =0
		if(cmd>1)
			profit=0;
		else if  (price>=Ask)
			profit=NormalizeDouble((OrderClosePrice()-OrderOpenPrice())*OrderLots()*MarketInfo(Symbol(), MODE_LOTSIZE),5);
		else
			profit=NormalizeDouble((OrderOpenPrice()-OrderClosePrice())*OrderLots()*MarketInfo(Symbol(), MODE_LOTSIZE),5);
		
		arrMatchProfit[allCounter]	= profit;
		strMatchProfit				= strMatchProfit+profit+";";
		if(profit!=infoProfit)
			errorOutput(StringConcatenate("Mismatch in PROFIT, expected ",profit," real result ",infoProfit));
		
		//���������� ����� �������� ���������� ������.	
		datetime infoOpTime=OrderOpenTime();
		errorLog("open time");
		if(openTime!=infoOpTime)
			errorOutput(StringConcatenate("Mismatch in OPENTIME, expected ",openTime+" real result ",infoOpTime));
			
		//���������� ����������������� ("����������") ����� ��� ���������� ������.
		int infoMagic=OrderMagicNumber();
		errorLog("magic numder");
		if(magic!=infoMagic)
			errorOutput(StringConcatenate("Mismatch in MAGICNUMBER, expected ",magic+" real result ",infoMagic));
		
		//���������� ���� ��������� ��� ���������� ����������� ������.
		datetime infoExp=OrderExpiration();
		errorLog("expiration");
		if(magic!=infoMagic)
			errorOutput(StringConcatenate("Mismatch in EXPIRATION, expected ",magic+" real result ",infoMagic));
		
		//���������� �������� ������������ �������� ��� ���������� ������.
		double infoComission=OrderCommission();
		errorLog("commision");
		if(infoComission!=0)
			errorOutput(StringConcatenate("Mismatch in COMMISSION, expected ",0+" real result ",infoComission));
		
		//���������� ����������� ��� ���������� ������.
		string infoComment=OrderComment();
		errorLog("comment");
		if(comment!=infoComment)
			errorOutput(StringConcatenate("Mismatch in COMMENT, expected ",openTime+" real result ",infoComment));
		
		//���������� ���� �������� ���������� ������.
		double infoCLPr=OrderClosePrice();
		errorLog("close price");
		double closePrice;
		//�������� �� ��� ������. ���� �������� �� �������� �������� ������ ��� ��������. ��� ��������� =0
		if(cmd>1)
			closePrice=0;
		else if(price>=Ask)
			closePrice=Bid;
		else closePrice=Ask;
		
		arrMatchClosePrice[allCounter]	=closePrice;
		strMatchClosePrice				= strMatchClosePrice+closePrice+";";
		if(closePrice!=infoCLPr)
			errorOutput(StringConcatenate("Mismatch in CLOSE PRICE, expected ",closePrice+" real result ",infoCLPr));
		
		//�������� ������� � �������� �������.
		if(cmd<=1)
		{
			bool close=OrderClose(ticker, OrderLots(), closePrice, 10, White);
			errorLog("close position");
			if(close!=1)
				errorOutput("Order did not close");
			else closeTime=TimeLocal();
		}
		else 
		{
			bool delete=OrderDelete(ticker, White);
			errorLog("delete order");
			if(delete!=1)
				errorOutput("Order did not delete");
		}
		
		//���������� ����� �������� ��� ���������� ������. ������ �������� ������ ����� ����� ��������, �� ������ 0.
		datetime infoClTime=OrderCloseTime();
		errorLog("close time");
		//�������� �� ��� ������. ����� �������� ��������� ������ ��� ��������. ��� ��������� =0
		if(cmd>1)
			closeTime=0;
		if(closeTime!=infoClTime)
			errorOutput(StringConcatenate("Mismatch in CLOSE TIME, expected ",closeTime+" real result ",infoClTime));
}
//---------------------------------------------

//���������� ���� �������� ������ ���������� � positionInfo ������, � ���� ��� ����������
//---------------------------------------------
void errorOutput(string errorText)
{
	if(OneTradeMode)
		Print(errorText);
	if(AllTradeMode)
		writeFile=FileWrite(errorText);
}
//---------------------------------------------

/*����� ��� ����������� ������ ���������� �������
"set"  - ����� ������ ��� ��������� �������
 other - ����� ������ ��� �������� ������� */
//---------------------------------------------
int errorLog(string checkType)
{
	int err=GetLastError();
	if(err!=0)
	{
		if(checkType=="set")
		{
			Print("Order did not set, error: "+ err);
			writeFile=FileWrite(file, "Order did not set, error: "+ err);
		}
		else 
		{
			Print("Error: "+ err+" in "+checkType+" check");
			writeFile=FileWrite(file, "Error: "+ err+" in "+checkType+" check");
		}
	}
}
//---------------------------------------------