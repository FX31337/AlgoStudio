int start()
{
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
  return(0);
}

