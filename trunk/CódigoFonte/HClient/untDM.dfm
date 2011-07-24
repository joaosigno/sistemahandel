object dm: Tdm
  OldCreateOrder = False
  Left = 934
  Top = 98
  Height = 445
  Width = 448
  object cdsUsu: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsu'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 104
    Top = 64
    object cdsUsuuclogin: TStringField
      DisplayLabel = 'Login.'
      DisplayWidth = 30
      FieldName = 'uclogin'
      Size = 30
    end
    object cdsUsuuciduser: TIntegerField
      DisplayLabel = 'C'#243'd.'
      DisplayWidth = 10
      FieldName = 'uciduser'
      Required = True
    end
    object cdsUsuucusername: TStringField
      DisplayWidth = 30
      FieldName = 'ucusername'
      Visible = False
      Size = 30
    end
    object cdsUsuucpassword: TStringField
      DisplayWidth = 250
      FieldName = 'ucpassword'
      Visible = False
      Size = 250
    end
    object cdsUsuucpassexpired: TStringField
      DisplayWidth = 10
      FieldName = 'ucpassexpired'
      Visible = False
      Size = 10
    end
    object cdsUsuucuserexpired: TIntegerField
      DisplayWidth = 10
      FieldName = 'ucuserexpired'
      Visible = False
    end
    object cdsUsuucuserdayssun: TIntegerField
      DisplayWidth = 10
      FieldName = 'ucuserdayssun'
      Visible = False
    end
    object cdsUsuucemail: TStringField
      DisplayWidth = 150
      FieldName = 'ucemail'
      Visible = False
      Size = 150
    end
    object cdsUsuucprivileged: TIntegerField
      DisplayWidth = 10
      FieldName = 'ucprivileged'
      Visible = False
    end
    object cdsUsuuctyperec: TStringField
      DisplayWidth = 1
      FieldName = 'uctyperec'
      Visible = False
      Size = 1
    end
    object cdsUsuucprofile: TIntegerField
      DisplayWidth = 10
      FieldName = 'ucprofile'
      Visible = False
    end
    object cdsUsuuckey: TStringField
      DisplayWidth = 250
      FieldName = 'uckey'
      Visible = False
      Size = 250
    end
    object cdsUsuucinative: TIntegerField
      DisplayWidth = 10
      FieldName = 'ucinative'
      Visible = False
    end
    object cdsUsucdempr: TIntegerField
      DisplayLabel = 'C'#243'd.Empresa'
      DisplayWidth = 10
      FieldName = 'cdempr'
      Visible = False
    end
    object cdsUsucdfunc: TIntegerField
      DisplayLabel = 'C'#243'd.Funcion'#225'rio'
      DisplayWidth = 10
      FieldName = 'cdfunc'
      Visible = False
    end
    object cdsUsutodasEmpresas: TStringField
      DisplayWidth = 1
      FieldName = 'todasEmpresas'
      Visible = False
      Size = 1
    end
    object cdsUsuprocuraEmpresa: TStringField
      DisplayLabel = 'Empresa'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'procuraEmpresa'
      LookupDataSet = cdsEmp
      LookupKeyFields = 'cdempr'
      LookupResultField = 'nmfant'
      KeyFields = 'cdempr'
      Visible = False
      Size = 30
      Lookup = True
    end
    object cdsUsuprocuraFuncioanrio: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'procuraFuncioanrio'
      LookupDataSet = cdsFunc
      LookupKeyFields = 'cdfunc'
      LookupResultField = 'nome'
      KeyFields = 'cdfunc'
      Visible = False
      Size = 30
      Lookup = True
    end
  end
  object scHC: TSocketConnection
    Connected = True
    ServerGUID = '{29C1310A-D963-42DA-99C6-C0570B487612}'
    ServerName = 'HS.RDM'
    Host = 'localhost'
    SupportCallbacks = False
    Left = 48
    Top = 8
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 48
    Top = 64
  end
  object cdsFor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspForn'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 216
    Top = 64
    object cdsFornmfant: TStringField
      DisplayLabel = 'Nome Fantasia'
      DisplayWidth = 50
      FieldName = 'nmfant'
      Required = True
      Size = 50
    end
    object cdsForrzsoci: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      DisplayWidth = 50
      FieldName = 'rzsoci'
      Size = 50
    end
    object cdsForcdforn: TIntegerField
      DisplayLabel = 'C'#243'd.'
      DisplayWidth = 10
      FieldName = 'cdforn'
      Required = True
      Visible = False
    end
    object cdsForcdempr: TIntegerField
      DisplayLabel = 'C'#243'd.Empr.'
      DisplayWidth = 10
      FieldName = 'cdempr'
      Required = True
      Visible = False
    end
    object cdsForcdbanco: TIntegerField
      DisplayLabel = 'C'#243'd.Banco'
      DisplayWidth = 10
      FieldName = 'cdbanco'
      Visible = False
    end
    object cdsForprocurabanco: TStringField
      DisplayLabel = 'Banco'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'procurabanco'
      LookupDataSet = cdsBanc
      LookupKeyFields = 'cdban'
      LookupResultField = 'descri'
      KeyFields = 'cdbanco'
      Visible = False
      Size = 30
      Lookup = True
    end
    object cdsFordtcada: TDateField
      DisplayLabel = 'Dt.Cadastro'
      DisplayWidth = 10
      FieldName = 'dtcada'
      Visible = False
    end
    object cdsForpesfis: TStringField
      DisplayLabel = 'Pes.Fis'
      DisplayWidth = 1
      FieldName = 'pesfis'
      Visible = False
      Size = 1
    end
    object cdsForinsest: TStringField
      DisplayLabel = 'IE'
      DisplayWidth = 20
      FieldName = 'insest'
      Visible = False
    end
    object cdsForcgc: TStringField
      DisplayLabel = 'CGC'
      DisplayWidth = 14
      FieldName = 'cgc'
      Visible = False
      Size = 14
    end
    object cdsForcep: TStringField
      DisplayLabel = 'Cep'
      DisplayWidth = 10
      FieldName = 'cep'
      Visible = False
      EditMask = '00000-000;1'
      Size = 10
    end
    object cdsForendere: TStringField
      DisplayLabel = 'Endere'#231'o'
      DisplayWidth = 50
      FieldName = 'endere'
      Visible = False
      Size = 50
    end
    object cdsForbairro: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 30
      FieldName = 'bairro'
      Visible = False
      Size = 30
    end
    object cdsForcidade: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 30
      FieldName = 'cidade'
      Visible = False
      Size = 30
    end
    object cdsFornumero: TStringField
      DisplayLabel = 'N'#250'm.'
      DisplayWidth = 6
      FieldName = 'numero'
      Visible = False
      Size = 6
    end
    object cdsForuf: TStringField
      DisplayLabel = 'UF'
      DisplayWidth = 2
      FieldName = 'uf'
      Visible = False
      Size = 2
    end
    object cdsFortelefo: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 20
      FieldName = 'telefo'
      Visible = False
      EditMask = '(00)0000-0000;0'
    end
    object cdsForfax: TStringField
      DisplayLabel = 'FAX'
      DisplayWidth = 20
      FieldName = 'fax'
      Visible = False
      EditMask = '(00)0000-0000;0'
    end
    object cdsFordtfund: TDateField
      DisplayLabel = 'DT.Funda'#231#227'o'
      DisplayWidth = 10
      FieldName = 'dtfund'
      Visible = False
    end
    object cdsForrmativ: TStringField
      DisplayLabel = 'Ramo Atividade'
      DisplayWidth = 50
      FieldName = 'rmativ'
      Visible = False
      Size = 50
    end
    object cdsForagenci: TStringField
      DisplayLabel = 'Agencia'
      DisplayWidth = 15
      FieldName = 'agenci'
      Visible = False
      Size = 15
    end
    object cdsForconta: TStringField
      DisplayLabel = 'Conta'
      DisplayWidth = 15
      FieldName = 'conta'
      Visible = False
      Size = 15
    end
    object cdsForemail: TStringField
      DisplayLabel = 'E-mail'
      DisplayWidth = 50
      FieldName = 'email'
      Visible = False
      Size = 50
    end
    object cdsForhomepa: TStringField
      DisplayLabel = 'Home Page'
      DisplayWidth = 50
      FieldName = 'homepa'
      Visible = False
      Size = 50
    end
    object cdsForobserv: TStringField
      DisplayLabel = 'Obs.'
      DisplayWidth = 200
      FieldName = 'observ'
      Visible = False
      Size = 200
    end
    object cdsForrepre1: TStringField
      DisplayLabel = 'Representante 1'
      DisplayWidth = 50
      FieldName = 'repre1'
      Visible = False
      Size = 50
    end
    object cdsForrpcon1: TStringField
      DisplayLabel = 'Contato Rep.1'
      DisplayWidth = 50
      FieldName = 'rpcon1'
      Visible = False
      Size = 50
    end
    object cdsForrptel1: TStringField
      DisplayLabel = 'Telefone Rep.1'
      DisplayWidth = 20
      FieldName = 'rptel1'
      Visible = False
      EditMask = '(00)0000-0000;0'
    end
    object cdsForrpfax1: TStringField
      DisplayLabel = 'Fax Rep.1'
      DisplayWidth = 20
      FieldName = 'rpfax1'
      Visible = False
      EditMask = '(00)0000-0000;0'
    end
    object cdsForrpema1: TStringField
      DisplayLabel = 'E-mail Rep.1'
      DisplayWidth = 50
      FieldName = 'rpema1'
      Visible = False
      Size = 50
    end
    object cdsForrepre2: TStringField
      DisplayLabel = 'Representante 2'
      DisplayWidth = 50
      FieldName = 'repre2'
      Visible = False
      Size = 50
    end
    object cdsForrpcon2: TStringField
      DisplayLabel = 'Contato Rep.2'
      DisplayWidth = 50
      FieldName = 'rpcon2'
      Visible = False
      Size = 50
    end
    object cdsForrptel2: TStringField
      DisplayLabel = 'Telefone Rep.2'
      DisplayWidth = 20
      FieldName = 'rptel2'
      Visible = False
      EditMask = '(00)0000-0000;0'
    end
    object cdsForrpfax2: TStringField
      DisplayLabel = 'Fax Rep.2'
      DisplayWidth = 20
      FieldName = 'rpfax2'
      Visible = False
      EditMask = '(00)0000-0000;0'
    end
    object cdsForrpema2: TStringField
      DisplayLabel = 'E-mail Rep.2'
      DisplayWidth = 50
      FieldName = 'rpema2'
      Visible = False
      Size = 50
    end
    object cdsForrepre3: TStringField
      DisplayLabel = 'Representante 3'
      DisplayWidth = 50
      FieldName = 'repre3'
      Visible = False
      Size = 50
    end
    object cdsForrpcon3: TStringField
      DisplayLabel = 'Contato Rep.3'
      DisplayWidth = 50
      FieldName = 'rpcon3'
      Visible = False
      Size = 50
    end
    object cdsForrptel3: TStringField
      DisplayLabel = 'Telefone Rep.3'
      DisplayWidth = 20
      FieldName = 'rptel3'
      Visible = False
      EditMask = '(00)0000-0000;0'
    end
    object cdsForrpfax3: TStringField
      DisplayLabel = 'Fax Rep.3'
      DisplayWidth = 20
      FieldName = 'rpfax3'
      Visible = False
      EditMask = '(00)0000-0000;0'
    end
    object cdsForrpema3: TStringField
      DisplayLabel = 'E-mail Rep.3'
      DisplayWidth = 50
      FieldName = 'rpema3'
      Visible = False
      Size = 50
    end
  end
  object cdsEmp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmp'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 48
    Top = 120
    object cdsEmpcdempr: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'cdempr'
      Required = True
      DisplayFormat = '000000'
    end
    object cdsEmpdtcada: TDateField
      DisplayLabel = 'Dt.Cadastro'
      FieldName = 'dtcada'
    end
    object cdsEmpnmfant: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'nmfant'
      Required = True
      Size = 50
    end
    object cdsEmprzsoci: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'rzsoci'
      Size = 50
    end
    object cdsEmpcgc: TStringField
      DisplayLabel = 'CGC'
      FieldName = 'cgc'
      EditMask = '99.999.999/9999-99;1;'
      Size = 14
    end
    object cdsEmpinsest: TStringField
      DisplayLabel = 'IE'
      FieldName = 'insest'
    end
    object cdsEmpendere: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'endere'
      Size = 50
    end
    object cdsEmpcomple: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'comple'
      Size = 50
    end
    object cdsEmpnumero: TStringField
      DisplayLabel = 'N'#250'm.'
      FieldName = 'numero'
      Size = 6
    end
    object cdsEmpbairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Size = 30
    end
    object cdsEmpcep: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'cep'
      EditMask = '00000-000;1'
      Size = 10
    end
    object cdsEmpcidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 30
    end
    object cdsEmpuf: TStringField
      DisplayLabel = 'UF'
      FieldName = 'uf'
      Size = 2
    end
    object cdsEmpcdbanc: TIntegerField
      DisplayLabel = 'C'#243'd.Banco'
      FieldName = 'cdbanc'
    end
    object cdsEmpprocuraBanco: TStringField
      DisplayLabel = 'Banco'
      FieldKind = fkLookup
      FieldName = 'procuraBanco'
      LookupDataSet = cdsBanc
      LookupKeyFields = 'cdban'
      LookupResultField = 'descri'
      KeyFields = 'cdempr'
      Size = 30
      Lookup = True
    end
    object cdsEmpconta: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'conta'
      Size = 15
    end
    object cdsEmpagenci: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'agenci'
      Size = 15
    end
    object cdsEmprespon: TStringField
      DisplayLabel = 'Respons'#225'vel'
      FieldName = 'respon'
      Size = 50
    end
    object cdsEmptelefo: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefo'
      EditMask = '(00)0000-0000;0;'
    end
    object cdsEmpfax: TStringField
      DisplayLabel = 'FAX'
      FieldName = 'fax'
      EditMask = '(00)0000-0000;0;'
    end
    object cdsEmpemail: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      Size = 50
    end
    object cdsEmptpempr: TStringField
      DisplayLabel = 'Tipo Emp.'
      FieldName = 'tpempr'
      Size = 14
    end
  end
  object cdsGRPro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGRPro'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 217
    Top = 8
    object cdsGRProcdgrup: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'cdgrup'
      Required = True
    end
    object cdsGRProdtcada: TDateField
      DisplayLabel = 'Dt.Cadastro'
      FieldName = 'dtcada'
    end
    object cdsGRProcdempr: TIntegerField
      DisplayLabel = 'Cod.Empr.'
      FieldName = 'cdempr'
      Required = True
    end
    object cdsGRProdescri: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descri'
      Required = True
      Size = 30
    end
    object cdsGRProacdesc: TStringField
      DisplayLabel = 'Ac.Desc.'
      FieldName = 'acdesc'
      Size = 1
    end
    object cdsGRProvldesc: TFloatField
      DisplayLabel = 'Desc. M'#225'ximo(%)'
      FieldName = 'vldesc'
      DisplayFormat = '#.00'
      EditFormat = '#.00'
    end
  end
  object cdsProfi: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProf'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 104
    Top = 120
    object cdsProficdprof: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'cdprof'
      Required = True
    end
    object cdsProficdempr: TIntegerField
      DisplayLabel = 'C'#243'd.Empr.'
      FieldName = 'cdempr'
      Required = True
    end
    object cdsProfidtcada: TDateField
      DisplayLabel = 'Dt.Cadastro'
      FieldName = 'dtcada'
    end
    object cdsProfidescri: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descri'
      Required = True
      Size = 30
    end
  end
  object cdsFunc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFun'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 160
    Top = 120
    object cdsFunccdfunc: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'cdfunc'
      Required = True
    end
    object cdsFuncativo: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ativo'
      Size = 1
    end
    object cdsFuncsexo: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'sexo'
      OnGetText = cdsFuncsexoGetText
      Size = 1
    end
    object cdsFuncdtcada: TDateField
      DisplayLabel = 'Dt.Cadastro'
      FieldName = 'dtcada'
    end
    object cdsFunccdempr: TIntegerField
      DisplayLabel = 'C'#243'd.Empr.'
      FieldName = 'cdempr'
      Required = True
    end
    object cdsFuncnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object cdsFuncrg: TStringField
      DisplayLabel = 'RG'
      FieldName = 'rg'
    end
    object cdsFunccpf: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'cpf'
      EditMask = '999.999.999-99;1;'
      Size = 14
    end
    object cdsFunccep: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'cep'
      EditMask = '00000-000;1'
      Size = 10
    end
    object cdsFuncendere: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'endere'
      Size = 50
    end
    object cdsFuncbairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Size = 30
    end
    object cdsFuncnumero: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'numero'
      Size = 6
    end
    object cdsFunccidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 30
    end
    object cdsFuncuf: TStringField
      DisplayLabel = 'UF'
      FieldName = 'uf'
      Size = 2
    end
    object cdsFunctelefo: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefo'
      EditMask = '(00)0000-0000;0'
    end
    object cdsFuncdtnasc: TDateField
      DisplayLabel = 'Dt.Nascimento'
      FieldName = 'dtnasc'
    end
    object cdsFuncemail: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      Size = 50
    end
    object cdsFuncdtadmi: TDateField
      DisplayLabel = 'Dt.Adminiss'#227'o'
      FieldName = 'dtadmi'
    end
    object cdsFuncdtsaid: TDateField
      DisplayLabel = 'Dt.Sa'#237'da'
      FieldName = 'dtsaid'
    end
    object cdsFunccdprof: TIntegerField
      DisplayLabel = 'C'#243'd.Prof.'
      FieldName = 'cdprof'
    end
    object cdsFuncprocuraProfissao: TStringField
      DisplayLabel = 'Profiss'#227'o'
      FieldKind = fkLookup
      FieldName = 'procuraProfissao'
      LookupDataSet = cdsProfi
      LookupKeyFields = 'cdprof'
      LookupResultField = 'descri'
      KeyFields = 'cdprof'
      Size = 30
      Lookup = True
    end
    object cdsFunccddepa: TIntegerField
      DisplayLabel = 'C'#243'd.Depart.'
      FieldName = 'cddepa'
    end
    object cdsFuncprocuraDepartamento: TStringField
      DisplayLabel = 'Departamento'
      FieldKind = fkLookup
      FieldName = 'procuraDepartamento'
      LookupDataSet = cdsDepa
      LookupKeyFields = 'cddepa'
      LookupResultField = 'descri'
      KeyFields = 'cddepa'
      Size = 30
      Lookup = True
    end
    object cdsFunccdbanc: TIntegerField
      DisplayLabel = 'C'#243'd.Banco'
      FieldName = 'cdbanc'
    end
    object cdsFuncprocuraBanco: TStringField
      FieldKind = fkLookup
      FieldName = 'procuraBanco'
      LookupDataSet = cdsBanc
      LookupKeyFields = 'cdban'
      LookupResultField = 'descri'
      KeyFields = 'cdbanc'
      Size = 30
      Lookup = True
    end
    object cdsFuncconta: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'conta'
      Size = 15
    end
    object cdsFuncagenci: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'agenci'
      Size = 15
    end
    object cdsFuncchorar: TIntegerField
      DisplayLabel = 'Cg.Hor'#225'ria'
      FieldName = 'chorar'
    end
    object cdsFuncsalari: TFloatField
      DisplayLabel = 'Sal'#225'rio'
      FieldName = 'salari'
      DisplayFormat = '#.00'
      EditFormat = '#.00'
    end
    object cdsFuncprferi: TDateField
      DisplayLabel = 'Pr.F'#233'rias'
      FieldName = 'prferi'
    end
    object cdsFunccartpr: TStringField
      DisplayLabel = 'Cart.Prof.'
      FieldName = 'cartpr'
    end
    object cdsFuncobserv: TStringField
      DisplayLabel = 'Obs.'
      FieldName = 'observ'
      Size = 200
    end
  end
  object UCCon: TUCMidasConn
    Connection = scHC
    ProviderName = 'dspCUsu'
    BancoDados = bdFirebird
    Left = 105
    Top = 8
  end
  object cdsDepa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepar'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 216
    Top = 120
    object cdsDepacddepa: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'cddepa'
      Required = True
    end
    object cdsDepadtcada: TDateField
      DisplayLabel = 'Dt.Cadastro'
      FieldName = 'dtcada'
    end
    object cdsDepacdempr: TIntegerField
      DisplayLabel = 'C'#243'd.Empr.'
      FieldName = 'cdempr'
      Required = True
    end
    object cdsDepadescri: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descri'
      Required = True
      Size = 30
    end
  end
  object cdsCli: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCli'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 48
    Top = 176
    object cdsClicdclie: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'cdclie'
      Required = True
    end
    object cdsClicdempr: TIntegerField
      DisplayLabel = 'C'#243'd.Empr.'
      FieldName = 'cdempr'
    end
    object cdsClipesjur: TStringField
      DisplayLabel = 'Pes.Jur.'
      FieldName = 'pesjur'
      Size = 1
    end
    object cdsCliativo: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ativo'
      Size = 1
    end
    object cdsCliestciv: TStringField
      DisplayLabel = 'Estado Civil'
      FieldName = 'estciv'
      Size = 15
    end
    object cdsClinome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object cdsClisexo: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'sexo'
      OnGetText = cdsClisexoGetText
      Size = 1
    end
    object cdsClidtnasc: TDateField
      DisplayLabel = 'Dt.Nascimento'
      FieldName = 'dtnasc'
    end
    object cdsClicldesd: TDateField
      DisplayLabel = 'Cliente Desde'
      FieldName = 'cldesd'
    end
    object cdsClidtcada: TDateField
      DisplayLabel = 'Dt.Cadastro'
      FieldName = 'dtcada'
    end
    object cdsClinatura: TStringField
      DisplayLabel = 'Natural de'
      FieldName = 'natura'
      Size = 50
    end
    object cdsClirg: TStringField
      DisplayLabel = 'RG'
      FieldName = 'rg'
    end
    object cdsClicpf: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'cpf'
      Size = 14
    end
    object cdsClicep: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'cep'
      EditMask = '00000-000;1;'
      Size = 10
    end
    object cdsCliendere: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'endere'
      Size = 50
    end
    object cdsClinumero: TStringField
      DisplayLabel = 'N'#250'm.'
      FieldName = 'numero'
      Size = 6
    end
    object cdsClicidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 30
    end
    object cdsClibairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Size = 30
    end
    object cdsCliuf: TStringField
      DisplayLabel = 'UF'
      FieldName = 'uf'
      Size = 2
    end
    object cdsClitelefo: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefo'
      EditMask = '(00)0000-0000;0'
    end
    object cdsClicelula: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'celula'
      EditMask = '(00)0000-0000;0'
    end
    object cdsClifax: TStringField
      DisplayLabel = 'FAX'
      FieldName = 'fax'
      EditMask = '(00)0000-0000;0'
    end
    object cdsClicdbanc: TIntegerField
      DisplayLabel = 'C'#243'd.Banco'
      FieldName = 'cdbanc'
    end
    object cdsCliprocuraBanco: TStringField
      DisplayLabel = 'Banco'
      FieldKind = fkLookup
      FieldName = 'procuraBanco'
      LookupDataSet = cdsBanc
      LookupKeyFields = 'cdban'
      LookupResultField = 'descri'
      KeyFields = 'cdbanc'
      Size = 30
      Lookup = True
    end
    object cdsCliagenci: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'agenci'
      Size = 15
    end
    object cdsCliconta: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'conta'
      Size = 15
    end
    object cdsClicdgrup: TIntegerField
      DisplayLabel = 'C'#243'd.Grupo'
      FieldName = 'cdgrup'
    end
    object cdsCliprocuraGrupo: TStringField
      DisplayLabel = 'Grupo'
      FieldKind = fkLookup
      FieldName = 'procuraGrupo'
      LookupDataSet = cdsGRCli
      LookupKeyFields = 'cdgrup'
      LookupResultField = 'descri'
      KeyFields = 'cdgrup'
      Size = 30
      Lookup = True
    end
    object cdsClicdcrfi: TStringField
      DisplayLabel = 'C'#243'd.Cart'#227'o Fidelidade'
      FieldName = 'cdcrfi'
    end
    object cdsCliprocuraCartaoFidelidade: TStringField
      DisplayLabel = 'Cart'#227'o Fidelidade'
      FieldKind = fkLookup
      FieldName = 'procuraCartaoFidelidade'
      LookupDataSet = cdsCartFid
      LookupKeyFields = 'nrcart'
      LookupResultField = 'nmcart'
      KeyFields = 'cdcrfi'
      Size = 30
      Lookup = True
    end
    object cdsClilimite: TFloatField
      DisplayLabel = 'Limite Cr'#233'dito'
      FieldName = 'limite'
    end
    object cdsClinmpai: TStringField
      DisplayLabel = 'Nome Pai'
      FieldName = 'nmpai'
      Size = 50
    end
    object cdsClinmmae: TStringField
      DisplayLabel = 'Nome M'#227'e'
      FieldName = 'nmmae'
      Size = 50
    end
    object cdsCliconjug: TStringField
      DisplayLabel = 'Conjugue'
      FieldName = 'conjug'
      Size = 50
    end
    object cdsClicjtele: TStringField
      DisplayLabel = 'Conjugue Telefone'
      FieldName = 'cjtele'
      EditMask = '(00)0000-0000;0'
    end
    object cdsCliemptra: TStringField
      DisplayLabel = 'Empresa Trabalha'
      FieldName = 'emptra'
      Size = 50
    end
    object cdsCliempcar: TStringField
      DisplayLabel = 'Empresa Cargo'
      FieldName = 'empcar'
      Size = 50
    end
    object cdsClicdprof: TIntegerField
      DisplayLabel = 'C'#243'd.Profiss'#227'o'
      FieldName = 'cdprof'
    end
    object cdsCliprocuraProfissao: TStringField
      DisplayLabel = 'Profissao'
      FieldKind = fkLookup
      FieldName = 'procuraProfissao'
      LookupDataSet = cdsProfi
      LookupKeyFields = 'cdprof'
      LookupResultField = 'descri'
      KeyFields = 'cdprof'
      Size = 30
      Lookup = True
    end
    object cdsCliemptel: TStringField
      DisplayLabel = 'Empresa Telefone '
      FieldName = 'emptel'
      EditMask = '(00)0000-0000;0'
    end
    object cdsCliempcep: TStringField
      DisplayLabel = 'Empresa Cep'
      FieldName = 'empcep'
      EditMask = '00000-000;1;'
      Size = 10
    end
    object cdsCliempend: TStringField
      DisplayLabel = 'Empresa Endere'#231'o'
      FieldName = 'empend'
      Size = 50
    end
    object cdsCliempbai: TStringField
      DisplayLabel = 'Empresa Bairro'
      FieldName = 'empbai'
      Size = 30
    end
    object cdsCliempcid: TStringField
      DisplayLabel = 'Empresa Cidade'
      FieldName = 'empcid'
      Size = 30
    end
    object cdsCliempuf: TStringField
      DisplayLabel = 'Empresa UF'
      FieldName = 'empuf'
      Size = 2
    end
    object cdsClirfcom1: TStringField
      DisplayLabel = 'Referencia Comercial 1'
      FieldName = 'rfcom1'
      Size = 50
    end
    object cdsClirfcom2: TStringField
      DisplayLabel = 'Referencia Comercial 2'
      FieldName = 'rfcom2'
      Size = 50
    end
    object cdsClirfcom3: TStringField
      DisplayLabel = 'Referencia Comercial 3'
      FieldName = 'rfcom3'
      Size = 50
    end
    object cdsClirfpes1: TStringField
      DisplayLabel = 'Referencia Pessoal 1'
      FieldName = 'rfpes1'
      Size = 50
    end
    object cdsClirfpes2: TStringField
      DisplayLabel = 'Referencia Pessoal 2'
      FieldName = 'rfpes2'
      Size = 50
    end
    object cdsClirfpes3: TStringField
      DisplayLabel = 'Referencia Pessoal 3'
      FieldName = 'rfpes3'
      Size = 50
    end
    object cdsCliemail: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      Size = 50
    end
    object cdsClihomepa: TStringField
      DisplayLabel = 'Home Page'
      FieldName = 'homepa'
      Size = 50
    end
    object cdsCliobserv: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'observ'
      Size = 200
    end
  end
  object cdsGRCli: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGRCli'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 104
    Top = 176
    object cdsGRClicdgrup: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'cdgrup'
      Required = True
    end
    object cdsGRClicdempr: TIntegerField
      DisplayLabel = 'C'#243'd.Empr.'
      FieldName = 'cdempr'
    end
    object cdsGRClidtcada: TDateField
      DisplayLabel = 'Dt.Cadastro'
      FieldName = 'dtcada'
    end
    object cdsGRClidescri: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descri'
      Required = True
      Size = 50
    end
  end
  object cdsBanc: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBanco'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 160
    Top = 64
    object cdsBanccdban: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'cdban'
      Required = True
    end
    object cdsBancdtcada: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'dtcada'
    end
    object cdsBancdescri: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descri'
      Required = True
      Size = 50
    end
  end
  object cdsAutori: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepAut'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 164
    Top = 177
    object cdsAutorinome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 50
    end
    object cdsAutoridocume: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'docume'
    end
    object cdsAutoricompra: TStringField
      DisplayLabel = 'Comprar?'
      FieldName = 'compra'
      Size = 1
    end
    object cdsAutoridtnasc: TDateField
      DisplayLabel = 'Dt.Nasc.'
      FieldName = 'dtnasc'
    end
    object cdsAutoritelefo: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefo'
      EditMask = '(00)0000-0000;0;'
    end
    object cdsAutoricdclien: TIntegerField
      FieldName = 'cdclien'
    end
    object cdsAutoritipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tipo'
      Size = 2
    end
    object cdsAutoridtcada: TDateField
      FieldName = 'dtcada'
    end
    object cdsAutoricdempr: TIntegerField
      FieldName = 'cdempr'
    end
  end
  object cdsDepen: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepAut'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 218
    Top = 177
    object cdsDepennome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 50
    end
    object cdsDependocume: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'docume'
    end
    object cdsDepencompra: TStringField
      DisplayLabel = 'Comprar?'
      FieldName = 'compra'
      Size = 1
    end
    object cdsDependtnasc: TDateField
      DisplayLabel = 'Dt.Nasc.'
      FieldName = 'dtnasc'
    end
    object cdsDepentelefo: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefo'
      EditMask = '(00)0000-0000;0;'
    end
    object cdsDepencdclien: TIntegerField
      FieldName = 'cdclien'
    end
    object cdsDepentipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tipo'
      Size = 2
    end
    object cdsDependtcada: TDateField
      FieldName = 'dtcada'
    end
    object cdsDepencdempr: TIntegerField
      FieldName = 'cdempr'
    end
  end
  object cdsCartFid: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCartFid'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 48
    Top = 232
    object cdsCartFidnrcart: TStringField
      DisplayLabel = 'Nr.Cart'#227'o'
      FieldName = 'nrcart'
      Required = True
    end
    object cdsCartFidcdempr: TIntegerField
      DisplayLabel = 'C'#243'd.Emrpesa'
      FieldName = 'cdempr'
    end
    object cdsCartFiddtcada: TDateField
      DisplayLabel = 'Dt.Cadastro'
      FieldName = 'dtcada'
    end
    object cdsCartFidnmcart: TStringField
      FieldName = 'nmcart'
      Required = True
      Size = 50
    end
    object cdsCartFidativo: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ativo'
      Size = 1
    end
    object cdsCartFidemail: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      Size = 50
    end
  end
  object cdsCheque: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChq'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 161
    Top = 8
    object cdsChequecdchq: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'd.'
      FieldName = 'cdchq'
      Required = True
    end
    object cdsChequecodBan: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'd. Banco'
      FieldName = 'codBan'
    end
    object cdsChequecodAge: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'codAge'
    end
    object cdsChequenumChq: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'N'#250'm. Cheque'
      FieldName = 'numChq'
    end
    object cdsChequenumCCo: TStringField
      Alignment = taCenter
      DisplayLabel = 'N'#250'm. Conta'
      FieldName = 'numCCo'
      Size = 15
    end
    object cdsChequenumC3: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C3'
      FieldName = 'numC3'
    end
    object cdsChequeemtChq: TStringField
      DisplayLabel = 'Emitente'
      FieldName = 'emtChq'
      Size = 100
    end
    object cdsChequevalor: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      DisplayFormat = '#.00'
      EditFormat = '#.00'
    end
    object cdsChequedtVenc: TDateField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      FieldName = 'dtVenc'
    end
    object cdsChequeobs: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'obs'
      Size = 255
    end
    object cdsChequestatus: TStringField
      Alignment = taCenter
      DisplayLabel = 'Status'
      FieldName = 'status'
      Size = 10
    end
    object cdsChequerecebi: TStringField
      Alignment = taCenter
      DisplayLabel = 'Recebi'
      FieldName = 'recebi'
      Size = 1
    end
    object cdsChequedtcada: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Cadastro'
      FieldName = 'dtcada'
    end
    object cdsChequecdempr: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'd. Empresa'
      FieldName = 'cdempr'
    end
    object cdsChequecmc7: TStringField
      Alignment = taCenter
      DisplayLabel = 'CMC7'
      FieldName = 'cmc7'
      Size = 50
    end
    object cdsChequecodcli: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'codcli'
    end
    object cdsChequeprocuraCLiente: TStringField
      DisplayLabel = 'Cliente'
      FieldKind = fkLookup
      FieldName = 'procuraCLiente'
      LookupDataSet = cdsCli
      LookupKeyFields = 'cdclie'
      LookupResultField = 'nome'
      KeyFields = 'codcli'
      Size = 30
      Lookup = True
    end
  end
  object cdsVende: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVende'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 112
    Top = 232
    object cdsVendecdvend: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'cdvend'
      Required = True
    end
    object cdsVendecdempr: TIntegerField
      DisplayLabel = 'C'#243'd.Empresa'
      FieldName = 'cdempr'
    end
    object cdsVendecdfunc: TIntegerField
      DisplayLabel = 'C'#243'd.Funcion'#225'rio'
      FieldName = 'cdfunc'
    end
    object cdsVendeprocuraFuncionario: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldKind = fkLookup
      FieldName = 'procuraFuncionario'
      LookupDataSet = cdsFunc
      LookupKeyFields = 'cdfunc'
      LookupResultField = 'nome'
      KeyFields = 'cdfunc'
      Size = 30
      Lookup = True
    end
    object cdsVendedtcada: TDateField
      DisplayLabel = 'Dt.Cadastro'
      FieldName = 'dtcada'
    end
    object cdsVendenome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 30
    end
    object cdsVendereccom: TStringField
      DisplayLabel = 'Recebe Comiss'#227'o?'
      FieldName = 'reccom'
      Size = 1
    end
    object cdsVendecomiss: TFloatField
      DisplayLabel = 'Comiss'#227'o(%)'
      FieldName = 'comiss'
      DisplayFormat = '#.00'
      EditFormat = '#.00'
    end
    object cdsVendevenvis: TStringField
      DisplayLabel = 'Venda a Vista'
      FieldName = 'venvis'
      Size = 1
    end
    object cdsVendevenpra: TStringField
      DisplayLabel = 'Venda a Prazo'
      FieldName = 'venpra'
      Size = 1
    end
    object cdsVendevencar: TStringField
      DisplayLabel = 'Venda a Cart'#227'o'
      FieldName = 'vencar'
      Size = 1
    end
    object cdsVendevenche: TStringField
      DisplayLabel = 'Venda a Cheque'
      FieldName = 'venche'
      Size = 1
    end
  end
  object cdsMcPro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMcPro'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 176
    Top = 232
    object cdsMcProcdmarc: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'cdmarc'
      Required = True
    end
    object cdsMcProcdempr: TIntegerField
      DisplayLabel = 'C'#243'd.Empresa'
      FieldName = 'cdempr'
    end
    object cdsMcProdtcada: TDateField
      DisplayLabel = 'Dt.Cadastro'
      FieldName = 'dtcada'
    end
    object cdsMcProdescri: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descri'
      Required = True
      Size = 30
    end
  end
  object cdsProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProd'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 232
    Top = 232
    object cdsProdcdprod: TIntegerField
      DisplayLabel = 'C'#243'd.'
      DisplayWidth = 10
      FieldName = 'cdprod'
      Required = True
    end
    object cdsProdcodfab: TStringField
      DisplayLabel = 'C'#243'd.Fabrica'
      DisplayWidth = 15
      FieldName = 'codfab'
      Size = 50
    end
    object cdsProdrefere: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      DisplayWidth = 15
      FieldName = 'refere'
      Size = 30
    end
    object cdsProdtipopr: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 10
      FieldName = 'tipopr'
      OnGetText = cdsProdtipoprGetText
      Size = 1
    end
    object cdsProddescri: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 50
      FieldName = 'descri'
      Required = True
      Size = 50
    end
    object cdsProdestatu: TFloatField
      DisplayLabel = 'Est.Atual'
      DisplayWidth = 10
      FieldName = 'estatu'
      DisplayFormat = '#.00'
    end
    object cdsProdpreven: TFloatField
      DisplayLabel = 'Pr.Venda'
      DisplayWidth = 10
      FieldName = 'preven'
      Required = True
      DisplayFormat = '#.00'
    end
    object cdsProdcdempr: TIntegerField
      DisplayLabel = 'C'#243'd.Empresa'
      DisplayWidth = 10
      FieldName = 'cdempr'
      Required = True
      Visible = False
    end
    object cdsProddtcada: TDateField
      DisplayLabel = 'Dt.Cadastro'
      DisplayWidth = 10
      FieldName = 'dtcada'
      Visible = False
    end
    object cdsProdativo: TStringField
      DisplayLabel = 'Ativo'
      DisplayWidth = 1
      FieldName = 'ativo'
      Visible = False
      Size = 1
    end
    object cdsProdcdmarc: TIntegerField
      DisplayLabel = 'C'#243'd.Marca'
      DisplayWidth = 10
      FieldName = 'cdmarc'
      Required = True
      Visible = False
    end
    object cdsProdprocuraMarca: TStringField
      DisplayLabel = 'Marca'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'procuraMarca'
      LookupDataSet = cdsMcPro
      LookupKeyFields = 'cdmarc'
      LookupResultField = 'descri'
      KeyFields = 'cdmarc'
      Visible = False
      Size = 30
      Lookup = True
    end
    object cdsProdcdgrup: TIntegerField
      DisplayLabel = 'C'#243'd.Grupo'
      DisplayWidth = 10
      FieldName = 'cdgrup'
      Required = True
      Visible = False
    end
    object cdsProdprocuraGrupo: TStringField
      DisplayLabel = 'Grupo'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'procuraGrupo'
      LookupDataSet = cdsGRPro
      LookupKeyFields = 'cdgrup'
      LookupResultField = 'descri'
      KeyFields = 'cdgrup'
      Visible = False
      Size = 30
      Lookup = True
    end
    object cdsProdtipcon: TStringField
      DisplayLabel = 'Tipo Controle'
      DisplayWidth = 1
      FieldName = 'tipcon'
      Visible = False
      Size = 1
    end
    object cdsProdunidad: TStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 15
      FieldName = 'unidad'
      Visible = False
      Size = 15
    end
    object cdsProdprecus: TFloatField
      DisplayLabel = 'Pr.Custo'
      DisplayWidth = 10
      FieldName = 'precus'
      Visible = False
      DisplayFormat = '#.00'
    end
    object cdsProdestmin: TFloatField
      DisplayLabel = 'Est.Minimo'
      DisplayWidth = 10
      FieldName = 'estmin'
      Visible = False
      DisplayFormat = '#.00'
    end
    object cdsProdcusrea: TFloatField
      DisplayLabel = 'Custo Real'
      DisplayWidth = 10
      FieldName = 'cusrea'
      Visible = False
      DisplayFormat = '#.00'
    end
    object cdsProdpesliq: TFloatField
      DisplayLabel = 'Peso Liquido'
      DisplayWidth = 10
      FieldName = 'pesliq'
      Visible = False
      DisplayFormat = '#.00'
    end
    object cdsProdpesbru: TFloatField
      DisplayLabel = 'Peso Bruto'
      DisplayWidth = 10
      FieldName = 'pesbru'
      Visible = False
      DisplayFormat = '#.00'
    end
    object cdsProdcodncm: TStringField
      DisplayLabel = 'C'#243'd.NCM'
      DisplayWidth = 10
      FieldName = 'codncm'
      Visible = False
      Size = 10
    end
    object cdsProdprzgar: TStringField
      DisplayLabel = 'Prazo Garantia'
      DisplayWidth = 30
      FieldName = 'przgar'
      Visible = False
      Size = 30
    end
    object cdsProdmarluc: TFloatField
      DisplayLabel = 'Margem de Lucro'
      DisplayWidth = 10
      FieldName = 'marluc'
      Visible = False
      DisplayFormat = '#.00'
    end
    object cdsProdcusmed: TFloatField
      DisplayLabel = 'Custo M'#233'dio'
      DisplayWidth = 10
      FieldName = 'cusmed'
      Visible = False
      DisplayFormat = '#.00'
    end
    object cdsProdultcom: TDateField
      DisplayLabel = #218'lt.Compra'
      DisplayWidth = 10
      FieldName = 'ultcom'
      Visible = False
    end
    object cdsProdultven: TDateField
      DisplayLabel = #218'lt.Venda'
      DisplayWidth = 10
      FieldName = 'ultven'
      Visible = False
    end
    object cdsProdclaori: TStringField
      DisplayLabel = 'Class. qto '#224#160' Origem'
      DisplayWidth = 1
      FieldName = 'claori'
      Visible = False
      OnGetText = cdsProdclaoriGetText
      Size = 1
    end
    object cdsProdsittri: TStringField
      DisplayLabel = 'Situa'#231#227'o Tribut'#225'ria'
      DisplayWidth = 2
      FieldName = 'sittri'
      Visible = False
      OnGetText = cdsProdsittriGetText
      Size = 2
    end
    object cdsProdicms: TFloatField
      DisplayLabel = 'ICMS(%)'
      DisplayWidth = 10
      FieldName = 'icms'
      Visible = False
    end
    object cdsProdipi: TFloatField
      DisplayLabel = 'IPI(%)'
      DisplayWidth = 10
      FieldName = 'ipi'
      Visible = False
    end
    object cdsProdclfisc: TStringField
      DisplayLabel = 'Classifica'#231#227'o Fiscal'
      DisplayWidth = 30
      FieldName = 'clfisc'
      Visible = False
      Size = 30
    end
    object cdsProdobserv: TStringField
      DisplayLabel = 'Obs.'
      DisplayWidth = 200
      FieldName = 'observ'
      Visible = False
      Size = 200
    end
  end
  object cdsHMPro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHMPro'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 48
    Top = 296
    object cdsHMProcdhist: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'cdhist'
      Required = True
    end
    object cdsHMProcdempr: TIntegerField
      DisplayLabel = 'C'#243'd.Empresa'
      FieldName = 'cdempr'
    end
    object cdsHMProCDPROD: TIntegerField
      DisplayLabel = 'C'#243'd.Produto'
      FieldName = 'CDPROD'
      Required = True
    end
    object cdsHMProhistor: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'histor'
      Required = True
      Size = 200
    end
    object cdsHMProquaalt: TFloatField
      DisplayLabel = 'Quant.Alterada'
      FieldName = 'quaalt'
      Required = True
    end
    object cdsHMProestatu: TFloatField
      DisplayLabel = 'Est.Atual'
      FieldName = 'estatu'
      Required = True
    end
  end
  object cdsNtOpe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNtOpe'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 112
    Top = 296
    object cdsNtOpecdntop: TStringField
      DisplayLabel = 'C'#243'd.'
      DisplayWidth = 10
      FieldName = 'cdntop'
      Required = True
      Size = 10
    end
    object cdsNtOpedescri: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 100
      FieldName = 'descri'
      Required = True
      Size = 100
    end
    object cdsNtOpebxesto: TStringField
      DisplayLabel = 'Altera Est.'
      DisplayWidth = 1
      FieldName = 'bxesto'
      Visible = False
      Size = 1
    end
    object cdsNtOpeefelan: TStringField
      DisplayLabel = 'Gera Lan'#231'.'
      DisplayWidth = 1
      FieldName = 'efelan'
      Visible = False
      Size = 1
    end
    object cdsNtOpeincipi: TStringField
      DisplayLabel = 'Inclui IPI'
      DisplayWidth = 1
      FieldName = 'incipi'
      Visible = False
      Size = 1
    end
  end
  object cdsPlanContas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPlanContas'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 176
    Top = 296
    object cdsPlanContascdcont: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'cdcont'
      Required = True
      Size = 13
    end
    object cdsPlanContascdcoma: TStringField
      DisplayLabel = 'C'#243'd.Conta M'#227'e'
      FieldName = 'cdcoma'
      Size = 13
    end
    object cdsPlanContasdescri: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descri'
      Required = True
      Size = 50
    end
    object cdsPlanContastipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tipo'
      Size = 2
    end
  end
  object cdsCtPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCtPag'
    RemoteServer = scHC
    OnReconcileError = cdsChequeReconcileError
    Left = 240
    Top = 296
    object cdsCtPagcodcon: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codcon'
      Required = True
    end
    object cdsCtPagcdempr: TIntegerField
      DisplayLabel = 'C'#243'd. Empresa'
      FieldName = 'cdempr'
      Required = True
    end
    object cdsCtPagtipcon: TStringField
      DisplayLabel = 'Tipo Conta'
      FieldName = 'tipcon'
      Required = True
      Size = 1
    end
    object cdsCtPagcdclfo: TIntegerField
      DisplayLabel = 'Fornecedor'
      FieldName = 'cdclfo'
      Required = True
    end
    object cdsCtPagprocuraFornecedor: TStringField
      DisplayLabel = 'Fornecedor'
      FieldKind = fkLookup
      FieldName = 'procuraFornecedor'
      LookupDataSet = cdsFor
      LookupKeyFields = 'cdforn'
      LookupResultField = 'nmfant'
      KeyFields = 'cdclfo'
      Size = 30
      Lookup = True
    end
    object cdsCtPagprocuraCliente: TStringField
      DisplayLabel = 'Cliente'
      FieldKind = fkLookup
      FieldName = 'procuraCliente'
      LookupDataSet = cdsCli
      LookupKeyFields = 'cdclie'
      LookupResultField = 'nome'
      KeyFields = 'cdclfo'
      Size = 30
      Lookup = True
    end
    object cdsCtPagtitulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'titulo'
      Required = True
      Size = 15
    end
    object cdsCtPagnotcon: TIntegerField
      DisplayLabel = 'C'#243'd. Nota'
      FieldName = 'notcon'
    end
    object cdsCtPagdtemit: TDateField
      DisplayLabel = 'Dt.Emiss'#227'o'
      FieldName = 'dtemit'
      Required = True
    end
    object cdsCtPagvlcont: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'vlcont'
    end
    object cdsCtPagdtvenc: TDateField
      DisplayLabel = 'Dt.Venc.'
      FieldName = 'dtvenc'
      Required = True
    end
    object cdsCtPagdtpaga: TDateField
      DisplayLabel = 'Dt.Pagam.'
      FieldName = 'dtpaga'
    end
    object cdsCtPagvalpag: TFloatField
      DisplayLabel = 'Valor Pago'
      FieldName = 'valpag'
    end
    object cdsCtPagjurpag: TFloatField
      DisplayLabel = 'Juros Pago'
      FieldName = 'jurpag'
    end
    object cdsCtPagobscon: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'obscon'
      Size = 200
    end
    object cdsCtPagvendco: TIntegerField
      DisplayLabel = 'C'#243'd. Vendedor'
      FieldName = 'vendco'
    end
    object cdsCtPagstacon: TStringField
      DisplayLabel = 'Status'
      FieldName = 'stacon'
      Required = True
      Size = 1
    end
    object cdsCtPaghistor: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'histor'
      Required = True
      Size = 255
    end
    object cdsCtPagcodusu: TIntegerField
      DisplayLabel = 'C'#243'd. Usu'#225'rio'
      FieldName = 'codusu'
    end
  end
  object cdsTrans: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTrans'
    RemoteServer = scHC
    Left = 56
    Top = 344
    object cdsTranscdtran: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'cdtran'
      Required = True
    end
    object cdsTranscdempr: TIntegerField
      DisplayLabel = 'C'#243'd. da Empresa'
      FieldName = 'cdempr'
    end
    object cdsTransnmfant: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'nmfant'
      Required = True
      Size = 50
    end
    object cdsTransdtcada: TDateField
      DisplayLabel = 'Dt.Cadastro'
      FieldName = 'dtcada'
    end
    object cdsTransrzsoci: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'rzsoci'
      Size = 50
    end
    object cdsTransendere: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'endere'
      Size = 50
    end
    object cdsTranstelefo: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefo'
      EditMask = '(00)0000-0000;0'
    end
    object cdsTransfax: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'fax'
      EditMask = '(00)0000-0000;0'
    end
    object cdsTransbairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Size = 30
    end
    object cdsTranscidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 30
    end
    object cdsTransnumero: TStringField
      DisplayLabel = 'Num.'
      FieldName = 'numero'
      Size = 6
    end
    object cdsTransuf: TStringField
      DisplayLabel = 'UF'
      FieldName = 'uf'
      Size = 2
    end
    object cdsTranscep: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Size = 10
    end
    object cdsTranscgc: TStringField
      DisplayLabel = 'CNPJ.'
      FieldName = 'cgc'
      EditMask = '99.999.999/9999-99;1;'
      Size = 14
    end
    object cdsTransinsest: TStringField
      DisplayLabel = 'Insc.Estadual'
      FieldName = 'insest'
    end
    object cdsTransrespon: TStringField
      DisplayLabel = 'Respons'#225'vel'
      FieldName = 'respon'
      Size = 50
    end
    object cdsTransemail: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      Size = 50
    end
    object cdsTranshomepa: TStringField
      DisplayLabel = 'Home Page'
      FieldName = 'homepa'
      Size = 50
    end
  end
end
