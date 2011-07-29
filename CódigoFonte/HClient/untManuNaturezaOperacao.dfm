inherited frmManuNaturezaOperacao: TfrmManuNaturezaOperacao
  Top = 139
  Caption = 'Manuten'#231#227'o de Natureza de Opera'#231#227'o'
  ClientHeight = 421
  ClientWidth = 666
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  inherited tbManutencao: TToolBar
    Top = 361
    Width = 666
    inherited ToolButton1: TToolButton
      Width = 113
    end
    inherited tbPrimeiro: TToolButton
      Left = 113
    end
    inherited tbAnterior: TToolButton
      Left = 170
    end
    inherited tbProximo: TToolButton
      Left = 227
    end
    inherited tbUltimo: TToolButton
      Left = 284
    end
    inherited tbSepardor: TToolButton
      Left = 341
    end
    inherited tbAdicionar: TToolButton
      Left = 349
    end
    inherited tbExcluir: TToolButton
      Left = 406
    end
    inherited tbGravar: TToolButton
      Left = 463
    end
    inherited tbCancelar: TToolButton
      Left = 520
    end
  end
  object pgNatOpe: TPageControl [1]
    Left = 0
    Top = 0
    Width = 666
    Height = 361
    ActivePage = tsInicio
    Align = alClient
    TabOrder = 1
    object tsInicio: TTabSheet
      Caption = 'In'#237'cio'
      object Label2: TLabel
        Left = 181
        Top = 10
        Width = 63
        Height = 14
        Alignment = taRightJustify
        Caption = 'Descri'#231#227'o'
        Transparent = True
      end
      object Label1: TLabel
        Left = 7
        Top = 10
        Width = 42
        Height = 14
        Alignment = taRightJustify
        Caption = 'C'#243'digo'
        Transparent = True
      end
      object dbgrd_naturezaoperacao: TDBGrid
        Left = 6
        Top = 58
        Width = 643
        Height = 255
        DataSource = DataSource
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -12
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        OnColExit = dbgrd_naturezaoperacaoColExit
        OnDrawColumnCell = dbgrd_naturezaoperacaoDrawColumnCell
        OnKeyPress = dbgrd_naturezaoperacaoKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'cdntop'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descri'
            Width = 330
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'bxesto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'efelan'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'incipi'
            Visible = True
          end>
      end
      object edt_procuradescricao: TEdit
        Left = 180
        Top = 24
        Width = 467
        Height = 21
        Hint = 'Digite a descri'#231#227'o da natureza de opera'#231#227'o'
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnKeyUp = edt_procuradescricaoKeyUp
      end
      object dbckbx_alteraestoque: TDBCheckBox
        Left = 450
        Top = 0
        Width = 15
        Height = 17
        Color = clBtnFace
        DataField = 'bxesto'
        DataSource = DataSource
        ParentColor = False
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Visible = False
      end
      object dbckbx_geralancamento: TDBCheckBox
        Left = 470
        Top = 0
        Width = 17
        Height = 17
        Color = clBtnFace
        DataField = 'efelan'
        DataSource = DataSource
        ParentColor = False
        TabOrder = 3
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Visible = False
      end
      object dbckbx_incluiIPI: TDBCheckBox
        Left = 491
        Top = -1
        Width = 17
        Height = 17
        Color = clBtnFace
        DataField = 'incipi'
        DataSource = DataSource
        ParentColor = False
        TabOrder = 4
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        Visible = False
      end
      object edt_procuracodigo: TEdit
        Left = 6
        Top = 23
        Width = 171
        Height = 21
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnKeyUp = edt_procuracodigoKeyUp
      end
    end
  end
  inherited imManutencao: TImageList
    Left = 128
    Top = 352
  end
  inherited DataSource: TDataSource
    Left = 296
    Top = 368
  end
end
