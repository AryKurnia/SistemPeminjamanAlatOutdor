unit UnitAlat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormAlat = class(TForm)
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    tbNama: TEdit;
    tbKlasifikasi: TEdit;
    tbMerek: TEdit;
    tbWarna: TEdit;
    tbJumlah: TEdit;
    Label6: TLabel;
    btnInsert: TButton;
    btnUpdate: TButton;
    btnDelete: TButton;
    btnClear: TButton;
    ZQalat: TZQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    procedure btnInsertClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
    function GenerateRandomID: Integer; 
  public
    { Public declarations }
  end;

var
  FormAlat: TFormAlat;

  id, jumlah : Integer;
  nama, klasifikasi, merek, warna : string;

implementation

{$R *.dfm}

uses UnitHome;

procedure TFormAlat.btnClearClick(Sender: TObject);
begin
  nama := '';
  klasifikasi := '';
  merek := '';
  warna := '';
  jumlah := 0;

  tbNama.Text := nama;
  tbKlasifikasi.Text := klasifikasi;
  tbMerek.Text := merek;
  tbWarna.Text := warna;
  tbJumlah.Text  := IntToStr(jumlah);

  // Menon Aktifkan Tombol(Button)
  btnUpdate.Enabled := False;
  btnDelete.Enabled := False;
end;// End btnClearClick

procedure TFormAlat.btnDeleteClick(Sender: TObject);
begin
  // Pastikan ada baris yang dipilih di DBGrid
  if not ZQalat.IsEmpty then
  begin
    // Tampilkan konfirmasi penghapusan
    if MessageDlg('Apakah Anda yakin ingin menghapus data ini?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      with ZQalat do
      begin
        // Hapus baris yang dipilih
        Delete;

        nama := '';
        klasifikasi := '';
        merek := '';
        warna := '';
        jumlah := 0;

        tbNama.Text := nama;
        tbKlasifikasi.Text := klasifikasi;
        tbMerek.Text := merek;
        tbWarna.Text := warna;
        tbJumlah.Text  := IntToStr(jumlah);

        // Tampilkan pesan sukses
        ShowMessage('Data Berhasil Dihapus!');

        // Menon Aktifkan Tombol(Button)
        btnUpdate.Enabled := False;
        btnDelete.Enabled := False;
      end;
    end;
  end;
end;

procedure TFormAlat.btnInsertClick(Sender: TObject);
begin
  // Mengisi masing masing nilai fariabel sesuai TextBox
  nama := tbNama.Text;
  klasifikasi := tbKlasifikasi.Text;
  merek := tbMerek.Text;
  warna := tbWarna.Text;
  jumlah := StrToInt(tbJumlah.Text);

  // Memastikan Agar Semua Fariabel terisi menggunakan If
  if (nama <> '') and (klasifikasi <> '') and (merek <> '') and (warna <> '') and (jumlah <> 0) then
  begin
    with ZQalat do
    begin
      SQL.Clear;
      // Membuat ID Alat dari ID Increment
      id := GenerateRandomID;

      // Membersihkan SQL dan melakukan oprasi Insert
      SQL.Clear;
      SQL.Add('SELECT * FROM `alat`');
      Open;
      Insert;
      FieldByName('id_alat').AsInteger := id;
      FieldByName('Nama').AsString := nama;
      FieldByName('Klasifikasi').AsString := klasifikasi;
      FieldByName('Merek').AsString := merek;
      FieldByName('Warna').AsString := warna;
      FieldByName('Jumlah').AsInteger := jumlah;
      Post;

      ShowMessage('Data Berhasil Ditambahkan!');
    end;// End With Do
  end
  else
  begin
    // Menampilkan Pesan jika ada fariabel yang kosong
    ShowMessage('Mohon isi data terlebi dahulu!');
  end;// End If Else

end;

function TFormAlat.GenerateRandomID: integer;
var
  i, randomID: Integer;
begin
  // Set seed untuk random number generator
  Randomize;

  // Inisialisasi randomID dengan kosong
  randomID := 0;

  // Generate 4 karakter acak untuk ID
  for i := 1 to 4 do
  begin
    // Mendapatkan karakter acak dengan ASCII antara 48 ('0') dan 57 ('9')
    randomID := randomID + Random(57 - 48 + 1) + 48;
  end;

  // Mengembalikan ID yang dihasilkan
  Result := randomID;
end;

procedure TFormAlat.btnUpdateClick(Sender: TObject);
begin
  if MessageDlg('Apakah Anda yakin ingin memperbaharui data?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    // Pastikan ada baris yang dipilih di DBGrid
    if not ZQalat.IsEmpty then
    begin
      with ZQalat do
      begin
        nama := tbNama.Text;
        klasifikasi := tbKlasifikasi.Text;
        merek := tbMerek.Text;
        warna := tbWarna.Text;
        jumlah := StrToInt(tbJumlah.Text);

        // Ubah mode edit
        Edit;
        // Update nilai pada kolom-kolom yang diinginkan
        FieldByName('Nama').AsString := nama;
        FieldByName('Klasifikasi').AsString := klasifikasi;
        FieldByName('Merek').AsString := merek;
        FieldByName('Warna').AsString := warna;
        FieldByName('Jumlah').AsInteger := jumlah;

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
    end;// end if
  end;
end;

procedure TFormAlat.DBGrid1CellClick(Column: TColumn);
begin
  // Memastikan Cell yang diklik tidak kosong
  if not ZQalat.IsEmpty then
  begin
    // Mengisi Variabel dan textBox
    nama := ZQalat.FieldByName('Nama').AsString;
    klasifikasi := ZQalat.FieldByName('Klasifikasi').AsString;
    merek := ZQalat.FieldByName('Merek').AsString;
    warna := ZQalat.FieldByName('Warna').AsString;
    jumlah := ZQalat.FieldByName('Jumlah').AsInteger;

    tbNama.Text := nama;
    tbKlasifikasi.Text := klasifikasi;
    tbMerek.Text := merek;
    tbWarna.Text := warna;
    tbJumlah.Text  := IntToStr(jumlah);

    // Mengaktifkan Tombol(Button)
    btnUpdate.Enabled := True;
    btnDelete.Enabled := True;
  end;// End If
end;

end.
