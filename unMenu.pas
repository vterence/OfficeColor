unit unMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, dxRibbon, dxBar, SqlExpr, FMTBcd, DB, DBClient, Provider, unPadrao;

type
  TfrmMenu = class(TFrmPadrao)
    MainMenuPadrao: TMainMenu;
    Cadastros: TMenuItem;
    sds: TSQLDataSet;
    dsp: TDataSetProvider;
    cds: TClientDataSet;
    ds: TDataSource;
    m001TFrmCadImpressoras: TMenuItem;
    m002TFrmCadClientes: TMenuItem;
    Configurações: TMenuItem;
    m004TFrmCadUsuarios: TMenuItem;
    m003TFrmCadItens: TMenuItem;
    m005: TMenuItem;
    m006TFrmRelClientes: TMenuItem;
    Gerenciamento: TMenuItem;
    m007TFrmOS: TMenuItem;
    m008TfrmPesquisaOSAberto: TMenuItem;
    m009TfrmAberturaContador: TMenuItem;
    m010: TMenuItem;
    m011TFrmRelOS: TMenuItem;
    m012TfrmRelOsResumido: TMenuItem;
    m013TFrmParametros: TMenuItem;
    m014TFrmRelOSErro: TMenuItem;
    m015TfrmCadGruposAcesso: TMenuItem;
    m016TfrmCadGruposUsuarios: TMenuItem;
    m017TFrmRelContador: TMenuItem;
    m018TFrmCadConsumiveis: TMenuItem;
    m019TFrmRelTrocaConsumiveis: TMenuItem;
  private
    { Private declarations }
    procedure MontaTabRibbon(Ribbon:TdxRibbon;BarManager:TdxBarManager; PapaiDele:TComponent;cod_menu, ordem, ordem_papai_dele: String; modulo: String = '');
    function GravarMenuBancoDados: Boolean;
    function MontarMenuSitema(MM: TMainMenu; Ribbon:TdxRibbon;BarManager:TdxBarManager): Boolean;
    procedure BuscarFilhos(var qry: TSQLQuery; cod_menu,modulo: String);

  public
    { Public declarations }

    RibbonTab        : TdxRibbonTab      ;
    RibbonGrupo      : TdxRibbonTabGroup ;
    RibbonBarra      : TdxBar            ;
    RibbonBotao      : TdxBarItem        ;
    function CarregarMenuPrincipal(MM: TMainMenu; Ribbon:TdxRibbon; BarManager:TdxBarManager): Boolean;
    procedure AddRibbonTab(Ribbon:TdxRibbon;caption,name:string);

    //adiciona uma toolbar à tab criada acima
    procedure AddToolBar(Ribbon:TdxRibbon;BarManager:TdxBarManager; tab:integer;Texto:string;addgrupo:boolean = true);

    //adiciona um submenu à toolbar criada acima
    procedure AddSubMenu(Ribbon:TdxRibbon;BarManager:TdxBarManager; Pai:TComponent;var RibbonSubMenu: TdxBarSubItem);

    //adiciona um botao (menu que chama uma tela ou relatorio) ao submenu criado acima
    procedure AddBotao  (Ribbon:TdxRibbon;BarManager:TdxBarManager; Pai:TComponent);

  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}
uses unDM, unPrincipal;

procedure TfrmMenu.BuscarFilhos(var qry: TSQLQuery; cod_menu, modulo: String);
begin
  qry := TSQLQuery.Create(nil);
  qry.SQLConnection := DM.Conn;
  qry.SQL.Text :=
    'SELECT DISTINCT                                          ' + #13 +
    '  MENU.MODULO,                                           ' + #13 +
    '  GRP_ACE_ITEM.NOME_MENU,                                ' + #13 +
    '  MENU.DESC_MENU,                                        ' + #13 +
    '  MENU.ORDEM    ,                                        ' + #13 +
    '  MENU.FORMULARIO   ,                                    ' + #13 +
    '  MENU.IMAGEINDEX   ,                                    ' + #13 +
    '  MENU.PARAM_TAG                                         ' + #13 +
    'FROM GRUPOS_ACESSOS_ITENS GRP_ACE_ITEM                   ' + #13 +
    '  INNER JOIN MENUS MENU                                  ' + #13 +
    '    ON GRP_ACE_ITEM.NOME_MENU = MENU.NOME_MENU           ' + #13 +
    '  INNER JOIN USUARIOS_GRUPOS_ITENS USR_GRP_ITEM          ' + #13 +
    '    ON USR_GRP_ITEM.COD_ACESSO = GRP_ACE_ITEM.COD_ACESSO ' + #13 +
    '    AND USR_GRP_ITEM.COD_GRUPO = ' + DM.DadosUsu.Grupo     + #13 ;

  if ( modulo = '' ) then
    qry.SQL.Text := qry.SQL.Text + #13 +
      '  AND MENU.PAPAI_NOME_MENU = ' + QuotedStr(cod_menu)
  else
    qry.sql.Text := qry.sql.Text + #13 +
      '  AND MENU.PAPAI_NOME_MENU IS NULL' + #13 +
      '  AND MENU.MODULO = ' + QuotedStr(modulo);
  qry.sql.Text := Qry.sql.Text + #13 +
    'ORDER BY     ' + #13 +
    '  MENU.ORDEM ';
  qry.Open;
