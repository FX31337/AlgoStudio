//+------------------------------------------------------------------+
//|                                                  Integra_v2.7.18 |
//|                                                           Kordan |
//|    http://www.leprecontrading.com/client/register.php?ref=103264 |
//+------------------------------------------------------------------+

//INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA
/*
   �������� � ������������ ����� ����������� ����� ������������� �����. �.�. ������ ������������ �� ����� PipStep �� �������� �����������.  
   �������� ����� ���������� � ����������� ����������� ���������� �� PipStep �� ������� ����������� � ����� ����������� ����������
������� �� � ������� ����.
   ���� � ������ �������� ������ � ����� ����������� ������ ������������� �� ����� � ������ ������� � ������� ���� ��� ������� �������
� ������������� ���������� ������� � ������ ����� ��� ��� ����� ������� �������.
   ��������� ���������� �������.
*/

#property copyright             "Kordan"
#property link                  "http://www.leprecontrading.com/client/register.php?ref=103264"
#include <stderror.mqh>                               // ��� ��������� � �������� �������� - "������� ������". ��������� �������� �����. ����������.                                                     
#include <stdlib.mqh>                                 // Kordan    Z984090990532 ��� R355833322963

extern string t0 =              "�� � ������ ��������";
extern bool   valute               =         false;      // TRUE - �� � ������ ����(��� � Kordan-�), false - � �������,��� TRUE ������ �� ����� ���� ������������
extern double DefaultProfit      =           0;      // ���� ������ � ������ �������� (��������������� ����� �������)

extern string t1 =              "��������� ����������";
extern int    Tral_Start         =            5;      // ���������� ������ ����� �� ����� Profit � ������� (������������ �� � �������)
extern int    Tral_Size          =            5;      // �������� ����� ����� Tral_Start � �������
extern int    PipStep            =           13;      // ��� �������� ����� � �������

extern string t2 =              "��������� ������� � M�";
extern int    Bonus              =            0;      // ��������, �� ������������ � �������� (� ������ ��������)
extern double Risk               =            0;      // ������ ������ �������� � % �� ��������� �������, ���� Risk=0 �� ������ ������ ����������� �������� DefaultLot
extern double DefaultLot         =          0.1;      // ��������� ���, �������� ���� Risk=0
extern double LotExponent        =            2;      // ����������� ���������� ����
extern int    TypeLotExp         =            2;      // ��� LotExponent (0 - ��� � �������,1 - ����������� � �������(��������������),2- �������������� ),���������� � ������ ���������� ����� ��������(���� FixLot=FALSE)

extern string t2.2=               "��������� ��������� ����� N-�� ������ ";
extern int    LotN               =              7;      // � ������ ������ ����� �������� ���������
extern double LotExponentNew       =            1;      // ����������� ���������� ����
extern int    PipStepNew           =           35;      // ��� �������� ����� � �������

extern string t2.3=               "�������� ���������";
extern bool   CloseBy             =        True;      // ���� TRUE, �� �������� ���������, ���� FALSE - ������;

extern string t3 =              "������� �� �������";
extern int    FixLotPercent      =           30;      // ������� �������� ��� ������������ �� ������������� ���
extern bool   FixLot             =        FALSE;      // ���� TRUE, �� ������������� ���, ���� FALSE - ������������
extern string t2.1=              "��������� �����������";
extern bool   UseLock            =        FALSE; 
extern bool   Common             =         true;      //������������� �������: 
                                                      //true - ������� �� ������ ������(n������ ��� LockDrwdn � LockPercentDrwdn), 
                                                      //false - ������� �� ������� �������� �����������
extern bool   TradeAfterLock     =        true;      //��������� �� ������ ����� ����������� ����(��� false �������� ������ ����������, ��� true ������ ��������� ����� ����� ����������� ������)                                                    
extern bool   LeadingAfterLock   =       false;      //�������� �� ���������� ����� ����������� ����                                                   
extern double LockPercent        =          40;      // ������� �������� ������ �� ���������� ������ �������� �����
extern int    LotTradeN          =           5;      // � ������ ������ ����� ������� ��� ��� ���������� ������ �� ��������� �������
extern double PipsLock           =           0;      // ����� ������� �� ����� ��� �������� �������� ������ 
extern double LockDrwdn          =           0;      // �������� ��� �������� �������� ������ � ������ ����
extern double LockPercentDrwdn   =          25;      // ������� �������� ��� �������� �������� ������ 
extern double LockMargLevel      =     1000.00;      // ������� ������� ���� ������� �� ������ �����
extern bool   LockCCI            =       FALSE;     // ������������� ���������� CCI ��� �������� �������� ������

extern string t4 =              "��������� ����������";
extern int    LeadingOrder       =            4;      // C ������ ������ �������� ����������
extern int    ProfitPersent      =           30;      // ������� ����������(10...50)
extern int    SecondProfitPersent=           50;      // ������� ���������� ����� ������������ ������������� �����

extern string t5 =              "�����������"  ;
extern int    MaxTrades          =            5;      // ������������ ���������� ������������ �������� �����
extern double MaxLot             =            1;      // ����������� �� ������������ ���, ���� MaxLot=0, �� ���� ��������� ��� ��
extern int    CurrencySL         =            0;      // ����������� �� �������� � ������ ��������. ����  CurrencySL=0, �� ���������.

extern string t6 =              "������� ��"  ;
extern bool   Close_All          =        FALSE;      // ��� ��� - ������������� ����������� ��� �������, ����� ���� �� ����������

extern string t7 =              "��������� ��������";
extern bool   ManualTrade        =        FALSE;      // ��� ManualTrade = TRUE ������ ����� ����� ����������� �������, ����� ����� �������������� ���������� �������������
extern bool   NewCycle_ON        =         TRUE;      // ��� ������� - ���� �������������� �� �����, ����� ���� �� ����������
extern bool   TradeBuy           =         TRUE;      // FALSE\TRUE - ���������\��������� ������� �������  
extern bool   TradeSell          =         TRUE;      // FALSE\TRUE - ���������\��������� �������� ������� 

extern string t8 =              "��������� CCI";
extern bool   CCI_NR         =            FALSE;      // FALSE\TRUE - ����� ����� ����������� ����������� CCI � iCCI.NR 
extern int    CCI_TimeFrame      =            2;      // ��      CCI  (0-������� �� �������, 1=�1,2=�5,3=�15,4=�30,5=�1,6=�4,7=D1,8=W1,9=MN1)   
extern int    Level              =          100;      // ������� CCI     
extern int    Period_CCI         =           14;      // ������  CCI 
extern double Sens               =            1;      // ����� �������������� � �������.
       int    PriceTip           =            5;      // ��� ����
                                                      // 0 - PRICE_CLOSE    - ���� �������� 
                                                      // 1 - PRICE_OPEN     - ���� ��������
                                                      // 2 - PRICE_HIGH     - ����.����
                                                      // 3 - PRICE_LOW      - ���.����
                                                      // 4 - PRICE_MEDIAN   - ������� ����,(high+low)/2
                                                      // 5 - PRICE_TYPICAL  - �������� ����,(high+low+close)/3
                                                      // 6 - PRICE_WEIGHTED - ���������� ���� ��������,(high+low+close+close)/4
extern string t9 =              "������� ������� �� ��";
extern int    TipMAFilter        =            2;      // ��� �������. ���� 0-����, ���� 1-������ shvondera, ���� 2-������ Kordana
extern int    TF_MA              =           60;      // ��������� �� �� ������� �������� ��� ������� ( 5, 15, 60)
extern int    Period_��          =         1000;      // ������ ���������� �������
extern int    Distance_��        =          350;      // ���� ���1 - ��������� � ������� �� ������� ���� ������ ������ �� �� ��� �������� ������. ������ � ������� ��.
                                                      // ���� ���2 - ������� ������� �������� ������� ����/���� �� ���������� ������� � �������. ������� �� ����� ���������.
extern string t10 =             "������ ������� �� ��������"; 
extern bool   UseFilterTime      =        FALSE;      // ������������ ������ �������� � ������� ����� � � ����������� �� ��������� ������
extern int    StartHourMonday    =            7;      // ����� ������ �������� � �����������
extern int    EndHourFriday      =           19;      // ����� �����  �������� � �������

extern string t11 =             "��������� ����� � ������� ���������";
extern color  ColorInd           =       Silver;      // ���� �������� ���������
extern color  ColorTP            =       Silver;      // ���� ����� Profit
extern color  ColTPTrail         =   DarkOrange;      // ���� ����� Profit ����� ������������ �����
extern color  ColorZL            =  DeepSkyBlue;      // ���� ����� ���������
extern int    xDist1             =          300;      // ���������� �� ����������� ����� ����� � �������� �������
extern int    xDist2             =          800;      // ���������� �� ����������� ����� ��������� �������� � �������
extern int    FontSize           =            9;      // ������ ������ ���������

extern string t12 =             "�������������� ���������";
extern bool   Info               =         TRUE;      // ��� ���������, ��������� ������������� �������� ����� � ���������� ����������������
extern bool   VisualMode         =         TRUE;      // ��� ������ ������� ����������
extern int    MagicNumber        =          777;      // ���������� ����� ��������� (��� MagicNumber=0 ��� ������������ ������ ������)
extern int    MagicNumberCloseby =        12345;      // ���������� ����� ��������� (��� MagicNumber=0 ��� ������������ ������ ������)
extern string MagicNumList       =  "111 0 888";      // ������, ����� ������, ������� ������� �������� ����� ������� ������ (�� ����� 10)
extern int    PauseTrade         =            6;      // ����� �������� ����� ��������� ��������� � ��� 

//********************************************************************************************

