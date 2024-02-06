object FormAlat: TFormAlat
  Left = 0
  Top = 0
  Caption = 'Alat'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label2: TLabel
    Left = 256
    Top = 8
    Width = 121
    Height = 37
    Caption = 'Data Alat'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 51
    Width = 321
    Height = 169
    Caption = 'Form Data'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 32
      Height = 15
      Caption = 'Nama'
    end
    object Label3: TLabel
      Left = 16
      Top = 53
      Width = 51
      Height = 15
      Caption = 'Klasifikasi'
    end
    object Label4: TLabel
      Left = 16
      Top = 82
      Width = 33
      Height = 15
      Caption = 'Merek'
    end
    object Label5: TLabel
      Left = 16
      Top = 111
      Width = 34
      Height = 15
      Caption = 'Warna'
    end
    object Label6: TLabel
      Left = 16
      Top = 140
      Width = 38
      Height = 15
      Caption = 'Jumlah'
    end
    object tbNama: TEdit
      Left = 88
      Top = 21
      Width = 217
      Height = 23
      TabOrder = 0
    end
    object tbKlasifikasi: TEdit
      Left = 88
      Top = 50
      Width = 217
      Height = 23
      TabOrder = 1
    end
    object tbMerek: TEdit
      Left = 88
      Top = 79
      Width = 217
      Height = 23
      TabOrder = 2
    end
    object tbWarna: TEdit
      Left = 88
      Top = 108
      Width = 217
      Height = 23
      TabOrder = 3
    end
    object tbJumlah: TEdit
      Left = 88
      Top = 137
      Width = 57
      Height = 23
      NumbersOnly = True
      TabOrder = 4
      Text = '0'
    end
  end
  object btnInsert: TButton
    Left = 344
    Top = 71
    Width = 75
    Height = 25
    Caption = 'Insert'
    TabOrder = 1
    OnClick = btnInsertClick
  end
  object btnUpdate: TButton
    Left = 344
    Top = 102
    Width = 75
    Height = 25
    Caption = 'Update'
    Enabled = False
    TabOrder = 2
    OnClick = btnUpdateClick
  end
  object btnDelete: TButton
    Left = 344
    Top = 133
    Width = 75
    Height = 25
    Caption = 'Delete'
    Enabled = False
    TabOrder = 3
    OnClick = btnDeleteClick
  end
  object btnClear: TButton
    Left = 344
    Top = 195
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 4
    OnClick = btnClearClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 226
    Width = 612
    Height = 208
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id_alat'
        Title.Caption = 'ID Alat'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 51
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
        Width = 165
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Klasifikasi'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Merek'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Warna'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Jumlah'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 47
        Visible = True
      end>
  end
  object ZQalat: TZQuery
    Connection = FormHome.ZConnection1
    Active = True
    SQL.Strings = (
      'SELECT * FROM `alat`;')
    Params = <>
    Left = 592
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ZQalat
    Left = 560
    Top = 16
  end
end