end;

function TfrmMenu.CarregarMenuPrincipal(MM: TMainMenu; Ribbon:TdxRibbon;BarManager:TdxBarManager): Boolean;
begin
  Result := True;
  try
    if not GravarMenuBancoDados then
      Abort;
    if not MontarMenuSitema(MM, Ribbon, BarManager) then
      Abort;
  except
    Result := False;
  end;
end;


function TfrmMenu.GravarMenuBancoDados: Boolean;
var
  menuPai, nome, arquivo, descricao, info:string;
  teste , a , i , j , aux , ordem:integer;
  buscou_ordem : boolean;
  mteste : TComponent;

procedure GravarItem(IT: TMenuItem; Papai_Dele, Modulo: String);
var
  a,teste: Integer;
  descricao, formulario: String;


function BuscaOrdem(Papai_Dele:string):integer;
begin
  dm.BuscaQry(DM.QR_Busca,
  ' SELECT                                   '+
  ' MAX(MENUS.ORDEM) ORDEM                   '+
  ' FROM MENUS                               '+
  '      INNER JOIN MODULOS ON               '+
  '      MENUS.MODULO = MODULOS.MODULO       '+
  ' WHERE MENUS.PAPAI_NOME_MENU = '+quotedstr(Papai_Dele));

  result := DM.QR_Busca.fieldbyname('ORDEM').AsInteger + 1;
end;

begin
  teste := 0 ;
  for a := 0 to (IT.Count - 1) do
  begin
    Descricao := IT.Items[a].Caption;

    if (pos('mget', IT.Items[a].Name) = 0) then
    begin
      Formulario := Copy(IT.Items[a].Name, 5, 300);
      Nome_Menu  := Copy(IT.Items[a].Name, 1, 004);
    end
    else // Gravar os formulários dos WidGets
    begin
      Formulario := Copy(IT.Items[a].Name, 8, 300);
      Nome_Menu  := Copy(IT.Items[a].Name, 1, 007);
    end;

    //VERIFICO SE O MENU JA EXISTE ANTES DE GRAVAR
    if not cds.Locate('NOME_MENU', VarArrayOf([Nome_Menu]), [loCaseInsensitive]) then
    begin
      // INSERE O MENU
      cds.Append;
      cds.FieldByName('NOME_MENU').AsString := Nome_Menu;
    end
    else
      cds.edit;

    cds.FieldByName('DESC_MENU').AsString := Descricao;
    if ( Formulario <> '' ) then
      cds.FieldByName('FORMULARIO').AsString := Formulario;
    if ( Papai_Dele <> '' ) then
      cds.FieldByName('PAPAI_NOME_MENU').AsString := Papai_Dele
    else
      cds.FieldByName('PAPAI_NOME_MENU').Value := null;
    cds.FieldByName('ORDEM').AsInteger    := a + 1;
    cds.FieldByName('MODULO').AsString    := Modulo;
    cds.FieldByName('PARAM_TAG' ).AsString := IntToStr(IT.Items[a].Tag);
    cds.FieldByName('IMAGEINDEX').AsString := IntToStr(IT.Items[a].imageindex);
    cds.Post;
    teste := a;
    GravarItem(IT.Items[a], Nome_Menu, Modulo);
  end;

  cds.ApplyUpdates(-1);
end;

