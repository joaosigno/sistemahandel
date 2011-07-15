object rds: Trds
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  Left = 678
  Top = 177
  Height = 290
  Width = 353
  object con: TZConnection
    Protocol = 'postgresql-8'
    HostName = 'localhost'
    Database = 'handel'
    User = 'postgres'
    Password = '040908'
    Left = 24
    Top = 8
  end
  object qryUsuario: TZQuery
    Connection = con
    SQL.Strings = (
      'select * from usuario')
    Params = <>
    Left = 24
    Top = 64
    object qryUsuariocdusuario: TIntegerField
      FieldName = 'cdusuario'
      Required = True
    end
    object qryUsuariocdempresa: TIntegerField
      FieldName = 'cdempresa'
    end
    object qryUsuariocdfuncionario: TIntegerField
      FieldName = 'cdfuncionario'
    end
    object qryUsuariousunome: TStringField
      FieldName = 'usunome'
      Size = 30
    end
    object qryUsuariooperaqualquerempresa: TStringField
      FieldName = 'operaqualquerempresa'
      Size = 1
    end
    object qryUsuarioadministrador: TStringField
      FieldName = 'administrador'
      Size = 1
    end
    object qryUsuariosenha: TStringField
      FieldName = 'senha'
      Size = 30
    end
  end
  object dspUsuario: TDataSetProvider
    DataSet = qryUsuario
    Left = 112
    Top = 64
  end
  object qryEmpresa: TZQuery
    Connection = con
    SQL.Strings = (
      'select * from empresa')
    Params = <>
    Left = 24
    Top = 128
    object qryEmpresacdempresa: TIntegerField
      FieldName = 'cdempresa'
      Required = True
    end
    object qryEmpresanomefantasia: TStringField
      FieldName = 'nomefantasia'
      Size = 50
    end
    object qryEmpresarazaosocial: TStringField
      FieldName = 'razaosocial'
      Size = 50
    end
    object qryEmpresacgc: TStringField
      FieldName = 'cgc'
      Size = 18
    end
    object qryEmpresainscricaoestudal: TStringField
      FieldName = 'inscricaoestudal'
    end
    object qryEmpresaendereco: TStringField
      FieldName = 'endereco'
      Size = 50
    end
    object qryEmpresacomplemento: TStringField
      FieldName = 'complemento'
      Size = 50
    end
    object qryEmpresanumero: TStringField
      FieldName = 'numero'
      Size = 6
    end
    object qryEmpresabairro: TStringField
      FieldName = 'bairro'
      Size = 30
    end
    object qryEmpresacep: TStringField
      FieldName = 'cep'
      Size = 10
    end
    object qryEmpresacidade: TStringField
      FieldName = 'cidade'
      Size = 50
    end
    object qryEmpresauf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object qryEmpresaresponsavel: TStringField
      FieldName = 'responsavel'
      Size = 50
    end
    object qryEmpresatelefone: TStringField
      FieldName = 'telefone'
    end
    object qryEmpresafax: TStringField
      FieldName = 'fax'
    end
    object qryEmpresaemail: TStringField
      FieldName = 'email'
      Size = 50
    end
  end
  object dspEmpresa: TDataSetProvider
    DataSet = qryEmpresa
    Left = 112
    Top = 128
  end
  object dspFuncionario: TDataSetProvider
    DataSet = qryFuncionario
    Left = 112
    Top = 192
  end
  object dspBanco: TDataSetProvider
    DataSet = qryBanco
    Left = 280
    Top = 66
  end
  object dspFornecedor: TDataSetProvider
    DataSet = qryFornecedor
    Left = 280
    Top = 128
  end
  object qryBanco: TZQuery
    Connection = con
    SQL.Strings = (
      'select * from banco')
    Params = <>
    Left = 202
    Top = 64
  end
  object qryFornecedor: TZQuery
    Connection = con
    SQL.Strings = (
      'select * from fornecedor')
    Params = <>
    Left = 200
    Top = 128
    object qryFornecedorcdfor: TIntegerField
      FieldName = 'cdfor'
      Required = True
    end
    object qryFornecedorcdemp: TIntegerField
      FieldName = 'cdemp'
    end
    object qryFornecedorcdbancario: TIntegerField
      FieldName = 'cdbancario'
    end
    object qryFornecedordatacadastro: TDateField
      FieldName = 'datacadastro'
    end
    object qryFornecedorpessoafisica: TStringField
      FieldName = 'pessoafisica'
      Size = 1
    end
    object qryFornecedornomefantasia: TStringField
      FieldName = 'nomefantasia'
      Size = 50
    end
    object qryFornecedorrazaosocial: TStringField
      FieldName = 'razaosocial'
      Size = 50
    end
    object qryFornecedorinscricaoestadual: TStringField
      FieldName = 'inscricaoestadual'
    end
    object qryFornecedorcgc: TStringField
      FieldName = 'cgc'
    end
    object qryFornecedorcep: TStringField
      FieldName = 'cep'
      Size = 10
    end
    object qryFornecedorendereco: TStringField
      FieldName = 'endereco'
      Size = 50
    end
    object qryFornecedorbairro: TStringField
      FieldName = 'bairro'
      Size = 30
    end
    object qryFornecedorcidade: TStringField
      FieldName = 'cidade'
      Size = 50
    end
    object qryFornecedornumero: TStringField
      FieldName = 'numero'
      Size = 6
    end
    object qryFornecedoruf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object qryFornecedortelefone: TStringField
      FieldName = 'telefone'
    end
    object qryFornecedorfax: TStringField
      FieldName = 'fax'
    end
    object qryFornecedordatafundacao: TDateField
      FieldName = 'datafundacao'
    end
    object qryFornecedorramoatividade: TStringField
      FieldName = 'ramoatividade'
      Size = 50
    end
    object qryFornecedoragencia: TStringField
      FieldName = 'agencia'
      Size = 15
    end
    object qryFornecedorcontacorrente: TStringField
      FieldName = 'contacorrente'
      Size = 15
    end
    object qryFornecedoremail: TStringField
      FieldName = 'email'
      Size = 50
    end
    object qryFornecedorhomepage: TStringField
      FieldName = 'homepage'
      Size = 100
    end
    object qryFornecedorobservacao: TStringField
      FieldName = 'observacao'
      Size = 150
    end
    object qryFornecedorrepresentante1: TStringField
      FieldName = 'representante1'
      Size = 50
    end
    object qryFornecedorrepcontato1: TStringField
      FieldName = 'repcontato1'
      Size = 50
    end
    object qryFornecedorreptelefone1: TStringField
      FieldName = 'reptelefone1'
    end
    object qryFornecedorrepfax1: TStringField
      FieldName = 'repfax1'
      Size = 15
    end
    object qryFornecedorrepemail1: TStringField
      FieldName = 'repemail1'
      Size = 50
    end
    object qryFornecedorrepresentante2: TStringField
      FieldName = 'representante2'
      Size = 50
    end
    object qryFornecedorrepcontato2: TStringField
      FieldName = 'repcontato2'
      Size = 50
    end
    object qryFornecedorreptelefone2: TStringField
      FieldName = 'reptelefone2'
    end
    object qryFornecedorrepfax2: TStringField
      FieldName = 'repfax2'
      Size = 15
    end
    object qryFornecedorrepemail2: TStringField
      FieldName = 'repemail2'
      Size = 50
    end
    object qryFornecedorrepresentante3: TStringField
      FieldName = 'representante3'
      Size = 50
    end
    object qryFornecedorrepcontato3: TStringField
      FieldName = 'repcontato3'
      Size = 50
    end
    object qryFornecedorreptelefone3: TStringField
      FieldName = 'reptelefone3'
    end
    object qryFornecedorrepfax3: TStringField
      FieldName = 'repfax3'
      Size = 15
    end
    object qryFornecedorrepemail3: TStringField
      FieldName = 'repemail3'
      Size = 50
    end
  end
  object qryFuncionario: TZQuery
    Connection = con
    SQL.Strings = (
      'select * from funcionario')
    Params = <>
    Left = 24
    Top = 192
    object qryFuncionariocdfuncionario: TIntegerField
      FieldName = 'cdfuncionario'
      Required = True
    end
    object qryFuncionariocdempresa: TIntegerField
      FieldName = 'cdempresa'
    end
    object qryFuncionarioprofissao: TIntegerField
      FieldName = 'profissao'
    end
    object qryFuncionariosexo: TStringField
      FieldName = 'sexo'
      Size = 1
    end
    object qryFuncionarionome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object qryFuncionariorg: TStringField
      FieldName = 'rg'
      Size = 15
    end
    object qryFuncionariocpf: TStringField
      FieldName = 'cpf'
      Size = 14
    end
    object qryFuncionariocep: TStringField
      FieldName = 'cep'
      Size = 10
    end
    object qryFuncionarioendereco: TStringField
      FieldName = 'endereco'
      Size = 50
    end
    object qryFuncionariobairro: TStringField
      FieldName = 'bairro'
      Size = 30
    end
    object qryFuncionariocidade: TStringField
      FieldName = 'cidade'
      Size = 50
    end
    object qryFuncionariouf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object qryFuncionariotelefone: TStringField
      FieldName = 'telefone'
    end
    object qryFuncionariodatanascimento: TDateField
      FieldName = 'datanascimento'
    end
    object qryFuncionarioemail: TStringField
      FieldName = 'email'
      Size = 50
    end
    object qryFuncionariodataadmissao: TDateField
      FieldName = 'dataadmissao'
    end
    object qryFuncionariodatasaida: TDateField
      FieldName = 'datasaida'
    end
    object qryFuncionariocargahoraria: TIntegerField
      FieldName = 'cargahoraria'
    end
    object qryFuncionariosenhaponto: TStringField
      FieldName = 'senhaponto'
      Size = 30
    end
    object qryFuncionariosalariofixo: TFloatField
      FieldName = 'salariofixo'
    end
    object qryFuncionariocomissao: TFloatField
      FieldName = 'comissao'
    end
    object qryFuncionarioprevisaoferias: TDateField
      FieldName = 'previsaoferias'
    end
    object qryFuncionarioobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 400
    end
  end
  object tmHS: TTimer
    Enabled = False
    OnTimer = tmHSTimer
    Left = 280
    Top = 8
  end
  object qryVerificaAcessos: TZQuery
    Connection = con
    SQL.Strings = (
      'select u.cdusuario,'
      '          u.usunome,'
      '          e.nomefantasia'
      ' from usuario u'
      '          left join empresa e on u.cdempresa=e.cdempresa'
      'where u.cdempresa=e.cdempresa and u.ativo='#39'S'#39)
    Params = <>
    Left = 112
    Top = 8
    object qryVerificaAcessoscdusuario: TIntegerField
      DisplayLabel = 'Cod.'
      FieldName = 'cdusuario'
      Required = True
    end
    object qryVerificaAcessosusunome: TStringField
      DisplayLabel = 'Usuario'
      FieldName = 'usunome'
      Size = 30
    end
    object qryVerificaAcessosnomefantasia: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'nomefantasia'
      Size = 50
    end
  end
  object dspVerificaAcessos: TDataSetProvider
    DataSet = qryVerificaAcessos
    Left = 208
    Top = 8
  end
end
