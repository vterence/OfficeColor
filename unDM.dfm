object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 670
  object Conn: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbx4fb.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database=C:\Users\kgb\workspace\OfficeColor\app\officecolor.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    VendorLib = 'fbclient.DLL'
    Left = 32
    Top = 16
  end
  object QR_Busca: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conn
    Left = 88
    Top = 8
  end
  object sdsPesquisasGeral: TSQLDataSet
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conn
    Left = 32
    Top = 80
  end
  object dspPesquisasGeral: TDataSetProvider
    DataSet = sdsPesquisasGeral
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 64
    Top = 80
  end
  object cdsPesquisasGeral: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesquisasGeral'
    Left = 96
    Top = 80
  end
  object dsPesquisasGeral: TDataSource
    DataSet = cdsPesquisasGeral
    Left = 128
    Top = 80
  end
end
