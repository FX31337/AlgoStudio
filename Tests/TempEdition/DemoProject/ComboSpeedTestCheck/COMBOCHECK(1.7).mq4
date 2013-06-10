//��� ����������� ����������� ������� � �������� ���� ������ �� �� �� ������ ������������.

/*��� ���������� ����� �������� ���� ����� ���� � ������� ���� ����� �����������
1) �������� ����������� � ����� string separators()
*/



#include <WinUser32.mqh>
extern bool T01_PrimitiveMath1000, T02_PrimitiveMath10000, T03_PrimitiveMath100000,T04_PredefinedVariables1000,
			T05_TimeseriesAccess50,T06_Concatenatio100,T07_TradeFunction,T08_ConversionFunctions50,T09_DateTimeFunctions100,
			T10_GlobalVariable100,T11_AccountInformation100,T12_ArrayFunctions,T13_Checkup100,T14_ClientTerminal10000,T15_CommonFunctions5,
			T16_AllIndicators,T17_CustomIndicator50,T18_MathTrig10000,T19_AllStringFunctions,T20_AllWindowFunctions,T21_ObjectFunctions;

//������������ ���������� ��� ����������-----------------------
bool One_Chose=true;
int Quoute_counter=0;
double Start_time,Stop_Time,Passed_sec,QuotesPerSec,MksPerSec;	
//-------------------------------------------------------------
int file;


//���������� ��� ������� ��������, �� ��� ��� �--------------------------------------------------------------------

// ������������ ��� ������������� � �������� ������� � �������� MQL4.
//��� 20 ��������--------------------------------------------------------------------
//#property indicator_chart_window    // �����. �������� � �������� ����
//#property indicator_buffers 2       // ���������� �������
//#property indicator_color1 Blue     // ���� ������ �����
//#property indicator_color2 Red      // ���� ������ �����
 
double Buf_0[],Buf_1[];             // ���������� �������� (��� ������ ����������)
//--------------------------------------------------------------------
//��� 21 ��������--------------------------------------------------------------------
datetime DT1=D'2013.02.06 9:45:00';
datetime DT2=D'2013.02.06 11:00:00';
datetime DT3=D'2013.02.06 13:15:00';
double Price1=1.35450;
double Price2=1.35550;
double Price3=1.35650;
//--------------------------------------------------------------------


//Tests method-------------------------------------------------------------
void _01_PrimitiveMath1000(){
    for(int n=0; n<1000; n++)
     {
	     int s1=45+123;
	     int s2=4561-2541;
	     int s3=14*86;
	     int s4=4564/153;
     	}
    return;
    }
    
void _02_PrimitiveMath10000(){
	for(int n=0; n<10000; n++)
     {
	     int s1=45+123;
	     int s2=4561-2541;
	     int s3=14*86;
	     int s4=4564/153;
     	}
    return;
    }
    
void _03_PrimitiveMath100000(){
	for(int n=0; n<100000; n++)
     {
	     int s1=45+123;
	     int s2=4561-2541;
	     int s3=14*86;
	     int s4=4564/153;
     	}
    return;
    }
    
void _04_PredefinedVariables1000(){
	for(int i=0; i<1000; i++){
    	double s1=(Ask),s2=(Bid),s3=(Open[0]),s4=(High[0]),s5=(Low[0]),s6=(Close[0]),s7=(Time[0]),s8=(Volume[0]),s9=(Bars), s10=(Digits), s11=(Point);
		}
    return;
    }
    
void _05_TimeseriesAccess50(){
	for(int n=0; n<50; n++)
     {
	     double s1=iClose("111", 0, 0),
	     		s2=iHigh("111", 0, 0),
//	     		s3=iHighest("111", 0, 0), //����� �� ����� ������ ����� �������
	     		shift=iBarShift(Symbol(),0,D'2013.01.03 12:00'),
			    s4=iLow("111", 0, 0),
//	     		s5=iLowest("111", 0, 0),	//����� �� ����� ������ ����� �������
	     		s6=iOpen("111", 0, 0),
	     		s7=iTime("111", 0, 0),
	     		s8=iVolume("111", 0, 0),
	     		s9=iBars("111", 0);
     	}
    return;
    }    
    
void _06_Concatenatio100(){
	for(int n=0; n<100; n++)
     {
	     string s1="rr",s2="ff",s3,s4,s7;
	     s3=s1+s2;
	     s4="111"+"222";
	     string s5=(("333"+"444")+"555");
	     string s6=("!@#"+("   "+"*&^"));
	     s7=s1+s2+s3+s4+s5+s6;
     	}
    return;
    }
    
void _07_TradeFunction(){
	for(int n=0; n<1; n++)
     {
	     string symb=Symbol();
        //������������� ������ �����(��������� �������� �� ��������)
		int i=OrderSend(symb, OP_SELL, 1, Bid, 10, Ask+0.0005, Bid-0.0005, "I dont why it's need", 123456, 0, White);
		//�������� ������������ ����� ��� ���������� ������
		bool j=OrderSelect(i, SELECT_BY_TICKET);
		//���������� ��� �������� �������� ���������� ������
		int q=OrderType();
		//���������� ����� ������ ��� �������� ���������� ������.
		int w=OrderTicket();
		//���������� �������� ���� �������� ������� ��� ���������� ������ ����������� (stop loss) ��� �������� ���������� ������.
		double StopLoss=OrderStopLoss();
		//���������� �������� ���� �������� ������� ��� ���������� ������ ������������ (take profit) ��� �������� ���������� ������
		double TakeProfit=OrderTakeProfit();
		//���������� ������������ ����������� ����������� ��� �������� ���������� ������.
		string Symb=OrderSymbol();
		//���������� �������� ����� ��� �������� ���������� ������.
		double swap=OrderSwap();
		//���������� ����� ���������� �������� � ���������� �������.
		int total=OrdersTotal();
		//���������� ���������� �������� ������� � ��������� ������� � ������� �������� �����, ����������� � ���������� ���������.
		int accTotal=OrdersHistoryTotal();
		//���������� �������� ������ ������� (��� ����� ������ � ��������) ��� ���������� ������.
		double profit=OrderProfit();
		//������� ������ ������ � ������
		OrderPrint();
		//���������� ����� �������� ���������� ������.	
		datetime OpTime=OrderOpenTime();
		//���������� ���� �������� ��� ���������� ������.
		double ClPr=OrderOpenPrice();
		//���������� ����������������� ("����������") ����� ��� ���������� ������.
		int Mag=OrderMagicNumber();
		//���������� ���������� ����� ��� ���������� ������.
		double Lot=OrderLots();
		//���������� ���� ��������� ��� ���������� ����������� ������.
		datetime Exp=OrderExpiration();
		//���������� �������� ������������ �������� ��� ���������� ������.
		double comis=OrderCommission();
		//���������� ����������� ��� ���������� ������.
		string comment=OrderComment();
		//���������� ���� �������� ���������� ������.
		double CLPr=OrderClosePrice();
		//�������� �������.
		bool Clos=OrderClose(i, 1, Ask, 10, White);
		//���������� ����� �������� ��� ���������� ������. ������ �������� ������ ����� ����� ��������, �� ������ 0.
		datetime ClTime=OrderCloseTime();
		//������������� ������ �����(��������� �������� �� ��������)
		int tick=OrderSend(symb, OP_BUYLIMIT, 1, Bid-0.005, 10, Bid-0.0005, Bid+0.0005, "Wats happens?", 987564, 0, White);
		//�������� ������������ ����� ��� ���������� ������
		bool jtick=OrderSelect(tick, SELECT_BY_TICKET);
		//�������� ��������� ����� �������� ������� ��� ���������� �������.
		bool ModTick=OrderModify(tick, 1, 1-0.0005, 1+0.0005, 0, Black);
		//������� ����� ������������� ���������� �����.
		bool delord=OrderDelete(OrderTicket());
		//������������� ������ �����(��������� �������� �� ��������)
		int selli=OrderSend(symb, OP_SELL, 1, Bid, 10, 0, 0);
		//������������� ������ �����(��������� �������� �� ��������)
		int buyi=OrderSend(symb, OP_BUY, 1, Ask, 10, 0, 0);
		//�������� ����� �������� ������� ������ ��������, �������� �� ���� �� ������ �����������, �� � ��������������� �����������.
		bool closeby=OrderCloseBy(selli,buyi);
     	}
    return;
    }    
    
