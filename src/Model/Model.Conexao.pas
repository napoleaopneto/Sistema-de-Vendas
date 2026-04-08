unit Model.Conexao;

interface

uses
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Phys.SQLiteDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  FireDAC.Phys.SQLite,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Phys.MySQL,
  System.SysUtils,
  Vcl.Forms,
  Interfaces.Conexao;

  type
    TConexao = class(TInterfacedObject, iConexao)
      private
        FConexao: TFDConnection;
        FDriverMysql: TFDPhysMySQLDriverLink;
      public
        Constructor Create;
        destructor destroy; override;
        class function New : iconexao;
        function Conexao : TCustomConnection;
    end;


implementation

{ TConexao }

function TConexao.Conexao: TCustomConnection;
begin
  result := Fconexao;
end;

constructor TConexao.Create;
begin
  FConexao := TFDConnection.Create(nil);
  FDriverMysql := TFDPhysMySQLDriverLink.Create(FConexao);

  if FConexao.Connected then
    FConexao.Connected := false;

  FConexao.Params.Clear;
  FConexao.Params.Add('DriverID=MySQL');
  FConexao.Params.Add('Server='     + 'localhost');
  FConexao.Params.Add('Port='       + IntToStr(3306));
  FConexao.Params.Add('Database='   + 'db_pedidos');
  FConexao.Params.Add('User_Name='  + 'root');
  FConexao.Params.Add('Password='   + 'root');

  try
    FConexao.Connected := True;
  except
    on E: EFDDBEngineException do
      raise Exception.CreateFmt('Erro no banco de dados: %s', [E.Message]);
    on E: EFDException do
      raise Exception.CreateFmt('Erro FireDAC: %s', [E.Message]);
    on E: Exception do
      raise Exception.CreateFmt('Erro ao conectar: %s', [E.Message]);
  end;
end;

destructor TConexao.destroy;
begin
  FreeAndNil(FConexao);
  inherited;
end;

class function TConexao.New: iconexao;
begin
  result := Self.Create;
end;

end.
