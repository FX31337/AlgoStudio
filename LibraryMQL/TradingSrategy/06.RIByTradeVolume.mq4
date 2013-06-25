/*���� ����� ������ �� ��������� 60 ���.> ��� 1.2*������� ���������� ������ 
�� ��������� 10 �����, �� �������. ������ �� ����������� �������� ��������� 
60 ������. ���������� 100 �������, ���� ���� 50 �������.*/

int side,ticket;
double price, sl, tp;

//������� ��� ������ ������. ��������, ��������.
int errorLog()
{
	int err=GetLastError();
	if(err!=0)
		Print(err);
}

/*�������� ������� ���� ����� ��������� ����� � �������.
range - ������� ������ ����� ���� ����� ���
shift - ����� � �������� ��-�� ���� ��� ���� �� ����� ��������� � �������*/
int selectBar(int range, int shift)
{
	datetime time=(TimeCurrent()-range);	
	int shiftTime=iBarShift(Symbol(), 0, time, false);
	if(Time[shiftTime]>time-shift)	//-shift ������ ��-�� ���� ��� ������� ���� �� ����� �� ������� ���������.
		return(-1);
	else return(shiftTime);
}

int volumeCounter(int bar)
{	
	int totalVolume=0;
	for(int index=0; index<bar; index++)
	{
		totalVolume=totalVolume+Volume[index];
	}
	return(totalVolume);
}

int positionSide(int bar1)
{
	double result=(Bid+Ask)/2-Close[bar1];
	if(result>=0)
		return(0);
	else return(1);
}

int start()
{
	int bar10=selectBar(600, 10);
	if(bar10==-1)
		return;
		
	int bar1=selectBar(60, 1);
	if(bar1==-1)
	{
		Print("Warning, bar1 return -1");
		return;
	}
	
	int volume10=volumeCounter(bar10);
	int volume1=volumeCounter(bar1);
	
	side=positionSide(bar1);
	
	if(side==0)	
	{
		price=Ask;
		sl=Bid-50*Point;
		tp=Bid+100*Point;
	}
	else
	{	
		price=Bid;
		sl=Ask+50*Point;
		tp=Ask-100*Point;
	}
	
	
	if(volume1 > (1.2*(volume10/10)))
	{
		ticket=OrderSend(Symbol(),1, side, price,30, sl,tp);
		errorLog();
		bool select=OrderSelect(ticket, SELECT_BY_TICKET, MODE_TRADES);
		errorLog();
	}
}