void _08_ConversionFunctions50(){
	    for(int c=0; c<50;c++){
			//�������������� ���� ������� � �������������� ������.
		    for(int i=0; i<257; i++) string j=CharToStr(i);
		    //�������������� ��������� �������� � ��������� ������, ���������� ���������� ������������� ����� � ��������� ������� ��������.
		    string value0=DoubleToStr(1.123456789,8);
		    string value1=DoubleToStr(123456979797,0);
		    string value2=DoubleToStr(1464646464.1234567894,7);
		    string value3=DoubleToStr(0,8);
		    //���������� ����� � ��������� ������� �� ��������� ��������.
		    double norm1=0.12315464987, norm2=12116546464, norm3=45632131.6466464646;
		    double norm11=NormalizeDouble(norm1,7), norm22=NormalizeDouble(norm2,7), norm33=NormalizeDouble(norm3,7);
		    //�������������� ������, ���������� ���������� ������������� �����, � ����� ���� double (������ ������� �������� � ��������� ������).
		    double var1=StrToDouble("1.355");
		    double var2=StrToDouble("145464644.355");
		    double var3=StrToDouble("1.646546464355");
		    //�������������� ������, ���������� ���������� ������������� �����, � ����� ���� int (�����).
		    int varia1=StrToInteger("123123");
		    int varia2=StrToInteger("123123.23434");
		    int varia3=StrToInteger("0");
			//�������������� ������, ���������� ����� �/��� ���� � ������� "yyyy.mm.dd [hh:mi]", � ����� ���� datetime (���������� ������, ��������� � 01.01.1970).
			datetime dt1,dt2,dt3;
			var1=StrToTime("2003.8.12 17:35");
			var2=StrToTime("17:35");      // ������� ������� ���� � ��������� ��������
			var3=StrToTime("2003.8.12");  // ������� ���� � ���������� �������� "00:00"    
			//�������������� ��������, ����������� ����� � ��������, ��������� � 01.01.1970, � ������ ������� "yyyy.mm.dd hh:mi".
			string tts1, tts2, tts3;
			tts1=TimeToStr(135567300,TIME_DATE|TIME_SECONDS);
			tts2=TimeToStr(135565300,TIME_DATE|TIME_MINUTES);
			tts3=TimeToStr(138567300,TIME_DATE|TIME_MINUTES|TIME_SECONDS);
			}
    return;
    } 
    
void _09_DateTimeFunctions100(){
    for(int i=0; i<100; i++){
	    //���������� ������� ���� ������, �.� ���� ������ ���������� ���������� ������� �������.
	    int day=Day();
	    //���������� ���������� ����� ��� ������ (�����������-0,1,2,3,4,5,6) ���������� ���������� ������� �������.
		int dayofweek=DayOfWeek();
		//���������� ������� ���� ���� (1-1 ������,..,365(6) - 31 �������), �.� ���� ���� ���������� ���������� ������� �������.
		int dayofyear=DayOfYear();
	    //���������� ������� ��� (0,1,2,..23) ���������� ���������� ���������� ������� �� ������ ������ ��������� (� �������� ���������� ��������� ��� �������� �� ��������).
	    int hour=Hour();
		//���������� ������� ������ (0,1,2,..59) ���������� ���������� ���������� ������� �� ������ ������ ��������� (� �������� ���������� ��������� ��� �������� �� ��������).
		int minute=Minute();
	   	//���������� ����� �������� ������ (1-������,2,3,4,5,6,7,8,9,10,11,12), �.�. ����� ������ ���������� ���������� ������� �������.
	   	int month=Month();
	   	//���������� ���������� ������, ��������� � ������ ������� ������ ���������� ���������� ���������� ������� �� ������ ������ ��������� (� �������� ���������� ��������� ��� �������� �� ��������).
	   	int sec=Seconds();
	   	//���������� ��������� ��������� ����� ������� (����� ������� ��������� ���������) � ���� ���������� ������, ��������� ����� 00:00 1 ������ 1970 ����.
	   	int Curt=TimeCurrent();
	   	//���������� ���� ������ (1 - 31) ��� ��������� ����.
	   	int Tday=TimeDay(D'2003.12.31');
	   	//���������� ���� ������ (0-�����������,1,2,3,4,5,6) ��� ��������� ����.
	   	int weekday=TimeDayOfWeek(D'2004.11.2');
	   	//���������� ���� (1 - 1 ������,..,365(6) - 31 �������) ���� ��� ��������� ����.
	   	int tdoy=TimeDayOfYear(TimeCurrent());
	   	//���������� ��� ��� ���������� �������.
	   	int th=TimeHour(TimeCurrent());
	   	//���������� ��������� ������������ ����� � ���� ���������� ������, ��������� ����� 00:00 1 ������ 1970 ����.
	   	datetime LocTim=TimeLocal();
	   	//���������� ������ ��� ���������� �������.
	   	int m=TimeMinute(TimeCurrent());
		//���������� ����� ������ ��� ���������� ������� (1-������,2,3,4,5,6,7,8,9,10,11,12).
		int MM=TimeMonth(TimeCurrent());
		//���������� ���������� ������, ��������� � ������ ������ ��� ���������� �������.
		int seco=TimeSeconds(TimeCurrent());
		//���������� ��� ��� ��������� ����. ������������ �������� ����� ���� � ��������� 1970-2037.
		int y=TimeYear(TimeCurrent());
		//���������� ������� ���, �.�. ��� ���������� ���������� ������� �������.
		int year=Year();
		}
    return;
    }
    
void _10_GlobalVariable100(){
	 for (int i=0; i<100; i++){
	    //������������� ����� �������� ���������� ����������. ���� ���������� �� ����������, �� ������� ������� ����� ���������� ����������. 
	    datetime gvs=GlobalVariableSet("x",50);
	//  Print(GetLastError());
		//���������� �������� TRUE, ���� ���������� ���������� ����������, ����� ���������� FALSE.
		bool gvc=GlobalVariableCheck("x");
	//	Print(GetLastError());
		//���������� �������� ������������ ���������� ���������� ��� 0 � ������ ������.
		double gvg=GlobalVariableGet("x");
	//	Print(GetLastError());
		//������� ���������� ����� ���������� ���������� ����������.
		int gvt=GlobalVariablesTotal();
	//	Print(GetLastError());
		//������� ���������� ��� ���������� ���������� �� ����������� ������ � ������ ���������� ����������.
		string name=GlobalVariableName(0);
	//	Print(GetLastError());
		//������������� ����� �������� ������������ ���������� ����������, ���� ������� �������� ���������� ����� �������� �������� ��������� check_value.
		bool gvsoc=GlobalVariableSetOnCondition("x", 60, 50);
	//	Print(GetLastError());
		//������� ���������� ����������. ��� �������� �������� ������� ���������� TRUE, ����� FALSE.
		bool gvd=GlobalVariableDel("x");
	//	Print(GetLastError());
		//������� ���������� ����������. ���� ������� ��� ����� �� �����, �� ��������� ��� ���������� ����������.
		int gvda=GlobalVariablesDeleteAll();
	//	Print(GetLastError());
	}
    return;
    }
    
