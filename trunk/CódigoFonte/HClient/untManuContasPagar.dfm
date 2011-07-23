inherited frmManuContasPagar: TfrmManuContasPagar
  Left = 355
  Top = 239
  Caption = 'Contas '#224' Pagar'
  ClientHeight = 336
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  inherited tbManutencao: TToolBar
    Top = 276
  end
  object pgContasPagar: TPageControl [1]
    Left = 0
    Top = 0
    Width = 534
    Height = 276
    ActivePage = tbPrincipal
    Align = alClient
    TabOrder = 1
    object tbPrincipal: TTabSheet
      Caption = 'Principal'
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 84
        Height = 14
        Caption = 'C'#243'digo.....:'
        FocusControl = dbeCod
      end
      object Label2: TLabel
        Left = 8
        Top = 70
        Width = 84
        Height = 14
        Caption = 'Fornecedor.:'
        FocusControl = dbeCodFor
      end
      object Label3: TLabel
        Left = 7
        Top = 97
        Width = 84
        Height = 14
        Caption = 'T'#237'tulo.....:'
        FocusControl = dbeTitulo
      end
      object Label4: TLabel
        Left = 6
        Top = 128
        Width = 84
        Height = 14
        Caption = 'C'#243'd. Nota..:'
        FocusControl = dbeCodNota
      end
      object Label5: TLabel
        Left = 286
        Top = 24
        Width = 105
        Height = 14
        Caption = 'Data Cadastro.:'
      end
      object Label6: TLabel
        Left = 315
        Top = 162
        Width = 56
        Height = 14
        Caption = 'Valor..:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 257
        Top = 126
        Width = 133
        Height = 14
        Caption = 'Data Vencimento...:'
      end
      object Label9: TLabel
        Left = 6
        Top = 177
        Width = 63
        Height = 14
        Caption = 'Hist'#243'rico'
      end
      object Bevel1: TBevel
        Left = 7
        Top = 54
        Width = 508
        Height = 3
      end
      object dbePesquisaFornecedor: TwwDBLookupComboDlg
        Left = 233
        Top = 68
        Width = 284
        Height = 22
        DisableThemes = False
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'nmfant'#9'50'#9'Nome Fantasia'#9'F'
          'rzsoci'#9'50'#9'Raz'#227'o Social'#9'F')
        LookupTable = dm.cdsFor
        LookupField = 'nmfant'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnExit = dbePesquisaFornecedorExit
      end
      object dbeCod: TDBEdit
        Left = 94
        Top = 22
        Width = 131
        Height = 20
        Color = 13425885
        Ctl3D = False
        DataField = 'codcon'
        DataSource = DataSource
        Enabled = False
        ParentCtl3D = False
        TabOrder = 1
      end
      object dbeCodFor: TDBEdit
        Left = 93
        Top = 68
        Width = 134
        Height = 20
        Ctl3D = False
        DataField = 'cdclfo'
        DataSource = DataSource
        Enabled = False
        ParentCtl3D = False
        TabOrder = 2
      end
      object dbeTitulo: TDBEdit
        Left = 93
        Top = 94
        Width = 134
        Height = 20
        Ctl3D = False
        DataField = 'titulo'
        DataSource = DataSource
        Enabled = False
        ParentCtl3D = False
        TabOrder = 3
      end
      object dbeCodNota: TDBEdit
        Left = 92
        Top = 123
        Width = 136
        Height = 22
        DataField = 'notcon'
        DataSource = DataSource
        TabOrder = 4
      end
      object dbdtedtDataAtual: TDBDateEdit
        Left = 393
        Top = 22
        Width = 123
        Height = 21
        DataField = 'dtemit'
        DataSource = DataSource
        NumGlyphs = 2
        TabOrder = 5
      end
      object dbePesquisaTitulo: TwwDBLookupComboDlg
        Left = 233
        Top = 94
        Width = 284
        Height = 22
        DisableThemes = False
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        LookupTable = dm.cdsPlanContas
        LookupField = 'descri'
        TabOrder = 6
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnExit = dbePesquisaTituloExit
      end
      object dbedtDataVenc: TDBDateEdit
        Left = 392
        Top = 123
        Width = 125
        Height = 21
        DataField = 'dtvenc'
        DataSource = DataSource
        NumGlyphs = 2
        TabOrder = 7
      end
      object dbmmHistorico: TDBMemo
        Left = 3
        Top = 193
        Width = 517
        Height = 52
        DataField = 'histor'
        DataSource = DataSource
        TabOrder = 8
      end
      object dbeValor: TRxDBCalcEdit
        Left = 373
        Top = 159
        Width = 144
        Height = 21
        DataField = 'vlcont'
        DataSource = DataSource
        DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
        NumGlyphs = 2
        TabOrder = 9
      end
    end
    object tbObservacao: TTabSheet
      Caption = 'Observa'#231#227'o'
      ImageIndex = 1
      object dbmmObs: TDBMemo
        Left = 2
        Top = 3
        Width = 521
        Height = 294
        DataField = 'obscon'
        DataSource = DataSource
        TabOrder = 0
      end
    end
  end
  inherited imManutencao: TImageList
    Left = 184
    Top = 8
  end
  inherited DataSource: TDataSource
    Left = 128
    Top = 0
  end
end
