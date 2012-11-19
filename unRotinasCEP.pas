// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://192.168.1.21:3002/cep_backend/wsdl
//  >Import : http://192.168.1.21:3002/cep_backend/wsdl:0
// Encoding : UTF-8
// Version  : 1.0
// (23/10/2009 15:07:12 - - $Rev: 10138 $)
// ************************************************************************ //

unit unRotinasCEP;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns,StdCtrls,DateUtils,untsha1,dbclient,
     forms,buttons,SqlExpr;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[]

  CepStruct            = class;                 { "urn:ActionWebService"[GblCplx] }



  // ************************************************************************ //
  // XML       : CepStruct, global, <complexType>
  // Namespace : urn:ActionWebService
  // ************************************************************************ //
  CepStruct = class(TRemotable)
  private
    Fcod_munic: WideString;
    Fcep: WideString;
    Fendereco: WideString;
    Fuf: WideString;
    Fnome_munic: WideString;
    Fbairro: WideString;
  published
    property cod_munic:  WideString  read Fcod_munic write Fcod_munic;
    property cep:        WideString  read Fcep write Fcep;
    property endereco:   WideString  read Fendereco write Fendereco;
    property uf:         WideString  read Fuf write Fuf;
    property nome_munic: WideString  read Fnome_munic write Fnome_munic;
    property bairro:     WideString  read Fbairro write Fbairro;
  end;

  CepStructArray = array of CepStruct;          { "urn:ActionWebService"[GblCplx] }

  // ************************************************************************ //
  // Namespace : urn:ActionWebService
  // soapAction: /cep_backend/api/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : CepBackendCepBackendBinding
  // service   : CepBackendService
  // port      : CepBackendCepBackendPort
  // URL       : http://192.168.1.21:3002/cep_backend/api
  // ************************************************************************ //
  CepBackendCepBackendPort = interface(IInvokable)
  ['{1CC858D2-1B84-068D-FEFE-7E87E9EAD73F}']
    function  FindByCep(const key: WideString; const hash: WideString; const cep: WideString): CepStructArray; stdcall;
    function  FindByEnd(const key: WideString; const hash: WideString; const endereco: WideString; const bairro: WideString; const nome_munic: WideString; const uf: WideString;
                        const limit: Integer): CepStructArray; stdcall;
  end;

procedure BuscaCEP(edtCep,edtEndereco:TCustomEdit;cds:TClientDataSet;endereco,bairro,municipio:string);

function GetCepBackendCepBackendPort(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): CepBackendCepBackendPort;

implementation
  uses SysUtils, unRegrasForm, unDM;

procedure BuscaCEP(edtCep,edtEndereco:TCustomEdit;cds:TClientDataSet;endereco,bairro,municipio:string);
var
  a, i  : Integer;
  s, h  : string;
  l     : CepBackendCepBackendPort;
  ls    : CepStructArray;
  texto : string;
  qry   : TSQLQuery;
begin
  if trim(edtCep.Text) = '' then exit;
  /////////////////////////////////////////////////////////
  ///              BUSCA POR WEB SERVICE                ///
  /////////////////////////////////////////////////////////

  a := 0;
  i := Trunc((Now - Trunc(Now)) * 100000000) + YearOf(Now) + MonthOf(Now) +  + DayOf(Now);
  h := FormatDateTime('yyyymmddhhnn', Now);
  s := SHA1Hash(h + IntToStr(Trunc((i + 1503) / 3)));
  //
  l := GetCepBackendCepBackendPort();

  ls := l.FindByCep(h + IntToHex(i, 1), s, RetiraCaracterNaoNumero(edtCEP.Text));

  if ls <> nil  then
  begin
    cds.fieldbyname(endereco ).AsString := UTF8Decode(ls[a].endereco);
    cds.fieldbyname(bairro   ).AsString := ls[a].bairro;
    cds.fieldbyname(municipio).AsString := ls[a].cod_munic;
    edtEndereco.SetFocus;
  end
  else
  begin
    aviso('CEP não Encontrado!');
    edtCep.SetFocus;
  end;
end;

function GetCepBackendCepBackendPort(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): CepBackendCepBackendPort;
const
  //defWSDL = 'http://192.168.0.122:3002/cep_backend/wsdl';
  //defURL  = 'http://192.168.0.122:3002/cep_backend/api';
  defWSDL = 'http://datacep.gigatron.com.br.gigatron.com.br/cep_backend/wsdl';
  defURL  = 'http://datacep.gigatron.com.br/cep_backend/api';
  defSvc  = 'CepBackendService';
  defPrt  = 'CepBackendCepBackendPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as CepBackendCepBackendPort);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(CepBackendCepBackendPort), 'urn:ActionWebService', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(CepBackendCepBackendPort), '/cep_backend/api/%operationName%');
  RemClassRegistry.RegisterXSClass(CepStruct, 'urn:ActionWebService', 'CepStruct');
  RemClassRegistry.RegisterXSInfo(TypeInfo(CepStructArray), 'urn:ActionWebService', 'CepStructArray');

end.
