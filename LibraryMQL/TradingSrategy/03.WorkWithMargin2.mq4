//--------------------------------------------------------------------
// openbuy.mq4 
// ������������ ��� ������������� � �������� ������� � �������� MQL4.
//--------------------------------------------------------------- 1 --
extern int Dist_SL =300;                             // �������� SL (pt)
extern int Dist_TP =100;                              // �������� TP (pt)
//double Free=10000;
double Balance=10000;
int start()                                     // ����.������� start
  {
      
   double Prots=0.01;                       	// ������� ����. ��.
   string Symb=Symbol();                        // ������. ����������
//--------------------------------------------------------------- 2 --
   while(true)                                  // ���� �������� ���.
     {
      //�������������� ����� ��������� � �������
//      double FreeMargin=AccountFreeMargin();      		// ������� ��������
//      double Equity=AccountEquity();					//���������� ����� ����������� ������� ��� �������� �����.
//      double Marg=AccountMargin();						//���������� ����� ��������� �������, ������������ ��� ����������� �������� ������� �� ������� �����.
//      double Profit=AccountProfit();					//���������� �������� ������� ��� �������� ����� � ������� ������.
      double Profit=AccountProfit();					//���������� �������� ������� ��� �������� ����� � ������� ������.
      double Marg=AccountMargin();						//���������� ����� ��������� �������, ������������ ��� ����������� �������� ������� �� ������� �����.
      double Equity=Balance+Profit;							//���������� ����� ����������� ������� ��� �������� �����.
      double FreeMargin=Equity-Marg;									// ������� ��������
      Alert("FreeMargin= ",FreeMargin,"\n","Margin= ",Marg,"\n","Equity= ",Equity,"\n", "Profit= ",Profit,"\n");
      Comment("FreeMargin= ",FreeMargin,"\n","Margin= ",Marg,"\n","Equity= ",Equity,"\n", "Profit= ",Profit,"\n");
      //--------------------------------------------------------- 2,5 --
      int Min_Dist=MarketInfo(Symb,MODE_STOPLEVEL);// ���. ���������
      double Min_Lot=MarketInfo(Symb,MODE_MINLOT);// ���. ������ ����
      double Step   =MarketInfo(Symb,MODE_LOTSTEP);//��� ������� �����
      double One_Lot=MarketInfo(Symb,MODE_MARGINREQUIRED);//�����.1 ����
      //--------------------------------------------------------- 3 --
      double Lot=MathFloor(FreeMargin*Prots/One_Lot/Step)*Step;// ����
      if (Lot < Min_Lot)                        // ���� ������ ������
        {
         Alert(" �� ������� ����� �� ", Min_Lot," �����");
         break;                                 // ����� �� �����
        }
      //--------------------------------------------------------- 4 --
      double SL = Bid - Dist_SL*Point;          // ���������� ���� SL
      if (Dist_SL<Min_Dist)                     // ���� ������ ������.
        {
         SL = Bid - Min_Dist*Point;             // ���������� ���� SL
         Alert(" ��������� ��������� SL = ",Min_Dist," pt");
        }
      //--------------------------------------------------------- 5 --
	  double TP=Ask + Dist_TP*Point;            // ���������� ���� ��
      if (Dist_TP < Min_Dist)                   // ���� ������ ������.
        {
         TP=Ask+Min_Dist*Point;// ��������� ������.
         Alert(" ��������� ��������� TP = ",Dist_TP," pt");
        }
      //--------------------------------------------------------- 6 --
      Alert("+++������ ����������� ���� ",Lot,"; ���������� �����. ",FreeMargin);
//      Alert("�������� ������ ��������� �� ������. �������� ������..");
      int ticket=OrderSend(Symb, OP_BUY, Lot, Bid, 2, SL, TP);
      //--------------------------------------------------------- 7 --
      if (ticket>0)                             // ���������� :)
        {
         Alert ("������ ����� Buy ",ticket);
		 	double Profit2=AccountProfit();					//���������� �������� ������� ��� �������� ����� � ������� ������.
    	 	double Marg2=AccountMargin();						//���������� ����� ��������� �������, ������������ ��� ����������� �������� ������� �� ������� �����.
      	 	double Equity2=Balance+Profit;							//���������� ����� ����������� ������� ��� �������� �����.
      	 	double FreeMargin2=Equity-Marg;									// ������� ��������
   	     	Alert("FreeMargin= ",FreeMargin2,"\n","Margin= ",Marg2,"\n","Equity= ",Equity2,"\n", "Profit= ",Profit2,"\n", "-------------------------------------------------");      	    
         break;                                 // ����� �� �����                             //����� �� �����
        }
//      --------------------------------------------------------- 8 --
	if (GetLastError()!=0) Print(GetLastError(),"=", GetLastErrorDescription()); 
      break;                                    // ����� �� �����
     }
//--------------------------------------------------------------- 9 --
   Alert ("������ �������� ������ -----------------------------");
   return;                                      // ����� �� start()
  }
//-------------------------------------------------------------- 10 --



