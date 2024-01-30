program AplikasiPeminjamanAlat;

uses
  Vcl.Forms,
  UnitHome in 'UnitHome.pas' {FormHome},
  UnitAlat in 'UnitAlat.pas' {FormAlat};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormHome, FormHome);
  Application.CreateForm(TFormAlat, FormAlat);
  Application.Run;
end.
