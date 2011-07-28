inherited frmManuDefineEmpresaUsuario: TfrmManuDefineEmpresaUsuario
  Left = 661
  Top = 153
  Caption = 'Definir Empresa Usu'#225'rio'
  ClientHeight = 207
  ClientWidth = 531
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  inherited tbManutencao: TToolBar
    Top = 147
    Width = 531
    inherited tbAdicionar: TToolButton
      Visible = False
    end
    inherited tbExcluir: TToolButton
      Visible = False
    end
  end
  object pgUsuario: TPageControl [1]
    Left = 0
    Top = 0
    Width = 531
    Height = 147
    ActivePage = tsInicio
    Align = alClient
    TabOrder = 1
    object tsInicio: TTabSheet
      Caption = #205'nicio'
      object Label1: TLabel
        Left = 0
        Top = 40
        Width = 84
        Height = 14
        Caption = 'C'#243'd.Emp....:'
        FocusControl = dbeCodEmpr
      end
      object Label2: TLabel
        Left = 0
        Top = 64
        Width = 84
        Height = 14
        Caption = 'C'#243'd.Func...:'
        FocusControl = dbeCodFunc
      end
      object Label3: TLabel
        Left = 0
        Top = 16
        Width = 84
        Height = 14
        Caption = 'Login......:'
      end
      object dbeCodEmpr: TDBEdit
        Left = 88
        Top = 40
        Width = 119
        Height = 20
        Ctl3D = False
        DataField = 'cdempr'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 0
        OnExit = dbeCodEmprExit
        OnKeyPress = dbeCodEmprKeyPress
      end
      object dbeCodFunc: TDBEdit
        Left = 88
        Top = 64
        Width = 119
        Height = 20
        Ctl3D = False
        DataField = 'cdfunc'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 1
        OnExit = dbeCodFuncExit
        OnKeyPress = dbeCodFuncKeyPress
      end
      object dblcbFunc: TDBLookupComboBox
        Left = 210
        Top = 64
        Width = 305
        Height = 20
        Ctl3D = False
        DataField = 'procuraFuncioanrio'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 2
      end
      object dbecbEmpresa: TDBLookupComboBox
        Left = 210
        Top = 40
        Width = 305
        Height = 20
        Ctl3D = False
        DataField = 'procuraEmpresa'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 3
      end
      object dbcbLogin: TDBComboBox
        Left = 88
        Top = 16
        Width = 429
        Height = 22
        DataField = 'uclogin'
        DataSource = DataSource
        ItemHeight = 14
        ReadOnly = True
        TabOrder = 4
      end
      object dbcbxPessoaJuridica: TDBCheckBox
        Left = 89
        Top = 89
        Width = 240
        Height = 17
        Caption = 'Opera em Todas as Empresas?'
        Ctl3D = False
        DataField = 'todasEmpresas'
        DataSource = DataSource
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
  end
  object pesquisa: TwwDBLookupComboDlg [2]
    Left = 497
    Top = 42
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
      'uclogin'#9'30'#9'Login'#9'F'
      'uciduser'#9'10'#9'C'#243'd.'#9'F'#9
      'todasEmpresas'#9'10'#9'TodasEmpresas'#9'F')
    LookupTable = dm.cdsUsu
    ParentCtl3D = False
    TabOrder = 2
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = False
  end
  inherited imManutencao: TImageList
    Left = 72
    Top = 144
  end
  inherited DataSource: TDataSource
    Left = 136
    Top = 144
  end
end