#import "mt4gui.dll"
   string   tbVersion()                                     ;
   string   tbGetText(int,int)                              ;   
   bool     tbIsClicked(int,int)                            ;                       
   bool     tbIsChecked(int,int)                            ;     
   int      tbPutObject(int,string,int,int,int,int,string)  ; 
   int      tbSetBgColor(int,int,int)                       ;                      
   int      tbSetTextColor(int,int,int)                     ;                   
   int      tbRemove(int,int)                               ;                              
   int      tbRemoveAll(int)                                ;                                                 
   int      tbSetText(int,int,string,int,string)            ;                                
   int      tbSetChecked(int,int,bool)                      ;                     
   int      tbEnable(int,int,int)                           ;                        
   int      tbAddListItem(int,int,string)                   ;                 
   int      tbGetListSel(int,int)                           ;                         
   int      tbSetListSel(int,int,int)                       ;              
#import

//INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA 

   int      mper[10]={0,1,5,15,30,60,240,1440,10080,43200},magic[10];
   int      hwnd=0, btn1=0;
   int      dig,Error,Lpos,Lpos1,Cpos,PrcCL1,cmagic,totalord,totalbuy,totalsell,spr,freez,stlev,
            buybtn,sellbtn,closebtn,lottxt,lotbtnp,lotbtnm,closesellbtn,closebuybtn, maxtrades,pipstep;
   color    col,ZLcolor,TPcolor;
   double   TPPrice,ZeroLine,Cprofit,Lprofit,Lprofit1,PrcCL,CurrentDrawdown,CurrentUrov,Profit,SumProfit,SumLotBuy,SumLotSell,
            Lot,LotR,Sum_lot,Sumlot,minLot,maxLot,delta,delta2,TV,Price,DrawDownRate,FreeMargin,Balance,Sredstva,One_Lot,Step,
            ProfitBuy,ProfitSell,LastLotBuy,LastLotSell,LastPriceBuy,LastPriceSell,lotexponent,CP_Lot_step ;
   string   comment,prevar,DrawDownString="no_drawdown";
   bool     CloseTrigger,NoTrade,CloseAll,CloseFM,fixlot,Lockbuy,Locksell; 

//INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA  
   
int init(){  

   DeleteObject()    ;  // ����� �������� � ������� ������
   TV      = MarketInfo(Symbol(),MODE_TICKVALUE     ) ;  
   minLot  = MarketInfo(Symbol(),MODE_MINLOT        ) ; 
   maxLot  = MarketInfo(Symbol(),MODE_MAXLOT        ) ;
   One_Lot = MarketInfo(Symbol(),MODE_MARGINREQUIRED) ;  // ������ ��������� �������, ����������� ��� �������� 1 ���� �� �������
   Step    = MarketInfo(Symbol(),MODE_LOTSTEP       ) ;  // ��� ��������� ������� ����
   dig     = LotDecimal();
   
//*********************************************************************************************  
   
if (VisualMode){
   hwnd=WindowHandle(Symbol(),Period());
   tbRemoveAll(hwnd);
   lottxt      = tbPutObject(hwnd,"text"  , 77,-39,70,20, DoubleToStr(LotR,2));
   buybtn      = tbPutObject(hwnd,"button",149,-39,70,20,"Buy"              );
   sellbtn     = tbPutObject(hwnd,"button",  5,-39,70,20,"Sell"             );
   closebtn    = tbPutObject(hwnd,"button",221,-39,90,20,"������� ���"      );
   closesellbtn= tbPutObject(hwnd,"button",313,-39,90,20,"������� Sell"     );
   closebuybtn = tbPutObject(hwnd,"button",405,-39,90,20,"������� Buy"      );
   tbSetBgColor(hwnd,closebtn,Gold);
}   
  
//***************** �������������� ������� �� �������� **************************************** 

   int _digits = MarketInfo(Symbol(), MODE_DIGITS);
      if (_digits == 5 || _digits == 3){
         Tral_Start        *= 10;
         Tral_Size         *= 10;
         PipStep           *= 10;
         PipStepNew        *= 10;
         Distance_��       *= 10;
      }
         
//***************  ������ �� ������������� ����������� ����������  ****************************

   if(CCI_TimeFrame< 2 || CCI_TimeFrame>4) CCI_TimeFrame = 2;
  // if(DefaultProfit<=0 )  DefaultProfit = 0.01  ;
  // if(LockPercent  <=0 )  LockPercent=1         ;
   if(DefaultLot   <=0 )  DefaultLot=0.01       ;
   if (LeadingOrder >0){ if (LeadingOrder <3)   LeadingOrder=3        ;}
   if(AllowTrade() == false) return(0)          ;
//************************************���������� ����������********************************** 

   maxtrades=MaxTrades;
   lotexponent=LotExponent;
   pipstep=PipStep;

//********************************************************************************************* 

cmagic=0; string st; int k=StringLen(MagicNumList);
for (int a=0; a<k; a++){
   if (StringSubstr(MagicNumList,a,1)!=" "){
      st=st+StringSubstr(MagicNumList,a,1); 
         if(a < k-1) continue;
   }
      if (st!=""){
         magic[cmagic]=StrToInteger(st); cmagic++; st="";
      }
   } 
   return(0);
}

//INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA  
  
int deinit() {
   DeleteObject();  // ����� �������� � ������� ������
   tbRemoveAll(WindowHandle(Symbol(),Period()));
   return(0);
} 
     
//INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA

int start(){

   CurrentCondition();
   FreeMargin = NormalizeDouble(AccountFreeMargin()- Bonus, 2) ;
   Balance    = NormalizeDouble(AccountBalance   ()- Bonus, 2) ;
   Sredstva   = NormalizeDouble(AccountEquity    ()       , 2) ;
   if (Sumlot ==0) Sumlot = 0.00000001                         ;  // ������ �� �������� �������� 
   spr        = MarketInfo(Symbol(),MODE_SPREAD     )          ;
   freez      = MarketInfo(Symbol(),MODE_FREEZELEVEL)          ; 
   stlev      = MarketInfo(Symbol(),MODE_STOPLEVEL  )          ;
   Lot        = GetLot()                                       ; 
   if (MaxLot ==0 || MaxLot > maxLot)         MaxLot = maxLot   ;               
//  CP_Lot_step = Lot* LotExponent                               ;   /// ���������� ��� ������� ��������������� ���������� ����
//   if (LeadingOrder>= 2) CheckOverlapping()                    ; 
 
//***************  ������ �� ������������� ����������� �����������  ***************************

int levels        =spr+freez+stlev          ;
   if(PipStep    <=levels) PipStep   =levels;
   if(Tral_Start <=levels) Tral_Start=levels; 

//===============================================================================================================================

if(time() && VisualMode){
   if(tbGetText(hwnd,lottxt)!="")LotR=StrToDouble(tbGetText(hwnd,lottxt));
   if (tbIsClicked(hwnd,buybtn)){
      comment=StringConcatenate("Integra -P�����, ","Magic : ",MagicNumber);
         SendOrder(OP_BUY , LotR,0,0,0, comment, MagicNumber);
   }

   if (tbIsClicked(hwnd,sellbtn)){
      comment=StringConcatenate("Integra -P�����, ","Magic : ",MagicNumber);
         SendOrder(OP_SELL, LotR,0,0,0, comment, MagicNumber);
   }

   if (tbIsClicked(hwnd,closebtn    )) CloseThisSymbolAll(MagicNumber         );
   if (tbIsClicked(hwnd,closesellbtn)) CloseThisSymbolAll(MagicNumber, OP_SELL);
   if (tbIsClicked(hwnd,closebuybtn )) CloseThisSymbolAll(MagicNumber, OP_BUY );   
}
 
//===========================================  ���������� ��������� �������  ==========================================

if (SumProfit<0 && CurrencySL!=0){
   if (MathAbs(SumProfit)>=CurrencySL){
      if (Info) Print("�������� ��������� �������� �������");
         CloseFM=true;
   }
} 
     
if (totalord==0)  {CloseAll=false; Close_All=false;Lockbuy=false;Locksell=false;}
   if (Close_All || CloseAll || CloseFM){
      CloseOrders() ; Indication ("ICloseAll",2,10,150,"�������� �������",FontSize,"Times New Roman",ColorInd);
      DeleteObject(); // ����� �������� � ������� ������
      CloseFM=false;
         if (Info && Close_All)   Print("������� �Ѩ");
   return(0);
   }

//===============================   ������� �� ������������� ���   ====================================================

if (CurrentDrawdown<=FixLotPercent) fixlot=false; else fixlot=true ;
if (FixLot)  fixlot=true ; 

//==============================   ��������� �������� ����� N-�� ������==============================

   if (LotN > 0) {
       if (totalbuy >= LotN || totalsell >=LotN )
                  {
   LotExponent=LotExponentNew ;     
   PipStep=PipStepNew;
                    } 
                           else  
        {
   LotExponent=lotexponent ;     
   PipStep=pipstep;
        }  
                  }    
//***********************    
CP_Lot_step = Lot* LotExponent                               ;   /// ���������� ��� ������� ��������������� ���������� ����
                    
//===============================   Lock   ====================================================


if (totalbuy>0 || totalsell>0)
{
Lockbuy=false;
Locksell=false;
 for(int cnt = OrdersTotal() - 1; cnt >= 0; cnt--){
       if (OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES))
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
            {
               if  (OrderType()==OP_BUY)
                  {
                  if(StringFind(OrderComment()," Lock-Buy",0)!=-1) Lockbuy=true;
                  }
               if  (OrderType()==OP_SELL)
                  {
               if(StringFind(OrderComment()," Lock-Sell",0)!=-1) Locksell=true;
                  }
            }  
 } 
}
if (UseLock) { 
/* double CurrentMargLevel = 10000;
   if (AccountMargin()>0) {
    CurrentMargLevel = (AccountEquity()/AccountMargin())*100;}*/
double lock1=NormalizeDouble(Sumlot/100*LockPercent,dig);
if (lock1>maxLot) lock1=maxLot;
double  pips, dwdn,drwdnprs,Balans,Equity;
/*double ProfitBuy = CurrentCondition("Buy" ,"ProfitBuy" );
double ProfitSell= CurrentCondition("Sell","ProfitSell");*/
Balans   = Balance;
Equity   = Sredstva;
   
if (Sumlot>0) {
   if (Balans>Equity)    pips=NormalizeDouble((Equity-AccountStopoutLevel()*Equity/ 100.0)/Sumlot/TV,0);
    if (Common)    {
     if (Balans<=Equity)    {
     dwdn=0;
     drwdnprs=0;}
     else {
 dwdn=NormalizeDouble(Balans-Equity,3);
 drwdnprs=  CurrentDrawdown;
      }
    }
   else
    {
     if (SumProfit>=0) {
     dwdn=0;
     drwdnprs=0;}
        else      {
       dwdn=NormalizeDouble(-SumProfit,3);
       drwdnprs= NormalizeDouble(dwdn*100/Balans,3);
         }
    }

//dwdn=NormalizeDouble(GetMoney("Balance")-GetMoney("Sredstva"),3);
if (!Locksell &&!Lockbuy&& SumLotBuy!=SumLotSell)
      { if ((LockPercentDrwdn>0 && CurrentDrawdown>=LockPercentDrwdn) || (PipsLock>0 && pips<=PipsLock) || (LockDrwdn>0 && dwdn>=LockDrwdn)||(LockMargLevel>0 && LockMargLevel>CurrentUrov)) {
         if ((Sum_lot<0||ProfitSell<0<ProfitBuy) && LockCCI==false&&totalsell>=LotTradeN)                      {if(Info) Print("O������� �������� ������  Lock-Buy") ; SendOrder(OP_BUY ,lock1,0,0,MagicNumber,"Integra" + " Lock-Buy" ,Error);}
      else 
         if ((Sum_lot<0||ProfitSell<0<ProfitBuy) && Signal_CCI()== 1 && LockCCI==true&&totalsell>=LotTradeN)   {if(Info) Print("O������� �������� ������  Lock-Buy") ; SendOrder(OP_BUY ,lock1,0,0,MagicNumber,"Integra" + " Lock-Buy" ,Error);}
         
         if ((Sum_lot>0||ProfitBuy<0<ProfitSell) && LockCCI==false&& totalbuy>=LotTradeN)                      {if(Info) Print("O������� �������� ������  Lock-Sell"); SendOrder(OP_SELL,lock1,0,0,MagicNumber,"Integra" + " Lock-Sell",Error);}
      else
         if ((Sum_lot>0||ProfitBuy<0<ProfitSell) && Signal_CCI()==-1 && LockCCI==true&& totalbuy>=LotTradeN)   {if(Info) Print("O������� �������� ������  Lock-Sell"); SendOrder(OP_SELL,lock1,0,0,MagicNumber,"Integra" + " Lock-Sell",Error);} 
      }
 } 
}
}  
if   (!TradeAfterLock) { 
 if (Lockbuy) MaxTrades=totalsell-1; else MaxTrades=maxtrades;
 if (Locksell) MaxTrades=totalbuy-1; else MaxTrades=maxtrades;               }
