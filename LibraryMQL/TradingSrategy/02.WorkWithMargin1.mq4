double Balance=10000;							//��������� ������
int i=0;										//������� ������
static bool Disable_Expert;
int start()                                     // ����.������� start
  {
   if(Disable_Expert) return(0);	
   string Symb=Symbol();                        // ������. ����������
   while(true)                                  // ���� �������� ���.
     {
         //-----����������� ��������� ����������-----------------------------------------------------------
      double Profit=AccountProfit();					//���������� �������� ������� ��� �������� ����� � ������� ������.
      double Marg=AccountMargin();						//���������� ����� ��������� �������, ������������ ��� ����������� �������� ������� �� ������� �����.
      double Equity=Balance+Profit;						//���������� ����� ����������� ������� ��� �������� �����.
      double FreeMargin=Equity-Marg;					// ������� ��������
      double FreeMargin2=AccountFreeMargin();			// ������� ��������
      double Equity2=AccountEquity();					//���������� ����� ����������� ������� ��� �������� �����.
      double Lot_Size=MarketInfo(Symb,MODE_LOTSIZE); 	//����������� ������� ������ ����
      double One_Lot=MarketInfo(Symb,MODE_MARGINMAINTENANCE); 		//�����.1 ����
      int Lot=10;										//������ ����
      double F;											//����� ����� ��������� ������
      int ticket;										//����� ������
      	//-------------------------------------------------------------------------------------------------
      	//-----�������������� ��������� �� �������� �������------------------------------------------------
      Alert("FreeMargin= ",FreeMargin,"   ",FreeMargin2,"\n","Margin= ",Marg,"\n","Equity= ",Equity,
      						"   ",Equity2,"\n","Profit= ",Profit,"\n");
      //-------------------------------------------------------------------------------------------------
      //-------������ ������� ���� ----------------------------------------------------------------------
//      if(i<2){											//������ ������� ��� ����������� ��������� �������
			//-----������� ��������������-----------------------------------------------------------
	        double NextPL=(Bid-Ask)*Lot*Lot_Size;				//������ �� ��� ��������� ������
//	        F=FreeMargin-Lot*One_Lot+NextPL+Profit;				//����� ����� ��������� ������
			F=Balance+Profit-(Balance-FreeMargin)-Lot*One_Lot+NextPL;
	        Alert("������ ����������� ���� ",Lot,"; ��������� ������� ���� ",FreeMargin,
	        				"; ��������� ������� ����� ������ ",F);
	      	ticket=OrderSend(Symb, OP_BUY, Lot, Bid, 2, 0, 0);	//�������� �������
//      	i++;										
//      	}
      //����� ������� ����
      if (ticket>0)                             // ���������� :)
        {
         double Free=F;
			double Profit2=AccountProfit();					//���������� �������� ������� ��� �������� ����� � ������� ������.
    		double Marg2=AccountMargin();						//���������� ����� ��������� �������, ������������ ��� ����������� �������� ������� �� ������� �����.
      		double Equity3=Balance+Profit2;							//���������� ����� ����������� ������� ��� �������� �����.
      		double FreeMargin3=Equity3-Marg2;									// ������� �������� 
   	        Alert("Free= ", Free, "\n","FreeMargin= ",FreeMargin3,"\n","Margin= ",Marg2,"\n","Equity= ",Equity3,"\n", "Profit= ",Profit2,"\n", "-------------------------------------------------");      	    
//   	        if(FreeMargin2<(10+Lot*One_Lot))Disable_Expert = true;			//�������� �� ��������� ��������	
         break;                                 // ����� �� �����
        }
        break;
    }
   return;                                      // ����� �� start()
  }



