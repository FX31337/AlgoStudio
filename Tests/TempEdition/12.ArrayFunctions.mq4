int start()
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
  return(0);
}

//void temp(){
//    //������������ � ������ ���������
//    //		1)���������� ����������� �������.
//	int Mas1[5];
//	Print(Mas1);
//	//2)���������� ���������� �������. 
//	double Mas2[5][5];
//	Print(Mas2);
//	//3)���������� ���������� �������. 
//	double Mas3[2][5][5];
//	Print(Mas3);
//
////    //1) ��������� � ���� ������� ����. ���������� ��� � ����� �������� ��������� � ������ ��� � ����.
//	datetime daytimes[];		//����������� ������ � ������� ��������� �������� ������ 
//	int  shift=10,dayshift;		// ����� ����=10 ��� �� �����, 
//	// ��� Time[] ����� ������� ������������� � ����������� ��������
//	int g0=ArrayCopySeries(daytimes,MODE_TIME,Symbol(),PERIOD_D1); //����� ����� ������������� ����������.
//	datetime g1=Time[shift];
//	datetime g2=daytimes[0];
//	if(Time[shift]>=daytimes[0]) dayshift=0;
//	else
//  		{
//   		dayshift=ArrayBsearch(daytimes,Time[shift],WHOLE_ARRAY,0,MODE_DESCEND);
//   		if(Period()<PERIOD_D1) dayshift++;
//  		}
//	Print(TimeToStr(Time[shift])," corresponds to ",dayshift," day bar opened at ",TimeToStr(daytimes[dayshift]));
//    return(0);
//    }
