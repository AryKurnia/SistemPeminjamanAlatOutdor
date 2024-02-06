object FormHome: TFormHome
  Left = 0
  Top = 0
  Caption = 'Home'
  ClientHeight = 423
  ClientWidth = 612
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  TextHeight = 15
  object Label1: TLabel
    Left = 192
    Top = 8
    Width = 257
    Height = 37
    Caption = 'PEMINJAMAN ALAT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 112
    Width = 620
    Height = 322
    Caption = 'Peminjaman Hari Ini'
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 8
    object Menu1: TMenuItem
      Caption = 'Menu'
      object Alat1: TMenuItem
        Caption = 'Alat'
        OnClick = Alat1Click
      end
      object Peminjaman1: TMenuItem
        Caption = 'Peminjaman'
        OnClick = Peminjaman1Click
      end
    end
    object Keluar1: TMenuItem
      Caption = 'Keluar'
    end
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16')
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'mapala'
    User = 'root'
    Password = ''
    Protocol = 'mysql-5'
    LibraryLocation = 
      'C:\Users\CAMBANG\OneDrive\Dokumen\Embarcadero\Studio\Projects\Si' +
      'stemPeminjamanAlatOutdor\libmysql-the-mollon\libmysql.dll'
    Left = 560
    Top = 8
  end
  object ZQpeminjam: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'SELECT * FROM `peminjam`;')
    Params = <>
    Left = 528
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ZQpeminjam
    Left = 496
    Top = 8
  end
end