begin
  inherited;
  Result := True;

  try

    //////////////////////////////////////////////////////////////
    ///       LIMPANDO OS MENUS DE TELA DA TABELA              ///
    //////////////////////////////////////////////////////////////

    cds.Close;
    cds.CommandText :=
    ' SELECT                                '+
    ' MENUS.*                               '+
    ' FROM MENUS                            '+
    ' ORDER BY NOME_MENU                    ';

    cds.Open ;
    while ( not cds.Eof ) do
    begin
      //SE O MENU NAO EXISTE MAIS NA ARVORE, DEVO EXCLUIR
      nome   := copy(cds.fieldbyname('NOME_MENU').asstring,1,4) + cds.fieldbyname('FORMULARIO').asstring;
      mteste := frmmenu.FindComponent(nome);
      if mteste <> nil then
        cds.next
      else
        cds.delete;
    end;

    cds.ApplyUpdates(-1);


    //////////////////////////////////////////////////////////////
    ///           GRAVANDO OS MENUS DE TELAS                   ///
    //////////////////////////////////////////////////////////////

    for a := 0 to (MainMenuPadrao.Items.Count - 1) do
    begin
      if ( MainMenuPadrao.Items.Parent = nil ) then
      begin
        GravarItem(MainMenuPadrao.Items[a], '', MainMenuPadrao.Items[a].Name);
      end;
    end;

  except
    on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

function TfrmMenu.MontarMenuSitema(MM: TMainMenu; Ribbon: TdxRibbon;
  BarManager: TdxBarManager): Boolean;
var
  texto, modulo, sqlTexto: String;
  ordem : integer;
  i:integer;
  oldMMOwner: TComponent;

begin
  result := True;

  // Display para mensagem ao usuário enquanto o sistema monta o menu.
  Application.ProcessMessages;

  try
    // Se for o tipo de menu tradicional, remove o componente menu do formulário para acelerar montagem.
    // Após a montagem, o menu será inserido novamente no formulário.

    // tipo = 0 mainmenu  tipo = 1 treeview  tipo = 2 ribbon
    Ribbon.Tabs.Clear;
    BarManager.Bars.Clear;
    Ribbon.SupportNonClientDrawing := true;
    //LIMPANDO OS BOTOES CRIADO PELO RIBBON

    i := 0;
    while i < BarManager.ComponentCount do
    begin
      BarManager.Components[i].Destroy;
    end;

    texto :=
      'SELECT DISTINCT                                          ' + #13 +
      '  MENU.MODULO                                            ' + #13 +
      'FROM GRUPOS_ACESSOS_ITENS GRP_ACE_ITEM                   ' + #13 +
      '  INNER JOIN MENUS MENU                                  ' + #13 +
      '    ON GRP_ACE_ITEM.NOME_MENU = MENU.NOME_MENU           ' + #13 +
      '  INNER JOIN USUARIOS_GRUPOS_ITENS USR_GRP_ITEM          ' + #13 +
      '    ON USR_GRP_ITEM.COD_ACESSO = GRP_ACE_ITEM.COD_ACESSO ' + #13 +
      '  INNER JOIN MODULOS MODULO                              ' + #13 +
      '    ON MODULO.MODULO = MENU.MODULO                       ' + #13 +
      'WHERE USR_GRP_ITEM.COD_GRUPO = ' + DM.DadosUsu.grupo       + #13 +
      '  AND MENU.PAPAI_NOME_MENU IS NULL                       ' + #13 +
      'ORDER BY                                                 ' + #13 +
      '  MODULO.ORDEM                                           ';
    DM.BuscaQry(DM.QR_Busca, texto);
    ordem := 1;
    while not DM.QR_Busca.eof do
    begin
      modulo := DM.QR_Busca.FieldByName('MODULO').AsString ;
      AddRibbonTab(ribbon,inttostr(ordem) + '. '+DM.QR_Busca.fieldbyname('MODULO').AsString,DM.QR_Busca.fieldbyname('MODULO').AsString);
      AddToolBar(ribbon,BarManager,ordem-1,inttostr(ordem) + '. '+DM.QR_Busca.fieldbyname('MODULO').AsString);
      MontaTabRibbon(ribbon,BarManager,RibbonBarra,'',inttostr(ordem),'',DM.QR_Busca.fieldbyname('MODULO').AsString);
      DM.QR_Busca.next;
      inc (ordem);
    end;

  finally
    result := True;
  end;
end;

procedure TfrmMenu.AddRibbonTab(Ribbon:TdxRibbon;caption,name:string);
begin
  RibbonTab := Ribbon.Tabs.Add;
  RibbonTab.caption := caption;
  RibbonTab.name    := name   ;
  RibbonTab.Active  := true   ;
end;

procedure TfrmMenu.AddToolBar(Ribbon:TdxRibbon;BarManager:TdxBarManager; tab:integer;Texto:string;addgrupo:boolean = true);
begin
  RibbonBarra   := BarManager.AddToolBar;
  RibbonBarra.Caption := Texto;
  if addgrupo then
  begin
    RibbonGrupo := Ribbon.Tabs[BarManager.Bars.Count-1].Groups.add;
    RibbonGrupo.ToolBar := RibbonBarra;
  end;
