object dm: Tdm
  OldCreateOrder = False
  Left = 580
  Top = 135
  Height = 445
  Width = 448
  object cdsUsu: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsu'
    RemoteServer = scHC
    Left = 104
    Top = 64
    object cdsUsuuciduser: TIntegerField
      FieldName = 'uciduser'
      Required = True
    end
    object cdsUsuucusername: TStringField
      FieldName = 'ucusername'
      Size = 30
    end
    object cdsUsuuclogin: TStringField
      FieldName = 'uclogin'
      Size = 30
    end
    object cdsUsuucpassword: TStringField
      FieldName = 'ucpassword'
      Size = 250
    end
    object cdsUsuucpassexpired: TStringField
      FieldName = 'ucpassexpired'
      Size = 10
    end
    object cdsUsuucuserexpired: TIntegerField
      FieldName = 'ucuserexpired'
    end
    object cdsUsuucuserdayssun: TIntegerField
      FieldName = 'ucuserdayssun'
    end
    object cdsUsuucemail: TStringField
      FieldName = 'ucemail'
      Size = 150
    end
    object cdsUsuucprivileged: TIntegerField
      FieldName = 'ucprivileged'
    end
    object cdsUsuuctyperec: TStringField
      FieldName = 'uctyperec'
      Size = 1
    end
    object cdsUsuucprofile: TIntegerField
      FieldName = 'ucprofile'
    end
    object cdsUsuuckey: TStringField
      FieldName = 'uckey'
      Size = 250
    end
    object cdsUsuucinative: TIntegerField
      FieldName = 'ucinative'
    end
    object cdsUsucdempresa: TIntegerField
      FieldName = 'cdempresa'
    end
    object cdsUsucdfuncionario: TIntegerField
      FieldName = 'cdfuncionario'
    end
    object cdsUsutodasEmpresas: TStringField
      FieldName = 'todasEmpresas'
      Size = 1
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
    Left = 48
    Top = 64
  end
  object cdsFor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspForn'
    RemoteServer = scHC
    Left = 216
    Top = 64
    object cdsForcdforn: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'cdforn'
      Required = True
    end
    object cdsForcdempr: TIntegerField
      DisplayLabel = 'C'#243'd.Empr.'
      FieldName = 'cdempr'
      Required = True
    end
    object cdsForcdbanco: TIntegerField
      DisplayLabel = 'C'#243'd.Banco'
      FieldName = 'cdbanco'
    end
    object cdsForprocurabanco: TStringField
      DisplayLabel = 'Banco'
      FieldKind = fkLookup
      FieldName = 'procurabanco'
      LookupDataSet = cdsBanc
      LookupKeyFields = 'cdban'
      LookupResultField = 'descri'
      KeyFields = 'cdbanco'
      Size = 30
      Lookup = True
    end
    object cdsFordtcada: TDateField
      DisplayLabel = 'Dt.Cadastro'
      FieldName = 'dtcada'
    end
    object cdsForpesfis: TStringField
      DisplayLabel = 'Pes.Fis'
      FieldName = 'pesfis'
      Size = 1
    end
    object cdsFornmfant: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'nmfant'
      Required = True
      Size = 50
    end
    object cdsForrzsoci: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'rzsoci'
      Size = 50
    end
    object cdsForinsest: TStringField
      DisplayLabel = 'IE'
      FieldName = 'insest'
    end
    object cdsForcgc: TStringField
      DisplayLabel = 'CGC'
      FieldName = 'cgc'
      Size = 14
    end
    object cdsForcep: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'cep'
      EditMask = '00000-000;1'
      Size = 10
    end
    object cdsForendere: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'endere'
      Size = 50
    end
    object cdsForbairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Size = 30
    end
    object cdsForcidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 30
    end
    object cdsFornumero: TStringField
      DisplayLabel = 'N'#250'm.'
      FieldName = 'numero'
      Size = 6
    end
    object cdsForuf: TStringField
      DisplayLabel = 'UF'
      FieldName = 'uf'
      Size = 2
    end
    object cdsFortelefo: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefo'
      EditMask = '(00)0000-0000;0'
    end
    object cdsForfax: TStringField
      DisplayLabel = 'FAX'
      FieldName = 'fax'
      EditMask = '(00)0000-0000;0'
    end
    object cdsFordtfund: TDateField
      DisplayLabel = 'DT.Funda'#231#227'o'
      FieldName = 'dtfund'
    end
    object cdsForrmativ: TStringField
      DisplayLabel = 'Ramo Atividade'
      FieldName = 'rmativ'
      Size = 50
    end
    object cdsForagenci: TStringField
      DisplayLabel = 'Agencia'
      FieldName = 'agenci'
      Size = 15
    end
    object cdsForconta: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'conta'
      Size = 15
    end
    object cdsForemail: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      Size = 50
    end
    object cdsForhomepa: TStringField
      DisplayLabel = 'Home Page'
      FieldName = 'homepa'
      Size = 50
    end
    object cdsForobserv: TStringField
      DisplayLabel = 'Obs.'
      FieldName = 'observ'
      Size = 200
    end
    object cdsForrepre1: TStringField
      DisplayLabel = 'Representante 1'
      FieldName = 'repre1'
      Size = 50
    end
    object cdsForrpcon1: TStringField
      DisplayLabel = 'Contato Rep.1'
      FieldName = 'rpcon1'
      Size = 50
    end
    object cdsForrptel1: TStringField
      DisplayLabel = 'Telefone Rep.1'
      FieldName = 'rptel1'
      EditMask = '(00)0000-0000;0'
    end
    object cdsForrpfax1: TStringField
      DisplayLabel = 'Fax Rep.1'
      FieldName = 'rpfax1'
      EditMask = '(00)0000-0000;0'
    end
    object cdsForrpema1: TStringField
      DisplayLabel = 'E-mail Rep.1'
      FieldName = 'rpema1'
      Size = 50
    end
    object cdsForrepre2: TStringField
      DisplayLabel = 'Representante 2'
      FieldName = 'repre2'
      Size = 50
    end
    object cdsForrpcon2: TStringField
      DisplayLabel = 'Contato Rep.2'
      FieldName = 'rpcon2'
      Size = 50
    end
    object cdsForrptel2: TStringField
      DisplayLabel = 'Telefone Rep.2'
      FieldName = 'rptel2'
      EditMask = '(00)0000-0000;0'
    end
    object cdsForrpfax2: TStringField
      DisplayLabel = 'Fax Rep.2'
      FieldName = 'rpfax2'
      EditMask = '(00)0000-0000;0'
    end
    object cdsForrpema2: TStringField
      DisplayLabel = 'E-mail Rep.2'
      FieldName = 'rpema2'
      Size = 50
    end
    object cdsForrepre3: TStringField
      DisplayLabel = 'Representante 3'
      FieldName = 'repre3'
      Size = 50
    end
    object cdsForrpcon3: TStringField
      DisplayLabel = 'Contato Rep.3'
      FieldName = 'rpcon3'
      Size = 50
    end
    object cdsForrptel3: TStringField
      DisplayLabel = 'Telefone Rep.3'
      FieldName = 'rptel3'
      EditMask = '(00)0000-0000;0'
    end
    object cdsForrpfax3: TStringField
      DisplayLabel = 'Fax Rep.3'
      FieldName = 'rpfax3'
      EditMask = '(00)0000-0000;0'
    end
    object cdsForrpema3: TStringField
      DisplayLabel = 'E-mail Rep.3'
      FieldName = 'rpema3'
      Size = 50
    end
  end
  object cdsEmp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmp'
    RemoteServer = scHC
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
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProf'
    RemoteServer = scHC
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
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCli'
    RemoteServer = scHC
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
    object cdsClicdcrfi: TIntegerField
      DisplayLabel = 'C'#243'd.Cart'#227'o FIdelidade'
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
    Left = 160
    Top = 64
    object cdsBanccdban: TIntegerField
      DisplayLabel = 'Cod.'
      FieldName = 'cdban'
      Required = True
      DisplayFormat = '000'
      EditFormat = '000'
    end
    object cdsBancdtcada: TDateField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'dtcada'
    end
    object cdsBancdescri: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descri'
      Required = True
      Size = 30
    end
  end
  object cdsAutori: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepAut'
    RemoteServer = scHC
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
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCartFid'
    RemoteServer = scHC
    Left = 48
    Top = 232
    object cdsCartFidnrcart: TIntegerField
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
      DisplayLabel = 'Nome Cart'#227'o'
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
    Left = 176
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
end
