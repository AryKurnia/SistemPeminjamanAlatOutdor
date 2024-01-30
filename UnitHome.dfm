object FormHome: TFormHome
  Left = 0
  Top = 0
  Caption = 'Home'
  ClientHeight = 424
  ClientWidth = 616
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
    object DBGrid1: TDBGrid
      Left = 16
      Top = 24
      Width = 585
      Height = 289
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'IDP'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nama'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Alamat'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Deat Line'
          Visible = True
        end>
    end
  end
  object MainMenu1: TMainMenu
    Left = 592
    Top = 8
    object Menu1: TMenuItem
      Caption = 'Menu'
      object Alat1: TMenuItem
        Caption = 'Alat'
        OnClick = Alat1Click
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
    Protocol = 'mysql'
    LibraryLocation = 
      'C:\Users\asus\Documents\Embarcadero\Studio\Projects\AplikasiPemi' +
      'njamanAlat\libmysql.dll'
    Left = 560
    Top = 8
  end
  object ZQpeminjam: TZQuery
    Connection = ZConnection1
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