void _11_AccountInformation100(){
	for(int i=0; i<100; i++){
		//���������� �������� ������� ��������� ����� (����� �������� ������� �� �����).
		double AB=AccountBalance();
		//���������� �������� ������� ��� ��������� �����.
		double AC=AccountCredit();
		//���������� �������� ���������� ��������, � ������� ��������������� ������� ����.
		string ACo=AccountCompany();
		//���������� ������������ ������ ��� �������� �����.
		string ACu=AccountCurrency();
		//���������� ����� ����������� ������� ��� �������� �����. ������ equity ������� �� �������� ��������� �������.
		double AE=AccountEquity();
		//���������� �������� ��������� �������, ����������� ��� �������� ������� �� ������� �����.
		double AFM=AccountFreeMargin();
		//���������� ������ ��������� �������, ������� ��������� ����� �������� ��������� ������� �� ������� ���� �� ������� �����.
		double AFMC=AccountFreeMarginCheck(Symbol(), OP_BUY, 1);
		//����� ������� ��������� �������, ����������� ��� �������� ������� �� ������� �����. ����� ������� ����� ��������� ��������� ��������:
		double AFMM=AccountFreeMargin();
		//���������� �������� ����� ��� �������� �����.
		int AL=AccountLeverage();
		//���������� ����� ��������� �������, ������������ ��� ����������� �������� ������� �� ������� �����.
		double AM=AccountMargin();
		//���������� ��� ������������ �������� �����.
		string AN=AccountName();
		//���������� ����� �������� �����.
		int ANu=AccountNumber();
		//���������� �������� ������� ��� �������� ����� � ������� ������.
		double AP=AccountProfit();
		//���������� ��� ��������� �������.
		string AS=AccountServer();
		//���������� �������� ������, �� �������� ������������ ��������� Stop Out.
		int ASL=AccountStopoutLevel();
		//���������� ����� ������� ������ Stop Out. ����� ������� ����� ��������� ��������� ��������:
		int ASM=AccountStopoutMode();
		}
    return;
    }
    
void _12_ArrayFunctions(){
	for(int n=0; n<1; n++)
     {
	    	string symb=Symbol();
			int  Mas1[4]={4,5,6,8};
			double Mas2[3][4] = { 	9.3, 3.2, 2.1, 1.0, 
									10.1, 20.1, 12.3, 13.4,   
									11.2, 21.2, 22.3, 23.4 };
			string Mas3[2][2][3] ={"q", "w", "e",
									"a", "s", "d",
									
									"r", "t", "y",
									"g", "h", "j",};
			bool Mas4[5] ={1,0,1,0,1};
			int Mas5[4];
			double Mas6[][6];
			int vol[];
			double num_array[15]={4,1,6,3,9,4,1,6,3,9,4,1,6,3,9};
				
			//���������� �������� �������� �� ������� ���������. �������-��������� �� ����� ���� �������������.
			int sortMas2=ArraySort(Mas2);
			//���������� ������ ������� ���������� �������� � ������ ��������� �������.
			int ArBs=ArrayBsearch(Mas2,13.4,0,0,MODE_DESCEND);
			//�������� ���� ������ � ������. 
			int ArCo=ArrayCopy(Mas5, Mas1);
			//�������� � ���������� ������, ���� RateInfo[][6], ������ ����� �������� ������� � ���������� ���������� ������������� �����
		//	int ArCR=ArrayCopyRates(Mas6, symb); //����� ����������� ������ ��� ��������� �������������
			//�������� ������-��������� � ���������������� ������ � ���������� ���������� ������������� ���������.
		//	int ArCS=ArrayCopySeries(vol,MODE_VOLUME,symb);
			//���������� ���� ������������ �������.
			int ArDi=ArrayDimension(Mas1);
			//	������������ TRUE, ���� ������ ����������� ��� ��������� (�������� ������� ������������� �� ���������� � �������), ����� ������������ FALSE.
			bool Agss=ArrayGetAsSeries(Mas1);
			//������������� ��� �������� ��������� ������� � ���� ��������. ���������� ���������� ������������������ ���������.
			int AI=ArrayInitialize(Mas1,5);
			//������������ TRUE, ���� ����������� ������ �������� ��������-���������� (Time[],Open[],Close[],High[],Low[] ��� Volume[]), ����� ������������ FALSE.
			bool AIS=ArrayIsSeries(vol);
			//����� �������� � ������������ ���������. ������� ���������� ������� ������������� �������� � �������.
			int ARMax=ArrayMaximum(Mas1); //� ������� �� ������� �� ����, ���� ���������� ����� �����������
		//	int ARmax=ArrayMaximum(Mas1); //�� ��������� �������
			int maxValueIdx=ArrayMaximum(num_array);
			//����� �������� � ����������� ���������. ������� ���������� ������� ������������ �������� � �������.
			int minValueidx=ArrayMinimum(num_array);
			//���������� ����� ��������� � ��������� ��������� �������. ��������� ������� ���������� � ����, ������ ��������� �� 1 ������, ��� ����� ������� ������.
			int ARr=ArrayRange(Mas3, 2);
			//������������� ����������� �������������� � �������.
			bool ArSeAsSer=ArraySetAsSeries(num_array,true);
			//������������� ����� ������ � ������ ��������� �������
			int ArRes=ArrayResize(num_array,20);
			//���������� ���������� ��������� �������.
			int ArSi=ArraySize(Mas3);
     	}
    return;
    }
    
void _13_Checkup100(){
	    int err;
		for(int i=0; i<100; i++){
			// TRUE - ����� � �������� �����������, FALSE - ����� � �������� ����������� ��� ��������.
			bool con=IsConnected();
			err=GetLastError();
			//������������ TRUE, ���� ��������� �������� �� ���������������� �����, � ��������� ������ ���������� FALSE.
			bool dem=IsDemo();
			err=GetLastError();
			//���������� TRUE, ���� DLL ����� ������� ��������� ��� ��������, ����� ���������� FALSE.
			bool dll=IsDllsAllowed();
			err=GetLastError();
			//���������� TRUE, ���� � ���������� ��������� �������� ������ ���������, ����� ���������� FALSE.
			bool ExpEn=IsExpertEnabled();
			err=GetLastError();
			//���������� TRUE, ���� ������� ����� ������� ������������ �������, ����� ���������� FALSE.
			bool libAll= IsLibrariesAllowed();
			err=GetLastError();
			//������������ TRUE, ���� ������� �������� � ������ ����������� ������������, ����� ���������� FALSE.
			bool opt=IsOptimization();
			err=GetLastError();
			//������������ TRUE, ���� ��������� (������� ��� ������) �������� ������� �� ���������� ����� ������, ����� ���������� FALSE.
			bool stop=IsStopped();
			err=GetLastError();
			//������������ TRUE, ���� ������� �������� � ������ ������������, ����� ���������� FALSE.
			bool test=IsTesting();
			err=GetLastError();
			//������������ TRUE, ���� �������� ��������� ��������� � ����� ��� ���������� �������� �������� ��������, ����� ���������� FALSE.
			bool tral=IsTradeAllowed();
			err=GetLastError();
			//������������ TRUE, ���� ����� ��� ���������� �������� �������� �����, ����� ���������� FALSE.
			bool COntBusy=IsTradeContextBusy();
			err=GetLastError();
			//������������ TRUE, ���� ������� ����������� � ������ ������������, ����� ���������� FALSE.
			bool VisM=IsVisualMode();
			err=GetLastError();
			//���������� ��� ������� ���������� ���������, ���������������� ����������� � ��������. ������������ �������� ����� ���� ����� �� ����� ���������������.
			bool UnReas=UninitializeReason();
			err=GetLastError();
			}
    return;
    }
    
