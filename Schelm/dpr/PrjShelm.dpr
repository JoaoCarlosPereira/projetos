program PrjShelm;

uses
  Vcl.Forms,
  Shl001 in '..\Pas\Shl001.pas' {FrmSchelm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmSchelm, FrmSchelm);
  Application.Run;
end.
