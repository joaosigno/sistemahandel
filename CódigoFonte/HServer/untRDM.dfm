object RDM: TRDM
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  OnDestroy = RemoteDataModuleDestroy
  Left = 351
  Top = 129
  Height = 489
  Width = 651
  object con: TZConnection
    Protocol = 'postgresql-8'
    HostName = 'localhost'
    Database = 'handel'
    User = 'postgres'
    Password = '040908'
    Properties.Strings = (
      'codepage=latin1')
    TransactIsolationLevel = tiReadCommitted
    Connected = True
    Left = 40
    Top = 8
  end
  object dspUsu: TDataSetProvider
    DataSet = qryUsu
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poAllowCommandText]
    Left = 128
    Top = 120
  end
  object dspFun: TDataSetProvider
    DataSet = qryFun
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poAllowCommandText]
    Left = 128
    Top = 248
  end
  object dspBanco: TDataSetProvider
    DataSet = qryBanco
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poAllowCommandText]
    Left = 296
    Top = 122
  end
  object dspForn: TDataSetProvider
    DataSet = qryForn
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poAllowCommandText]
    Left = 296
    Top = 184
  end
  object dspVerificaAcessos: TDataSetProvider
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poAllowCommandText]
    Left = 125
    Top = 8
  end
  object dspPesq: TDataSetProvider
    DataSet = qryPesq
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poAllowCommandText]
    Left = 296
    Top = 64
  end
  object dspAux: TDataSetProvider
    DataSet = qryAux
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poAllowCommandText]
    Left = 128
    Top = 64
  end
  object qryEmp: TZReadOnlyQuery
    Connection = con
    SQL.Strings = (
      'select * from empre')
    Params = <>
    Left = 40
    Top = 192
    object qryEmpcdempr: TIntegerField
      FieldName = 'cdempr'
      Required = True
    end
    object qryEmpnmfant: TStringField
      FieldName = 'nmfant'
      Required = True
      Size = 50
    end
    object qryEmprzsoci: TStringField
      FieldName = 'rzsoci'
      Size = 50
    end
    object qryEmpcgc: TStringField
      FieldName = 'cgc'
      Size = 14
    end
    object qryEmpinsest: TStringField
      FieldName = 'insest'
    end
    object qryEmpendere: TStringField
      FieldName = 'endere'
      Size = 50
    end
    object qryEmpcomple: TStringField
      FieldName = 'comple'
      Size = 50
    end
    object qryEmpnumero: TStringField
      FieldName = 'numero'
      Size = 6
    end
    object qryEmpbairro: TStringField
      FieldName = 'bairro'
      Size = 30
    end
    object qryEmpcidade: TStringField
      FieldName = 'cidade'
      Size = 30
    end
    object qryEmpuf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object qryEmprespon: TStringField
      FieldName = 'respon'
      Size = 50
    end
    object qryEmptelefo: TStringField
      FieldName = 'telefo'
    end
    object qryEmpfax: TStringField
      FieldName = 'fax'
    end
    object qryEmpemail: TStringField
      FieldName = 'email'
      Size = 50
    end
    object qryEmptpempr: TStringField
      FieldName = 'tpempr'
      Size = 14
    end
    object qryEmpcdbanc: TIntegerField
      FieldName = 'cdbanc'
    end
    object qryEmpconta: TStringField
      FieldName = 'conta'
      Size = 15
    end
    object qryEmpdtcada: TDateField
      FieldName = 'dtcada'
    end
    object qryEmpagenci: TStringField
      FieldName = 'agenci'
      Size = 15
    end
    object qryEmpcep: TStringField
      FieldName = 'cep'
      Size = 10
    end
  end
  object dspEmp: TDataSetProvider
    DataSet = qryEmp
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poAllowCommandText]
    Left = 128
    Top = 192
  end
  object qryAux: TZReadOnlyQuery
    Connection = con
    Params = <>
    Left = 40
    Top = 64
  end
  object qryUsu: TZReadOnlyQuery
    Connection = con
    SQL.Strings = (
      'select * from uctabusers')
    Params = <>
    Left = 40
    Top = 120
    object qryUsuuciduser: TIntegerField
      FieldName = 'uciduser'
      Required = True
    end
    object qryUsuucusername: TStringField
      FieldName = 'ucusername'
      Size = 30
    end
    object qryUsuuclogin: TStringField
      FieldName = 'uclogin'
      Size = 30
    end
    object qryUsuucpassword: TStringField
      FieldName = 'ucpassword'
      Size = 250
    end
    object qryUsuucpassexpired: TStringField
      FieldName = 'ucpassexpired'
      Size = 10
    end
    object qryUsuucuserexpired: TIntegerField
      FieldName = 'ucuserexpired'
    end
    object qryUsuucuserdayssun: TIntegerField
      FieldName = 'ucuserdayssun'
    end
    object qryUsuucemail: TStringField
      FieldName = 'ucemail'
      Size = 150
    end
    object qryUsuucprivileged: TIntegerField
      FieldName = 'ucprivileged'
    end
    object qryUsuuctyperec: TStringField
      FieldName = 'uctyperec'
      Size = 1
    end
    object qryUsuucprofile: TIntegerField
      FieldName = 'ucprofile'
    end
    object qryUsuuckey: TStringField
      FieldName = 'uckey'
      Size = 250
    end
    object qryUsuucinative: TIntegerField
      FieldName = 'ucinative'
    end
    object qryUsucdempresa: TIntegerField
      FieldName = 'cdempresa'
    end
    object qryUsucdfuncionario: TIntegerField
      FieldName = 'cdfuncionario'
    end
    object qryUsutodasEmpresas: TStringField
      FieldName = 'todasEmpresas'
      Size = 1
    end
  end
  object qryFun: TZReadOnlyQuery
    Connection = con
    SQL.Strings = (
      'select * from funci')
    Params = <>
    Left = 40
    Top = 248
    object qryFuncdfunc: TIntegerField
      FieldName = 'cdfunc'
      Required = True
    end
    object qryFuncdempr: TIntegerField
      FieldName = 'cdempr'
      Required = True
    end
    object qryFuncdprof: TIntegerField
      FieldName = 'cdprof'
    end
    object qryFunnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object qryFunsexo: TStringField
      FieldName = 'sexo'
      Size = 1
    end
    object qryFunrg: TStringField
      FieldName = 'rg'
    end
    object qryFuncpf: TStringField
      FieldName = 'cpf'
      Size = 14
    end
    object qryFunendere: TStringField
      FieldName = 'endere'
      Size = 50
    end
    object qryFunbairro: TStringField
      FieldName = 'bairro'
      Size = 30
    end
    object qryFunnumero: TStringField
      FieldName = 'numero'
      Size = 6
    end
    object qryFuncidade: TStringField
      FieldName = 'cidade'
      Size = 30
    end
    object qryFunuf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object qryFuntelefo: TStringField
      FieldName = 'telefo'
    end
    object qryFundtnasc: TDateField
      FieldName = 'dtnasc'
    end
    object qryFunemail: TStringField
      FieldName = 'email'
      Size = 50
    end
    object qryFundtadmi: TDateField
      FieldName = 'dtadmi'
    end
    object qryFundtsaid: TDateField
      FieldName = 'dtsaid'
    end
    object qryFunchorar: TIntegerField
      FieldName = 'chorar'
    end
    object qryFunsalari: TFloatField
      FieldName = 'salari'
    end
    object qryFuncomisa: TFloatField
      FieldName = 'comisa'
    end
    object qryFunprferi: TDateField
      FieldName = 'prferi'
    end
    object qryFunobserv: TStringField
      FieldName = 'observ'
      Size = 200
    end
    object qryFundtcada: TDateField
      FieldName = 'dtcada'
    end
    object qryFuncartpr: TStringField
      FieldName = 'cartpr'
    end
    object qryFuncddepa: TIntegerField
      FieldName = 'cddepa'
    end
    object qryFunativo: TStringField
      FieldName = 'ativo'
      Size = 1
    end
    object qryFuncdbanc: TIntegerField
      FieldName = 'cdbanc'
    end
    object qryFunconta: TStringField
      FieldName = 'conta'
      Size = 15
    end
    object qryFunagenci: TStringField
      FieldName = 'agenci'
      Size = 15
    end
    object qryFuncep: TStringField
      FieldName = 'cep'
      Size = 10
    end
  end
  object qryPesq: TZReadOnlyQuery
    Connection = con
    Params = <>
    Left = 216
    Top = 64
  end
  object qryBanco: TZReadOnlyQuery
    Connection = con
    SQL.Strings = (
      'select * from banco'
      'order by descri')
    Params = <>
    Left = 216
    Top = 128
    object qryBancocdban: TIntegerField
      FieldName = 'cdban'
      Required = True
    end
    object qryBancodescri: TStringField
      FieldName = 'descri'
      Required = True
      Size = 30
    end
    object qryBancodtcada: TDateField
      FieldName = 'dtcada'
    end
  end
  object qryForn: TZReadOnlyQuery
    Connection = con
    SQL.Strings = (
      'select * from forne')
    Params = <>
    Left = 216
    Top = 184
    object qryForncdforn: TIntegerField
      FieldName = 'cdforn'
      Required = True
    end
    object qryForncdbanco: TIntegerField
      FieldName = 'cdbanco'
    end
    object qryForndtcada: TDateField
      FieldName = 'dtcada'
    end
    object qryFornpesfis: TStringField
      FieldName = 'pesfis'
      Size = 1
    end
    object qryFornnmfant: TStringField
      FieldName = 'nmfant'
      Required = True
      Size = 50
    end
    object qryFornrzsoci: TStringField
      FieldName = 'rzsoci'
      Size = 50
    end
    object qryForninsest: TStringField
      FieldName = 'insest'
    end
    object qryForncgc: TStringField
      FieldName = 'cgc'
      Size = 14
    end
    object qryFornendere: TStringField
      FieldName = 'endere'
      Size = 50
    end
    object qryFornbairro: TStringField
      FieldName = 'bairro'
      Size = 30
    end
    object qryForncidade: TStringField
      FieldName = 'cidade'
      Size = 30
    end
    object qryFornnumero: TStringField
      FieldName = 'numero'
      Size = 6
    end
    object qryFornuf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object qryForntelefo: TStringField
      FieldName = 'telefo'
    end
    object qryFornfax: TStringField
      FieldName = 'fax'
    end
    object qryForndtfund: TDateField
      FieldName = 'dtfund'
    end
    object qryFornrmativ: TStringField
      FieldName = 'rmativ'
      Size = 50
    end
    object qryFornagenci: TStringField
      FieldName = 'agenci'
      Size = 15
    end
    object qryFornconta: TStringField
      FieldName = 'conta'
      Size = 15
    end
    object qryFornemail: TStringField
      FieldName = 'email'
      Size = 50
    end
    object qryFornhomepa: TStringField
      FieldName = 'homepa'
      Size = 50
    end
    object qryFornobserv: TStringField
      FieldName = 'observ'
      Size = 200
    end
    object qryFornrepre1: TStringField
      FieldName = 'repre1'
      Size = 50
    end
    object qryFornrpcon1: TStringField
      FieldName = 'rpcon1'
      Size = 50
    end
    object qryFornrptel1: TStringField
      FieldName = 'rptel1'
    end
    object qryFornrpfax1: TStringField
      FieldName = 'rpfax1'
    end
    object qryFornrpema1: TStringField
      FieldName = 'rpema1'
      Size = 50
    end
    object qryFornrepre2: TStringField
      FieldName = 'repre2'
      Size = 50
    end
    object qryFornrpcon2: TStringField
      FieldName = 'rpcon2'
      Size = 50
    end
    object qryFornrptel2: TStringField
      FieldName = 'rptel2'
    end
    object qryFornrpfax2: TStringField
      FieldName = 'rpfax2'
    end
    object qryFornrpema2: TStringField
      FieldName = 'rpema2'
      Size = 50
    end
    object qryFornrepre3: TStringField
      FieldName = 'repre3'
      Size = 50
    end
    object qryFornrpcon3: TStringField
      FieldName = 'rpcon3'
      Size = 50
    end
    object qryFornrptel3: TStringField
      FieldName = 'rptel3'
    end
    object qryFornrpfax3: TStringField
      FieldName = 'rpfax3'
    end
    object qryFornrpema3: TStringField
      FieldName = 'rpema3'
      Size = 50
    end
    object qryForncdempr: TIntegerField
      FieldName = 'cdempr'
      Required = True
    end
    object qryForncep: TStringField
      FieldName = 'cep'
      Size = 10
    end
  end
  object dspCUsu: TDataSetProvider
    DataSet = qryCUsu
    Options = [poCascadeDeletes, poCascadeUpdates, poReadOnly, poAutoRefresh, poAllowCommandText]
    Left = 296
    Top = 8
  end
  object qryCUsu: TZQuery
    Connection = con
    SQL.Strings = (
      '')
    Params = <>
    Left = 216
    Top = 8
  end
  object qryGRPro: TZReadOnlyQuery
    Connection = con
    SQL.Strings = (
      'select * from grpro')
    Params = <>
    Left = 216
    Top = 248
    object qryGRProcdgrup: TIntegerField
      FieldName = 'cdgrup'
      Required = True
    end
    object qryGRProcdempr: TIntegerField
      FieldName = 'cdempr'
      Required = True
    end
    object qryGRProdescri: TStringField
      FieldName = 'descri'
      Required = True
      Size = 30
    end
    object qryGRProacdesc: TStringField
      FieldName = 'acdesc'
      Size = 1
    end
    object qryGRProvldesc: TFloatField
      FieldName = 'vldesc'
    end
    object qryGRProdtcada: TDateField
      FieldName = 'dtcada'
    end
  end
  object dspGRPro: TDataSetProvider
    DataSet = qryGRPro
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poAllowCommandText]
    Left = 296
    Top = 248
  end
  object qryProf: TZReadOnlyQuery
    Connection = con
    SQL.Strings = (
      'select * from profi'
      'order by descri')
    Params = <>
    Left = 40
    Top = 304
    object qryProfcdprof: TIntegerField
      FieldName = 'cdprof'
      Required = True
    end
    object qryProfcdempr: TIntegerField
      FieldName = 'cdempr'
      Required = True
    end
    object qryProfdescri: TStringField
      FieldName = 'descri'
      Required = True
      Size = 30
    end
    object qryProfdtcada: TDateField
      FieldName = 'dtcada'
    end
  end
  object dspProf: TDataSetProvider
    DataSet = qryProf
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poAllowCommandText]
    Left = 128
    Top = 304
  end
  object dspDepar: TDataSetProvider
    DataSet = qryDepa
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poAllowCommandText]
    Left = 296
    Top = 304
  end
  object qryDepa: TZReadOnlyQuery
    Connection = con
    SQL.Strings = (
      'select * from depar'
      'order by descri')
    Params = <>
    Left = 216
    Top = 304
    object qryDepacddepa: TIntegerField
      FieldName = 'cddepa'
      Required = True
    end
    object qryDepacdempr: TIntegerField
      FieldName = 'cdempr'
      Required = True
    end
    object qryDepadescri: TStringField
      FieldName = 'descri'
      Required = True
      Size = 30
    end
    object qryDepadtcada: TDateField
      FieldName = 'dtcada'
    end
  end
  object qryCli: TZReadOnlyQuery
    Connection = con
    SQL.Strings = (
      'select * from clien'
      '')
    Params = <>
    Left = 40
    Top = 360
    object qryClicdclie: TIntegerField
      FieldName = 'cdclie'
      Required = True
    end
    object qryClicdbanc: TIntegerField
      FieldName = 'cdbanc'
    end
    object qryClicdgrup: TIntegerField
      FieldName = 'cdgrup'
    end
    object qryClipesjur: TStringField
      FieldName = 'pesjur'
      Size = 1
    end
    object qryCliativo: TStringField
      FieldName = 'ativo'
      Size = 1
    end
    object qryClinome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object qryClisexo: TStringField
      FieldName = 'sexo'
      Size = 1
    end
    object qryClidtnasc: TDateField
      FieldName = 'dtnasc'
    end
    object qryClicldesd: TDateField
      FieldName = 'cldesd'
    end
    object qryClidtcada: TDateField
      FieldName = 'dtcada'
    end
    object qryClinatura: TStringField
      FieldName = 'natura'
      Size = 50
    end
    object qryClirg: TStringField
      FieldName = 'rg'
    end
    object qryClicpf: TStringField
      FieldName = 'cpf'
      Size = 14
    end
    object qryCliendere: TStringField
      FieldName = 'endere'
      Size = 50
    end
    object qryClinumero: TStringField
      FieldName = 'numero'
      Size = 6
    end
    object qryClicidade: TStringField
      FieldName = 'cidade'
      Size = 30
    end
    object qryClibairro: TStringField
      FieldName = 'bairro'
      Size = 30
    end
    object qryCliuf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object qryClitelefo: TStringField
      FieldName = 'telefo'
    end
    object qryClicelula: TStringField
      FieldName = 'celula'
    end
    object qryClifax: TStringField
      FieldName = 'fax'
    end
    object qryClinmpai: TStringField
      FieldName = 'nmpai'
      Size = 50
    end
    object qryClinmmae: TStringField
      FieldName = 'nmmae'
      Size = 50
    end
    object qryCliemptra: TStringField
      FieldName = 'emptra'
      Size = 50
    end
    object qryCliempcar: TStringField
      FieldName = 'empcar'
      Size = 50
    end
    object qryClicdprof: TIntegerField
      FieldName = 'cdprof'
    end
    object qryCliemptel: TStringField
      FieldName = 'emptel'
    end
    object qryCliempend: TStringField
      FieldName = 'empend'
      Size = 50
    end
    object qryCliempbai: TStringField
      FieldName = 'empbai'
      Size = 30
    end
    object qryCliempcid: TStringField
      FieldName = 'empcid'
      Size = 30
    end
    object qryCliempuf: TStringField
      FieldName = 'empuf'
      Size = 2
    end
    object qryClirfcom1: TStringField
      FieldName = 'rfcom1'
      Size = 50
    end
    object qryClirfcom2: TStringField
      FieldName = 'rfcom2'
      Size = 50
    end
    object qryClirfcom3: TStringField
      FieldName = 'rfcom3'
      Size = 50
    end
    object qryClirfpes1: TStringField
      FieldName = 'rfpes1'
      Size = 50
    end
    object qryClirfpes2: TStringField
      FieldName = 'rfpes2'
      Size = 50
    end
    object qryClirfpes3: TStringField
      FieldName = 'rfpes3'
      Size = 50
    end
    object qryCliemail: TStringField
      FieldName = 'email'
      Size = 50
    end
    object qryClihomepa: TStringField
      FieldName = 'homepa'
      Size = 50
    end
    object qryCliobserv: TStringField
      FieldName = 'observ'
      Size = 200
    end
    object qryClicdempr: TIntegerField
      FieldName = 'cdempr'
    end
    object qryCliconta: TStringField
      FieldName = 'conta'
      Size = 15
    end
    object qryCliagenci: TStringField
      FieldName = 'agenci'
      Size = 15
    end
    object qryCliestciv: TStringField
      FieldName = 'estciv'
      Size = 15
    end
    object qryCliconjug: TStringField
      FieldName = 'conjug'
      Size = 50
    end
    object qryClicjtele: TStringField
      FieldName = 'cjtele'
    end
    object qryClicep: TStringField
      FieldName = 'cep'
      Size = 10
    end
    object qryCliempcep: TStringField
      FieldName = 'empcep'
      Size = 10
    end
    object qryClilimite: TFloatField
      FieldName = 'limite'
    end
    object qryClicdcrfi: TIntegerField
      FieldName = 'cdcrfi'
    end
  end
  object dspCli: TDataSetProvider
    DataSet = qryCli
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poAllowCommandText]
    Left = 128
    Top = 360
  end
  object qryGRCli: TZReadOnlyQuery
    Connection = con
    SQL.Strings = (
      'select * from grcli'
      'order by descri')
    Params = <>
    Left = 216
    Top = 360
    object qryGRClicdgrup: TIntegerField
      FieldName = 'cdgrup'
      Required = True
    end
    object qryGRClidescri: TStringField
      FieldName = 'descri'
      Required = True
      Size = 50
    end
    object qryGRClicdempr: TIntegerField
      FieldName = 'cdempr'
    end
    object qryGRClidtcada: TDateField
      FieldName = 'dtcada'
    end
  end
  object dspGRCli: TDataSetProvider
    DataSet = qryGRCli
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poAllowCommandText]
    Left = 304
    Top = 360
  end
  object dspDepAut: TDataSetProvider
    DataSet = qryDepAut
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poAllowCommandText]
    Left = 448
    Top = 8
  end
  object qryDepAut: TZReadOnlyQuery
    Connection = con
    SQL.Strings = (
      'select * from DEPAUT'
      'order by NOME')
    Params = <>
    Left = 360
    Top = 8
    object qryDepAutcdclien: TIntegerField
      FieldName = 'cdclien'
    end
    object qryDepAutdepend: TStringField
      FieldName = 'depend'
      Size = 1
    end
    object qryDepAutnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object qryDepAutdocume: TStringField
      FieldName = 'docume'
    end
    object qryDepAutdtnasc: TDateField
      FieldName = 'dtnasc'
    end
    object qryDepAuttelefo: TStringField
      FieldName = 'telefo'
    end
    object qryDepAutcompra: TStringField
      FieldName = 'compra'
      Size = 1
    end
    object qryDepAutdtcada: TDateField
      FieldName = 'dtcada'
    end
    object qryDepAutcdempr: TIntegerField
      FieldName = 'cdempr'
    end
  end
  object qryCartFid: TZReadOnlyQuery
    Connection = con
    SQL.Strings = (
      'select * from crfid'
      'order by nmcart')
    Params = <>
    Left = 360
    Top = 64
    object qryCartFiddtcada: TDateField
      FieldName = 'dtcada'
    end
    object qryCartFidnmcart: TStringField
      FieldName = 'nmcart'
      Required = True
      Size = 50
    end
    object qryCartFidativo: TStringField
      FieldName = 'ativo'
      Size = 1
    end
    object qryCartFidemail: TStringField
      FieldName = 'email'
      Size = 50
    end
    object qryCartFidnrcart: TIntegerField
      FieldName = 'nrcart'
      Required = True
    end
  end
  object dspCartFid: TDataSetProvider
    DataSet = qryCartFid
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poAllowCommandText]
    Left = 448
    Top = 64
  end
end
