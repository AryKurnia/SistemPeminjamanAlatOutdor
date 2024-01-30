unit UnitHome;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  ZAbstractConnection, ZConnection;

type
  TFormHome = class(TForm)
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    Alat1: TMenuItem;
    Keluar1: TMenuItem;
    ZConnection1: TZConnection;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    ZQpeminjam: TZQuery;
    DataSource1: TDataSource;
    procedure Alat1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHome: TFormHome;

implementation

{$R *.dfm}

uses UnitAlat;

procedure TFormHome.Alat1Click(Sender: TObject);
begin
  FormAlat.Show;
end;

end.
