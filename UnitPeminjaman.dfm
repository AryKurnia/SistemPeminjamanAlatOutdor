object FormPeminjaman: TFormPeminjaman
  Left = 0
  Top = 0
  Caption = 'Peminjaman'
  ClientHeight = 442
  ClientWidth = 781
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 288
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
    Top = 248
    Width = 765
    Height = 179
    Caption = 'Daftar Peminjam'
    TabOrder = 0
    object btnClear: TButton
      Left = 687
      Top = 105
      Width = 75
      Height = 25
      Caption = 'Clear'
      TabOrder = 0
      OnClick = btnClearClick
    end
    object btnDelete: TButton
      Left = 687
      Top = 74
      Width = 75
      Height = 25
      Caption = 'Delete'
      Enabled = False
      TabOrder = 1
      OnClick = btnDeleteClick
    end
    object btnInsert: TButton
      Left = 687
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Insert'
      TabOrder = 2
      OnClick = btnInsertClick
    end
    object btnPrint: TButton
      Left = 687
      Top = 151
      Width = 75
      Height = 25
      Caption = 'Print'
      TabOrder = 3
    end
    object btnUpdate: TButton
      Left = 687
      Top = 43
      Width = 75
      Height = 25
      Caption = 'Update'
      Enabled = False
      TabOrder = 4
      OnClick = btnUpdateClick
    end
    object DBGrid1: TDBGrid
      Left = 3
      Top = 16
      Width = 678
      Height = 160
      DataSource = dsMeminjamAlat
      ReadOnly = True
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'id_peminjam'
          Title.Alignment = taCenter
          Title.Caption = 'ID'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nama'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 109
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Alamat'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Kontak'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nama_1'
          Title.Alignment = taCenter
          Title.Caption = 'Alat'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Merek'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tgl_pengembalian'
          Title.Alignment = taCenter
          Title.Caption = 'Pengembalian'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'jumlah'
          Title.Alignment = taCenter
          Title.Caption = 'Jumlah'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 44
          Visible = True
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 51
    Width = 465
    Height = 198
    Caption = 'Data Peminjam'
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
      Top = 109
      Width = 37
      Height = 15
      Caption = 'Kontak'
    end
    object Label5: TLabel
      Left = 16
      Top = 140
      Width = 111
      Height = 15
      Caption = 'Tanggal Peminjaman'
    end
    object Label6: TLabel
      Left = 16
      Top = 169
      Width = 120
      Height = 15
      Caption = 'Tanggal Pengembalian'
    end
    object Label10: TLabel
      Left = 16
      Top = 82
      Width = 38
      Height = 15
      Caption = 'Alamat'
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
      Width = 177
      Height = 23
      TabOrder = 1
    end
    object tbKontak: TEdit
      Left = 144
      Top = 108
      Width = 161
      Height = 23
      TabOrder = 2
    end
    object dtTanggalPengembalian: TDateTimePicker
      Left = 144
      Top = 137
      Width = 137
      Height = 23
      Date = 45329.000000000000000000
      Time = 0.775974641204811600
      DateFormat = dfLong
      TabOrder = 3
    end
    object dtTanggalPeminjaman: TDateTimePicker
      Left = 144
      Top = 166
      Width = 137
      Height = 23
      Date = 45322.000000000000000000
      Time = 0.775974641204811600
      DateFormat = dfLong
      TabOrder = 4
    end
    object tbAlamat: TEdit
      Left = 144
      Top = 79
      Width = 318
      Height = 23
      TabOrder = 5
    end
  end
  object GroupBox3: TGroupBox
    Left = 479
    Top = 51
    Width = 291
    Height = 198
    Caption = 'Form Alat'
    TabOrder = 2
    object Label7: TLabel
      Left = 16
      Top = 24
      Width = 47
      Height = 15
      Caption = 'Pilih Alat'
    end
    object Label8: TLabel
      Left = 16
      Top = 171
      Width = 38
      Height = 15
      Caption = 'Jumlah'
    end
    object Label9: TLabel
      Left = 16
      Top = 140
      Width = 60
      Height = 15
      Caption = 'Keterangan'
    end
    object Label11: TLabel
      Left = 16
      Top = 109
      Width = 33
      Height = 15
      Caption = 'Merek'
    end
    object tbJumlah: TEdit
      Left = 80
      Top = 168
      Width = 57
      Height = 23
      NumbersOnly = True
      TabOrder = 0
      Text = '0'
    end
    object tbAlatTersedia: TEdit
      Left = 248
      Top = 21
      Width = 31
      Height = 23
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 1
      Text = '0'
    end
    object tbKlasifikasi: TEdit
      Left = 80
      Top = 137
      Width = 199
      Height = 23
      ReadOnly = True
      TabOrder = 2
    end
    object lbAlat: TListBox
      Left = 77
      Top = 21
      Width = 165
      Height = 79
      ItemHeight = 15
      TabOrder = 3
      OnClick = lbAlatClick
    end
    object tbMerek: TEdit
      Left = 80
      Top = 106
      Width = 199
      Height = 23
      ReadOnly = True
      TabOrder = 4
    end
  end
  object ZQpeminjam: TZQuery
    Connection = FormHome.ZConnection1
    Active = True
    SQL.Strings = (
      'SELECT * FROM `peminjam`;')
    Params = <>
    Left = 744
    Top = 8
  end
  object dsPeminjam: TDataSource
    DataSet = ZQpeminjam
    Left = 648
    Top = 8
  end
  object ZQalat: TZQuery
    Connection = FormHome.ZConnection1
    Active = True
    SQL.Strings = (
      'SELECT * FROM `alat`;')
    Params = <>
    Left = 712
    Top = 8
  end
  object dsAlat: TDataSource
    DataSet = ZQalat
    Left = 616
    Top = 8
  end
  object ZQmeminjamAlat: TZQuery
    Connection = FormHome.ZConnection1
    Active = True
    SQL.Strings = (
      'SELECT *'
      'FROM `meminjam_alat`'
      
        'INNER JOIN `peminjam` ON `meminjam_alat`.`id_peminjam` = `peminj' +
        'am`.`id_peminjam`'
      
        'INNER JOIN `alat` ON `meminjam_alat`.`id_alat` = `alat`.`id_alat' +
        '`;')
    Params = <>
    Left = 8
    Top = 8
  end
  object dsMeminjamAlat: TDataSource
    AutoEdit = False
    DataSet = ZQmeminjamAlat
    Left = 40
    Top = 8
  end
end