//=========================================  ������ ������������� �������  ============================================
if(DefaultProfit<=0 )  Profit = 0.01  ;  
if(DefaultProfit>0 ){
      if(!valute)
{Profit = NormalizeDouble(Lot*DefaultProfit*Point*MarketInfo(Symbol(),MODE_LOTSIZE)/10000,2); }   //MarketInfo(Symbol(),MODE_LOTSIZE)/10000/Point
      if(valute)           {if(Risk!=0) Profit = NormalizeDouble(Lot*DefaultProfit/minLot,2); else Profit = DefaultProfit;  }
                     }
                     
//==========================================  �������� �������  =======================================================
   
if (SumProfit>(Profit+Tral_Start*TV*Sumlot) && !CloseTrigger){
   CloseTrigger=1; TPcolor=ColTPTrail; ZLcolor=ColorZL ;
}   
         
   if (!CloseTrigger){
   TPcolor=ColorTP; ZLcolor=ColorZL      ;
   delta  = (Profit-SumProfit)/TV/Sumlot ; // ����� ������� �� �������
   delta2 =  SumProfit/TV/Sumlot         ; // ����� ������� �� ��������� 
      if (Sum_lot>0){
      TPPrice=NormalizeDouble(Bid+(delta+Tral_Start)*Point,Digits); ZeroLine=NormalizeDouble(Bid-delta2*Point,Digits)  ;
      }
      else{
      TPPrice=NormalizeDouble(Ask-(delta+Tral_Start)*Point,Digits); ZeroLine=NormalizeDouble(Ask+delta2*Point,Digits)  ;
      } 
   }

      if (!IsTesting() || IsVisualMode() || !IsOptimization()){
         DrawLine("ILineTP",TPPrice,TPcolor,2); DrawLine("ILineZL",ZeroLine,ZLcolor,0); 
         DrawText("ItxtTP","������� ��",TPPrice,TPcolor); DrawText("Itxt��","������� ��",ZeroLine,ZLcolor);
      }
      if (totalord==0) ObjectDelete("Itxt��");
      
//==========================  ������� �����  ======================================
if (Sum_lot!=0){ 
   if (CloseTrigger==1){       
//==========================  Buy  ======================================

      if (Sum_lot>0){
         if (Bid<=NormalizeDouble(TPPrice,Digits)){
            if (Info)  Print("������� ����� �� �������� Buy SL");                 CloseAll=true ;
         }
            else 
         if (TPPrice<(Bid-Tral_Size*Point)) TPPrice=NormalizeDouble(Bid-Tral_Size*Point,Digits) ;
      }

//==========================  Sell  ====================================== 

      if (Sum_lot<0){
         if (Ask>=NormalizeDouble(TPPrice,Digits)){
            if (Info)  Print("������� ����� �� �������� Sell SL ");               CloseAll=true ;
         }
            else 
         if (TPPrice>(Ask+Tral_Size*Point)) TPPrice=NormalizeDouble(Ask+Tral_Size*Point,Digits) ;
      }
   } 
}
  
//********************************************************************************************* 

if (!IsTesting() || IsVisualMode() || !IsOptimization()){
   if (Info){
   MainIndication(); 
   SetOrdersInfo();
   Price = PriceCCI(Level);   
   } 
}

//============================================================  ������ �����  ===================================================
if (!ManualTrade && NewCycle_ON && time() && !Close_All && !NoTrade&&!Locksell&&!Lockbuy){
//=========================================================  �������� ������� Buy  ==============================================

double StartLot                                      ; 
int ticketbuy=0, ticketsell=0                        ;  
   if (TradeBuy && totalbuy==0){
      if (ticketbuy ==0){
         if (GetMASignalS()==1 || !TipMAFilter==1){
            if (!GetMASignal()==1 || !TipMAFilter==2){
               if (Signal_CCI()==1){
                  DeleteObject()                     ;
                  StartLot = NormalizeDouble(Lot,dig);     
                  if(Info) Print("������� �� �������� ������� BUY");
                     comment=StringConcatenate("1-� ����� Buy, ","Magic : ",MagicNumber)           ;
                        ticketbuy = SendOrder(OP_BUY , StartLot, 0, 0, MagicNumber, comment, Error);
                  if (!IsTesting() || IsVisualMode() || !IsOptimization()){
                     if (Info) PlaySound("alert.wav");
                        Sleep(1000); // ���� ��� �� ������������ - "��������" �� 1 �������.; 
                  }
               }
            }
         }
      } 
   }   
   
//=========================================================  �������� ������� Sell  =============================================

   if (TradeSell && totalsell==0){
      if (ticketsell==0){
         if (GetMASignalS()==-1 || !TipMAFilter==1){
            if (!GetMASignal()==-1 || !TipMAFilter==2){
               if (Signal_CCI()==-1){
                  DeleteObject()                     ;
                  StartLot = NormalizeDouble(Lot,dig);    
                  if(Info) Print("������� �� �������� ������� SELL");
                     comment=StringConcatenate("1-� ����� Sell, ","Magic : ",MagicNumber)            ;
                        ticketsell  = SendOrder(OP_SELL, StartLot, 0, 0, MagicNumber, comment, Error);
                  if (!IsTesting() || IsVisualMode() || !IsOptimization()){
                     if (Info) PlaySound("alert.wav");
                        Sleep(1000); // ���� ��� �� ������������ - "��������" �� 1 �������.; 
                  }
               }
            } 
         }   
      }        
   }   
}        

//=====================================================  ������������� �����  ===================================================

if (time() && !Close_All && !NoTrade){  
double NewLot,afmc;
ObjectDelete("InewLot");

      //==========================  Buy  ======================================

   if (TradeBuy && totalbuy>0 && totalbuy<=MaxTrades&&!Lockbuy){
      if (Ask<(LastPriceBuy-PipStep*Point)){  
         NewLot = NewLot(1)                                          ;
            afmc = AccountFreeMarginCheck(Symbol(), OP_BUY, NewLot)  ;
if(Info) Indication ("InewLot",3,10,115,StringConcatenate("������� �����: Buy ",DoubleToStr(NewLot,dig)," / ","�c������� : $",DoubleToStr(afmc,0)),FontSize,"Times New Roman",ColorInd);            
           
      if(afmc<=0) return; else
         if (GetMASignalS()==1 || !TipMAFilter==1){
            if (!GetMASignal()==1 || !TipMAFilter==2){
               if (Signal_CCI()==1){
                  if (Info)  Print("������� ����������� �� �������� ������ - BUY")                 ;   
                     comment=StringConcatenate(totalbuy+1,"-� ����� Buy, " ,"Magic : ",MagicNumber);
                        ticketbuy = SendOrder(OP_BUY, NewLot, 0, 0, MagicNumber, comment, Error)   ;
                  if (!IsTesting() || IsVisualMode() || !IsOptimization()){
                     if (Info) PlaySound("alert.wav")                                              ;
                        Sleep(1000); // ���� ��� �� ������������ - "��������" �� 1 �������.;      
                  }     
               }         
            }
         }     
      }         
   }   
      
      //==========================  Sell  =====================================

   if (TradeSell && totalsell>0 && totalsell<=MaxTrades&&!Locksell){
      if (Bid>(LastPriceSell+PipStep*Point)){ 
         NewLot = NewLot(2)                                          ;
            afmc = AccountFreeMarginCheck(Symbol(), OP_SELL, NewLot) ;
if(Info) Indication ("InewLot",3,10,115,StringConcatenate("������� �����: Sell ",DoubleToStr(NewLot,dig)," / ","�c������� : $",DoubleToStr(afmc,0)),FontSize,"Times New Roman",ColorInd);            
  
      if(afmc<=0) return; else
         if (GetMASignalS()==-1 || !TipMAFilter==1){
            if (!GetMASignal()==-1 || !TipMAFilter==2){
               if (Signal_CCI()==-1){
                  if (Info)  Print("������� ����������� �� �������� ������ - SELL")                   ; 
                     comment=StringConcatenate(totalsell+1,"-� ����� Sell, ","Magic : ",MagicNumber)  ;
                        ticketsell = SendOrder(OP_SELL, NewLot, 0, 0, MagicNumber, comment, Error)    ; 
                  if (!IsTesting() || IsVisualMode() || !IsOptimization()){
                     if (Info) PlaySound("alert.wav")                                                 ;
                        Sleep(1000); // ���� ��� �� ������������ - "��������" �� 1 �������.;       
                  }
               }
            }  
         } 
      }        
   }            
}    
if (LeadingOrder >0){
 if (!LeadingAfterLock) if (!Lockbuy && !Locksell) CheckOverlapping()  ;    
 if (LeadingAfterLock)   CheckOverlapping()          ;   
                      }                       