void _14_ClientTerminal10000(){
    for(int i=0;i<10000;i++){
	    //���������� ������������ ��������-��������� ����������� ���������.
		string q=TerminalCompany();
		//���������� ��� ����������� ���������.
		string w=TerminalName();
		//���������� ����������, �� �������� ������� ���������� ��������.
		string �= TerminalPath();
	}
    return;
    }
    
void _15_CommonFunctions5(){
    for(int i=0; i<5; i++){
	    string symb=Symbol();
	    //���������� ���������� ����, ���������� ���������������� ������.
		Alert("DFGJK");
		//������� ������� �����������, ������������ �������������, � ����� ������� ���� �������.
		Comment("sddfsdfsfs");
		//������� GetTickCount() ���������� ���������� �����������, ��������� � ������� ������ �������. 
		int start=GetTickCount();
		//���������� ��������� ���������� � ���������� ������������, ������������� � ���� "����� �����"
		double low		=MarketInfo(symb,MODE_LOW);
		double high 	=MarketInfo(symb,MODE_HIGH);
		double time		=MarketInfo(symb,MODE_TIME);
		double bid  	=MarketInfo(symb,MODE_BID);
		double ask  	=MarketInfo(symb,MODE_ASK);
		double point	=MarketInfo(symb,MODE_POINT);
		int    digits	=MarketInfo(symb,MODE_DIGITS);
		int    spread	=MarketInfo(symb,MODE_SPREAD);
		double stlevel	=MarketInfo(symb,MODE_STOPLEVEL);
		double lotsize	=MarketInfo(symb,MODE_LOTSIZE);
		double tickval	=MarketInfo(symb,MODE_TICKVALUE);
		double ticksize	=MarketInfo(symb,MODE_TICKSIZE);
		double swaplong	=MarketInfo(symb,MODE_SWAPLONG);
		double swapshort=MarketInfo(symb,MODE_SWAPSHORT);
		double starting	=MarketInfo(symb,MODE_STARTING);
		double expiration	=MarketInfo(symb,MODE_EXPIRATION);
		double tradeallowed	=MarketInfo(symb,MODE_TRADEALLOWED);
		double minblot		=MarketInfo(symb,MODE_MINLOT);
		double lotstep		=MarketInfo(symb,MODE_LOTSTEP);
		int    maxlot		=MarketInfo(symb,MODE_MAXLOT);
		double swaptupe		=MarketInfo(symb,MODE_SWAPTYPE);
		double profitalcmode	=MarketInfo(symb,MODE_PROFITCALCMODE);
		double margincalcmode	=MarketInfo(symb,MODE_MARGINCALCMODE);
		double marginit			=MarketInfo(symb,MODE_MARGININIT);
		double marginmaintance	=MarketInfo(symb,MODE_MARGINMAINTENANCE);
		double marginhedged		=MarketInfo(symb,MODE_MARGINHEDGED);
		double marginrequired	=MarketInfo(symb,MODE_MARGINREQUIRED);
		double freezlevel		=MarketInfo(symb,MODE_FREEZELEVEL);
	//		Print(low," ",high," ",time," ",bid," ",ask," ",point," ",digits," ",spread," ",stlevel," ",lotsize," ",tickval," ",ticksize,
	//	  		" ",swaplong," ",swapshort," ",starting," ",expiration," ",tradeallowed," ",minblot," ",lotstep," maxlot=",maxlot," ",swaptupe,
	//	  		" ",profitalcmode," ",margincalcmode," ",marginit," ",marginmaintance," ",marginhedged," ",marginrequired," ",freezlevel);
		//������� ������������� �������� ����. ���� ������ ���� ���������� � �������� �������_���������\sounds ��� ��� �����������.
	//	PlaySound("update.wav"); //����� �������� �������, ������ ���� �������
		//�������� ��������� ��������� � ������ ���������.
		Print("dfdfd");
		//�������� ���� �� ������, ���������� � ���� �������� �� �������� "����������".
		bool SFTP=SendFTP("report.txt"); //�������� �� ��������.
		//�������� ����������� ������ �� ������, ���������� � ���� �������� �� �������� "�����".
	//	SendMail("FGHJKL:", "dfsfdfsdf"); //C���� � ��� ��������, �������
		//�������� Push-����������� �� ��������� ���������, ��� MetaQuotes ID ������� � ���� �������� �� �������� "�����������". 
	//	bool SN=SendNotification()  ��� ������ � ���
		//������� ����������� ���������� �������� �������� ��� ������� �� ������������ ��������.
		Sleep(100000);	//� �� �� ����� �� ��������. ������ ��� TSL
		}
    return;
    }
    
void _16_AllIndicators(){
	for(int n=0; n<1; n++)
     {
	    double q=		iAC(NULL, 0, 0);
		double w=		iAD(NULL, 0, 0);
		double e=		iAlligator(NULL, 0, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, 1);
		double r=		iADX(NULL,0,14,PRICE_HIGH,MODE_MAIN,0);
	//	double t=		iATR(NULL,0,12,0);
		double y=		iAO(NULL, 0, 2);
		double u=		iBearsPower(NULL, 0, 13,PRICE_CLOSE,0);
		double i=		iBands(NULL,0,20,2,0,PRICE_LOW,MODE_LOWER,0);
	//	double o=		iBandsOnArray(ExtBuffer,total,2,0,0,MODE_LOWER,0);//������ ���������� Bollinger Bands �� ������, ���������� � �������.
		double p=		iBullsPower(NULL, 0, 13,PRICE_CLOSE,0);
		double s=		iFractals(NULL, 0, MODE_UPPER, 3);
		double a=		iForce(NULL, 0, 13,MODE_SMA,PRICE_CLOSE,0);
	//	double d=	iEnvelopesOnArray(ExtBuffer,10,13,MODE_SMA,0,0.2,MODE_UPPER,0);//������ ���������� Envelopes �� ������, ���������� � �������. 
		double f=		iEnvelopes(NULL, 0, 13,MODE_SMA,10,PRICE_CLOSE,0.2,MODE_UPPER,0);	
		double g=		iDeMarker(NULL, 0, 13, 1);
		double h=		iCustom(NULL, 0, "SampleInd",13,1,0);
	//	double j=	iCCIOnArray(ExtBuffer,total,12,0);//������ ���������� Commodity Channel Index �� ������, ���������� � �������.
		double k=		iCCI(Symbol(),0,12,PRICE_TYPICAL,0);
	//	double l=	iStdDevOnArray(ExtBuffer,100,10,0,MODE_EMA,0);//������ ���������� Standard Deviation �� ������, ���������� � �������
		double l=		iStochastic(NULL,0,5,3,3,MODE_SMA,0,MODE_MAIN,0);
		double z=		iWPR(NULL,0,14,0);
		double x=		iStdDev(NULL,0,10,0,MODE_EMA,PRICE_CLOSE,0);
		double c=		iRVI(NULL, 0, 10,MODE_MAIN,0);
	//	double v=	iRSIOnArray(ExtBuffer,1000,14,0);//������ ���������� Standard Deviation �� ������, ���������� � �������
		double b=		iRSI(NULL,0,14,PRICE_CLOSE,0);
		double nn=		iSAR(NULL,0,0.02,0.2,0);
		double m=		iOBV(NULL, 0, PRICE_CLOSE, 1);
		double qq=		iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,0);
		double ww=		iOsMA(NULL,0,12,26,9,PRICE_OPEN,1);
	//	double ee=	iMAOnArray(ExtBuffer,0,5,0,MODE_LWMA,0);//������ ���������� Standard Deviation �� ������, ���������� � �������
		double rr=		iMA(NULL,0,13,8,MODE_SMMA,PRICE_MEDIAN,0);
		double tt=		iMFI(NULL,0,14,0);
	//	double yy=	iMomentumOnArray(mybuffer,100,12,0);//������ ���������� Momentum �� ������, ���������� � �������.
		double uu=		iMomentum(NULL,0,12,PRICE_CLOSE,0);
		double ii=		iBWMFI(NULL, 0, 0);
		double oo=		iIchimoku(NULL, 0, 9, 26, 52, MODE_TENKANSEN, 1);
		double pp=		iGator(NULL, 0, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_UPPER, 1);
     	}
    return;
    }
    
