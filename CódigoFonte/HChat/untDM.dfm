object dm: Tdm
  OldCreateOrder = False
  Left = 193
  Top = 125
  Height = 276
  Width = 320
  object scHC: TSocketConnection
    Connected = True
    ServerGUID = '{29C1310A-D963-42DA-99C6-C0570B487612}'
    ServerName = 'HS.RDM'
    Host = 'localhost'
    Left = 40
    Top = 8
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux'
    RemoteServer = scHC
    Left = 104
    Top = 8
  end
  object cdsUsu: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsu'
    RemoteServer = scHC
    Left = 160
    Top = 8
    object cdsUsuuclogin: TStringField
      DisplayLabel = 'Login'
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
    object cdsUsutodasEmpresas: TStringField
      DisplayLabel = 'TodasEmpresas'
      DisplayWidth = 10
      FieldName = 'todasEmpresas'
      Size = 1
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
    object cdsUsucdempresa: TIntegerField
      DisplayWidth = 10
      FieldName = 'cdempresa'
      Visible = False
    end
    object cdsUsucdfuncionario: TIntegerField
      DisplayWidth = 10
      FieldName = 'cdfuncionario'
      Visible = False
    end
  end
end