//================================================= 
   
      return(0);  // ����� �� start
}

//INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++++++           �������            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//=========================================================================================================================================//
// Qimer . ������� �������� ������� ������ ������                                                                                          //
//=========================================================================================================================================//

bool MagicCheck(){
   for(int i=0; i<cmagic; i++){
      if (OrderMagicNumber()==magic[i]) return(true);
   }
   return(false);
}

//=========================================================================================================================================//
// shvonder . ������ ������� �� �� S                                                                                                       //
//=========================================================================================================================================//  

int GetMASignalS(){
   if (TipMAFilter==1){
int Signal = 0;
double iMA_Signal = iMA(Symbol(), TF_MA, Period_��, 0, MODE_SMMA, PRICE_CLOSE, 1);
int Ma_Bid_Diff = MathAbs(iMA_Signal - Bid)/Point;
   if(Ma_Bid_Diff > Distance_�� && Bid > iMA_Signal) Signal = -1; //Sell
   if(Ma_Bid_Diff > Distance_�� && Bid < iMA_Signal) Signal =  1; //Buy   
double LevelNoBuy =iMA_Signal-Distance_��*Point;
double LevelNoSell=iMA_Signal+Distance_��*Point; 
      if (!IsTesting() || IsVisualMode() || !IsOptimization()){
         DrawLine("ILevelNoBuy  ", LevelNoBuy  , RoyalBlue, 3); 
         DrawLine("ILevelNoSell ", LevelNoSell , Crimson  , 3);  
         DrawText("ItxtLevelBuy ","Filter shvonder - ������ Buy" , LevelNoBuy , RoyalBlue);
         DrawText("ItxtLevelSell","Filter shvonder - ������ Sell", LevelNoSell, Crimson  );
      }
   }
return(Signal);
}

//=========================================================================================================================================//
// Kordan . ������ ������� �� �� K                                                                                                         //
//=========================================================================================================================================//  

int    GetMASignal(){
   if (TipMAFilter==2){
int    Signal = 0;
double iMA_Signal  = iMA(Symbol(),TF_MA,Period_��, 0, MODE_SMMA, PRICE_CLOSE, 1);
int    Ma_Bid_Diff = MathAbs(iMA_Signal - Bid)/Point;
double LevelNoBuy =iMA_Signal+Distance_��*Point;
double LevelNoSell=iMA_Signal-Distance_��*Point;
      if(Ma_Bid_Diff > Distance_��){ 
         if(Bid > iMA_Signal) Signal = 1; //������ Buy
         if(Bid < iMA_Signal) Signal =-1; //������ Sell  
      }   
      if (!IsTesting() || IsVisualMode() || !IsOptimization()){
         DrawLine("ILevelNoBuy  ", LevelNoBuy  , RoyalBlue, 3); 
         DrawLine("ILevelNoSell ", LevelNoSell , Crimson  , 3);
         DrawText("ItxtLevelBuy ","Filter Kordan - ������ Buy" , LevelNoBuy , RoyalBlue);  
         DrawText("ItxtLevelSell","Filter Kordan - ������ Sell", LevelNoSell, Crimson  ); 
      }  
   } 
return(Signal);                      
}

//=========================================================================================================================================//
// Kordan . ������ �CI                                                                                                                     //
//=========================================================================================================================================// 
int Signal_CCI(){
double x0,x1,x2,x3,x4;
int Signal = 0;
 x0 = iClose(Symbol(),mper[CCI_TimeFrame+1], 0)      ;
 x1 = iClose(Symbol(),mper[CCI_TimeFrame+1], 2)      ;
if (CCI_NR) {
 x2 = iCustom(NULL,mper[CCI_TimeFrame],"iCCI.NR", Period_CCI,PriceTip,Sens, 0,0);
 x3 = iCustom(NULL,mper[CCI_TimeFrame],"iCCI.NR", Period_CCI,PriceTip,Sens, 0,1);
 x4 = iCustom(NULL,mper[CCI_TimeFrame],"iCCI.NR", Period_CCI,PriceTip,Sens, 0,3);}
if (!CCI_NR) {
 x2 = iCCI(NULL,mper[CCI_TimeFrame],Period_CCI,0,0)  ; 
 x3 = iCCI(NULL,mper[CCI_TimeFrame],Period_CCI,0,1)  ;
 x4 = iCCI(NULL,mper[CCI_TimeFrame],Period_CCI,0,3)  ;}
   if (x2>-Level && x3<-Level && x2>x4 && x1>x0) Signal = 1;    //Buy 
   if (x2< Level && x3> Level && x2<x4 && x1<x0) Signal =-1;    //Sell
return(Signal);
}
//=========================================================================================================================================//
// Kordan . ������� ��������� ���������� �� �������� �������                                                                               //
//=========================================================================================================================================// 

void CurrentCondition(){
totalord=0;totalbuy=0;totalsell=0;SumProfit=0;CurrentDrawdown=0;ProfitBuy=0;ProfitSell=0;SumLotBuy=0;SumLotSell=0;LastPriceBuy=0;LastPriceSell=0;
   for (int cnt=0;cnt<OrdersTotal();cnt++){
      if (OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES)){
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber || MagicCheck()){
            if (OrderType()== OP_SELL || OrderType() == OP_BUY){
               switch(OrderType()){
                  case OP_BUY :  
                     totalbuy     ++             ; 
                     SumLotBuy    += OrderLots() ;
                     LastLotBuy    = OrderLots() ;
                     LastPriceBuy  = NormalizeDouble(OrderOpenPrice() , Digits) ;
                     ProfitBuy    += NormalizeDouble(OrderProfit()+OrderSwap()+OrderCommission(), 2); 
                        break;
                  case OP_SELL: 
                     totalsell    ++             ;
                     SumLotSell   += OrderLots() ;
                     LastLotSell   = OrderLots() ;
                     LastPriceSell = NormalizeDouble(OrderOpenPrice() , Digits) ; 
                     ProfitSell   += NormalizeDouble(OrderProfit()+OrderSwap()+OrderCommission(), 2);  
                        break; 
               default: return(0);
               }
            }
         totalord        = totalbuy + totalsell;
         SumProfit      += OrderProfit()+OrderSwap()+OrderCommission() ;
         CurrentDrawdown = NormalizeDouble(MathMax((AccountBalance()+AccountCredit()-AccountEquity())/(AccountBalance()+AccountCredit())*100,0),2);        
         Sum_lot         = NormalizeDouble(SumLotBuy-SumLotSell ,dig);  // ��������� ��� (���� ��� �����)        
         Sumlot          = NormalizeDouble(MathAbs(Sum_lot     ),dig);  // A��������� �������� ���������� ���� (�������� �� ������, ������ ����)        
         if (AccountMargin()>0) CurrentUrov = NormalizeDouble(AccountEquity()/AccountMargin()*100,0);                  
         }
      }
   }    
}

//=========================================================================================================================================//
// Kordan . ������� ��������� ������ � ���� � ��� ��������� �������                                                                        //
//=========================================================================================================================================// 

void GetOrdMaxNinProfit(){
int    Pos   =0;
double result=0,profit=0;
//   for (int cnt=OrdersTotal()-1; cnt>=0; cnt--) {
   for (int cnt=0;cnt<OrdersTotal();cnt++){
      if (OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES)){
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber || MagicCheck()){
            if (OrderType()== OP_SELL || OrderType() == OP_BUY){
            
               profit = OrderProfit()           ;
               Pos    = OrderTicket()           ;
               
               if (profit>0 && profit>Lprofit){
                  Lprofit1 = Lprofit            ;
                  Lpos1    = Lpos               ; 
                  Lprofit  = profit             ; //���� ��������
                  Lpos     = Pos                ;
               }
                  
               if (profit<0 && profit<Cprofit){
                  Cprofit = profit              ; //���  ��������
                  Cpos    = Pos                 ;
               }
            }
         }
      }   
   }                                                                                             
}

//=========================================================================================================================================//
// Kordan . ������� ������� ���� ��� �������� �����                                                                                        //
//=========================================================================================================================================//

