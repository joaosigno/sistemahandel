inherited frmManuCheques: TfrmManuCheques
  Left = 561
  Top = 225
  Caption = 'Manuten'#231#227'o de Chques'
  ClientHeight = 401
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  inherited tbManutencao: TToolBar
    Top = 341
  end
  object pgCheques: TPageControl [1]
    Left = 0
    Top = 0
    Width = 534
    Height = 341
    ActivePage = tsCheques
    Align = alClient
    TabOrder = 1
    object tsCheques: TTabSheet
      Caption = 'Cad. Cheques'
      object Label1: TLabel
        Left = 4
        Top = 19
        Width = 77
        Height = 14
        Caption = 'C'#243'd.......:'
        FocusControl = dbeCod
      end
      object Label2: TLabel
        Left = 2
        Top = 99
        Width = 77
        Height = 14
        Caption = 'C'#243'd.Banco.:'
        FocusControl = dbeNumBanco
      end
      object Label3: TLabel
        Left = 173
        Top = 100
        Width = 56
        Height = 14
        Caption = 'Ag'#234'ncia:'
        FocusControl = dbeAgencia
      end
      object Label4: TLabel
        Left = 340
        Top = 101
        Width = 84
        Height = 14
        Caption = 'N'#250'm. Cheque:'
        FocusControl = dbeNumChq
      end
      object Label5: TLabel
        Left = 2
        Top = 125
        Width = 77
        Height = 14
        Caption = 'N'#250'm. Conta:'
        FocusControl = dbeNumConta
      end
      object Label6: TLabel
        Left = 205
        Top = 127
        Width = 21
        Height = 14
        Caption = 'C3:'
        FocusControl = dbeC3
      end
      object Label7: TLabel
        Left = 1
        Top = 156
        Width = 77
        Height = 14
        Caption = 'Emitente..:'
        FocusControl = dbeEmitente
      end
      object Label8: TLabel
        Left = 272
        Top = 128
        Width = 70
        Height = 14
        Caption = 'Valor....:'
        FocusControl = dbeValor
      end
      object Label9: TLabel
        Left = 313
        Top = 155
        Width = 91
        Height = 14
        Caption = 'Vencimento..:'
      end
      object Label11: TLabel
        Left = 1
        Top = 237
        Width = 77
        Height = 14
        Caption = 'Status....:'
      end
      object Label13: TLabel
        Left = 170
        Top = 21
        Width = 98
        Height = 14
        Caption = 'Data Cadastro:'
      end
      object Label15: TLabel
        Left = 3
        Top = 48
        Width = 77
        Height = 14
        Caption = 'CMC7......:'
        FocusControl = dbeCMC7
      end
      object Label16: TLabel
        Left = 1
        Top = 206
        Width = 77
        Height = 14
        Caption = 'Cliente...:'
      end
      object Bevel1: TBevel
        Left = 2
        Top = 78
        Width = 521
        Height = 3
      end
      object Bevel2: TBevel
        Left = 2
        Top = 191
        Width = 521
        Height = 3
      end
      object dbeCod: TDBEdit
        Left = 82
        Top = 17
        Width = 83
        Height = 20
        Color = 13425885
        Ctl3D = False
        DataField = 'cdchq'
        DataSource = DataSource
        Enabled = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object dbeNumBanco: TDBEdit
        Left = 80
        Top = 96
        Width = 86
        Height = 20
        Ctl3D = False
        DataField = 'codBan'
        DataSource = DataSource
        Enabled = False
        ParentCtl3D = False
        TabOrder = 1
      end
      object dbeAgencia: TDBEdit
        Left = 231
        Top = 97
        Width = 103
        Height = 20
        Ctl3D = False
        DataField = 'codAge'
        DataSource = DataSource
        Enabled = False
        ParentCtl3D = False
        TabOrder = 2
      end
      object dbeNumChq: TDBEdit
        Left = 424
        Top = 96
        Width = 96
        Height = 20
        Ctl3D = False
        DataField = 'numChq'
        DataSource = DataSource
        Enabled = False
        ParentCtl3D = False
        TabOrder = 3
      end
      object dbeNumConta: TDBEdit
        Left = 80
        Top = 124
        Width = 117
        Height = 20
        Ctl3D = False
        DataField = 'numCCo'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 4
      end
      object dbeC3: TDBEdit
        Left = 231
        Top = 124
        Width = 33
        Height = 20
        Ctl3D = False
        DataField = 'numC3'
        DataSource = DataSource
        Enabled = False
        ParentCtl3D = False
        TabOrder = 5
      end
      object dbeEmitente: TDBEdit
        Left = 80
        Top = 153
        Width = 225
        Height = 22
        CharCase = ecUpperCase
        DataField = 'emtChq'
        DataSource = DataSource
        TabOrder = 6
        OnExit = dbeEmitenteExit
      end
      object dbeValor: TDBEdit
        Left = 344
        Top = 123
        Width = 175
        Height = 22
        DataField = 'valor'
        DataSource = DataSource
        TabOrder = 7
        OnExit = dbeValorExit
      end
      object dbeCMC7: TDBEdit
        Left = 81
        Top = 46
        Width = 440
        Height = 22
        DataField = 'cmc7'
        DataSource = DataSource
        TabOrder = 8
        OnExit = dbeCMC7Exit
        OnKeyPress = dbeCMC7KeyPress
      end
      object ddbcbStatus: TDBComboBox
        Left = 80
        Top = 235
        Width = 193
        Height = 22
        DataField = 'status'
        DataSource = DataSource
        ItemHeight = 14
        Items.Strings = (
          'BAIXADO'
          'DEVOLVIDO'
          'PENDENTE')
        TabOrder = 9
      end
      object dbDtVencimento: TDBDateEdit
        Left = 407
        Top = 151
        Width = 113
        Height = 21
        DataField = 'dtVenc'
        DataSource = DataSource
        NumGlyphs = 2
        TabOrder = 10
      end
      object dbcbEmitido: TDBCheckBox
        Left = 382
        Top = 20
        Width = 142
        Height = 17
        Caption = 'Emitido pela Emp.'
        Ctl3D = True
        DataField = 'recebi'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 11
        ValueChecked = 'N'
        ValueUnchecked = 'S'
        OnClick = dbcbEmitidoClick
      end
      object dbdtCadastro: TDBDateEdit
        Left = 274
        Top = 18
        Width = 103
        Height = 21
        DataField = 'dtcada'
        DataSource = DataSource
        NumGlyphs = 2
        TabOrder = 12
      end
      object dblkpcbCliente: TDBLookupComboBox
        Left = 80
        Top = 204
        Width = 438
        Height = 22
        DataField = 'codcli'
        DataSource = DataSource
        KeyField = 'cdclie'
        ListField = 'nome'
        ListSource = DataSourceAux
        TabOrder = 13
        OnExit = dblkpcbClienteExit
      end
    end
    object tsChqObs: TTabSheet
      Caption = 'Observa'#231#227'o'
      ImageIndex = 1
      object DBMemo1: TDBMemo
        Left = 2
        Top = 4
        Width = 520
        Height = 304
        DataField = 'obs'
        DataSource = DataSource
        TabOrder = 0
      end
    end
  end
  inherited imManutencao: TImageList
    Left = 256
    Top = 0
  end
  inherited DataSource: TDataSource
    DataSet = dm.cdsCheque
    Left = 168
    Top = 0
  end
  object DataSourceAux: TDataSource
    DataSet = dm.cdsCli
    Left = 212
    Top = 1
  end
end
