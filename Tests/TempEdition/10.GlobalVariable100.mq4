int start()
{
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
  return(0);
}

;