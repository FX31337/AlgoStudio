int start()
{
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
  return(0);
}

