inherited frmManuBanco: TfrmManuBanco
  Left = 348
  Top = 106
  Caption = 'Manuten'#231#227'o de Bancos'
  ClientHeight = 166
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 296
    Top = -16
    Width = 28
    Height = 14
    Caption = 'Cod.'
  end
  object Label2: TLabel [1]
    Left = 296
    Top = 24
    Width = 84
    Height = 14
    Caption = 'Dt. Cadastro'
  end
  object Label3: TLabel [2]
    Left = 296
    Top = 64
    Width = 63
    Height = 14
    Caption = 'Descri'#231#227'o'
  end
  inherited tbManutencao: TToolBar
    Top = 106
  end
  object pgBanco: TPageControl [4]
    Left = 0
    Top = 0
    Width = 534
    Height = 106
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Dados Principais'
      object Label4: TLabel
        Left = 0
        Top = 10
        Width = 91
        Height = 14
        Caption = 'Cod.........:'
        FocusControl = dbeCod
      end
      object Label5: TLabel
        Left = 253
        Top = 10
        Width = 98
        Height = 14
        Caption = 'Dt. Cadastro.:'
      end
      object Label7: TLabel
        Left = 0
        Top = 36
        Width = 91
        Height = 14
        Caption = 'Descri'#231#227'o...:'
        FocusControl = dbeDescri
      end
      object dbeCod: TDBEdit
        Left = 96
        Top = 9
        Width = 121
        Height = 20
        Ctl3D = False
        DataField = 'cdban'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 0
        OnExit = dbeCodExit
        OnKeyPress = dbeCodKeyPress
      end
      object dbeDescri: TDBEdit
        Left = 96
        Top = 32
        Width = 369
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'descri'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 1
        OnExit = dbeDescriExit
      end
      object dbdateedtdatacadastro: TDBDateEdit
        Left = 353
        Top = 7
        Width = 112
        Height = 21
        DataField = 'dtcada'
        DataSource = DataSource
        ButtonHint = 'Clique para abrir o calend'#225'rio'
        Ctl3D = True
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
        TabOrder = 2
      end
    end
  end
  inherited imManutencao: TImageList
    Left = 368
    Top = 88
  end
  inherited DataSource: TDataSource
    Left = 304
    Top = 88
  end
end
