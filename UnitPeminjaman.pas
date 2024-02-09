unit UnitPeminjaman;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  frxSmartMemo, frCoreClasses, frxClass;

type
  TFormPeminjaman = class(TForm)
    ZQpeminjam: TZQuery;
    Label1: TLabel;
    dsPeminjam: TDataSource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    tbNama: TEdit;
    tbOrganisasi: TEdit;
    tbKontak: TEdit;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    tbJumlah: TEdit;
    Label8: TLabel;
    Label5: TLabel;
    dtTanggalPengembalian: TDateTimePicker;
    Label6: TLabel;
    dtTanggalPeminjaman: TDateTimePicker;
    tbAlatTersedia: TEdit;
    Label9: TLabel;
    tbKlasifikasi: TEdit;
    tbAlamat: TEdit;
    Label10: TLabel;
    btnClear: TButton;
    btnDelete: TButton;
    btnInsert: TButton;
    btnPrint: TButton;
    btnUpdate: TButton;
    lbAlat: TListBox;
    ZQalat: TZQuery;
    dsAlat: TDataSource;
    ZQmeminjamAlat: TZQuery;
    dsMeminjamAlat: TDataSource;
    DBGrid1: TDBGrid;
    Label11: TLabel;
    tbMerek: TEdit;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnInsertClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbAlatClick(Sender: TObject);

    procedure InsertPeminjam(const id_peminjam: integer);
    procedure InsertMeminjamAlat(const id_meminjam, id_peminjam, id_alat: integer);
  private
    { Private declarations }
    function GenerateNewID: Integer;
  public
    { Public declarations }
  end;

var
  FormPeminjaman: TFormPeminjaman;

  ZQuery : TZQuery;
  idAlat, alatTersedia, jumlah: Integer;
  klasifikasi, merekAlat : string;

  nama, organisasi, alamat, kontak : string;
  tanggalPeminjaman, tanggalPengembalian : TDate;



implementation

{$R *.dfm}

uses UnitHome;

procedure TFormPeminjaman.btnClearClick(Sender: TObject);
begin
  nama := '';
  organisasi := '';
  alamat := '';
  kontak := '';
  tanggalPeminjaman := Date;
  tanggalPengembalian := Date;

  tbNama.Text := nama;
  tbOrganisasi.Text := organisasi;
  tbAlamat.Text := alamat;
  tbKontak.Text := kontak;
  dtTanggalPeminjaman.Date := tanggalPeminjaman;
  dtTanggalPengembalian.Date  := tanggalPengembalian;

  // Menon Aktifkan Tombol(Button)
  btnUpdate.Enabled := False;
  btnDelete.Enabled := False;
end;