double NewLot(int OrdType){
double newlot,cp                                                                       ;

  if (OrdType==1){
           if (!fixlot) cp=MathAbs((LastPriceBuy-Ask )/Point/PipStep);   else cp=1       ;   
                     if (TypeLotExp == 2)                         // ��������������
           newlot=NormalizeDouble(LastLotBuy+(CP_Lot_step*cp),dig) ;    else  {    
                     
                     if (TypeLotExp == 1)                          //������������� 
           newlot=NormalizeDouble(LastLotBuy*MathPow(LotExponent,cp),dig);  else  { 
           
                     if (TypeLotExp == 0)                          //�� Kordan-�  
           newlot = NormalizeDouble(LastLotBuy*LotExponent*cp,dig)  ; else  
                     
         //            if (TypeLotExp != 2 && TypeLotExp != 1 && TypeLotExp != 0) 
           newlot = NormalizeDouble(LastLotBuy*LotExponent*cp,dig)  ;}}
          }
             
if (OrdType==2){
          if (!fixlot) cp=MathAbs((Bid-LastPriceSell)/Point/PipStep);   else cp=1       ;   
                      if (TypeLotExp == 2)                         // ��������������
           newlot=NormalizeDouble(LastLotSell+(CP_Lot_step*cp),dig) ;      else  {  
                     
                     if (TypeLotExp == 1)                          //������������� 
           newlot=NormalizeDouble(LastLotSell*MathPow(LotExponent,cp),dig);  else  { 
           
                     if (TypeLotExp == 0)                          //�� Kordan-�  
           newlot = NormalizeDouble(LastLotSell*LotExponent*cp,dig)  ; else  
                     
  //                   if (TypeLotExp != 2 && TypeLotExp != 1 && TypeLotExp !=0) 
           newlot = NormalizeDouble(LastLotSell*LotExponent*cp,dig)  ;}}
          }
              
if (newlot > MaxLot)    newlot = NormalizeDouble(MaxLot,dig)                 ;
if(newlot < minLot)  newlot = minLot                                                   ;            
return(newlot)                                                                         ;
} 

//=========================================================================================================================================//
// Kordan . ������� ������� ���������� ����                                                                                                //
//=========================================================================================================================================//

double GetLot(){  
double lot=0                                                      ;
      if(Risk!=0)                                                    // ���� ���-�� ����� ������� � % �� ��������� �������,                                                          
         lot  =MathAbs(FreeMargin*Risk/3200/One_Lot/Step)*Step ; else// �� ������� ��������� ����
         lot  =MathMax(DefaultLot,minLot)                         ;  // ����� ������������ �������� �������� DefaultLot �� ������ ���. ������a ����
      if(lot<minLot) lot=minLot                                   ;  // �� ������ ������������  ������a ���a
      if(MaxLot==0 ) lot=lot; else
                     lot=MathMin(MaxLot, lot)                     ;  // �� ������ ����������� �������������� ������a ���a
                                                                      
      if (lot*One_Lot>FreeMargin){                                   // ���� ��� ������ ��������� �������,
         if (!IsTesting() || IsVisualMode() || !IsOptimization()){   // �� ������� ��������� � ������ ����,
            Indication ("INoMoney",2,xDist1,40,"������������ �������!!!",FontSize+5,"Courier",Red) ;  // ������� �����              
         }
            else{ 
               Indication ("INoMoney",2,xDist1,40,"������������ �������!!! �������� �����������!!!",FontSize+5,"Courier",Red); 
                  NoTrade=TRUE                                    ;  // ������������� ��������
            }          
         return (0)                                               ;  // � ������� �� ������� start()
      } 
      else  ObjectDelete("INoMoney")                              ;                                           
return(lot)                                                       ;
}

//===================================================================================================================================================
// shvonder . 
//===================================================================================================================================================

bool AllowTrade(){
   if(Bars < Period_��){
      Print("���������� ����� � �������!"); 
         return(false); 
   }
   if (Bid == 0.0 || Ask == 0.0){
      Print(StringConcatenate("������������ ����. Ask: ", Ask, " Bid: ", Bid)); 
         return(false); 
   }
return(true);
}

//=========================================================================================================================================//
// ������� ������� ����� ����� �������                                                                                                     //
//=========================================================================================================================================//

int LotDecimal(){
int digits;     
   if (Step >= 1   ) digits = 0;
   if (Step >= 0.1 ) digits = 1;
   if (Step >= 0.01) digits = 2;
return(digits);
}   
 
//=========================================================================================================================================//
// Qimer . ������� ������� �� �������                                                                                                      //
//=========================================================================================================================================// 

bool time(){
   if (((Hour()<StartHourMonday && DayOfWeek()==1) || (Hour()>=EndHourFriday && DayOfWeek()==5)) && UseFilterTime) return(false);
   else return(true);
}

//=========================================================================================================================================//
// ir0407 . ������� �������� �������                                                                                                       //
//=========================================================================================================================================//   

int SendOrder (int Type, double Lots, int TP, int SL, int magic, string Cmnt, int Error){
double Price, Take, Stop;
int Ticket, Slippage, Color, Err; 
bool Delay = False;
   if (Info) Print("������� �������� �������");
while(!IsStopped()){  
   if (!IsTesting()){ //���� �� �� � ������ ������������
      if(!IsExpertEnabled()){
         Error = ERR_TRADE_DISABLED;
         Print ("�������� ��������� ���������! ������ \"���������\" ������.");
         return(-1);
      }
         if (Info) Print("�������� ��������� ���������");
            if(!IsConnected()){
               Error = ERR_NO_CONNECTION;
               Print("����� �����������!");
            return(-1);
            }
      if (Info) Print("����� � �������� �����������");
      if(IsTradeContextBusy()){
         Print("�������� ����� �����!");
         Print(StringConcatenate("������� ",PauseTrade," cek"));
         Sleep(PauseTrade*1000);
         Delay = True;
         continue;
      }
      if (Info) Print("�������� ����� ��������");
         if(Delay){
            if(Info) Print("��������� ���������");
            RefreshRates();
            Delay = False;
         }
      else if (Info) Print("��������� ���������");
      }
            switch(Type){
               case OP_BUY:
//               if (Info) Print("�������������� ��������� ��� BUY-������");
                Price = NormalizeDouble( Ask, Digits);
                Take = IIFd(TP == 0, 0, NormalizeDouble( Ask + TP * Point, Digits));
                Stop = IIFd(SL == 0, 0, NormalizeDouble( Ask - SL * Point, Digits));
                Color = Blue;
                break;
             case OP_SELL:
//                 if (Info) Print("�������������� ��������� ��� SELL-������");
                 Price = NormalizeDouble( Bid, Digits);
                 Take = IIFd(TP == 0, 0, NormalizeDouble( Bid - TP * Point, Digits));
                 Stop = IIFd(SL == 0, 0, NormalizeDouble( Bid + SL * Point, Digits));
                 Color = Red;
                 break; 
             default:
               Print("!��� ������ �� ������������� �����������!");
               return(-1);
             }   
       string NameOP=GetNameOP(Type);      
       Slippage = 2*MarketInfo(Symbol(), MODE_SPREAD);      
       if (Info) Print(StringConcatenate("�����: ",NameOP," / "," ����=",Price," / ","Lot=",Lots," / ","Slip=",Slippage," pip"," / ",Cmnt)); 
       
	if(IsTradeAllowed()){
		if (Info) Print(">>>>>�������� ���������, ���������� ����� >>>>>");
			Ticket = OrderSend(Symbol(), Type, Lots, Price, Slippage, Stop, Take, Cmnt, magic, 0, Color);
   
		if(Ticket < 0){
         Err = GetLastError();
      if(Err == 4   || /* SERVER_BUSY       */
         Err == 129 || /* ERR_INVALID_PRICE */
         Err == 130 || /* INVALID_STOPS     */ 
         Err == 135 || /* PRICE_CHANGED     */ 
         Err == 137 || /* BROKER_BUSY       */ 
         Err == 138 || /* REQUOTE           */ 
         Err == 146 || /* TRADE_CONTEXT_BUSY*/
         Err == 136 )  /* OFF_QUOTES        */
            {
               if (!IsTesting()){
                  Print(StringConcatenate("������(OrderSend - ",Err,"): ",ErrorDescription(Err), ")"));
                  Print(StringConcatenate("������� ",PauseTrade," cek"));
                  Sleep (PauseTrade*1000);
                  Delay = True;
               continue;
               }
            }
               else{
                  Print(StringConcatenate("����������� ������(OrderSend - ",Err,"): ",ErrorDescription(Err), ")"));
                  Error = Err;
               break;
               }
		}
      break;
	}
      else{
         if(Info) Print("�������� ��������� ���������! ����� ����� � ��������� ��������.");
      break;
      }
}
   if(Ticket > 0)
      if(Info) Print(StringConcatenate("����� ��������� �������. ����� = ",Ticket));
   else {
      if(Info) Print(StringConcatenate("������! ����� �� ���������. (��� ������ = ",Error,": ",ErrorDescription(Error), ")"));
   }
   return(Ticket);
}

//=========================================================================================================================================//
// KimIV . ������� "����-��" ��� double                                                                                                    //
//=========================================================================================================================================//

double IIFd(bool condition, double ifTrue, double ifFalse) 
{if (condition) return(ifTrue); else return(ifFalse);}

//=========================================================================================================================================//
// ir0407 +Qimer+lol. ������� �������� �������                                                                                                       //
//=========================================================================================================================================//  

