unit UnitPeminjaman;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TFormPeminjaman = class(TForm)
    ZQpeminjam: TZQuery;
    Label1: TLabel;
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    tbNama: TEdit;
    tbOrganisasi: TEdit;
    tbAlamat: TEdit;
    dtTanggalPeminjaman: TDateTimePicker;
    dtTanggalPengembalian: TDateTimePicker;
    Label7: TLabel;
    tbStatus: TEdit;
    btnInsert: TButton;
    btnUpdate: TButton;
    btnDelete: TButton;
    btnClear: TButton;
    btnPrint: TButton;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnInsertClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPeminjaman: TFormPeminjaman;

  nama, organisasi, alamat, status : string;
  tanggalPeminjaman, tanggalPengembalian : TDate;

implementation

{$R *.dfm}

uses UnitHome;

procedure TFormPeminjaman.btnClearClick(Sender: TObject);
begin
  nama := '';
  organisasi := '';
  alamat := '';
  tanggalPeminjaman := Date;
  tanggalPengembalian := Date;
  status := '';

  tbNama.Text := nama;
  tbOrganisasi.Text := organisasi;
  tbAlamat.Text := alamat;
  dtTanggalPeminjaman.Date := tanggalPeminjaman;
  dtTanggalPengembalian.Date  := tanggalPengembalian;
  tbStatus.Text := status;

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
        tanggalPeminjaman := Date;
        tanggalPengembalian := Date;
        status := '';

        tbNama.Text := nama;
        tbOrganisasi.Text := organisasi;
        tbAlamat.Text := alamat;
        dtTanggalPeminjaman.Date := tanggalPeminjaman;
        dtTanggalPengembalian.Date  := tanggalPengembalian;
        tbStatus.Text := status;

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
  maxID : Integer;
  newID : String;
begin
  // Mengisi masing masi fariabel
  nama := tbNama.Text;
  organisasi := tbOrganisasi.Text;
  alamat := tbAlamat.Text;
  tanggalPeminjaman := dtTanggalPeminjaman.Date;
  tanggalPengembalian := dtTanggalPengembalian.Date;
  status := tbStatus.Text;

  // Memastikan Agar Semua Fariabel terisi menggunakan If
  if (nama <> '') and (alamat <> '') and (tanggalPeminjaman <> null) and (tanggalPengembalian <> null) then
  begin
    with ZQpeminjam do
    begin
      SQL.Clear;
      // Membuat ID Alat dari ID Increment
      SQL.Add('SELECT MAX(id) AS MaxID FROM `alat`');
      Open;
      maxID := FieldByName('MaxID').AsInteger;
      Inc(maxID);
      newID := Format('PM%.4d', [maxID]);

      // Membersihkan SQL dan melakukan oprasi Insert
      SQL.Clear;
      SQL.Add('SELECT * FROM `peminjam`');
      Open;
      Insert;
      FieldByName('IDP').AsString := newID;
      FieldByName('Nama').AsString := nama;
      FieldByName('Organisasi').AsString := organisasi;
      FieldByName('Alamat').AsString := alamat;
      FieldByName('Tanggal_Meminjam').AsDateTime := tanggalPeminjaman;
      FieldByName('Tanggal_Kembali').AsDateTime := tanggalPengembalian;
      FieldByName('Status').AsString := status;
      Post;

      ShowMessage('Data Berhasil Ditambahkan!');
    end;
  end
  else
  begin
    // Menampilkan Pesan jika ada fariabel yang kosong
    ShowMessage('Mohon isi data terlebi dahulu!');
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
        tanggalPeminjaman := dtTanggalPeminjaman.Date;
        tanggalPengembalian := dtTanggalPengembalian.Date;
        status := tbStatus.Text;

        // Ubah mode edit
        Edit;
        // Update nilai pada kolom-kolom yang diinginkan
        FieldByName('Nama').AsString := nama;
        FieldByName('Organisasi').AsString := organisasi;
        FieldByName('Alamat').AsString := alamat;
        FieldByName('Tanggal_Meminjam').AsDateTime := tanggalPeminjaman;
        FieldByName('Tanggal_Kembali').AsDateTime := tanggalPengembalian;
        FieldByName('Status').AsString := status;

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
    status := ZQpeminjam.FieldByName('Status').AsString;

    tbNama.Text := nama;
    tbOrganisasi.Text := organisasi;
    tbAlamat.Text := alamat;
    dtTanggalPeminjaman.Date := tanggalPeminjaman;
    dtTanggalPengembalian.Date  := tanggalPengembalian;
    tbStatus.Text := status;

    // Mengaktifkan Tombol(Button)
    btnUpdate.Enabled := True;
    btnDelete.Enabled := True;
  end;// End If
end;

end.