void _17_CustomIndicator50(){
	   for(int j=0; j<50;j++){
		  int i,                           // ������ ����
		       Counted_bars;                // ���������� ������������ ����� 
		   double indicator=iMA(Symbol(),0,0,0,30,PRICE_CLOSE,0);
		//--------------------------------------------------------------------   
		   SetIndexBuffer(2,Buf_0);         // ���������� ������� ������
		   SetIndexStyle (2,DRAW_LINE,STYLE_SOLID,2);// ����� �����
		   SetIndexBuffer(1,Buf_1);         // ���������� ������� ������
		   SetIndexStyle (1,DRAW_ARROW);	// ����� �����
		   SetIndexArrow(0,217);			//���������� ������ ��� ����� �����������, ������� ����� DRAW_ARROW.
		//--------------------------------------------------------------------
			IndicatorBuffers(3);			//������������ ������ ��� �������, ������������ ��� ���������� ����������������� ����������.2 �������������� ������, ������������ ��� �������.
			IndicatorDigits(7);				//��������� ������� �������� (���������� ������ ����� ���������� �����) ��� ������������ �������� ����������. 
			IndicatorShortName("0_o");		//��������� "���������" ����� ����������������� ���������� ��� ����������� � ������� ���������� � � ���� DataWindow.
			SetIndexDrawBegin(0, indicator);
			SetIndexEmptyValue(1,0.0);		//������������� �������� ������ �������� ��� ����� ����������. �� ��������, ��������.
			SetIndexLabel(0,"HJK");			//��������� ����� ����� ���������� ��� ����������� ���������� � ���� DataWindow � ����������� ���������
			SetIndexLabel(1,"Tenkan");		//��������� ����� ����� ���������� ��� ����������� ���������� � ���� DataWindow � ����������� ���������
			SetIndexShift(0, 0);			//��������� �������� ����� ���������� ������������ ������ �������.
		//	void SetLevelStyle(	int draw_style, int line_width, color clr=CLR_NONE) �� ��������� ����
		//	void SetLevelValue(	int level, double value)���� ���� �� �����
		//--------------------------------------------------------------------
		   Counted_bars=IndicatorCounted(); // ���������� ������������ �����. ������� ���������� ���������� �����, �� ���������� ����� ���������� ������ ����������.
		   i=Bars-Counted_bars-1;           // ������ ������� ��������������
		   while(i>=0)                      // ���� �� ������������� �����
		     {
		      Buf_0[i]=Close[i];             // �������� 0 ������ �� i-�� ����
		      Buf_1[i]=Close[i]-1;
		      i--;                          // ������ ������� ���������� ����
		     }
		     }
		//--------------------------------------------------------------------
    return;
    }
   
//��� ������ ���� ���� �������� FileFunction �� � ��� ��� ��� ��� ���� ����� ��� ��� ������ ��.

//������������ ��� ������� ���� 
void _18_MathTrig10000(){		
	for(int i=0; i<1000;i++){
		double q=10.123, w=-21.456, arc=0.5;
		double  abs=MathAbs(w);			//������� ���������� ���������� �������� (�������� �� ������) ����������� �� �����
		double arccos=MathArccos(arc);	//������� ���������� �������� ����������� x � ��������� 0 � ? � ��������. ���� x ������ -1 ��� ������ 1, ������� ���������� NaN (�������������� ��������).
		double arcsin=MathArcsin(arc);	//������� ���������� �������� x � ��������� �� -?/2 �� ?/2 ��������. ���� x-, ������ -1 ��� ������ 1, ������� ���������� NaN (�������������� ��������).
		double arctan=MathArctan(arc);	//������� ���������� ���������� x. ���� x ����� 0, ������� ���������� 0. MathArctan ���������� �������� � ��������� �� -?/2 �� ?/2 ��������.
		double ceil=MathCeil(q);		//������� ���������� �������� ��������, �������������� ���������� ����� �����, ������� ������ ��� ����� x.
		double cos=MathCos(arc);		//������� ���������� ������� ����.
		double exp=MathExp(w);			//������� ���������� �������� ����� e � ������� d. ��� ������������ ������� ���������� INF (�������������), � ������ ������ ������� MathExp ���������� 0.
	//	double floor=MathFloor(w);		//������� ���������� �������� ��������, �������������� ���������� ����� �����, ������� ������ ��� ����� x.
		double log=MathLog(w);			//������� ���������� ����������� �������� x � ������ ������. ���� x �����������, ������� ���������� NaN (�������������� ��������). ���� x ����� 0, ������� ���������� INF (�������������) .
		double max=MathMax(q,w);		//������� ���������� ������������ �� ���� �������� ��������.
		double min=MathMin(q,w);		//������� ���������� ����������� �� ���� �������� ��������.
		double mod=MathMod(w,q);		//������� ���������� ������������ ������� �� ������� ���� �����.
		double pow=MathPow(w,q);		//������� ���������� �������� ���������, ������������ � ��������� �������.
		MathSrand(w);					//������� ������������� ��������� ��������� ��� ��������� ���� ��������������� ����� �����. 
		int rand=MathRand();			//������� ���������� ��������������� ����� ����� � �������� �� 0 �� 32767. 
		double round=MathRound(w);		//������� ���������� ��������, ����������� �� ���������� ������ ����� ���������� ��������� ��������.
		double sin=MathSin(arc);		//������� ���������� ����� ���������� ����.
		double sqrt=MathSqrt(w);		//������� ���������� ���������� ������ x. ���� x �����������, MathSqrt ���������� NaN (�������������� ��������).
		double tan=MathTan(q);			//������� ���������� ������� x. ���� x ������ ��� ����� 263 ��� ������ ��� ����� -263, �� ���������� ������ �������� � ������� ���������� �������������� �����.
		}
    return;
    }
    
void _19_AllStringFunctions(){
	 for(int n=0; n<100; n++)
	 	{
		//  ��������� ������ �� ���������� ���������� � ���������� �. ��������� ����� ����� ����� ���. ���������� ���������� �� ����� ��������� 64.  
		string SC1=StringConcatenate(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64);
		
		//  ����� ���������. ���������� ����� ������� � ������, � ������� ���������� ������� ���������, ���� -1, ���� ��������� �� �������.  
		string text="������� ���������� ������ ������������� ������� ������";
		int SF1=StringFind(text,"������ �������������",0);
		
		//���������� �������� �������, �������������� � ��������� ������� ������.
		int SGC=StringGetChar("Test3",3);
		
		//���������� ����� �������� � ������.
		int SL=StringLen("123456789");
		
		//���������� ����� ������ � ���������� ��������� ������� � ��������� �������.
		string SSC1=StringSetChar("� ���� ����������� ��� ������",12,'�');
		
		//��������� ��������� �� ��������� ������, ������������ c ��������� �������.
		string SS=StringSubstr("������� ���������� ������ ������������� ������� ������",8,10);
		
		//������� ������� ������� �������� �������, ������� � ������� ��������� � ����� ����� ������.
		string S1="   Test1   ";
		string STL1=StringTrimLeft(S1);
		
		//������� ������� ������� �������� �������, ������� � ������� ��������� � ������ ����� ������
		string S2="   Test2   ";
		string STL2=StringTrimRight(S2);
		}
    return;
    }