procedure TFormPeminjaman.btnDeleteClick(Sender: TObject);
begin
  // Pastikan ada baris yang dipilih di DBGrid
  if not ZQpeminjam.IsEmpty then
  begin
    // Tampilkan konfirmasi penghapusan
    if MessageDlg('Apakah Anda yakin ingin menghapus data ini?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      with ZQpeminjam do
      begin
        // Hapus baris yang dipilih
        Delete;

        nama := '';
        organisasi := '';
        alamat := '';
        kontak := '';
        tanggalPeminjaman := Date;
        tanggalPengembalian := Date;

        tbNama.Text := nama;
        tbOrganisasi.Text := organisasi;
        tbAlamat.Text := alamat;
        tbKontak.Text := kontak;
        dtTanggalPeminjaman.Date := tanggalPeminjaman;
        dtTanggalPengembalian.Date  := tanggalPengembalian;

        // Tampilkan pesan sukses
        ShowMessage('Data Berhasil Dihapus!');

        // Menon Aktifkan Tombol(Button)
        btnUpdate.Enabled := False;
        btnDelete.Enabled := False;
      end;
    end;
  end;
end;

procedure TFormPeminjaman.btnInsertClick(Sender: TObject);
var
  id_peminjam, id_meminjam, id_alat: Integer;
begin
  // Mengisi nilai variabel
  nama := tbNama.Text;
  organisasi := tbOrganisasi.Text;
  alamat := tbAlamat.Text;
  kontak := tbKontak.Text;
  tanggalPeminjaman := dtTanggalPeminjaman.Date;
  tanggalPengembalian := dtTanggalPengembalian.Date;
  jumlah := StrToInt(tbJumlah.Text);

  // Memastikan agar semua variabel terisi
  if (nama <> '') and (alamat <> '') and (tanggalPeminjaman <> 0) and (tanggalPengembalian <> 0) then
  begin
    // Membuat ID Peminjam dari ID Increment    
    id_peminjam := GenerateNewID;
    id_alat := idAlat;

    // Memasukkan data ke tabel peminjam
    InsertPeminjam(id_peminjam); 

    // Memasukkan data ke tabel meminjam_alat
    InsertMeminjamAlat(id_meminjam, id_peminjam, id_alat);

    ZQmeminjamAlat.Refresh;

    ShowMessage('Data Berhasil Ditambahkan!');
  end
  else
  begin
    ShowMessage('Mohon isi data terlebih dahulu!');
  end;
end;

function TFormPeminjaman.GenerateNewID: integer;
var
  id_peminjam: Integer;
begin
  with ZQpeminjam do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM `peminjam` WHERE id_peminjam = (SELECT MAX(id_peminjam) FROM peminjam)');
    Open;

    // Ambil nilai maksimum dari kolom id
    id_peminjam := FieldByName('id_peminjam').AsInteger;

    // Tambahkan 1 pada nilai maksimum
    Inc(id_peminjam);
  end;
  Result := id_peminjam;
end;

procedure TFormPeminjaman.InsertPeminjam(const id_peminjam: integer);
begin
  ZQuery := ZQpeminjam;
  with ZQuery do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM `peminjam`');
    Open;
    Insert;
    FieldByName('id_peminjam').AsInteger := id_peminjam;
    FieldByName('Nama').AsString := nama;
    FieldByName('Organisasi').AsString := organisasi;
    FieldByName('Alamat').AsString := alamat;
    FieldByName('Kontak').AsString := kontak;
    Post;
//    ZQuery.Refresh;
  end;
end;

procedure TFormPeminjaman.InsertMeminjamAlat(const id_meminjam, id_peminjam, id_alat: integer);
begin
  ZQuery := ZQmeminjamAlat;
  with ZQuery do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM `meminjam_alat`');
    Open;
    Insert;
    FieldByName('id_peminjam').AsInteger := id_peminjam;
    FieldByName('id_alat').AsInteger := id_alat;
    FieldByName('tgl_meminjam').AsDateTime := tanggalPeminjaman;
    FieldByName('tgl_pengembalian').AsDateTime := tanggalPengembalian;
    FieldByName('jumlah').AsInteger := jumlah;
    Post;
//    ZQuery.Refresh;
  end;
end;

procedure TFormPeminjaman.btnUpdateClick(Sender: TObject);
begin
  if MessageDlg('Apakah Anda yakin ingin memperbaharui data?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    // Pastikan ada baris yang dipilih di DBGrid
    if not ZQpeminjam.IsEmpty then
    begin
      with ZQpeminjam do
      begin
        // Mengisi masing masi fariabel
        nama := tbNama.Text;
        organisasi := tbOrganisasi.Text;
        alamat := tbAlamat.Text;
        kontak := tbKontak.Text;
        tanggalPeminjaman := dtTanggalPeminjaman.Date;
        tanggalPengembalian := dtTanggalPengembalian.Date;

        // Ubah mode edit
        Edit;
        // Update nilai pada kolom-kolom yang diinginkan
        FieldByName('Nama').AsString := nama;
        FieldByName('Organisasi').AsString := organisasi;
        FieldByName('Alamat').AsString := alamat;
        FieldByName('Kontak').AsString := kontak;
        FieldByName('Tanggal_Meminjam').AsDateTime := tanggalPeminjaman;
        FieldByName('Tanggal_Kembali').AsDateTime := tanggalPengembalian;

        // Lakukan post untuk menyimpan perubahan
        Post;

        // Tampilkan pesan sukses
        ShowMessage('Data Berhasil Diupdate!');
      end;
    end
    else
    begin
      // Tampilkan pesan bahwa tidak ada data yang dipilih
      ShowMessage('Pilih data terlebih dahulu.');
    end;
  end;
end;

procedure TFormPeminjaman.DBGrid1CellClick(Column: TColumn);
begin
  // Memastikan Cell yang diklik tidak kosong
  if not ZQpeminjam.IsEmpty then
  begin
    // Mengisi Variabel dan textBox
    nama := ZQpeminjam.FieldByName('Nama').AsString;
    organisasi := ZQpeminjam.FieldByName('Organisasi').AsString;
    alamat := ZQpeminjam.FieldByName('Alamat').AsString;
    tanggalPeminjaman := ZQpeminjam.FieldByName('Tanggal_Meminjam').AsDateTime;
    tanggalPengembalian := ZQpeminjam.FieldByName('Tanggal_Kembali').AsDateTime;

    tbNama.Text := nama;
    tbOrganisasi.Text := organisasi;
    tbAlamat.Text := alamat;
    dtTanggalPeminjaman.Date := tanggalPeminjaman;
    dtTanggalPengembalian.Date  := tanggalPengembalian;

    // Mengaktifkan Tombol(Button)
    btnUpdate.Enabled := True;
    btnDelete.Enabled := True;
  end;// End If
end;

procedure TFormPeminjaman.FormCreate(Sender: TObject);
begin
  ZQuery := ZQalat;

  // Ambil data dari database dan tambahkan ke ListBox
  ZQuery.Open;
  while not ZQuery.Eof do
  begin
    lbAlat.Items.AddObject(
      ZQuery.FieldByName('Nama').AsString,
      TObject(ZQuery.FieldByName('id_alat').AsInteger)
    );
    ZQuery.Next;
  end;
end;

procedure TFormPeminjaman.lbAlatClick(Sender: TObject);
var
  selectedItemIndex: Integer;
begin
  // Mendapatkan indeks item yang dipilih
  selectedItemIndex := lbAlat.ItemIndex;

  // Memastikan item terpilih valid
  if (selectedItemIndex > -1) and (selectedItemIndex < lbAlat.Count) then
  begin
    // Mendapatkan nilai id_alat dari objek terpilih
    idAlat := Integer(lbAlat.Items.Objects[selectedItemIndex]);

    // Mengambil nilai Klasifikasi dari database berdasarkan id_alat terpilih
    ZQuery.First;
    while not ZQuery.Eof do
    begin
      if ZQuery.FieldByName('id_alat').AsInteger = idAlat then
      begin
        tbMerek.Text := ZQuery.FieldByName('Merek').AsString;
        merekAlat := ZQuery.FieldByName('Merek').AsString;
        tbAlatTersedia.Text := ZQuery.FieldByName('Jumlah').AsString;
        alatTersedia := ZQuery.FieldByName('Jumlah').AsInteger;
        tbKlasifikasi.Text := ZQuery.FieldByName('Klasifikasi').AsString;
        klasifikasi := ZQuery.FieldByName('Klasifikasi').AsString;
        Break;
      end;
      ZQuery.Next;
    end;
  end;
end;

end.