void CloseOrders(){
bool Delay = False,q;
double  ClosePrice;
color   CloseColor;
int Err,tickS,tickB,tiket;
	if (Info) Print("������� �������� �������");
		if (!IsTesting()){ //���� �� �� � ������ ������������
			if(!IsExpertEnabled()){
				Error = ERR_TRADE_DISABLED;
				Print("�������� ��������� ���������!");
				return;
			}
		if (Info) Print("�������� ��������� ���������");
			if(!IsConnected()){
				Error = ERR_NO_CONNECTION;
				Print("����� �����������!");
				return;
			}
		}

		
   if (!IsTesting()){		
      if (Info) Print("����� � �������� �����������");
   }
 
   if (CloseBy /*&& !IsTesting()*/)
      {
    if (SumLotBuy >0) SendOrder(OP_SELL, SumLotBuy, 0, 0,  MagicNumberCloseby,"��������� Sell", Error) ;
    if (SumLotSell >0)  SendOrder(OP_BUY, SumLotSell, 0, 0, MagicNumberCloseby, "��������� Buy", Error) ; 
     /* tickB=0; 
      tickS=0;
	for(int j = OrdersTotal() - 1; j >= 0; j--)  {
	   
            if (OrderSelect(j,SELECT_BY_POS, MODE_TRADES)) 
               {
               if (OrderSymbol() == Symbol() && OrderType() == OP_SELL && OrderMagicNumber()==MagicNumberCloseby) {tickS=OrderTicket(); }
               if (OrderSymbol() == Symbol() && OrderType() == OP_BUY && OrderMagicNumber()==MagicNumberCloseby) {tickB=OrderTicket();}
               }
                                                }*/
       }    
	for(int trade = OrdersTotal() - 1; trade >= 0; trade--){
	  if (CloseBy){
	   tickB=0; 
      tickS=0;
	for(int j = OrdersTotal() - 1; j >= 0; j--)  {
	   
            if (OrderSelect(j,SELECT_BY_POS, MODE_TRADES)) 
               {
               if (OrderSymbol() == Symbol() && OrderType() == OP_SELL && OrderMagicNumber()==MagicNumberCloseby) {tickS=OrderTicket(); }
               if (OrderSymbol() == Symbol() && OrderType() == OP_BUY && OrderMagicNumber()==MagicNumberCloseby) {tickB=OrderTicket();}
               }
                                               }
                 }                             
		if(OrderSelect(trade, SELECT_BY_POS, MODE_TRADES)){
		
			if(OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber || MagicCheck()){
if (Info) Print("��������� ����� #", OrderTicket());
				while(!IsStopped()){
					if(IsTradeContextBusy()){
						Print("�������� ����� �����!");
						Print(StringConcatenate("������� ",PauseTrade," cek")); 
						Sleep(PauseTrade*1000);
						Delay = True;
					continue;
					}
					
   if (!IsTesting()){		
      if (Info) Print("�������� ����� ��������");
   }					
						if (Delay){
							if (Info) Print("��������� ���������");
							RefreshRates();
							Delay = False;
						}
							switch(OrderType()){
								case OP_BUY : ClosePrice = NormalizeDouble(Bid, Digits); CloseColor = Blue; tiket=tickS; break;
								case OP_SELL: ClosePrice = NormalizeDouble(Ask, Digits); CloseColor = Red ; tiket=tickB; break;
							}
							
   int Slippage = 2*MarketInfo(Symbol(), MODE_SPREAD);
      if (Info) Print(StringConcatenate("���� ��������=",ClosePrice," / ","Slip = ",Slippage," pip"));  
							if(!IsTradeAllowed()){
								Print("�������� ��������� ���������, ����� ����� � ��������� ��������!");
								return;
							}
								else 
	{if (CloseBy/* && !IsTesting()*/)	{ q=false; q=OrderCloseBy(OrderTicket(),tiket,CloseColor);}
   else   q=OrderClose(OrderTicket(), OrderLots(), ClosePrice, Slippage, CloseColor);
					if(!q){
						Err = GetLastError();
						if(Err == 4   || /* SERVER_BUSY       */
							Err == 129 || /* ERR_INVALID_PRICE */ 
							Err == 130 || /* INVALID_STOPS     */ 
							Err == 135 || /* PRICE_CHANGED     */ 
							Err == 137 || /* BROKER_BUSY       */ 
							Err == 138 || /* REQUOTE           */ 
							Err == 146 || /* TRADE_CONTEXT_BUSY*/
							Err == 136 ){ /* OFF_QUOTES        */
								Print(StringConcatenate("������(OrderClose - ",Err,"): ",ErrorDescription(Err), ")")); 
								Print(StringConcatenate("������� ",PauseTrade," cek")); 
								Sleep(PauseTrade*1000);
								Delay = True;
								continue;
														}
							else{
								Print(StringConcatenate("����������� ������(OrderClose - ",Err,"): ",ErrorDescription(Err), ")"));
								break;
							}
					} 	else break;								
				}  
			}
				 Sleep(100);        // ����� while(!IsStopped())	
			}
		}	
	}		
if (Info) Print("����� ������� �������� �������.");
	return;
}
//=========================================================================================================================================//
// shvonder . ���������� �������                                                                                                           //
//=========================================================================================================================================//

void CheckOverlapping(){
Lpos = 0; Cpos = 0; Lprofit = 0; Cprofit = 0;

GetOrdMaxNinProfit();

   if (totalbuy >= LeadingOrder || totalsell >= LeadingOrder){
      if(Lprofit > 0 && Lprofit1 <= 0 && Cprofit < 0){
         if(Lprofit + Cprofit > 0 && (Lprofit + Cprofit)*100/Lprofit > ProfitPersent){
            Lpos1 = 0;
            CloseSelectOrder();  
         }
      }  else
      
   if(Lprofit > 0 && Lprofit1 > 0 && (totalbuy > LeadingOrder || totalsell > LeadingOrder) && Cprofit < 0 ){
      if(Lprofit + Lprofit1 + Cprofit > 0 && (Lprofit + Lprofit1 + Cprofit)*100/(Lprofit + Lprofit1) > SecondProfitPersent) 
         CloseSelectOrder();         
      }
   } 
}

//=========================================================================================================================================//
// shvonder . ���������� �������                                                                                                           //
//=========================================================================================================================================//

int CloseSelectOrder(){
if (Info) Print("������� ���������� �������.");
   int error =  0;
   int error1 = 0;
   int error2 = 0;
   int Result = 0;
   int Slippage = 2*MarketInfo(Symbol(), MODE_SPREAD);
   
//                       ---------------------- ���������  -----------------------                            
       
   while (error1 == 0) {
      RefreshRates();
         int i = OrderSelect(Lpos, SELECT_BY_TICKET, MODE_TRADES);
            if (i != 1){
               Print ("������! ���������� ������� ����� � ���������� ��������. ���������� ���������� ��������.");
                  return (0);
            }  
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber || MagicCheck()){
               if (OrderType() == OP_BUY) {
                  error1 =  (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, Digits), Slippage, Blue));
                  if (error1 == 1) {
                     if (Info) Print ("���������� ����� ������ �������."); 
                     Sleep (500);   
                  } else {
                     Print ("������ �������� ����������� ������, ��������� ��������. ");                     
                  }      
               } 
               
//                        -----------------------------------------------------   
            
               if (OrderType() == OP_SELL) {
                  error1 = (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, Digits), Slippage, Red));
                  if (error1 == 1) {
                     if (Info) Print ("���������� ����� ������ �������"); 
                     Sleep (500);   
                  } else {
                     Print ("������ �������� ����������� ������, ��������� ��������. ");                     
                  }
               }
            } 
      }

//                       ---------------------- ���� ���������  -----------------------   
                         
   if(Lpos1 != 0){
      while (error2 == 0) {
         RefreshRates();
            i = OrderSelect(Lpos1, SELECT_BY_TICKET, MODE_TRADES);
               if  (i != 1 ){
                  Print ("������! ���������� ������� ���� ����� � ���������� ��������. ���������� ���������� ��������.");
                  return (0);
               }  
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber || MagicCheck()){
               if (OrderType() == OP_BUY){
                  error2 =  (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, Digits), Slippage, Blue));
                  if (error2 == 1){
                     if (Info) Print ("���� ���������� ����� ������ �������."); 
                     Sleep (500);   
                  } else{
                     Print ("������ �������� ���� ����������� ������, ��������� ��������. ");                     
                  }      
               } 
//                        -----------------------------------------------------               
               if (OrderType() == OP_SELL){
                  error2 = (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, Digits), Slippage, Red));
                  if (error2 == 1){
                     if (Info) Print ("���� ���������� ����� ������ �������"); 
                     Sleep (500);   
                  } else {
                     Print ("������ �������� ���� ����������� ������, ��������� ��������. ");                     
                  }
               }
            } 
         }
      }
      
//                      ----------- ��������� (������ � ���������� �������� ) -----------

   while (error == 0){
      RefreshRates();
         i = OrderSelect(Cpos, SELECT_BY_TICKET, MODE_TRADES);
            if  (i != 1 ){
               Print ("������! ���������� ������� ����� � ���������� ��������. ���������� ���������� ��������.");
               return (0);
            }    
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber || MagicCheck()){
               if (OrderType() == OP_BUY){
                  error = (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, Digits), Slippage, Blue)); 
                  if (error == 1 ){
                     if (Info) Print ("������������� ����� ������ �������."); 
                     Sleep (500);   
                  } else {
                     Print ("������ �������� �������������� ������, ��������� ��������. ");                    
                  } 
               }        
               
//                             --------------------------------------------------   
             
               if (OrderType() == OP_SELL){
                  error = (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, Digits), Slippage, Red));
                  if (error == 1){
                     if (Info) Print ("������������� ����� ������ �������."); 
                     Sleep (500);   
                  } else {
                     Print ("������ �������� �������������� ������, ��������� ��������. ");                     
                  }
               }
            }
      }     
       
   Result = 1;
   return (Result);    
}

//=========================================================================================================================================//
// Kordan . ������� �������� ��������                                                                                                      //
//=========================================================================================================================================//

int DeleteObject() {
CloseTrigger=0; TPPrice=0; ZeroLine=0     ;
int    ObjTotal = ObjectsTotal()          ;
string ObName                             ;
   for(int i = 0; i < ObjTotal; i++){
   ObName = ObjectName(i)                 ;
      if(StringSubstr(ObName,0,1) == "I" 
      || StringSubstr(ObName,0,1) == "i"){ 
         ObjectDelete(ObName)             ;
            Comment("")                   ; 
         i = i - 1                        ;
      }
   }
return(0);      
} 

//=========================================================================================================================================//
// Qimer . ��������� �����                                                                                                                 //
//=========================================================================================================================================//

void DrawLine(string name,double price, color col, int width){
   if (ObjectFind(name)<0)
      ObjectCreate(name,OBJ_HLINE,0,0,price); 
         else 
            ObjectMove(name,0,Time[1],price);
         ObjectSet(name,OBJPROP_COLOR,col)  ;
      ObjectSet(name,OBJPROP_WIDTH,width)   ;
}