//������������ ������� ������� ������ �� ��������.
void _20_AllWindowFunctions(){	
	for(int n=0; n<1; n++)
     {
		//���������� �������� ����� ����� ������� ��� �������� �������.
		int P=Period();
		//���������� �������� ����� ����� ������� ��� �������� �������.
		bool RR=RefreshRates();
		//���������� ��������� ������ � ������ �������� ����������� �����������.
		string S=Symbol(); 
		//������� ���������� ���������� �����, ������������ � ���� �������� �������.
		int WBPC=WindowBarsPerChart();
		//���������� ��� �������������� ��������, �������, ����������������� ���������� ��� ����������, � ����������� �� ����, �� ����� MQL4-��������� ������� ������ �������.
		string WEN=WindowExpertName();
		//���������� ����� ������� �������, ����������� ��������� � ��������� ������
		int WF1=WindowFind("iMACD");
		//������� ���������� ����� ������� �������� ���� � ���� �������� �������.
		int WVB=WindowFirstVisibleBar();
		//���������� ��������� ���������� ����
		int WH=WindowHandle("EURUSD",1);
		//���������� TRUE, ���� ������� ������� ������, ����� ���������� FALSE. ������� ������� ����� ���� ������ ��-�� ������� ��������� ����������� � ���� ����������.
		bool WIV=WindowIsVisible(1);
		//���������� ������������ �������� ������������ ����� ���������� ������� �������� �������
		double WPMax=WindowPriceMax(0);
		//���������� ����������� �������� ������������ ����� ���������� ������� �������� �������
		double WPMin=WindowPriceMin(0);
		//������������� �������������� ������� ������. ������ ����������� ����� ��������� ������� ��������.
//		WindowRedraw();
		//��������� ����������� �������� ������� � ����� ������� GIF.
		bool WSS=WindowScreenShot("Screen",500,500,6);
		//���������� ���������� ���� ����������� �� �������, ������� ������� ���� �������.
		int WT=WindowsTotal();
     	}
    return;
    }

