inherited frmManuGrades: TfrmManuGrades
  Left = 411
  Top = 117
  Caption = 'Manuten'#231#227'o de Grades'
  ClientHeight = 459
  ClientWidth = 495
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  inherited tbManutencao: TToolBar
    Top = 399
    Width = 495
    inherited ToolButton1: TToolButton
      Width = 17
    end
    inherited tbPrimeiro: TToolButton
      Left = 17
    end
    inherited tbAnterior: TToolButton
      Left = 74
    end
    inherited tbProximo: TToolButton
      Left = 131
    end
    inherited tbUltimo: TToolButton
      Left = 188
    end
    inherited tbSepardor: TToolButton
      Left = 245
    end
    inherited tbAdicionar: TToolButton
      Left = 253
    end
    inherited tbExcluir: TToolButton
      Left = 310
    end
    inherited tbGravar: TToolButton
      Left = 367
    end
    inherited tbCancelar: TToolButton
      Left = 424
    end
  end
  object pgGrade: TPageControl [1]
    Left = 0
    Top = 0
    Width = 495
    Height = 399
    ActivePage = tsinicio
    Align = alClient
    TabOrder = 1
    object tsinicio: TTabSheet
      Caption = 'In'#237'cio'
      object Label1: TLabel
        Left = 0
        Top = 12
        Width = 77
        Height = 14
        Caption = 'C'#243'digo....:'
      end
      object Label2: TLabel
        Left = 0
        Top = 32
        Width = 77
        Height = 14
        Caption = 'Descri'#231#227'o.:'
      end
      object Label5: TLabel
        Left = 6
        Top = 56
        Width = 70
        Height = 14
        Caption = 'Desc.Linha'
        FocusControl = dbeDescLinha
      end
      object Label3: TLabel
        Left = 296
        Top = 56
        Width = 84
        Height = 14
        Caption = 'Descr.Coluna'
        FocusControl = dbeDescCol
      end
      object Label4: TLabel
        Left = 271
        Top = 11
        Width = 91
        Height = 14
        Caption = 'Dt.Cadastro.:'
      end
      object dbgrd_Linha: TDBGrid
        Left = 7
        Top = 96
        Width = 179
        Height = 110
        Hint = '|Linhas da grade '
        Ctl3D = False
        DataSource = dsGradeLinha
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        PopupMenu = pm_linha
        ShowHint = True
        TabOrder = 4
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -12
        TitleFont.Name = 'Courier New'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrd_LinhaDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'descri'
            Width = 140
            Visible = True
          end>
      end
      object dbgrd_Coluna: TDBGrid
        Left = 298
        Top = 98
        Width = 179
        Height = 110
        Hint = '|Colunas da grade'
        Ctl3D = False
        DataSource = dsGradeColuna
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        PopupMenu = pm_coluna
        ShowHint = True
        TabOrder = 6
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -12
        TitleFont.Name = 'Courier New'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrd_ColunaDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'descri'
            Width = 140
            Visible = True
          end>
      end
      object AdvancedPanel4: TPanel
        Left = 7
        Top = 212
        Width = 470
        Height = 153
        ParentBackground = False
        TabOrder = 7
        object Shape1: TShape
          Left = 70
          Top = 16
          Width = 2
          Height = 53
        end
        object Shape2: TShape
          Left = -32
          Top = 41
          Width = 123
          Height = 2
        end
        object lbl_linha: TLabel
          Left = 31
          Top = 46
          Width = 35
          Height = 14
          Alignment = taRightJustify
          Caption = 'Linha'
          Transparent = True
        end
        object lbl_coluna: TLabel
          Left = 75
          Top = 23
          Width = 42
          Height = 14
          Caption = 'Coluna'
          Transparent = True
        end
        object AdvancedPanel5: TPanel
          Left = 1
          Top = 1
          Width = 468
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          Color = clSilver
          ParentBackground = False
          TabOrder = 0
          object Label7: TLabel
            Left = 5
            Top = 4
            Width = 128
            Height = 14
            Caption = 'Pr'#233'-visualiza'#231#227'o da Grade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
        end
        object strgrd_grade: TStringGrid
          Left = 70
          Top = 40
          Width = 393
          Height = 109
          Hint = '|Visualiza'#231#227'o das linhas e colunas da grade'
          ColCount = 6
          DefaultColWidth = 63
          DefaultRowHeight = 20
          FixedCols = 0
          FixedRows = 0
          ParentShowHint = False
          ScrollBars = ssNone
          ShowHint = True
          TabOrder = 1
        end
      end
      object dbeCod: TDBEdit
        Left = 78
        Top = 10
        Width = 89
        Height = 20
        CharCase = ecUpperCase
        Color = 13425885
        Ctl3D = False
        DataField = 'cdgrad'
        DataSource = DataSource
        Enabled = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object dbeDescri: TDBEdit
        Left = 77
        Top = 32
        Width = 396
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'descri'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 2
      end
      object pesquisa: TwwDBLookupComboDlg
        Left = 452
        Top = 31
        Width = 22
        Height = 22
        Ctl3D = True
        DisableThemes = False
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'cdgrad'#9'10'#9'C'#243'd.'#9'F'#9
          'descri'#9'30'#9'Descri'#231#227'o'#9'F'
          'deslin'#9'30'#9'Desc.Linha'#9'F'
          'descol'#9'30'#9'Descr.Coluna'#9'F')
        ParentCtl3D = False
        TabOrder = 8
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = pesquisaCloseUp
        OnKeyUp = pesquisaKeyUp
      end
      object dbeDescLinha: TDBEdit
        Left = 8
        Top = 69
        Width = 177
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'deslin'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 3
        OnKeyUp = dbeDescLinhaKeyUp
      end
      object dbeDescCol: TDBEdit
        Left = 296
        Top = 72
        Width = 180
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'descol'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 5
        OnKeyUp = dbeDescColKeyUp
      end
      object dbdateedtdatacadastro: TDBDateEdit
        Left = 361
        Top = 8
        Width = 112
        Height = 21
        DataField = 'dtcada'
        DataSource = DataSource
        ButtonHint = 'Clique para abrir o calend'#225'rio'
        Ctl3D = False
        Enabled = False
        GlyphKind = gkCustom
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080
          8080808080808080808080808080808080808080808080808080808080808080
          80808080808080FFFFFFFFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFF808080
          E9A4A1EEBEB8EEBEB8BCBC8CF2CDC5E7C2BABCBC8CE8C9C0D9C5BABCBC8CEDBF
          B8F5B0AD808080FFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
          FFFFC0C0C0FFFFFFFFFFFFC0C0C0FFFFFFFFFFFFC0C0C0FFFFFFFFFFFF808080
          FEBEBAFFF3ECFFF3ECBCBC8CFFF6ECFFF4EABCBC8CFFF6EBFFFAEDBCBC8CFFFE
          F5FFF4F0808080FFFFFFFFFFFFC0C0C0FFFFFFFFF3ECFFF3ECC0C0C0FFF6ECFF
          F4EAC0C0C0FFF6EBFFFAEDC0C0C0FFFEF5FFF4F0C0C0C0FFFFFFFFFFFF808080
          FEBEBAFFF3ECFFF3ECBCBC8CFFF6ECFFF4EABCBC8CFFF6EBFFFAEDBCBC8CFFFE
          F5FFF4F0808080FFFFFFFFFFFFC0C0C0FFFFFFFFF3ECFFF3ECC0C0C0FFF6ECFF
          F4EAC0C0C0FFF6EBFFFAEDC0C0C0FFFEF5FFF4F0C0C0C0FFFFFFFFFFFF808080
          BCBC8CBCBC8CBCBC8CBCBC8CBCBC8CBCBC8CBCBC8CBCBC8CBCBC8CBCBC8CBCBC
          8CBCBC8C808080FFFFFFFFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFF808080
          F4BDB8FFF4EBFFF4EBBCBC8CFFFFF4FFFFF5BCBC8CFCFCEEFAFFF5BCBC8CFFFF
          F5FFF3EC808080FFFFFFFFFFFFC0C0C0FFFFFFFFF4EBFFF4EBC0C0C0FFFFF4FF
          FFF5C0C0C0FCFCEEFAFFF5C0C0C0FFFFF5FFF3ECC0C0C0FFFFFFFFFFFF808080
          FAC8C2FFF9EFFFF9EFBCBC8CFFFBEEFFFEF1BCBC8CFFFFF5F8FFF5BCBC8CFFFF
          F5FFF8F1808080FFFFFFFFFFFFC0C0C0FFFFFFFFF9EFFFF9EFC0C0C0FFFBEEFF
          FEF1C0C0C0FFFFF5F8FFF5C0C0C0FFFFF5FFF8F1C0C0C0FFFFFFFFFFFF808080
          BCBC8CBCBC8CBCBC8CBCBC8CBCBC8CBCBC8CBCBC8CBCBC8CBCBC8CBCBC8CBCBC
          8CBCBC8C808080FFFFFFFFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFF808080
          FFD1CBFFF3EAFFF3EABCBC8CFFF9EDFFFFF5BCBC8CFFF6E9EFEFE1BCBC8CFFF8
          EEFFF4EE808080FFFFFFFFFFFFC0C0C0FFFFFFFFF3EAFFF3EAC0C0C0FFF9EDFF
          FFF5C0C0C0FFF6E9EFEFE1C0C0C0FFF8EEFFF4EEC0C0C0FFFFFFFFFFFF808080
          EDB5B0FFF8F0FFF8F0BCBC8CFCE1D7FFFFF5BCBC8CFFFFF5FFFFF3BCBC8CFFF2
          EAFFEDE8808080FFFFFFFFFFFFC0C0C0FFFFFFFFF8F0FFF8F0C0C0C0FCE1D7FF
          FFF5C0C0C0FFFFF5FFFFF3C0C0C0FFF2EAFFEDE8C0C0C0FFFFFFFFFFFF808080
          8080808080808080808080808080808080808080808080808080808080808080
          80808080808080FFFFFFFFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFF808080
          E8C9C0E8C9C0E8C9C0E8C9C0E8C9C0E8C9C0E8C9C0E8C9C0808080E8C9C0E8C9
          C0E8C9C0808080FFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFF808080
          8080808080808080808080808080808080808080808080808080808080808080
          80808080808080FFFFFFFFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 2
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
  end
  inherited imManutencao: TImageList
    Left = 152
    Top = 408
  end
  inherited DataSource: TDataSource
    DataSet = cdsGDProd
    Left = 224
    Top = 192
  end
  object pm_coluna: TPopupMenu
    Left = 352
    Top = 152
    object Apagarcoluna1: TMenuItem
      Caption = 'Apagar coluna'
      OnClick = Apagarcoluna1Click
    end
  end
  object pm_linha: TPopupMenu
    Left = 64
    Top = 140
    object Apagarlinha1: TMenuItem
      Caption = 'Apagar linha'
      OnClick = Apagarlinha1Click
    end
  end
  object dsGradeLinha: TDataSource
    DataSet = cdsLinhGrade
    Left = 228
    Top = 153
  end
  object dsGradeColuna: TDataSource
    DataSet = cdsColGrade
    Left = 228
    Top = 113
  end
  object cdsColGrade: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'codgrade'
        ParamType = ptInput
      end>
    ProviderName = 'dspColunaGrade'
    RemoteServer = dm.scHC
    AfterInsert = cdsColGradeAfterInsert
    AfterEdit = cdsColGradeAfterEdit
    BeforePost = cdsColGradeBeforePost
    AfterPost = cdsColGradeAfterPost
    AfterCancel = cdsColGradeAfterCancel
    AfterDelete = cdsColGradeAfterDelete
    OnReconcileError = cdsColGradeReconcileError
    Left = 264
    Top = 112
    object cdsColGradecdlcgr: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'cdlcgr'
      Required = True
    end
    object cdsColGradedescri: TStringField
      DisplayLabel = 'Descri'#231#227'o Coluna'
      FieldName = 'descri'
      Required = True
      Size = 30
    end
    object cdsColGradedtcada: TDateField
      DisplayLabel = 'Dt.Cadastro'
      FieldName = 'dtcada'
    end
    object cdsColGradecdempr: TIntegerField
      DisplayLabel = 'C'#243'd.Empresa'
      FieldName = 'cdempr'
    end
    object cdsColGradecdgrad: TIntegerField
      DisplayLabel = 'C'#243'd.Grade'
      FieldName = 'cdgrad'
    end
    object cdsColGradelincol: TStringField
      FieldName = 'lincol'
      Required = True
      Size = 1
    end
  end
  object cdsLinhGrade: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'codgrade'
        ParamType = ptInput
      end>
    ProviderName = 'dspLinhaGrade'
    RemoteServer = dm.scHC
    AfterInsert = cdsLinhGradeAfterInsert
    AfterEdit = cdsLinhGradeAfterEdit
    BeforePost = cdsLinhGradeBeforePost
    AfterPost = cdsLinhGradeAfterPost
    AfterCancel = cdsLinhGradeAfterCancel
    AfterDelete = cdsLinhGradeAfterDelete
    OnReconcileError = cdsColGradeReconcileError
    Left = 264
    Top = 152
    object cdsLinhGradecdlcgr: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'cdlcgr'
      Required = True
    end
    object cdsLinhGradedescri: TStringField
      DisplayLabel = 'Descri'#231#227'o Linha'
      FieldName = 'descri'
      Required = True
      Size = 30
    end
    object cdsLinhGradedtcada: TDateField
      DisplayLabel = 'Dt.Cadastro'
      FieldName = 'dtcada'
    end
    object cdsLinhGradecdempr: TIntegerField
      DisplayLabel = 'C'#243'd.Empresa'
      FieldName = 'cdempr'
    end
    object cdsLinhGradecdgrad: TIntegerField
      DisplayLabel = 'C'#243'd.Grade'
      FieldName = 'cdgrad'
    end
    object cdsLinhGradelincol: TStringField
      FieldName = 'lincol'
      Required = True
      Size = 1
    end
  end
  object cdsGDProd: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'empresa'
        ParamType = ptInput
      end>
    ProviderName = 'dspGDPro'
    RemoteServer = dm.scHC
    AfterInsert = cdsGDProdAfterInsert
    AfterEdit = cdsGDProdAfterEdit
    BeforePost = cdsGDProdBeforePost
    AfterPost = cdsGDProdAfterPost
    BeforeCancel = cdsGDProdBeforeCancel
    AfterCancel = cdsGDProdAfterCancel
    BeforeDelete = cdsGDProdBeforeDelete
    AfterDelete = cdsGDProdAfterDelete
    OnReconcileError = cdsColGradeReconcileError
    Left = 262
    Top = 192
    object cdsGDProdcdgrad: TIntegerField
      DisplayLabel = 'C'#243'd.'
      DisplayWidth = 10
      FieldName = 'cdgrad'
      Required = True
    end
    object cdsGDProddescri: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 30
      FieldName = 'descri'
      Required = True
      Size = 30
    end
    object cdsGDProddeslin: TStringField
      DisplayLabel = 'Desc.Linha'
      DisplayWidth = 30
      FieldName = 'deslin'
      Required = True
      Size = 30
    end
    object cdsGDProddescol: TStringField
      DisplayLabel = 'Descr.Coluna'
      DisplayWidth = 30
      FieldName = 'descol'
      Required = True
      Size = 30
    end
    object cdsGDProddtcada: TDateField
      DisplayLabel = 'Dt.Cadastro'
      DisplayWidth = 10
      FieldName = 'dtcada'
      Visible = False
    end
    object cdsGDProdcdempr: TIntegerField
      DisplayLabel = 'C'#243'd.Empresa'
      DisplayWidth = 10
      FieldName = 'cdempr'
      Visible = False
    end
  end
  object tmr_verificagrade: TTimer
    Interval = 100
    OnTimer = tmr_verificagradeTimer
    Left = 24
    Top = 320
  end
end
