/*���� ����� ������ �� ��������� 60 ���.> ��� 1.2*������� ���������� ������ 
�� ��������� 10 �����, �� �������. ������ �� ����������� �������� ��������� 
60 ������. ���������� 100 �������, ���� ���� 50 �������.

����� �������� "���������� ������" �� "��������"*/

extern int TP=10;
int side,bar10,bar1,ticket=0;
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
	
	/*��������� ������������� �� ��������� ��� ��������� � 10 ��� - shiuft
	shift ������ ��-�� ���� ��� ������� ���� �� ����� �� ������� ���������.*/
	if(Time[shiftTime]>time-shift)	
		return(-1);
	else return(shiftTime);
}

int volumeCounter(int bar)
{	
	double totalVolume=0; 
	for(int index=0; index<bar; index++)
	{
		totalVolume=totalVolume+Volume[index];
		
		if(totalVolume>2147483646 || totalVolume<-2147483646)	//���� �������� �� �������� �� ������ ������������
		{
			Print("Constant 'totalVolume' more or less then integer");
			return(-1);
		}
	}
	return(totalVolume);
}

/*���� �������� �� ��������� 60 ���.> ��� 1.2*������� ��������
�� ��������� 10 �����, �� �������. ������ �� ����������� �������� ��������� 
60 ������. ���������� 100 �������, ���� ���� 50 �������.*/
int priceRange(int bar)
{
	return (MathAbs(Close[0]-Close[bar]));
}

int positionSide(int bar1)
{
	double result=(Bid+Ask)/2-Close[bar1];
	if(result>=0)
		return(0);
	else return(1);
}

void sendPosition()
{
//	int volume10=volumeCounter(bar10);
//	int volume1=volumeCounter(bar1);
	double range10=priceRange(bar10);
	double range1=priceRange(bar1);
	
//	if(volume10==-1 || volume1==-1)
//		return;
//	Print("Time: "+TimeToStr(TimeCurrent())+": Volume1= "+volume1+": volume10/10= "+volume10/10);
	Print("Time: "+TimeToStr(TimeCurrent())+": Volume1= "+range1+": volume10/10= "+range10/10);
//	if(volume1 > (1.2*(volume10/10)))
	if(range1 > (1.2*(range10/10)))
	{
		side=positionSide(bar1);
		if(side==0)	
		{
			price=Ask;
			sl=Bid-TP/2*Point;
			tp=Bid+TP*Point;
		}
		else
		{	
			price=Bid;
			sl=Ask+TP/2*Point;
			tp=Ask-TP*Point;
		}
		
		Print("-------sendPosition call-----------");
		ticket=OrderSend(Symbol(),side, 1, price,30, sl,tp);
		errorLog();
		bool select=OrderSelect(ticket, SELECT_BY_TICKET, MODE_TRADES);
		errorLog();
	}
}

int start()
{
	datetime closeTime=OrderCloseTime();
	if(ticket!=0)
		if(closeTime==0)
			return;
	
	bar10=selectBar(600, 10);
	bar1=selectBar(60, 1);
	
	if(bar1==-1 || bar10==-1)
	{
		Print("Warning, bar1 or bar10 return -1");
		return;
	}
	
	sendPosition();
}