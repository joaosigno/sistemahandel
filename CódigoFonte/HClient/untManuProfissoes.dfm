inherited frmManuProfissoes: TfrmManuProfissoes
  Left = 500
  Top = 203
  Caption = 'Manuten;'#225'o de Profiss'#245'es'
  ClientHeight = 158
  ClientWidth = 486
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  inherited tbManutencao: TToolBar
    Top = 98
    Width = 486
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
  object pgProfissoes: TPageControl [1]
    Left = 0
    Top = 0
    Width = 486
    Height = 98
    ActivePage = tbDadosPrincipais
    Align = alClient
    TabOrder = 1
    object tbDadosPrincipais: TTabSheet
      Caption = 'Dados Principais'
      object Label1: TLabel
        Left = 0
        Top = 8
        Width = 77
        Height = 14
        Caption = 'C'#243'digo....:'
      end
      object Label2: TLabel
        Left = 0
        Top = 35
        Width = 77
        Height = 14
        Caption = 'Profiss'#227'o.:'
        FocusControl = dbeProfissao
      end
      object Label18: TLabel
        Left = 200
        Top = 10
        Width = 105
        Height = 14
        Caption = 'Data Cadastro.:'
        Transparent = True
      end
      object dbeProfissao: TDBEdit
        Left = 80
        Top = 32
        Width = 337
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'descri'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 2
        OnExit = dbeProfissaoExit
      end
      object dbeCod: TDBEdit
        Left = 80
        Top = 8
        Width = 89
        Height = 20
        Color = 13425885
        Ctl3D = False
        DataField = 'cdprof'
        DataSource = DataSource
        Enabled = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object dbdateedtdatacadastro: TDBDateEdit
        Left = 305
        Top = 8
        Width = 112
        Height = 21
        Hint = 'Digite ou escolha a data de cadastro do fornecedor'
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
    Left = 184
    Top = 96
  end
  inherited DataSource: TDataSource
    Left = 104
    Top = 104
  end
end