end;

procedure TfrmMenu.AddSubMenu(Ribbon:TdxRibbon;BarManager:TdxBarManager; Pai:TComponent;var RibbonSubMenu: TdxBarSubItem);
begin
  RibbonSubMenu := BarManager.AddSubItem;
  RibbonSubMenu.Visible := ivAlways;

  if pai.ClassName = 'TdxBar' then
    (pai as TdxBar).ItemLinks.Add.Item:= RibbonSubMenu;

  if pai.ClassName = 'TdxBarSubItem' then
    (pai as TdxBarSubItem).ItemLinks.Add.Item:= RibbonSubMenu;
end;

procedure TfrmMenu.AddBotao(Ribbon:TdxRibbon;BarManager:TdxBarManager; Pai:TComponent);
begin
  RibbonBotao := BarManager.AddItem(TdxBarLargeButton);
  RibbonBotao.Visible := ivAlways;

  if pai.ClassName = 'TdxBar' then
    (pai as TdxBar).ItemLinks.Add.Item:= RibbonBotao;

  if pai.ClassName = 'TdxBarSubItem' then
    (pai as TdxBarSubItem).ItemLinks.Add.Item:= RibbonBotao;
end;


procedure TfrmMenu.MontaTabRibbon(Ribbon: TdxRibbon; BarManager: TdxBarManager;
  PapaiDele: TComponent; cod_menu, ordem, ordem_papai_dele, modulo: String);
var
  Qry: TSQLQuery;
  caption,name,hint:string; enabled: boolean; ImageIndex:integer;
  RibbonSubMenu    : TdxBarSubItem     ;
  botao : TComponent;
begin
  BuscarFilhos(Qry,cod_menu,modulo);
  if ( not Qry.IsEmpty ) then
  begin
    if ( ordem <> '' ) and (ordem_papai_dele <> '') then
      ordem := ordem + '.';
    ordem := ordem + ordem_papai_dele;
  end;
  while not Qry.Eof do
  begin
    if ( ordem <> '' ) then
      Caption := ordem +'.'+Qry.FieldByName('ORDEM').AsString+'   '+Qry.FieldByName('DESC_MENU').AsString
    else
      Caption := Qry.FieldByName('ORDEM').AsString+'   '+Qry.FieldByName('DESC_MENU').AsString;

    ImageIndex := Qry.FieldByName('IMAGEINDEX' ).asinteger;
    Name    := Qry.FieldByName('NOME_MENU' ).Asstring;
    hint    := Qry.FieldByName('NOME_MENU' ).Asstring;

    Enabled := true;

    if Qry.fieldbyname('FORMULARIO').asstring = '' then
    begin
      AddSubMenu(ribbon,BarManager,PapaiDele,Ribbonsubmenu);
      Ribbonsubmenu.Caption         := caption    ;
      if ImageIndex = -1 then
      begin
        Ribbonsubmenu.ImageIndex      := 3         ;
        Ribbonsubmenu.largeImageIndex := 3         ;
      end
      else
      begin
        Ribbonsubmenu.ImageIndex      := ImageIndex;
        Ribbonsubmenu.largeImageIndex := ImageIndex;
      end;
      Ribbonsubmenu.Name            := Name       ;
      Ribbonsubmenu.hint            := hint       ;
      Ribbonsubmenu.Enabled         := Enabled    ;
    end
    else
    begin
      AddBotao(ribbon,BarManager,PapaiDele);
      RibbonBotao.Caption         := caption    ;
      if ImageIndex = -1 then
      begin
        RibbonBotao.ImageIndex      := -1       ;
        RibbonBotao.largeImageIndex := -1       ;
      end
      else
      begin
        RibbonBotao.ImageIndex      := ImageIndex;
        RibbonBotao.largeImageIndex := ImageIndex;
      end;
      RibbonBotao.Name            := Name       ;
      RibbonBotao.hint            := hint       ;
      RibbonBotao.Enabled         := Enabled    ;
      RibbonBotao.OnClick         := frmPrincipal.MenuClick;
    end;

    MontaTabRibbon(Ribbon,BarManager,Ribbonsubmenu,Qry.FieldByName('NOME_MENU').AsString,ordem,Qry.FieldByName('ORDEM').Asstring);
    Qry.Next;
  end;
  Qry.Close;
  Qry.Free;
end;

end.