//=========================================================================================================================================//
// Qimer . ��������� ������                                                                                                                //
//=========================================================================================================================================//

void DrawText(string name, string txt, double y, color col){  
   if (ObjectFind(name)<0) ObjectCreate(name,OBJ_TEXT,0,Time[WindowFirstVisibleBar()-WindowFirstVisibleBar()/5],y);
      else ObjectMove(name,0,Time[WindowFirstVisibleBar()-WindowFirstVisibleBar()/4],y);
   ObjectSetText(name,txt,10,"Times New Roman",col);
}

//=========================================================================================================================================//
// Kordan . ���������                                                                                                                      //
//=========================================================================================================================================//   

void Indication (string name,int corner,int Xdist,int Ydist,string txt,int fontsize,string font,color col){
   if (ObjectFind(name)<0)
      ObjectCreate(name,OBJ_LABEL,0,0,0)             ; 
         ObjectSet(name, OBJPROP_CORNER, corner)     ;
            ObjectSet(name, OBJPROP_XDISTANCE, Xdist);
         ObjectSet(name, OBJPROP_YDISTANCE, Ydist)   ;
      ObjectSetText(name,txt,fontsize,font,col)      ; 
} 

//=========================================================================================================================================//
// ������� ��������� � ������� CCI                                                                                                         //
//=========================================================================================================================================//

double PriceCCI(double Level, int CurrentCandle=0){
double MovBuffer;
double Price, SummPrice, Abs, SummAbs;
double K = 0.015;
int j;
   for(int i=Period_CCI-1; i>=0; i--){
      j=i+CurrentCandle;
         Price = (High[j]+Low[j]+Close[j])/3;
            MovBuffer = iMA(NULL,0,Period_CCI,0,MODE_SMA,PRICE_TYPICAL,CurrentCandle);
               Abs    = MathAbs(Price-MovBuffer);
      if(i>0){
         SummPrice += Price;
            SummAbs+= Abs;
      }
   }
   if(Info==true) {        
      double CCI = (Price-MovBuffer)/((SummAbs+Abs)*K/Period_CCI);
Indication ("ICCI",2,10,45,StringConcatenate("CCI (",DoubleToStr(Level,0),",",Period_CCI,",",CCI_TimeFrame,") = ",DoubleToStr(CCI,0)),FontSize,"Times New Roman",ColorInd);   
   }
      
double H = High[CurrentCandle];
double L =  Low[CurrentCandle];
i = Period_CCI;
   if(CCI>=0){
      CCI=Level;
         Price = -(H*i-L*i*i-H*i*i+L*i-CCI*H*K-CCI*L*K+3*SummPrice*i-
            CCI*3*K*SummPrice+CCI*H*K*i+CCI*L*K*i+CCI*3*K*SummAbs*i)/(i-i*i-CCI*K+CCI*K*i);
   }
      else{
      CCI=-Level;
         Price = -(H*i-L*i*i-H*i*i+L*i+CCI*H*K+CCI*L*K+3*SummPrice*i+
            CCI*3*K*SummPrice-CCI*H*K*i-CCI*L*K*i+CCI*3*K*SummAbs*i)/(i-i*i+CCI*K-CCI*K*i);
   }
if(ObjectFind("ILineCCI")!=-1) ObjectDelete("ILineCCI"    );
if(ObjectFind("ItxtCCI" )!=-1) ObjectDelete("ItxtCCI"     );
   if(Price>H){
      ObjectCreate("ILineCCI", OBJ_HLINE, 0, 0,Price      );
         ObjectSet   ("ILineCCI", OBJPROP_COLOR, SteelBlue);
      DrawText("ItxtCCI",StringConcatenate("CCI < ", DoubleToStr(CCI,0)),Price,SteelBlue );
   }
      else ObjectCreate("ILineCCI", OBJ_HLINE, 0, 0,Price );
   if(Price<L){
      ObjectCreate("ILineCCI", OBJ_HLINE, 0, 0,Price      );
         ObjectSet   ("ILineCCI", OBJPROP_COLOR, Teal     ); 
      DrawText("ItxtCCI",StringConcatenate("CCI > ", DoubleToStr(CCI,0)),Price, Teal     );
   }
      else ObjectCreate("ILineCCI", OBJ_HLINE, 0, 0,Price );           
return(Price);
}

//=========================================================================================================================================//
// shvonder . ������� ��������� ������� � ����� �������                                                                                    //
//=========================================================================================================================================//

void SetOrdersInfo(){
int ObjTotal = ObjectsTotal();
   string ObName;
      for(int i = 0; i < ObjTotal; i++){
         ObName = ObjectName(i);
         if(StringSubstr(ObName,0,1) == "i"){ 
            ObjectDelete(ObName);
         i = i - 1;
         }
      }

int TotalBuyOrd = 1;
   for(i=OrdersTotal();i>=0;i--){
      if (OrderSelect(i,SELECT_BY_POS, MODE_TRADES)){
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber || MagicCheck()){  
            if (OrderType()==OP_BUY){ 
               ObjectCreate (StringConcatenate("iB",TotalBuyOrd), OBJ_TEXT, 0, Time[40], OrderOpenPrice());
               ObjectSetText(StringConcatenate("iB",TotalBuyOrd), StringConcatenate("Lot: ",DoubleToStr(OrderLots(), 2)," Prof: ",DoubleToStr(OrderProfit(),2)), 8, "Verdana", DeepSkyBlue);
            TotalBuyOrd = TotalBuyOrd + 1;
            }       
         }
      }
   }
  
int TotalSellOrd = 1;
   for(i=OrdersTotal();i>=0;i--){
      if (OrderSelect(i,SELECT_BY_POS, MODE_TRADES)){
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber || MagicCheck()){ 
            if (OrderType()==OP_SELL){  
               ObjectCreate (StringConcatenate("iS",TotalSellOrd), OBJ_TEXT, 0, Time[40], OrderOpenPrice());
               ObjectSetText(StringConcatenate("iS",TotalSellOrd), StringConcatenate("Lot: ",DoubleToStr(OrderLots(), 2)," Prof: ",DoubleToStr(OrderProfit(),2)), 8, "Verdana", DarkOrange);
            TotalSellOrd = TotalSellOrd + 1;
            }      
         }
      }
   }
}

//=========================================================================================================================================//
// Kordan . ������� ������� ���������                                                                                                      //
//=========================================================================================================================================//

