inherited frmManuClientes: TfrmManuClientes
  Left = 391
  Top = 231
  Caption = 'Manuten'#231#227'o de Clientes'
  ClientHeight = 369
  ClientWidth = 553
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  inherited tbManutencao: TToolBar
    Top = 309
    Width = 553
  end
  object pgClientes: TPageControl [1]
    Left = 0
    Top = 0
    Width = 553
    Height = 309
    ActivePage = tsDepAut
    Align = alClient
    TabOrder = 1
    object tsBasicos: TTabSheet
      Caption = 'B'#225'sicos'
      object Label1: TLabel
        Left = 0
        Top = 9
        Width = 91
        Height = 14
        Caption = 'C'#243'd.........:'
      end
      object Label3: TLabel
        Left = 0
        Top = 32
        Width = 91
        Height = 14
        Caption = 'Sexo........:'
      end
      object lblnomefantasia: TLabel
        Left = 0
        Top = 56
        Width = 91
        Height = 14
        Caption = 'Nome........:'
        FocusControl = dbeNome
      end
      object Label5: TLabel
        Left = 315
        Top = 228
        Width = 105
        Height = 14
        Caption = 'Dt.Nascimento.:'
      end
      object Label6: TLabel
        Left = 320
        Top = 34
        Width = 105
        Height = 14
        Caption = 'Cliente Desde.:'
      end
      object Label7: TLabel
        Left = 326
        Top = 11
        Width = 91
        Height = 14
        Caption = 'Dt.Cadastro.:'
      end
      object Label8: TLabel
        Left = 0
        Top = 80
        Width = 91
        Height = 14
        Caption = 'Natural de..:'
        FocusControl = dbeNaturalde
      end
      object Label9: TLabel
        Left = 193
        Top = 105
        Width = 28
        Height = 14
        Caption = 'RG.:'
        FocusControl = dbeRG
      end
      object Label2: TLabel
        Left = 0
        Top = 104
        Width = 91
        Height = 14
        Caption = 'Est.Civil...:'
      end
      object Label10: TLabel
        Left = 359
        Top = 104
        Width = 35
        Height = 14
        Caption = 'CPF.:'
      end
      object Label11: TLabel
        Left = 384
        Top = 154
        Width = 35
        Height = 14
        Caption = 'CEP.:'
        FocusControl = dbeCep
      end
      object Label12: TLabel
        Left = 0
        Top = 129
        Width = 91
        Height = 14
        Caption = 'Endere'#231'o....:'
        FocusControl = dbeEndereco
      end
      object Label13: TLabel
        Left = 406
        Top = 131
        Width = 35
        Height = 14
        Caption = 'N'#250'm.:'
        FocusControl = dbeNum
      end
      object Label14: TLabel
        Left = 0
        Top = 179
        Width = 91
        Height = 14
        Caption = 'Cidade......:'
        FocusControl = dbeCidade
      end
      object Label15: TLabel
        Left = 0
        Top = 153
        Width = 91
        Height = 14
        Caption = 'Bairro......:'
        FocusControl = dbeBairro
      end
      object Label16: TLabel
        Left = 449
        Top = 177
        Width = 28
        Height = 14
        Caption = 'UF.:'
      end
      object Label17: TLabel
        Left = 0
        Top = 204
        Width = 91
        Height = 14
        Caption = 'Telefone....:'
        FocusControl = dbeTelefone
      end
      object Label18: TLabel
        Left = 317
        Top = 203
        Width = 63
        Height = 14
        Caption = 'Celular.:'
        FocusControl = dbeCelular
      end
      object Label19: TLabel
        Left = -1
        Top = 227
        Width = 91
        Height = 14
        Caption = 'FAX.........:'
        FocusControl = dbeFax
      end
      object Label20: TLabel
        Left = 0
        Top = 248
        Width = 91
        Height = 14
        Caption = 'E-mail......:'
      end
      object dbeNome: TDBEdit
        Left = 91
        Top = 56
        Width = 441
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'nome'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 6
        OnExit = dbeNomeExit
      end
      object dbeNaturalde: TDBEdit
        Left = 92
        Top = 80
        Width = 441
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'natura'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 7
      end
      object dbeRG: TDBEdit
        Left = 220
        Top = 104
        Width = 137
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'rg'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 9
      end
      object dbeCod: TDBEdit
        Left = 90
        Top = 8
        Width = 89
        Height = 20
        CharCase = ecUpperCase
        Color = 13425885
        Ctl3D = False
        DataField = 'cdclie'
        DataSource = DataSource
        Enabled = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object dbcbxPessoaJuridica: TDBCheckBox
        Left = 189
        Top = 9
        Width = 132
        Height = 17
        Caption = 'Pessoa Jur'#237'dica'
        Ctl3D = False
        DataField = 'pesjur'
        DataSource = DataSource
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnExit = dbcbxPessoaJuridicaExit
      end
      object dbcbSexo: TDBComboBox
        Left = 91
        Top = 31
        Width = 90
        Height = 22
        Hint = 'Escolha a UF do fornecedor'
        Style = csDropDownList
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'sexo'
        DataSource = DataSource
        ItemHeight = 14
        Items.Strings = (
          'M'
          'F')
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object dbdeDtNascimento: TDBDateEdit
        Left = 422
        Top = 224
        Width = 112
        Height = 21
        Hint = 'Digite ou escolha a data de cadastro do fornecedor'
        DataField = 'dtnasc'
        DataSource = DataSource
        ButtonHint = 'Clique para abrir o calend'#225'rio'
        Ctl3D = False
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
        TabOrder = 20
      end
      object dbdateedtdatacadastro: TDBDateEdit
        Left = 418
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
        TabOrder = 2
      end
      object dbdeClienteDesd: TDBDateEdit
        Left = 418
        Top = 32
        Width = 112
        Height = 21
        Hint = 'Digite ou escolha a data de cadastro do fornecedor'
        DataField = 'cldesd'
        DataSource = DataSource
        ButtonHint = 'Clique para abrir o calend'#225'rio'
        Ctl3D = False
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
        TabOrder = 5
      end
      object dbcbbxestadocivil: TDBComboBox
        Left = 91
        Top = 102
        Width = 100
        Height = 22
        Hint = 
          'Clique para escolher o estado civil|Escolha o estado civil do cl' +
          'iente'
        Style = csDropDownList
        AutoDropDown = True
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'estciv'
        DataSource = DataSource
        ItemHeight = 14
        Items.Strings = (
          'CASADO(A)'
          'SOLTEIRO(A)'
          'VIUVO(A)'
          'AMASIADO(A)'
          'DESQUITADO(A)'
          'OUTRO ???')
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
      end
      object dbeCep: TDBEdit
        Left = 422
        Top = 152
        Width = 112
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'cep'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 14
        OnKeyPress = dbeCepKeyPress
      end
      object dbeEndereco: TDBEdit
        Left = 92
        Top = 128
        Width = 305
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'endere'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 11
      end
      object dbeNum: TDBEdit
        Left = 446
        Top = 128
        Width = 88
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'numero'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 12
      end
      object dbeCidade: TDBEdit
        Left = 93
        Top = 176
        Width = 281
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'cidade'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 15
      end
      object dbeBairro: TDBEdit
        Left = 92
        Top = 152
        Width = 184
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'bairro'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 13
      end
      object dbeUF: TDBComboBox
        Left = 481
        Top = 175
        Width = 53
        Height = 22
        Hint = 'Escolha a UF do fornecedor'
        Style = csDropDownList
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'uf'
        DataSource = DataSource
        ItemHeight = 14
        Items.Strings = (
          'AC'
          'AL'
          'AM'
          'AP'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MG'
          'MS'
          'MT'
          'PA'
          'PB'
          'PE'
          'PI'
          'PR'
          'RJ'
          'RN'
          'RO'
          'RR'
          'RS'
          'SC'
          'SE'
          'SP'
          'TO')
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 16
      end
      object dbeTelefone: TDBEdit
        Left = 94
        Top = 200
        Width = 153
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'telefo'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 17
        OnKeyPress = dbeTelefoneKeyPress
      end
      object dbeCelular: TDBEdit
        Left = 382
        Top = 200
        Width = 153
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'celula'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 18
        OnKeyPress = dbeCelularKeyPress
      end
      object dbeFax: TDBEdit
        Left = 94
        Top = 224
        Width = 153
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'fax'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 19
        OnKeyPress = dbeFaxKeyPress
      end
      object dbcdedtemail: TRxDBComboEdit
        Left = 95
        Top = 248
        Width = 441
        Height = 21
        ButtonHint = 'Clique para enviar e-mail para o fornecedor'
        CharCase = ecLowerCase
        Ctl3D = True
        DataField = 'EMAIL'
        DataSource = DataSource
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFCCDCDF
          ACB9BC939EA097A3A5AAB8BABECDCFCADADDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFD8BDB0E2AB92B78F7D8C7D757D81808B96989F
          ACAEB1BFC1BFCED0C9D9DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7B7A0
          FECAAAFED1B3EBBB9EBF96819E83767C787678828388939599A5A8ABB9BBBAC9
          CCC6D6D9FFFFFFFFFFFFD5E5E8EDBFA7FFE0C5FECFB4FFE3CBFFE3CBFFDABFF3
          C6ACD2A089A88B7C867B74727B7D828C8E95A1A3B0BEC1FFFFFFD2DFE0F7CBB3
          FFE8D2FFDFC7FDD3BDFFEBDCFFEBDAFFE9D7FFEAD6FFE2CCFAD4BBE4B7A0B18C
          7B8E7B738F9A9CC2D1D4D5CBC5FEDECCFFEBDBFFEAD7FEE0CBFEDFCEFFF4EAFF
          F1E6FFEFE3FFEFE3FFF0E2FEE7D5FED7C0E8A98D899496C0CFD2DBC9C0FFEBDE
          FFF0E4FFEFE2FFF5E5FFD6C0F7DDD4FFFFFDFFFEF6FFF2E8FDDCCCFDD6C0FFE5
          D0D1A590939FA1C5D5D8DEC3B6FFF5EEFFFAF1FFF2E4DFCEC775A0C0649AC2DD
          D6D8D4CCCFE7C6BAFFEAD8FFEEDFFFEEDEBA93839DA9ABCADADDE9C6B9FFFFFB
          E8D8D38EAAC14FA5D847B6F147B3EE4B97C9409BD3649FC8F8E2D4FFF6ECFFEB
          DEA99289A7B4B6D0E0E3F5CBB9B0C6D366B4DA53C0F45FCAF95FC6F65DC4F557
          C4F857C3F848B5EF90ACC3FFF5EBFEEEE49A887FB3C1C3D5E5E892AEC551AFDC
          60C4ED67C7EF65C7EF66C8F163C6F162C5F164C8F562CAF851B8EBC0C9D2F5DA
          CB939595BFCFD1FFFFFFD2E6EA72AED065C1E376D5F276D4F36FCEEF6DCCEF6B
          CBEF66C6ED65C6ED5FC6F167B7DED8ADA1AFBBBEFFFFFFFFFFFFFFFFFFD4E6EA
          75B0D06EC7E581DDF485E3F982E0F880DEF77EDCF779D8F563C0E54A9AC7B3BA
          BCCFDFE2FFFFFFFFFFFFFFFFFFFFFFFFD3E6EA77B1D072C9E38AE4F490EBF98B
          E6F77ED9F05EB5D874A4BEC0D1D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFD5E6EA8EBED676CBE292EAF47AD1E764A8C79EBAC8CFDFE2FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF96C4D96CB9D488
          B5CCC6D7DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 1
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 21
      end
      object dbcbAtivo: TDBCheckBox
        Left = 189
        Top = 33
        Width = 108
        Height = 17
        Caption = 'Ativo'
        Ctl3D = False
        DataField = 'ativo'
        DataSource = DataSource
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbeCPF: TRxDBComboEdit
        Left = 393
        Top = 102
        Width = 142
        Height = 21
        Hint = 'cadastro/Pesquisa CNPJ/CPF'
        ButtonHint = 'Clique para entrar na home-page do fornecedor'
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'cpf'
        DataSource = DataSource
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFC1836BC1836BB27963C1836BFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1836BA96D57EEC3B1FFECDEFF
          F5E9D5BDB428465EC1836BC1836BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          BD7157E4AA93FEE9DBFFF6EBFFECDEFFF7EBD7DBDC146DA1076299968C8FA874
          5EC1836BC1836BFF00FFFF00FFFF00FFF1AD90FFF0E0FFEFE1FFEFDFFFECD4FF
          F2E1D3D3D3308DC1157FB9A5BECAFFF4E3EEBAA4C1836BFF00FFFF00FFFF00FF
          F3B294FFEBD6FFECD2FDD1B7CE9D97F8D8C4E4DED477B6D639A0D79CBCCCFFF4
          E0F7D0BCC1836BFF00FFFF00FFFF00FFF2B08CFFE0BBD4A69B5D50940F1FA58C
          7AA1FFF0D1FBE2CECECFCBD6D1CAFFEAD4F5C9B2C1836BFF00FFFF00FFFF00FF
          D28B72876C911A2AA4001FBA042AC3273EB1E3B9A8FFE9CAFFE3C8FFE1C7FFE3
          CBF6CDAEC1836BFF00FFFF00FF0C1E732A30990421B50326BF203DBF1742C90F
          48D2545EA6F1C1A4FFE2C1FFDFC0FFE3BEF9C09EC1836BFF00FFFF00FF0E2183
          0828B90A2FC45762BBD4D3DF8D99D21B5BDB1764E26E6FA3FFC59DFEC6A1C899
          946A557CFF00FFFF00FFFF00FF10217710268A0F3BC5AFA5C2FFFFF4FFE9D166
          87CE237FF72A85F36874AF555698122479FF00FFFF00FFFF00FFFF00FFFF00FF
          0F1F760C29909B9CC4FFEFD8F9DBCB6E9DE0298DFF2977E80F3EA8051964FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0D1E75233C937698D660A1F02B
          82EF1B48A90F216E081556FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF0C1C750F42A71C5EC5133083081556FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        NumGlyphs = 1
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnExit = dbeCPFExit
        OnKeyPress = dbeCPFKeyPress
      end
    end
    object tsFamilia: TTabSheet
      Caption = 'Fam'#237'lia'
      ImageIndex = 1
      object Label21: TLabel
        Left = 0
        Top = 8
        Width = 70
        Height = 14
        Caption = 'Nome Pai.:'
        FocusControl = dbeNmPai
      end
      object Label22: TLabel
        Left = 0
        Top = 36
        Width = 70
        Height = 14
        Caption = 'Nome M'#227'e.:'
        FocusControl = nmMae
      end
      object Label39: TLabel
        Left = 0
        Top = 81
        Width = 70
        Height = 14
        Caption = 'Conjugue.:'
        FocusControl = DbeConjugue
      end
      object Label40: TLabel
        Left = 0
        Top = 108
        Width = 70
        Height = 14
        Caption = 'Telefone.:'
        FocusControl = dbeTelefoneCOnjugue
      end
      object Bevel1: TBevel
        Left = 8
        Top = 67
        Width = 521
        Height = 3
      end
      object dbeNmPai: TDBEdit
        Left = 72
        Top = 8
        Width = 449
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'nmpai'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 0
      end
      object nmMae: TDBEdit
        Left = 72
        Top = 34
        Width = 449
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'nmmae'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 1
      end
      object DbeConjugue: TDBEdit
        Left = 72
        Top = 80
        Width = 448
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'conjug'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 2
      end
      object dbeTelefoneCOnjugue: TDBEdit
        Left = 72
        Top = 106
        Width = 161
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'cjtele'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = dbeTelefoneCOnjugueKeyPress
      end
    end
    object tsEmrpego: TTabSheet
      Caption = 'Emprego'
      ImageIndex = 2
      object Label23: TLabel
        Left = 0
        Top = 8
        Width = 77
        Height = 14
        Caption = 'Empresa...:'
        FocusControl = dbeEmpresa
      end
      object Label24: TLabel
        Left = 0
        Top = 32
        Width = 77
        Height = 14
        Caption = 'Cargo.....:'
        FocusControl = dbeCargo
      end
      object Label25: TLabel
        Left = 0
        Top = 60
        Width = 77
        Height = 14
        Caption = 'C'#243'd.Profi.:'
        FocusControl = dbeCodProf
      end
      object Label26: TLabel
        Left = 0
        Top = 83
        Width = 77
        Height = 14
        Caption = 'Telefone .:'
        FocusControl = dbeTelefoneEmp
      end
      object Label28: TLabel
        Left = 0
        Top = 106
        Width = 77
        Height = 14
        Caption = 'Endere'#231'o..:'
        FocusControl = dbeEndereEmpresa
      end
      object Label27: TLabel
        Left = 352
        Top = 128
        Width = 35
        Height = 14
        Caption = 'Cep.:'
        FocusControl = dbeCepEmpr
      end
      object Label29: TLabel
        Left = 0
        Top = 130
        Width = 77
        Height = 14
        Caption = 'Bairro....:'
        FocusControl = bdeBAirroEmpre
      end
      object Label30: TLabel
        Left = 0
        Top = 154
        Width = 77
        Height = 14
        Caption = 'Cidade....:'
        FocusControl = dbeCIdadeEmpre
      end
      object Label31: TLabel
        Left = 418
        Top = 154
        Width = 28
        Height = 14
        Caption = 'UF.:'
      end
      object dbeEmpresa: TDBEdit
        Left = 80
        Top = 6
        Width = 425
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'emptra'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 0
      end
      object dbeCargo: TDBEdit
        Left = 80
        Top = 31
        Width = 425
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'empcar'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 1
      end
      object dbeCodProf: TDBEdit
        Left = 80
        Top = 56
        Width = 105
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'cdprof'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 2
        OnExit = dbeCodProfExit
        OnKeyPress = dbeCodProfKeyPress
      end
      object dblcdProfi: TDBLookupComboBox
        Left = 189
        Top = 56
        Width = 316
        Height = 20
        Ctl3D = False
        DataField = 'procuraProfissao'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 3
      end
      object dbeTelefoneEmp: TDBEdit
        Left = 80
        Top = 80
        Width = 201
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'emptel'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 4
        OnKeyPress = dbeTelefoneEmpKeyPress
      end
      object dbeEndereEmpresa: TDBEdit
        Left = 80
        Top = 104
        Width = 425
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'empend'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 5
      end
      object dbeCepEmpr: TDBEdit
        Left = 400
        Top = 128
        Width = 105
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'empcep'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 7
        OnKeyPress = dbeCepEmprKeyPress
      end
      object bdeBAirroEmpre: TDBEdit
        Left = 80
        Top = 128
        Width = 249
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'empbai'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 6
      end
      object dbeCIdadeEmpre: TDBEdit
        Left = 80
        Top = 152
        Width = 249
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'empcid'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 8
      end
      object dbcbUfEmpresaDBComboBox1: TDBComboBox
        Left = 451
        Top = 151
        Width = 53
        Height = 22
        Hint = 'Escolha a UF do fornecedor'
        Style = csDropDownList
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'empuf'
        DataSource = DataSource
        ItemHeight = 14
        Items.Strings = (
          'AC'
          'AL'
          'AM'
          'AP'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MG'
          'MS'
          'MT'
          'PA'
          'PB'
          'PE'
          'PI'
          'PR'
          'RJ'
          'RN'
          'RO'
          'RR'
          'RS'
          'SC'
          'SE'
          'SP'
          'TO')
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
      end
    end
    object tsReferencia: TTabSheet
      Caption = 'Refer'#234'ncia'
      ImageIndex = 3
      object Label32: TLabel
        Left = 8
        Top = 16
        Width = 154
        Height = 14
        Caption = 'Referencia Comercial 1'
        FocusControl = dbeRFC1
      end
      object Label33: TLabel
        Left = 8
        Top = 56
        Width = 154
        Height = 14
        Caption = 'Referencia Comercial 2'
        FocusControl = dbeRFC2
      end
      object Label34: TLabel
        Left = 8
        Top = 96
        Width = 154
        Height = 14
        Caption = 'Referencia Comercial 3'
        FocusControl = dbeRFC3
      end
      object Label35: TLabel
        Left = 8
        Top = 144
        Width = 140
        Height = 14
        Caption = 'Referencia Pessoal 1'
        FocusControl = dbeRFP1
      end
      object Label36: TLabel
        Left = 8
        Top = 184
        Width = 140
        Height = 14
        Caption = 'Referencia Pessoal 2'
        FocusControl = dbeRFP2
      end
      object Label37: TLabel
        Left = 8
        Top = 224
        Width = 140
        Height = 14
        Caption = 'Referencia Pessoal 3'
        FocusControl = dbeRFP3
      end
      object Bevel2: TBevel
        Left = 8
        Top = 139
        Width = 521
        Height = 3
      end
      object dbeRFC1: TDBEdit
        Left = 8
        Top = 32
        Width = 521
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'rfcom1'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 0
      end
      object dbeRFC2: TDBEdit
        Left = 8
        Top = 72
        Width = 521
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'rfcom2'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 1
      end
      object dbeRFC3: TDBEdit
        Left = 8
        Top = 112
        Width = 521
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'rfcom3'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 2
      end
      object dbeRFP1: TDBEdit
        Left = 8
        Top = 160
        Width = 521
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'rfpes1'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 3
      end
      object dbeRFP2: TDBEdit
        Left = 8
        Top = 200
        Width = 522
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'rfpes2'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 4
      end
      object dbeRFP3: TDBEdit
        Left = 8
        Top = 240
        Width = 523
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'rfpes3'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 5
      end
    end
    object tsDepAut: TTabSheet
      Caption = 'Dep./Aut.'
      ImageIndex = 5
      object Label42: TLabel
        Left = 8
        Top = 8
        Width = 91
        Height = 14
        Caption = 'Dependentes.:'
      end
      object Label45: TLabel
        Left = 0
        Top = 140
        Width = 91
        Height = 14
        Caption = 'Autorizados.:'
      end
      object gridDependentes: TDBGrid
        Left = 0
        Top = 24
        Width = 545
        Height = 89
        Align = alCustom
        Ctl3D = False
        DataSource = dsDependentes
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'Courier New'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = gridDependentesDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'nome'
            Width = 256
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'docume'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'compra'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dtnasc'
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefo'
            Width = 119
            Visible = True
          end>
      end
      object gridAutorizados: TDBGrid
        Left = 0
        Top = 156
        Width = 545
        Height = 89
        Align = alCustom
        Ctl3D = False
        DataSource = dsAutorizados
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'Courier New'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = gridAutorizadosDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'nome'
            Width = 256
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'docume'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'compra'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dtnasc'
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefo'
            Width = 115
            Visible = True
          end>
      end
      object btnCadaDependentes: TBitBtn
        Left = 240
        Top = 118
        Width = 97
        Height = 25
        Caption = 'Cad. Dep.'
        TabOrder = 1
        OnClick = btnCadaDependentesClick
      end
      object btnCadAutorizados: TBitBtn
        Left = 243
        Top = 249
        Width = 98
        Height = 25
        Caption = 'Cad. Aut.'
        TabOrder = 5
        OnClick = btnCadAutorizadosClick
      end
      object btnEditaDependente: TBitBtn
        Left = 344
        Top = 118
        Width = 97
        Height = 25
        Caption = 'Editar Dep.'
        TabOrder = 2
        OnClick = btnEditaDependenteClick
      end
      object btnExclDepe: TBitBtn
        Left = 448
        Top = 118
        Width = 97
        Height = 25
        Caption = 'Exluir Dep.'
        TabOrder = 3
        OnClick = btnExclDepeClick
      end
      object btnEditAut: TBitBtn
        Left = 346
        Top = 250
        Width = 97
        Height = 25
        Caption = 'Editar Aut.'
        TabOrder = 6
        OnClick = btnEditAutClick
      end
      object btnExcluirAut: TBitBtn
        Left = 448
        Top = 250
        Width = 97
        Height = 25
        Caption = 'Exluir Aut.'
        TabOrder = 7
        OnClick = btnExcluirAutClick
      end
    end
    object tsOutros: TTabSheet
      Caption = 'Outros'
      ImageIndex = 6
      object Label41: TLabel
        Left = 0
        Top = 8
        Width = 77
        Height = 14
        Caption = 'C'#243'd.Banco.:'
        FocusControl = dbeCodBanco
      end
      object Label43: TLabel
        Left = 0
        Top = 35
        Width = 77
        Height = 14
        Caption = 'Ag'#234'ncia...:'
        FocusControl = abeAgencia
      end
      object Label44: TLabel
        Left = 325
        Top = 34
        Width = 49
        Height = 14
        Caption = 'Conta.:'
        FocusControl = dbeConta
      end
      object Label4: TLabel
        Left = 0
        Top = 72
        Width = 77
        Height = 14
        Caption = 'C'#243'd.Grupo.:'
        FocusControl = dbeCodGrupo
      end
      object Bevel3: TBevel
        Left = 3
        Top = 59
        Width = 521
        Height = 3
      end
      object Label46: TLabel
        Left = 0
        Top = 157
        Width = 77
        Height = 14
        Caption = 'Limite....:'
        FocusControl = dbeCodGrupo
      end
      object Bevel4: TBevel
        Left = 3
        Top = 99
        Width = 521
        Height = 3
      end
      object Bevel5: TBevel
        Left = 3
        Top = 139
        Width = 521
        Height = 3
      end
      object Label47: TLabel
        Left = 0
        Top = 112
        Width = 77
        Height = 14
        Caption = 'Cart.Fidel:'
        FocusControl = dbeCodCartFidelidade
      end
      object dbeCodBanco: TDBEdit
        Left = 80
        Top = 7
        Width = 97
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'cdbanc'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 0
        OnExit = dbeCodBancoExit
        OnKeyPress = dbeCodBancoKeyPress
      end
      object dblcbBanco: TDBLookupComboBox
        Left = 181
        Top = 7
        Width = 345
        Height = 20
        Ctl3D = False
        DataField = 'procuraBanco'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 1
      end
      object abeAgencia: TDBEdit
        Left = 80
        Top = 32
        Width = 145
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'agenci'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 2
      end
      object dbeConta: TDBEdit
        Left = 378
        Top = 32
        Width = 145
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'conta'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 3
      end
      object dbeCodGrupo: TDBEdit
        Left = 80
        Top = 71
        Width = 97
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'cdgrup'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 4
        OnExit = dbeCodGrupoExit
        OnKeyPress = dbeCodBancoKeyPress
      end
      object dblcbGrupo: TDBLookupComboBox
        Left = 181
        Top = 71
        Width = 345
        Height = 20
        Ctl3D = False
        DataField = 'procuraGrupo'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 5
      end
      object dbeLimite: TRxDBCalcEdit
        Left = 81
        Top = 152
        Width = 98
        Height = 21
        DataField = 'limite'
        DataSource = DataSource
        ButtonHint = 'Clique para abrir a calculadora'
        Ctl3D = False
        DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
        GlyphKind = gkCustom
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF
          8080808080808080808080808080808080808080808080808080808080808080
          80808080F4EEE1FFFFFFFFFFFFFFFFEFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFFFFFFFF808080
          A29E858C896A86825F908A61958E638E855A91885D9288608981599F97728681
          627F7B63808080FFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFF808080
          CFCCB0C0BF99BEBD91C2BD90D0CA9DB2A781CFC39FC0B58FC3BC91C3BF8FC2C2
          949B9B77808080FFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFF808080
          D8D6B8BFC096727242736F3EBBB588837551756645CBBF9B79724776743EBDBF
          8BAAAC82808080FFFFFFFFFFFFC0C0C0FFFFFFFFFFFFC0C0C0C0C0C0FFFFFFC0
          C0C0C0C0C0FFFFFFC0C0C0C0C0C0FFFFFFFFFFFFC0C0C0FFFFFFFFFFFF808080
          E1DEBFCAC89FC9C797C4BE8FCCC398C0B190C7B79AC6B796C6BD92B6B27DC0C0
          8AAFB084808080FFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFF808080
          D3CDB0BBB78E7571417A7447C1B78F7E6F4F79694CC8B9997E744C817D4ABFBF
          89A2A175808080FFFFFFFFFFFFC0C0C0FFFFFFFFFFFFC0C0C0C0C0C0FFFFFFC0
          C0C0C0C0C0FFFFFFC0C0C0C0C0C0FFFFFFFFFFFFC0C0C0FFFFFFFFFFFF808080
          D7D1B4C0BB94C4BF92C5BE93CEC59FB9AB8ECFC1A5BCAE91C8BD97C3BF8CC2C1
          8EA3A276808080FFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFF808080
          E0D9BEC0BA95787249766E46B8AF8A877A6072644DC5B99D7C734E757141BCBB
          89B0B185808080FFFFFFFFFFFFC0C0C0FFFFFFFFFFFFC0C0C0C0C0C0FFFFFFC0
          C0C0C0C0C0FFFFFFC0C0C0C0C0C0FFFFFFFFFFFFC0C0C0FFFFFFFFFFFF808080
          D6CEB7BFB897C8C39CBEB691C9C09FBFB29CC1B3A0BCB098C6BF9EBDBA8DBCBC
          8CA2A379808080FFFFFFFFFFFFC0C0C0FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFC0C0C0FFFFFFFFFFFF808080
          DDD4C0C6C1A2FFFFE6FFFFDEFFFCDFFFFFF1FFFFF0FFFFF0FFFFE5FFFFE2B6B8
          8AB9BA92808080FFFFFFFFFFFFC0C0C0FFFFFFC0C0C0FFFFE6FFFFDEFFFCDFFF
          FFF1FFFFF0FFFFF0FFFFE5FFFFE2C0C0C0FFFFFFC0C0C0FFFFFFFFFFFF808080
          C5BFB4B2AC99FFFFEEFFFFF0FFFFF2FFFFFBFDF6F3FFFFF8FFFFF2FFFFE9A4AC
          849BA080808080FFFFFFFFFFFFC0C0C0FFFFFFC0C0C0FFFFEEFFFFF0FFFFF2FF
          FFFBFDF6F3FFFFF8FFFFF2FFFFE9C0C0C0FFFFFFC0C0C0FFFFFFFFFFFF808080
          EEE7DEA9A593BEBDA8B9B8A49F9E90BEB9B6C0BCBBBAB7B2B2B5A5A4AA8BC3CA
          A7B3B99A808080FFFFFFFFFFFFC0C0C0FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFC0C0C0FFFFFFFFFFFF808080
          FBF5EEFFFFF4FAFAE8F9F9E9FFFFF8FFFEFFF2EFF1FBFAF6FFFFF5FFFFEBFEFF
          E6C6CEB0808080FFFFFFFFFFFFC0C0C0FBF5EEFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFBFB
          8080808080808080808080808080808080808080808080808080808080808080
          80808080FFFFEDFFFFFFFFFFFFFFFBFBC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFEDFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 2
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
      end
      object dbeCodCartFidelidade: TDBEdit
        Left = 80
        Top = 111
        Width = 97
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'cdcrfi'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 6
        OnExit = dbeCodCartFidelidadeExit
        OnKeyPress = dbeCodCartFidelidadeKeyPress
      end
      object dblcbCartFidelidade: TDBLookupComboBox
        Left = 181
        Top = 111
        Width = 345
        Height = 20
        Ctl3D = False
        DataField = 'procuraCartaoFidelidade'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 7
      end
    end
    object tsObs: TTabSheet
      Caption = 'Observa'#231#245'es'
      ImageIndex = 4
      object Label38: TLabel
        Left = 0
        Top = 8
        Width = 70
        Height = 14
        Caption = 'Observa'#231#227'o'
      end
      object dbmmObs: TDBMemo
        Left = 0
        Top = 24
        Width = 540
        Height = 249
        Ctl3D = False
        DataField = 'observ'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 0
      end
    end
  end
  inherited imManutencao: TImageList
    Left = 304
    Top = 312
  end
  inherited DataSource: TDataSource
    Left = 224
    Top = 16
  end
  object dsAutorizados: TDataSource
    Left = 516
    Top = 337
  end
  object dsDependentes: TDataSource
    Left = 508
    Top = 305
  end
end
