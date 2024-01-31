object FormPeminjaman: TFormPeminjaman
  Left = 0
  Top = 0
  Caption = 'Peminjaman'
  ClientHeight = 442
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
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
    Left = 8
    Top = 255
    Width = 620
    Height = 179
    Caption = 'Daftar Peminjam'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 3
      Top = 24
      Width = 606
      Height = 152
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IDP'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nama'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Organisasi'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Alamat'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Tanggal_Meminjam'
          ReadOnly = False
          Title.Caption = 'Tanggal Meminjam'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Tanggal_Kembali'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Status'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 51
    Width = 481
    Height = 198
    Caption = 'Form Data'
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 32
      Height = 15
      Caption = 'Nama'
    end
    object Label3: TLabel
      Left = 16
      Top = 53
      Width = 55
      Height = 15
      Caption = 'Organisasi'
    end
    object Label4: TLabel
      Left = 16
      Top = 82
      Width = 38
      Height = 15
      Caption = 'Alamat'
    end
    object Label5: TLabel
      Left = 16
      Top = 111
      Width = 111
      Height = 15
      Caption = 'Tanggal Peminjaman'
    end
    object Label6: TLabel
      Left = 16
      Top = 140
      Width = 120
      Height = 15
      Caption = 'Tanggal Pengembalian'
    end
    object Label7: TLabel
      Left = 16
      Top = 169
      Width = 32
      Height = 15
      Caption = 'Status'
    end
    object tbNama: TEdit
      Left = 144
      Top = 21
      Width = 217
      Height = 23
      TabOrder = 0
    end
    object tbOrganisasi: TEdit
      Left = 144
      Top = 50
      Width = 217
      Height = 23
      TabOrder = 1
    end
    object tbAlamat: TEdit
      Left = 144
      Top = 79
      Width = 217
      Height = 23
      TabOrder = 2
    end
    object dtTanggalPeminjaman: TDateTimePicker
      Left = 144
      Top = 108
      Width = 137
      Height = 23
      Date = 45322.000000000000000000
      Time = 0.775974641204811600
      DateFormat = dfLong
      TabOrder = 3
    end
    object dtTanggalPengembalian: TDateTimePicker
      Left = 144
      Top = 137
      Width = 137
      Height = 23
      Date = 45322.000000000000000000
      Time = 0.775974641204811600
      DateFormat = dfLong
      TabOrder = 4
    end
    object tbStatus: TEdit
      Left = 144
      Top = 166
      Width = 329
      Height = 23
      TabOrder = 5
    end
  end
  object btnInsert: TButton
    Left = 495
    Top = 65
    Width = 75
    Height = 25
    Caption = 'Insert'
    TabOrder = 2
    OnClick = btnInsertClick
  end
  object btnUpdate: TButton
    Left = 495
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Update'
    Enabled = False
    TabOrder = 3
    OnClick = btnUpdateClick
  end
  object btnDelete: TButton
    Left = 495
    Top = 127
    Width = 75
    Height = 25
    Caption = 'Delete'
    Enabled = False
    TabOrder = 4
    OnClick = btnDeleteClick
  end
  object btnClear: TButton
    Left = 495
    Top = 158
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 5
    OnClick = btnClearClick
  end
  object btnPrint: TButton
    Left = 495
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Print'
    TabOrder = 6
  end
  object ZQpeminjam: TZQuery
    Connection = FormHome.ZConnection1
    Active = True
    SQL.Strings = (
      'SELECT * FROM `peminjam`;')
    Params = <>
    Left = 584
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ZQpeminjam
    Left = 552
    Top = 8
  end
end
