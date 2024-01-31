program AplikasiPeminjamanAlat;

uses
  Vcl.Forms,
  UnitHome in 'UnitHome.pas' {FormHome},
  UnitAlat in 'UnitAlat.pas' {FormAlat},
  UnitPeminjaman in 'UnitPeminjaman.pas' {FormPeminjaman};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormHome, FormHome);
  Application.CreateForm(TFormAlat, FormAlat);
  Application.CreateForm(TFormPeminjaman, FormPeminjaman);
  Application.Run;
end.
