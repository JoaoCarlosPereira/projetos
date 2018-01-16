unit Conector;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFrmConexao = class(TForm)
    PnlArea: TPanel;
    PageControl: TPageControl;
    Tbs_Front: TTabSheet;
    Tbs_Firebird: TTabSheet;
    Tbs_Postgres: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnPostgres: TBitBtn;
    BtnFirebird: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    EdtIPFirebird: TLabeledEdit;
    EdtDiretorioFirebird: TLabeledEdit;
    EdtNomeFireBird: TLabeledEdit;
    Panel7: TPanel;
    Panel8: TPanel;
    EdtIPostgres: TLabeledEdit;
    EdtNomePostgres: TLabeledEdit;
    BtnGerarFirebird: TButton;
    BtnFecharFirebird: TButton;
    BtnFecharPostgres: TButton;
    BtnGerarPostgres: TButton;
    EdtDestinoFirebird: TLabeledEdit;
    EdtDestinoPostgres: TLabeledEdit;
    BtnVoltarFirebird: TButton;
    BtnVoltarPostgres: TButton;
    procedure BtnPostgresClick(Sender: TObject);
    procedure BtnFirebirdClick(Sender: TObject);
    procedure BtnGerarFirebirdClick(Sender: TObject);
    procedure BtnGerarPostgresClick(Sender: TObject);
    procedure BtnVoltarFirebirdClick(Sender: TObject);
    procedure BtnVoltarPostgresClick(Sender: TObject);
    procedure BtnFecharPostgresClick(Sender: TObject);
    procedure BtnFecharFirebirdClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConexao: TFrmConexao;

implementation

{$R *.dfm}

procedure TFrmConexao.BtnFecharFirebirdClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConexao.BtnFecharPostgresClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConexao.BtnFirebirdClick(Sender: TObject);
begin
  PageControl.ActivePage := Tbs_Firebird;
end;

procedure TFrmConexao.BtnGerarFirebirdClick(Sender: TObject);
var
  oDbxConnections: TStringList;
begin
  oDbxConnections := TStringList.Create;

  oDbxConnections.Add('#Gerenciador DBXConnections Vers: 1.4');
  oDbxConnections.Add('[InterXpress for Firebird]');
  oDbxConnections.Add('[Conecta]');
  oDbxConnections.Add('DriverName=InterXpress for Firebird');
  oDbxConnections.Add('Database=' + EdtIPFirebird.Text + ':' + EdtDiretorioFirebird.Text + EdtNomeFireBird.Text);
  oDbxConnections.Add('RoleName=RoleName');
  oDbxConnections.Add('ServerCharSet=WIN1252');
  oDbxConnections.Add('SQLDialect=3');
  oDbxConnections.Add('BlobSize=-1');
  oDbxConnections.Add('CommitRetain=False');
  oDbxConnections.Add('WaitOnLocks=True');
  oDbxConnections.Add('ErrorResourceFile=./DbxFbErr.msg');
  oDbxConnections.Add('LocaleCode=0000');
  oDbxConnections.Add('Firebird TransIsolation=ReadCommited');
  oDbxConnections.Add('Trim Char=False');
  oDbxConnections.Add('ZeBeDee=false');

  oDbxConnections.Add('[Interbase]');
  oDbxConnections.Add('[Delphi]');
  oDbxConnections.Add('DriverName=Interbase');
  oDbxConnections.Add('Database=' + EdtIPFirebird.Text + ':' + EdtDiretorioFirebird.Text + EdtNomeFireBird.Text);
  oDbxConnections.Add('RoleName=RoleName');
  oDbxConnections.Add('ServerCharSet=WIN1252');
  oDbxConnections.Add('SQLDialect=3');
  oDbxConnections.Add('BlobSize=-1');
  oDbxConnections.Add('ErrorResourceFile=./DbxIbErr.msg');
  oDbxConnections.Add('LocaleCode=0000');
  oDbxConnections.Add('CommitRetain=False');
  oDbxConnections.Add('WaitOnLocks=False');
  oDbxConnections.Add('Interbase TransIsolation=ReadCommited');
  oDbxConnections.Add('ZeBeDee=false');

  oDbxConnections.Add('[Devart]');
  oDbxConnections.Add('DriverName=DevartInterBase');
  oDbxConnections.Add('Database=' + EdtIPFirebird.Text + ':' + EdtDiretorioFirebird.Text + EdtNomeFireBird.Text);

  if (FileExists(EdtDestinoPostgres.Text + 'dbxconnections.ini')) then
    DeleteFile(EdtDestinoPostgres.Text + 'dbxconnections.ini');

  oDbxConnections.SaveToFile(EdtDestinoFirebird.Text + 'dbxconnections.ini');

  FreeAndNil(oDbxConnections);

  ShowMessage('Arquivo gerado!');
end;

procedure TFrmConexao.BtnGerarPostgresClick(Sender: TObject);
var
  oDbxConnections: TStringList;
begin
  oDbxConnections := TStringList.Create;
  oDbxConnections.Add('[PostgreSQL]');
  oDbxConnections.Add('[Delphi]');
  oDbxConnections.Add('DriverName=PostgreSQL');
  oDbxConnections.Add('Database=' + EdtIPostgres.Text + ':5432/' + EdtNomePostgres.Text);
  oDbxConnections.Add('BlobSize=-1');
  oDbxConnections.Add('ErrorResourceFile=./DbxPGSQLErr.msg');
  oDbxConnections.Add('LocaleCode=0000');
  oDbxConnections.Add('BlockingMode=True');
  oDbxConnections.Add('ServerCharSet=WIN1252');
  oDbxConnections.Add('UseQualifiedNames=false');
  oDbxConnections.Add('ZeBeDee=false');
  oDbxConnections.Add('RowsetSize=100');

  oDbxConnections.Add('[Devart]');
  oDbxConnections.Add('DriverName=DevartPostgreSQL');
  oDbxConnections.Add('HostName=' + EdtIPostgres.Text + ':5432');
  oDbxConnections.Add('DataBase=' + EdtNomePostgres.Text);

  if (FileExists(EdtDestinoPostgres.Text + 'dbxconnections.ini')) then
    DeleteFile(EdtDestinoPostgres.Text + 'dbxconnections.ini');

  oDbxConnections.SaveToFile(EdtDestinoPostgres.Text + 'dbxconnections.ini');

  FreeAndNil(oDbxConnections);
  ShowMessage('Arquivo gerado!');
end;

procedure TFrmConexao.BtnPostgresClick(Sender: TObject);
begin
  PageControl.ActivePage := Tbs_Postgres;
end;

procedure TFrmConexao.BtnVoltarFirebirdClick(Sender: TObject);
begin
  PageControl.ActivePage := Tbs_Front;
end;

procedure TFrmConexao.BtnVoltarPostgresClick(Sender: TObject);
begin
  PageControl.ActivePage := Tbs_Front;
end;

end.