void MainIndication() {

   if(ObjectFind("DrawDown")>=0){
        datetime time_coordinate=ObjectGet("DrawDown",OBJPROP_TIME1)      ;
        int shift=iBarShift(Symbol(),0,time_coordinate)    ;
        double price_coordinate=iHigh(Symbol(),0,shift)+(WindowPriceMax()-WindowPriceMin())/20 ;
        bool changed=ObjectSet("DrawDown",OBJPROP_PRICE1,price_coordinate);
    }
  
    if(DrawDownRate<(AccountBalance()+AccountCredit()-AccountEquity()+AccountCredit())/AccountBalance()+AccountCredit()){
        ObjectDelete("DrawDown")                           ;
        DrawDownRate=(AccountBalance()+AccountCredit()-AccountEquity()+AccountCredit())/AccountBalance()+AccountCredit();
        prevar=StringConcatenate(DoubleToStr(DrawDownRate*100,2)," %")    ;
        ObjectCreate("DrawDown",OBJ_ARROW,0,Time[0],High[0]+(WindowPriceMax()-WindowPriceMin())/20);
        ObjectSet("DrawDown",OBJPROP_ARROWCODE,117)        ;
        ObjectSet("DrawDown",OBJPROP_COLOR,DarkOrange)     ;
        ObjectSet("DrawDown",OBJPROP_TIMEFRAMES,0)         ;
        ObjectSetText("DrawDown",prevar)                   ;
    }
 
 
      if (Sredstva >= Balance/6*5) col = ColorInd          ; 
      if (Sredstva >= Balance/6*4 && Sredstva < Balance/6*5) col = DeepSkyBlue ;
      if (Sredstva >= Balance/6*3 && Sredstva < Balance/6*4) col = Gold        ;
      if (Sredstva >= Balance/6*2 && Sredstva < Balance/6*3) col = OrangeRed   ;
      if (Sredstva >= Balance/6   && Sredstva < Balance/6*2) col = Crimson     ;
      if (Sredstva <  Balance/6                            ) col = Red         ;
     
   //-------------------------
   
   string spips;
   int pips=NormalizeDouble((AccountEquity()-AccountStopoutLevel()*AccountEquity()/ 100.0)/Sumlot/TV,0) ;
   string lock=DoubleToStr(NormalizeDouble(Sumlot/100*LockPercent,dig),dig);
      if (Sum_lot!=0){
         string Prof  = StringConcatenate("�� ������� "  ,DoubleToStr(delta+Tral_Start, 0)," �������");  // ����� ������� �� �������
         string Bezub = StringConcatenate("�� ��������� ",DoubleToStr(delta2, 0)          ," �������");  // ����� ������� �� ���������       
            if (Sum_lot <0){
               spips = StringConcatenate("�� ����� ",pips," ������� �����")  ;
               lock  = StringConcatenate("����� ��� ����: Buy ",lock)        ;
            }
               else{ 
                  spips = StringConcatenate("�� ����� ",pips," ������� ����");
                  lock  = StringConcatenate("����� ��� ����: Sell ",lock)    ;
               }
      }
                  else{
                     if (SumLotBuy==0 && SumLotSell==0){
                        spips="��� �������"; Prof=""; Bezub="" ;
                     }
                        else{
                           spips ="���� ������ ������"         ;
                           Prof  ="���� ��������"              ;
                           Bezub ="��������� �����"            ;
                        }
                        lock = StringConcatenate("������� �������� ������ = ",LockPercent);
                  }                                

//==========================  ����� ������� ����  =====================================
     
if (MaxLot!=0) maxLot=MaxLot                                   ; 
   if (IsDemo()) string tip = "����"; else tip = "����"        ;  
   Comment(  
      "\n", StringConcatenate(" ���� : ",tip," - �: ",AccountNumber()," \ ",AccountCompany()), 
      "\n", StringConcatenate(" ��������� ����� = ", TimeToStr(TimeCurrent(),TIME_SECONDS))," \ ",NameDayOfWeek(DayOfWeek()),
      "\n", StringConcatenate(" ����. ��� = ",NormalizeDouble(maxLot,dig)," \ "," ���.  ��� = ",NormalizeDouble(minLot,dig)),
      "\n", StringConcatenate(" ����� = ",AccountLeverage()," : 1  \ "," ����� = ",spr),    
      "\n", StringConcatenate(" ������ : ��������� = ",freez," \ "," ������ = ",stlev," \ "," StopOut = ",AccountStopoutLevel(),"%"), 
      "\n", StringConcatenate(" ����� : Buy = ",MarketInfo(Symbol(), MODE_SWAPLONG)," \ "," Sell = ",MarketInfo(Symbol(), MODE_SWAPSHORT)), 
      "\n","====================================",
      "\n"
        );   
            
//==========================  ����� ������ ���� � ����� ===============================

   if ( fixlot        ) string txt="������������� ���"; else txt="������������ ���"                                         ;
   if (!NewCycle_ON   ) Indication ("INewCycleON",2,10,150,"������ ������ ������ �����",FontSize,"Times New Roman",ColorInd);
   if (!TradeBuy      ) Indication ("ITradeBuy"  ,2,10,135,"������ ������ Buy" ,FontSize,"Times New Roman",ColorInd        );
   if (!TradeSell     ) Indication ("ITradeSell" ,2,10,120,"������ ������ Sell",FontSize,"Times New Roman",ColorInd        );
   
if (TipMAFilter==1 || TipMAFilter==2){   
   if (GetMASignal()==1 && GetMASignalS()==-1 || GetMASignalS()==0) Indication ("ILevelBuy" ,2,10,105,"������ Buy" ,FontSize,"Times New Roman",ColorInd ); else ObjectDelete("ILevelBuy" );
   if (GetMASignal()==-1 && GetMASignalS()== 1 || GetMASignalS()==0) Indication ("ILevelSell",2,10,90 ,"������ Sell",FontSize,"Times New Roman",ColorInd ); else ObjectDelete("ILevelSell");
}   
   
   if (!time()        ) Indication ("Itime",2,10,75 ,"������� ������ �������x ����",FontSize,"Times New Roman",ColorInd); else ObjectDelete("Itime" );
   if (CloseTrigger==1) Indication ("ITrail",2,xDist1,30,"����������! ����� ���� �������!",FontSize+5,"Courier",Lime   ); else ObjectDelete("ITrail"); 
Indication ("IFixLot",2,10,60 ,txt,FontSize,"Times New Roman",ColorInd);   

//==========================  ������ ������ ����  ===================================== 

Indication ("Ispips"   ,3,10,55 ,spips,FontSize,"Times New Roman",col)     ;      
Indication ("Ilock"    ,3,10,10 ,lock ,FontSize,"Times New Roman",ColorInd);
Indication ("IProf"    ,3,10,40 ,Prof ,FontSize,"Times New Roman",col)     ;  
Indication ("IBezub"   ,3,10,25 ,Bezub,FontSize,"Times New Roman",col)     ;  
Indication ("MaxDrDown",3,10,145,StringConcatenate("����. ��������: ",DoubleToStr(MathMax(DrawDownRate,0)*100,2)," %"),FontSize,"Times New Roman",ColorInd);  
Indication ("IBalance ",3,10,100,StringConcatenate("������   ",DoubleToStr(Balance,        2)),FontSize,"Times New Roman",ColorInd);
Indication ("IEquity  ",3,10,85 ,StringConcatenate("�������� ",DoubleToStr(FreeMargin     ,2)),FontSize,"Times New Roman",col)     ; 
Indication ("IDrawDown",3,10,70 ,StringConcatenate("�������� ",DoubleToStr(CurrentDrawdown,2) ,"%"),FontSize,"Times New Roman",col); 

if (Sum_lot!=0) Indication ("ICurUrov" ,3,10,130,StringConcatenate("�������: ",DoubleToStr(CurrentUrov,0),"%"),FontSize,"Times New Roman",ColorInd); else ObjectDelete("ICurUrov");

   if (SumProfit <0) color ColProf= LightCoral; else ColProf=Lime;
   if (ProfitBuy <0) color ColBuy = LightPink ; else ColBuy = LightGreen; 
   if (ProfitSell<0) color ColSell= LightPink ; else ColSell= LightGreen; 
   
double       LotsTake = FreeMargin/MarketInfo(Symbol(), MODE_MARGINREQUIRED)              ;  //���������� ����� ������� ����� ������  
Indication ("Ilock"      ,3,10    ,10 , lock,FontSize,"Times New Roman",ColorInd)         ;
Indication ("IPrice"     ,1,10    ,20 , StringConcatenate(""                              ,  DoubleToStr(MarketInfo(Symbol(), MODE_BID) , Digits  )), 40 ,"Times New Roman",DodgerBlue); 
Indication ("ILotTake"   ,2,xDist2,130, StringConcatenate("����� ������: "                ,  DoubleToStr(LotsTake   ,dig) ," ���"),FontSize,"Times New Roman",ColorInd  );
Indication ("ILot"       ,2,xDist2,115, StringConcatenate("��������� ���: "               ,  DoubleToStr(Lot        ,dig)), FontSize,"Times New Roman",ColorInd         );      
Indication ("IProfit"    ,2,xDist2,100, StringConcatenate("���� ������ � ������ ����: "   ,  DoubleToStr(Profit     ,  2)), FontSize,"Times New Roman",ColorInd         );      
Indication ("ISumLotBuy" ,2,xDist2,85 , StringConcatenate("��������� ����� Buy �������: " ,  DoubleToStr(SumLotBuy  ,dig)), FontSize,"Times New Roman",ColorInd         );      
Indication ("ISumLotSell",2,xDist2,70 , StringConcatenate("��������� ����� Sell �������: ",  DoubleToStr(SumLotSell ,dig)), FontSize,"Times New Roman",ColorInd         );      
Indication ("ISumlot"    ,2,xDist2,55 , StringConcatenate("�������� ������� �������: "    ,  DoubleToStr(Sumlot     ,dig)), FontSize,"Times New Roman",ColorInd         );
Indication ("IProfitBuy" ,2,xDist2,40 , StringConcatenate("��������� ������ Buy: "        ,  DoubleToStr(ProfitBuy  ,  2)), FontSize,"Times New Roman",ColBuy           );
Indication ("IProfitSell",2,xDist2,25 , StringConcatenate("��������� ������ Sell: "       ,  DoubleToStr(ProfitSell ,  2)), FontSize,"Times New Roman",ColSell          );    
Indication ("ISumProfit" ,2,xDist2,10 , StringConcatenate("��������� ������: "            ,  DoubleToStr(SumProfit  ,  2)), FontSize,"Times New Roman",ColProf          );     
      
   //-------------------------                                        
   
   if (totalbuy>MaxTrades || totalsell>MaxTrades) string Integra="����������� ����� �����"; else Integra="Integra 2.7.18";   
      Indication ("IIntegra",2,10,25,Integra,FontSize,"Times New Roman",ColorInd);      
}

//+----------------------------------------------------------------------------+
//|  �����    : ��� ����� �. aka KimIV,  http://www.kimiv.ru                   |
//+----------------------------------------------------------------------------+
//|  ������   : 01.09.2005                                                     |
//|  �������� : ���������� ������������ ��� ������                             |
//+----------------------------------------------------------------------------+
//|  ���������:                                                                |
//|    ndw - ����� ��� ������                                                  |
//+----------------------------------------------------------------------------+
string NameDayOfWeek(int ndw){
   if (ndw==0) return("�����������") ;
   if (ndw==1) return("�����������") ;
   if (ndw==2) return("�������"    ) ;
   if (ndw==3) return("�����"      ) ;
   if (ndw==4) return("�������"    ) ;
   if (ndw==5) return("�������"    ) ;
   if (ndw==6) return("�������"    ) ;
}  

//+----------------------------------------------------------------------------+
//|  �����    : ��� ����� �. aka KimIV,  http://www.kimiv.ru                   |
//+----------------------------------------------------------------------------+
//|  ������   : 01.09.2005                                                     |
//|  �������� : ���������� ������������ �������� ��������                      |
//+----------------------------------------------------------------------------+
//|  ���������:                                                                |
//|    op - ������������� �������� ��������                                    |
//+----------------------------------------------------------------------------+
string GetNameOP(int op){
   switch (op) {
      case OP_BUY      : return("BUY"       );
      case OP_SELL     : return("SELL"      );
      case OP_BUYLIMIT : return("BUY LIMIT" );
      case OP_SELLLIMIT: return("SELL LIMIT");
      case OP_BUYSTOP  : return("BUY STOP"  );
      case OP_SELLSTOP : return("SELL STOP" );
      default          : return("Unknown Operation");
   }
}

//=========================================================================================================================================//
//                                                                                                                                         //
//=========================================================================================================================================//

void CloseThisSymbolAll(int _MN, int _ot=-1){
double slip=MarketInfo(Symbol(), MODE_SPREAD)*2;
   for (int trade = OrdersTotal() - 1; trade >= 0; trade--){
      OrderSelect(trade, SELECT_BY_POS, MODE_TRADES);{
         if (OrderSymbol() == Symbol() && (OrderMagicNumber() == _MN || MagicCheck()) && (OrderType() == _ot || _ot == -1)){
            RefreshRates();
            if (OrderType() == OP_BUY ) OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, Digits), slip, Blue);
            if (OrderType() == OP_SELL) OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, Digits), slip, Red );
         Sleep(1000);
         }
      }
   }
}

//INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA=INTEGRA