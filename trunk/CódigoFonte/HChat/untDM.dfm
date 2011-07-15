object dm: Tdm
  OldCreateOrder = False
  Left = 192
  Top = 124
  Height = 276
  Width = 320
  object scHC: TSocketConnection
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
end
