program Sistema;

uses
  Vcl.Forms,
  View.FrmPrincipal in 'View\View.FrmPrincipal.pas' {FrmPrincipal},
  Interfaces.Conexao in 'Interfaces\Interfaces.Conexao.pas',
  Model.Conexao in 'Model\Model.Conexao.pas',
  Interfaces.Controller.Conexao in 'Interfaces\Interfaces.Controller.Conexao.pas',
  Interfaces.ComponenteQuery in 'Interfaces\Interfaces.ComponenteQuery.pas',
  Model.ComponenteQuery in 'Model\Model.ComponenteQuery.pas',
  Controller.ComponenteQuery in 'Controller\Controller.ComponenteQuery.pas',
  Interfaces.Controller.ComponenteQuery in 'Interfaces\Interfaces.Controller.ComponenteQuery.pas',
  Interfaces.Crud in 'Interfaces\Interfaces.Crud.pas',
  Model.Crud in 'Model\Model.Crud.pas',
  Interfaces.Controller.Crud in 'Interfaces\Interfaces.Controller.Crud.pas',
  Controller.Crud in 'Controller\Controller.Crud.pas',
  Controller.Conexao in 'Controller\Controller.Conexao.pas',
  Vcl.Themes;

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := true;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  application.Run;
end.