void _21_ObjectFunctions(){	
	for(int n=0; n<1; n++)
     {
		// �������� ���� ��������   
		//--------------------------------------------- 
		bool OBJ_VLINE1=ObjectCreate("OBJ_VLINE1",OBJ_VLINE,0,DT1,1.3);
		bool OBJ_HLINE1=ObjectCreate("OBJ_HLINE1",OBJ_HLINE,0,D'2013.02.06 11:00:00',Price1);
		bool OBJ_TREND1=ObjectCreate("OBJ_TREND1",OBJ_TREND,0,DT1,Price1,DT2,Price2);
		bool OBJ_TRENDBYANGLE1=ObjectCreate("OBJ_TRENDBYANGLE1",OBJ_TRENDBYANGLE,0,DT1,Price1,DT2,Price2);
		bool OBJ_REGRESSION1=ObjectCreate("OBJ_REGRESSION1",OBJ_REGRESSION,0,DT1,Price1,DT2,Price2);
		bool OBJ_CHANNEL1=ObjectCreate("OBJ_CHANNEL1",OBJ_CHANNEL,0,DT1,Price1,DT2,Price2,DT3,Price3);
		bool OBJ_STDDEVCHANNEL1=ObjectCreate("OBJ_STDDEVCHANNEL1",OBJ_STDDEVCHANNEL,0,DT1,Price1,DT2,Price2);
		bool OBJ_GANNLINE1=ObjectCreate("OBJ_GANNLINE1",OBJ_GANNLINE,0,DT1,Price1,DT2,Price2);
		bool OBJ_GANNFAN1=ObjectCreate("OBJ_GANNFAN1",OBJ_GANNFAN,0,DT1,Price1,DT2,Price2);
		bool OBJ_GANNGRID1=ObjectCreate("OBJ_GANNGRID1",OBJ_GANNGRID,0,DT1,Price1,DT2,Price2);
		bool OBJ_FIBO1=ObjectCreate("OBJ_FIBO1",OBJ_FIBO,0,DT1,Price1,DT2,Price2);
		bool OBJ_FIBOTIMES1=ObjectCreate("OBJ_FIBOTIMES1",OBJ_FIBOTIMES,0,DT1,Price1,DT2,Price2);
		bool OBJ_FIBOFAN1=ObjectCreate("OBJ_FIBOFAN1",OBJ_FIBOFAN,0,DT1,Price1,DT2,Price2);
		bool OBJ_EXPANSION1=ObjectCreate("OBJ_EXPANSION1",OBJ_EXPANSION,0,DT1,Price1,DT2,Price2,DT3,Price3);
		bool OBJ_FIBOCHANNEL1=ObjectCreate("OBJ_FIBOCHANNEL1",OBJ_FIBOCHANNEL,0,DT1,Price1,DT2,Price2,DT3,Price3);
		bool OBJ_RECTANGLE1=ObjectCreate("OBJ_RECTANGLE1",OBJ_RECTANGLE,0,DT1,Price1,DT2,Price2);
		bool OBJ_TRIANGLE1=ObjectCreate("OBJ_TRIANGLE1",OBJ_TRIANGLE,0,DT1,Price1,DT2,Price2,DT3,Price3);
		bool OBJ_ELLIPSE1=ObjectCreate("OBJ_ELLIPSE1",OBJ_ELLIPSE,0,DT1,Price1,DT2,Price2);
		bool OBJ_PITCHFORK1=ObjectCreate("OBJ_PITCHFORK1",OBJ_PITCHFORK,0,DT1,Price1,DT2,Price2,DT3,Price3);
		bool OBJ_CYCLES1=ObjectCreate("OBJ_CYCLES1",OBJ_CYCLES,0,DT1,Price1,DT2,Price2);
		bool OBJ_TEXT1=ObjectCreate("OBJ_TEXT1",OBJ_TEXT,0,DT1,Price1);
		bool OBJ_ARROW1=ObjectCreate("OBJ_ARROW1",OBJ_ARROW,0,DT1,Price1);
		bool OBJ_LABEL1=ObjectCreate("OBJ_LABEL1",OBJ_LABEL,0,DT1,Price1);
		//--------------------------------------------- 
		
		
		//ObjectDescription ��� �������� ���� OBJ_TEXT � OBJ_LABEL
		//--------------------------------------------- 
		string OD1=ObjectDescription("OBJ_TEXT1");
		string OD2=ObjectDescription("OBJ_LABEL1");
		//--------------------------------------------- 
		
		
		//����� ������� � ��������� ������.
		//--------------------------------------------- 
		bool OF=ObjectFind("OBJ_VLINE1");
		//--------------------------------------------- 
		
		
		//���������� �������� ���������� �������� �������.
		//--------------------------------------------- 
		datetime OG1=ObjectGet("OBJ_FIBOCHANNEL1",OBJPROP_TIME1);
		double OG2=ObjectGet("OBJ_FIBOCHANNEL1",OBJPROP_PRICE2);
		color OG3=ObjectGet("OBJ_VLINE1",OBJPROP_COLOR);
		double OG4=ObjectGet("OBJ_VLINE1",OBJPROP_STYLE);
		double OG5=ObjectGet("OBJ_VLINE1",OBJPROP_WIDTH);
		int OG6=ObjectGet("OBJ_ARROW1",OBJPROP_ARROWCODE);
		int OG7=ObjectGet("OBJ_ARROW1",OBJPROP_TIMEFRAMES);
		bool OG8=ObjectGet("OBJ_FIBOARC1",OBJPROP_ELLIPSE);
		int OG9=ObjectGet("OBJ_LABEL1",OBJPROP_FONTSIZE);
		int OG10=ObjectGet("OBJ_LABEL1",OBJPROP_CORNER);
		int OG11=ObjectGet("OBJ_LABEL1",OBJPROP_XDISTANCE);
		int OG12=ObjectGet("OBJ_LABEL1",OBJPROP_YDISTANCE);
		bool OG13=ObjectGet("OBJ_TREND1",OBJPROP_BACK);
		bool OG14=ObjectGet("OBJ_TREND1",OBJPROP_RAY);
		double OG15=ObjectGet("OBJ_TREND1",OBJPROP_SCALE);
		double OG16=ObjectGet("OBJ_FIBOCHANNEL1",OBJPROP_FIBOLEVELS);
		color OG17=ObjectGet("OBJ_FIBOCHANNEL1",OBJPROP_LEVELCOLOR);
		double OG18=ObjectGet("OBJ_FIBOCHANNEL1",OBJPROP_LEVELSTYLE);
		double OG19=ObjectGet("OBJ_FIBOCHANNEL1",OBJPROP_LEVELWIDTH);
		double OG20=ObjectGet("OBJ_FIBOCHANNEL1",OBJPROP_FIRSTLEVEL+3);
		bool OG21=ObjectGet("OBJ_TRENDBYANGLE1",OBJPROP_ANGLE);
		bool OG22=ObjectGet("OBJ_STDDEVCHANNEL1",OBJPROP_DEVIATION);
		//--------------------------------------------- 
		
		
		//������� Set/Get ObjectFiboDescription
		//--------------------------------------------- 
		bool OSFD=ObjectSetFiboDescription("OBJ_FIBOFAN1",2,"BVB");			//����������� ����� �������� ������ ������� ���������
		string OGFD=ObjectGetFiboDescription("OBJ_FIBOFAN1",2);				//������� ���������� �������� ������ ������� ���������.
		//--------------------------------------------- 
		
		//�������  ObjectShiftByValue
		//--------------------------------------------- 
		int OGSBV=ObjectGetShiftByValue("OBJ_TREND1",Price1);				//������� ��������� � ���������� ����� ���� (�������� ������������ �������� ����) ��� ��������� ����.
		double OGVBS=ObjectGetValueByShift("OBJ_TREND1",2);					//������� ��������� � ���������� �������� ���� ��� ���������� ���� (�������� ������������ �������� ����).
		//--------------------------------------------- 
		
		//������ ���� �� ���������
		//--------------------------------------------- 
		bool OM1=ObjectMove("OBJ_FIBOCHANNEL1", 0,DT1+600,(Price1+30*Point));
		//--------------------------------------------- 
		
		//������������� ����� ��������
		//--------------------------------------------- 
		bool OS1=ObjectSet("OBJ_FIBOCHANNEL1",OBJPROP_TIME1,DT1+600);
		bool OS2=ObjectSet("OBJ_FIBOCHANNEL1",OBJPROP_PRICE2, (Price1+20*Point));
		bool OS3=ObjectSet("OBJ_VLINE1",OBJPROP_COLOR,447);
		bool OS4=ObjectSet("OBJ_VLINE1",OBJPROP_STYLE,2);
		bool OS5=ObjectSet("OBJ_VLINE1",OBJPROP_WIDTH,5);
		bool OS6=ObjectSet("OBJ_ARROW1",OBJPROP_ARROWCODE,138);
		bool OS7=ObjectSet("OBJ_ARROW1",OBJPROP_TIMEFRAMES,OBJ_PERIOD_M30);
		bool OS8=ObjectSet("OBJ_FIBOARC1",OBJPROP_ELLIPSE,1);
		bool OS9=ObjectSet("OBJ_LABEL1",OBJPROP_FONTSIZE,15);
		bool OS10=ObjectSet("OBJ_LABEL1",OBJPROP_CORNER,1);
		bool OS11=ObjectSet("OBJ_LABEL1",OBJPROP_XDISTANCE,135);
		bool OS12=ObjectSet("OBJ_LABEL1",OBJPROP_YDISTANCE,235);
		bool OS13=ObjectSet("OBJ_TREND1",OBJPROP_BACK,1);
		bool OS14=ObjectSet("OBJ_TREND1",OBJPROP_RAY,1);
		bool OS15=ObjectSet("OBJ_TREND1",OBJPROP_SCALE,2);
		bool OS16=ObjectSet("OBJ_FIBOCHANNEL1",OBJPROP_FIBOLEVELS,16);
		bool OS17=ObjectSet("OBJ_FIBOCHANNEL1",OBJPROP_LEVELCOLOR,447);
		bool OS18=ObjectSet("OBJ_FIBOCHANNEL1",OBJPROP_LEVELSTYLE,STYLE_DASHDOTDOT);
		bool OS19=ObjectSet("OBJ_FIBOCHANNEL1",OBJPROP_LEVELWIDTH,5);
		bool OS20=ObjectSet("OBJ_FIBOCHANNEL1",OBJPROP_FIRSTLEVEL+3,0.0268);
		bool OS21=ObjectSet("OBJ_TRENDBYANGLE1",OBJPROP_ANGLE,30);
		bool OS22=ObjectSet("OBJ_STDDEVCHANNEL1",OBJPROP_DEVIATION,5);
		bool OS23=ObjectSetText("OBJ_TEXT1","��������",17,"Times New Roman", Green);
		//--------------------------------------------- 
		
		//���������� ����� ����� �������� ���������� ���� �� �������.
		//--------------------------------------------- 
		int OT=ObjectsTotal();
		//--------------------------------------------- 
		
		//���������� ��� � ��� �������
		//--------------------------------------------- 
		for(int j=0;j<25;j++)
		{
		string ObjN=ObjectName(j);
		int ObjT=ObjectType(ObjN);
		}
		//--------------------------------------------- 
		
		
		//��������
		//--------------------------------------------- 
		bool ODel=ObjectDelete("OBJ_HLINE1");
		
		int ObDelA=ObjectsDeleteAll();
		//--------------------------------------------- 
     	}
    return;
    }

//���������� ��� ������
string separators(){
	string ModuleSeparator;
	if(T01_PrimitiveMath1000==1){ModuleSeparator=";";}
	else ModuleSeparator=";;;";
	return(ModuleSeparator);
	}
	
	
int init()
{	
    //�������� �� ���������� ����������� ���������, � ������ ���� �� ������ ��� ������ 1, �� ������� ������ � ������ �� ������������.
    int ChackBoxSum=T01_PrimitiveMath1000+ T02_PrimitiveMath10000+ T03_PrimitiveMath100000+T04_PredefinedVariables1000+
					T05_TimeseriesAccess50+T06_Concatenatio100+T07_TradeFunction+T08_ConversionFunctions50+T09_DateTimeFunctions100+
					T10_GlobalVariable100+T11_AccountInformation100+T12_ArrayFunctions+T13_Checkup100+T14_ClientTerminal10000+T15_CommonFunctions5+
					T16_AllIndicators+T17_CustomIndicator50+T18_MathTrig10000+T19_AllStringFunctions+T20_AllWindowFunctions+T21_ObjectFunctions;
	if(ChackBoxSum>1){
    	int FirstMessage=MessageBox("�� ������� ����� ��� ���� ����� ��� ������, ��������� ������� ������ ", "Question", MB_OK|MB_ICONQUESTION);	
    	One_Chose=false;
    	return(0);
    	}
	if(ChackBoxSum<1){
    	int SecondMessage=MessageBox("�� �� ������� �� ������ ��������, ��������� ������� ������ ", "Question", MB_OK|MB_ICONQUESTION);
    	One_Chose=false;
    	return(0);
    	}
    	
    //�������� �����
   	file= FileOpen("D:\\report.csv",FILE_CSV|FILE_WRITE|FILE_READ,';');
	if(file==-1)Print(GetLastError());
	Start_time =GetTickCount();		//����� ������ ��
  return(0);
}


