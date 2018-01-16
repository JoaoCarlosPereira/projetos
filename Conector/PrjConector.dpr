program PrjConector;

uses
  Vcl.Forms,
  Conector in 'Conector.pas' {FrmConexao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmConexao, FrmConexao);
  Application.Run;
end.
