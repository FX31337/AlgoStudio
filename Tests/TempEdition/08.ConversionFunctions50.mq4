int start()
{
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
  return(0);
}