int start()
{
    Quoute_counter++;
    if (One_Chose==false) return(0);	//��������� �������� � �����
    if (T01_PrimitiveMath1000==true) _01_PrimitiveMath1000();
    if (T02_PrimitiveMath10000==true) _02_PrimitiveMath10000();
    if (T03_PrimitiveMath100000==true) _03_PrimitiveMath100000();
    if (T04_PredefinedVariables1000==true) _04_PredefinedVariables1000();
    if (T05_TimeseriesAccess50==true) _05_TimeseriesAccess50();
    if (T06_Concatenatio100==true) _06_Concatenatio100();
    if (T07_TradeFunction==true) _07_TradeFunction();
    if (T08_ConversionFunctions50==true) _08_ConversionFunctions50();
    if (T09_DateTimeFunctions100==true) _09_DateTimeFunctions100();
    if (T10_GlobalVariable100==true) _10_GlobalVariable100();
    if (T11_AccountInformation100==true) _11_AccountInformation100();
    if (T12_ArrayFunctions==true) _12_ArrayFunctions();
    if (T13_Checkup100==true) _13_Checkup100();
    if (T14_ClientTerminal10000==true) _14_ClientTerminal10000();
    if (T15_CommonFunctions5==true) _15_CommonFunctions5();
    if (T16_AllIndicators==true) _16_AllIndicators();
    if (T17_CustomIndicator50==true) _17_CustomIndicator50();
    if (T18_MathTrig10000==true) _18_MathTrig10000();
    if (T19_AllStringFunctions==true) _19_AllStringFunctions();
    if (T20_AllWindowFunctions==true) _20_AllWindowFunctions();
    if (T21_ObjectFunctions==true) _21_ObjectFunctions();
  return(0);
}


int deinit()
{	
	//���� ��������� ���� ��� ����� ����� ������� ������� �� �����. ----------------------------------------------
	if(Quoute_counter<40000){
    	int answer1=MessageBox("������� ���� ����, ������ ����� ��������, �������� ������� ���� ����� ��� ������� ����", "Question", MB_OK|MB_ICONQUESTION);	
    	return(0);
		}
	if(Quoute_counter>10000000){		//������� �� 100000 �� ��������� �����
		int answer2=MessageBox("������� ����� ����, ������ ����� ��������, �������� ������� ���� �����", "Question", MB_OK|MB_ICONQUESTION);	
    	return(0);
		}
		
	//-------------------------------------------------------------------------------------------
    //���� ������� �������������� ������--------------------------------------------------------
	Stop_Time= GetTickCount();		//����� ��������� ��
	Passed_sec =(Stop_Time-Start_time )/1000; 		//����� ������� �������� ��������� (����� �� 1000 ������ ��� � ������������, �������� � ��������)
	QuotesPerSec=NormalizeDouble((Quoute_counter)/Passed_sec,0);//���� � �������.
	MksPerSec=Passed_sec*1000000/Quoute_counter;				//���������� ����������� ����������� �� 1 �����
	Print ("Quote/sec: ",QuotesPerSec,"   #Quotes: ",Quoute_counter,"   mks/1K Quotes: ",MksPerSec,"   testing Time: ",Passed_sec); //������� ��� ��������, ����� ���� �������
	string CalculationResult=(QuotesPerSec+";"+Quoute_counter+";"+MksPerSec+";"+Passed_sec);		//���������� ���������
	//---------------------------------------------------------------------------------------------
	
		//������ � �������----------------------------------------------------------------------------------------
		
		//��� ������ �������� ���� �� � ����� ��� ������.���� ��� �� ����� �����
		int SizeFile=FileSize(file);
		int CycleNumber;		//������ ��������� 
		if (SizeFile==0){	//���� ������ ����� 0 �� ������ �����
			CycleNumber=1;			//������ ��� ������� ����� ��������
			string SecRowTemplate=("N;Date/Time;Quote/sec;#Quotes;mks/1K Quotes;testing Time;;");
			int WriteFileHeader=FileWrite(file, CycleNumber,"\n;T01_PrimitiveMath1000;;;;;;;;T02_PrimitiveMath10000;;;;;;;;T03_PrimitiveMath100000;;;;;;;;",
			"T04_PredefinedVariables1000;;;;;;;;T05_TimeseriesAccess50;;;;;;;;T06_Concatenatio100;;;;;;;;T07_TradeFunction;;;;;;;;T08_ConversionFunctions50;;;;;;;;",
			"T09_DateTimeFunctions100;;;;;;;;T10_GlobalVariable100;;;;;;;;T11_AccountInformation100;;;;;;;;T12_ArrayFunctions;;;;;;;;T13_Checkup100;;;;;;;;T14_ClientTerminal10000",
			"T14_ClientTerminal10000;;;;;;;;T14_ClientTerminal10000;;;;;;;;T15_CommonFunctions5;;;;;;;;T16_AllIndicators;;;;;;;;T17_CustomIndicator50;;;;;;;;",
			"T18_MathTrig10000;;;;;;;;T19_AllStringFunctions;;;;;;;;T20_AllWindowFunctions;;;;;;;;T21_ObjectFunctions\n",SecRowTemplate,SecRowTemplate,SecRowTemplate,SecRowTemplate,
			SecRowTemplate,SecRowTemplate,SecRowTemplate,SecRowTemplate,SecRowTemplate,SecRowTemplate,SecRowTemplate,SecRowTemplate,SecRowTemplate,SecRowTemplate,
			SecRowTemplate,SecRowTemplate,SecRowTemplate,SecRowTemplate,SecRowTemplate,SecRowTemplate,SecRowTemplate);	//���������� ����� �������
			FileFlush(file);		//���������� ����� ����� � ����� �� ���������� �������� ������.
			}
				
			
		//---------------------------------------------------------------------------------------------
		//�������� ������ �����, ���� ������ ��������.
		else {
			int CurrentCounter=StrToInteger(FileReadString(file));
			if (T01_PrimitiveMath1000==1){
				CycleNumber=CurrentCounter+1;
				bool SeekToStart=FileSeek(file, 0, SEEK_SET);	//������ ������ � ������ ����� ��� ���������� ��������. ����� �� ������� ��������������� � ����������� �������� ����� ����
				int WriteFileCounter=FileWrite(file,CycleNumber);
				bool SeekToEnd=FileSeek(file, 0, SEEK_END);
				FileFlush(file);
				}
			else CycleNumber=CurrentCounter;
			}
		//---------------------------------------------------------------------------------------------
				//���������� ������ �� ��������� ������ ����� ������� � ����� ������ ������.
				if(T01_PrimitiveMath1000!=1){
					bool GoToEnd=FileSeek(file,-2,SEEK_END);
					}
				string time=TimeToStr(TimeCurrent());	//���������� ������� �����
				int WriteFileBody=FileWrite(file,separators()+CycleNumber+";"+time+";"+CalculationResult);	//���������� ������ � ������������ �����
		//������ � ����
		if(GetLastError()!=0)Print(GetLastError());
		//�������� �����, ����� ��������� �������� FileOpen().
	    FileClose(file);
	    if(GetLastError()!=0)Print(GetLastError());
	    
	    //���� 
  return(0);
}


