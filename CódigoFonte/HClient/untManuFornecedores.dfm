inherited frmManuFornecedores: TfrmManuFornecedores
  Left = 594
  Top = 95
  Caption = 'Manuten'#231#227'o de Fornecedores'
  ClientHeight = 521
  ClientWidth = 614
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 17
  inherited tbManutencao: TToolBar
    Top = 461
    Width = 614
    inherited ToolButton1: TToolButton
      Width = 25
    end
    inherited tbPrimeiro: TToolButton
      Left = 25
    end
    inherited tbAnterior: TToolButton
      Left = 82
    end
    inherited tbProximo: TToolButton
      Left = 139
    end
    inherited tbUltimo: TToolButton
      Left = 196
    end
    inherited tbSepardor: TToolButton
      Left = 253
    end
    inherited tbAdicionar: TToolButton
      Left = 261
    end
    inherited tbExcluir: TToolButton
      Left = 318
    end
    inherited tbGravar: TToolButton
      Left = 375
    end
    inherited tbCancelar: TToolButton
      Left = 432
    end
  end
  object pgFornecedor: TPageControl [1]
    Left = 0
    Top = 0
    Width = 614
    Height = 461
    ActivePage = tsFornecedor
    Align = alClient
    TabOrder = 1
    object tsFornecedor: TTabSheet
      Caption = 'In'#237'cio'
      object Label1: TLabel
        Left = 0
        Top = 68
        Width = 120
        Height = 17
        Caption = 'C'#243'digo........:'
        FocusControl = dbeCod
        Transparent = True
      end
      object Label2: TLabel
        Left = 328
        Top = 70
        Width = 120
        Height = 17
        Caption = 'Data Cadastro.:'
        Transparent = True
      end
      object lblnomefantasia: TLabel
        Left = 0
        Top = 98
        Width = 120
        Height = 17
        Caption = 'Nome Fantasia.:'
        FocusControl = dbeNomEFantasia
        Transparent = True
      end
      object lblrazaosocial: TLabel
        Left = 0
        Top = 126
        Width = 120
        Height = 17
        Caption = 'Raz'#227'o Social..:'
        FocusControl = dbeRazaoSocial
        Transparent = True
      end
      object lblRgeIe: TLabel
        Left = 0
        Top = 155
        Width = 120
        Height = 17
        Caption = 'Insc.Estadual.:'
        FocusControl = dbeInscEstadual
        Transparent = True
      end
      object lblCGCeCPF: TLabel
        Left = 350
        Top = 155
        Width = 48
        Height = 17
        Caption = 'CNPJ.:'
        Transparent = True
      end
      object Label8: TLabel
        Left = 0
        Top = 185
        Width = 120
        Height = 17
        Caption = 'CEP...........:'
        FocusControl = dbeCep
        Transparent = True
      end
      object Label9: TLabel
        Left = 0
        Top = 214
        Width = 120
        Height = 17
        Caption = 'Endere'#231'o......:'
        FocusControl = dbeEndereco
        Transparent = True
      end
      object Label10: TLabel
        Left = 0
        Top = 243
        Width = 120
        Height = 17
        Caption = 'Bairro........:'
        FocusControl = dbeBairro
        Transparent = True
      end
      object Label11: TLabel
        Left = 0
        Top = 272
        Width = 120
        Height = 17
        Caption = 'Cidade........:'
        FocusControl = dbeCidade
        Transparent = True
      end
      object Label12: TLabel
        Left = 486
        Top = 214
        Width = 40
        Height = 17
        Caption = 'Num.:'
        FocusControl = dbeNum
        Transparent = True
      end
      object Label13: TLabel
        Left = 495
        Top = 273
        Width = 32
        Height = 17
        Caption = 'UF.:'
        Transparent = True
      end
      object Label14: TLabel
        Left = 0
        Top = 301
        Width = 120
        Height = 17
        Caption = 'Telefone......:'
        FocusControl = dbeTelefone
        Transparent = True
      end
      object Label15: TLabel
        Left = 350
        Top = 301
        Width = 40
        Height = 17
        Caption = 'Fax.:'
        FocusControl = dbeFax
        Transparent = True
      end
      object dbeCod: TDBEdit
        Left = 126
        Top = 68
        Width = 108
        Height = 23
        Color = 13425885
        Ctl3D = False
        DataField = 'cdforn'
        DataSource = DataSource
        Enabled = False
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = dbeCodKeyPress
      end
      object dbeNomEFantasia: TDBEdit
        Left = 126
        Top = 97
        Width = 468
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'nmfant'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 3
        OnExit = dbeNomEFantasiaExit
      end
      object dbeRazaoSocial: TDBEdit
        Left = 126
        Top = 126
        Width = 468
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'rzsoci'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 4
        OnExit = dbeRazaoSocialExit
      end
      object dbeInscEstadual: TDBEdit
        Left = 126
        Top = 155
        Width = 196
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'insest'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 5
      end
      object dbeCep: TDBEdit
        Left = 126
        Top = 185
        Width = 196
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'CEP'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 7
      end
      object dbeEndereco: TDBEdit
        Left = 126
        Top = 214
        Width = 351
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'endere'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 8
      end
      object dbeBairro: TDBEdit
        Left = 126
        Top = 243
        Width = 351
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'bairro'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 10
      end
      object dbeCidade: TDBEdit
        Left = 126
        Top = 272
        Width = 351
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'cidade'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 11
      end
      object dbeNum: TDBEdit
        Left = 534
        Top = 214
        Width = 61
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'numero'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 9
      end
      object dbeTelefone: TDBEdit
        Left = 126
        Top = 301
        Width = 196
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'telefo'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 13
        OnKeyPress = dbeCodKeyPress
      end
      object dbeFax: TDBEdit
        Left = 398
        Top = 301
        Width = 196
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'fax'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 14
        OnKeyPress = dbeCodKeyPress
      end
      object dbdateedtdatacadastro: TDBDateEdit
        Left = 457
        Top = 68
        Width = 136
        Height = 26
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
        ButtonWidth = 26
        NumGlyphs = 2
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnKeyPress = dbeCodKeyPress
      end
      object dbcbxPessoafisica: TDBCheckBox
        Left = 123
        Top = 34
        Width = 141
        Height = 21
        Caption = 'Pessoa F'#237'sica'
        Ctl3D = False
        DataField = 'pesfis'
        DataSource = DataSource
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnExit = dbcbxPessoafisicaExit
      end
      object dbcbuf: TDBComboBox
        Left = 528
        Top = 271
        Width = 65
        Height = 25
        Hint = 'Escolha a UF do fornecedor'
        Style = csDropDownList
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'uf'
        DataSource = DataSource
        ItemHeight = 17
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
        TabOrder = 12
      end
      object dbeCNPJ: TRxDBComboEdit
        Left = 408
        Top = 155
        Width = 186
        Height = 26
        Hint = 'cadastro/Pesquisa CNPJ/CPF'
        ButtonHint = 'Clique para entrar na home-page do fornecedor'
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'CGC'
        DataSource = DataSource
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
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
        ButtonWidth = 26
        NumGlyphs = 1
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnButtonClick = dbeCNPJButtonClick
        OnExit = dbeCNPJExit
        OnKeyPress = dbeCNPJKeyPress
      end
    end
    object tsoutrosdados: TTabSheet
      Caption = 'Outros Dados'
      ImageIndex = 1
      object Label3: TLabel
        Left = 0
        Top = 81
        Width = 128
        Height = 17
        Caption = 'Banco..........:'
        Transparent = True
      end
      object Label16: TLabel
        Left = 0
        Top = 24
        Width = 128
        Height = 17
        Caption = 'Data Funda'#231#227'o..:'
        Transparent = True
      end
      object Label17: TLabel
        Left = 0
        Top = 52
        Width = 128
        Height = 17
        Caption = 'Ramo Atividade.:'
        FocusControl = dbeRamoatividade
        Transparent = True
      end
      object Label18: TLabel
        Left = 0
        Top = 109
        Width = 128
        Height = 17
        Caption = 'Ag'#234'ncia........:'
        FocusControl = dbeagencia
        Transparent = True
      end
      object Label19: TLabel
        Left = 311
        Top = 107
        Width = 128
        Height = 17
        Caption = 'Conta Corrente.:'
        FocusControl = dbecontacorrente
        Transparent = True
      end
      object Label20: TLabel
        Left = -1
        Top = 136
        Width = 128
        Height = 17
        Caption = 'E-mail.........:'
        Transparent = True
      end
      object Label21: TLabel
        Left = -1
        Top = 165
        Width = 128
        Height = 17
        Caption = 'Home Page......:'
        Transparent = True
      end
      object Label22: TLabel
        Left = 0
        Top = 194
        Width = 128
        Height = 17
        Caption = 'Obs............:'
        Transparent = True
      end
      object dbeRamoatividade: TDBEdit
        Left = 136
        Top = 52
        Width = 448
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'rmativ'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 1
      end
      object dbeagencia: TDBEdit
        Left = 136
        Top = 108
        Width = 137
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'agenci'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 4
      end
      object dbecontacorrente: TDBEdit
        Left = 447
        Top = 108
        Width = 137
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'conta'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 5
      end
      object dbeObs: TDBMemo
        Left = 136
        Top = 194
        Width = 448
        Height = 118
        Ctl3D = False
        DataField = 'observ'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 8
      end
      object dbdateedtdatafundacao: TDBDateEdit
        Left = 136
        Top = 24
        Width = 128
        Height = 26
        DataField = 'dtfund'
        DataSource = DataSource
        ButtonHint = 'Clique para abrir o calend'#225'rio'
        Ctl3D = True
        GlyphKind = gkCustom
        Glyph.Data = {
          36080000424D3608000000000000360000002800000020000000100000000100
          2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
          8000808080008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FFFFFF00FFFFFF00C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF008080
          8000E9A4A100EEBEB800EEBEB800BCBC8C00F2CDC500E7C2BA00BCBC8C00E8C9
          C000D9C5BA00BCBC8C00EDBFB800F5B0AD0080808000FFFFFF00FFFFFF00C0C0
          C000FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF00C0C0C000FFFF
          FF00FFFFFF00C0C0C000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF008080
          8000FEBEBA00FFF3EC00FFF3EC00BCBC8C00FFF6EC00FFF4EA00BCBC8C00FFF6
          EB00FFFAED00BCBC8C00FFFEF500FFF4F00080808000FFFFFF00FFFFFF00C0C0
          C000FFFFFF00FFF3EC00FFF3EC00C0C0C000FFF6EC00FFF4EA00C0C0C000FFF6
          EB00FFFAED00C0C0C000FFFEF500FFF4F000C0C0C000FFFFFF00FFFFFF008080
          8000FEBEBA00FFF3EC00FFF3EC00BCBC8C00FFF6EC00FFF4EA00BCBC8C00FFF6
          EB00FFFAED00BCBC8C00FFFEF500FFF4F00080808000FFFFFF00FFFFFF00C0C0
          C000FFFFFF00FFF3EC00FFF3EC00C0C0C000FFF6EC00FFF4EA00C0C0C000FFF6
          EB00FFFAED00C0C0C000FFFEF500FFF4F000C0C0C000FFFFFF00FFFFFF008080
          8000BCBC8C00BCBC8C00BCBC8C00BCBC8C00BCBC8C00BCBC8C00BCBC8C00BCBC
          8C00BCBC8C00BCBC8C00BCBC8C00BCBC8C0080808000FFFFFF00FFFFFF00C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF008080
          8000F4BDB800FFF4EB00FFF4EB00BCBC8C00FFFFF400FFFFF500BCBC8C00FCFC
          EE00FAFFF500BCBC8C00FFFFF500FFF3EC0080808000FFFFFF00FFFFFF00C0C0
          C000FFFFFF00FFF4EB00FFF4EB00C0C0C000FFFFF400FFFFF500C0C0C000FCFC
          EE00FAFFF500C0C0C000FFFFF500FFF3EC00C0C0C000FFFFFF00FFFFFF008080
          8000FAC8C200FFF9EF00FFF9EF00BCBC8C00FFFBEE00FFFEF100BCBC8C00FFFF
          F500F8FFF500BCBC8C00FFFFF500FFF8F10080808000FFFFFF00FFFFFF00C0C0
          C000FFFFFF00FFF9EF00FFF9EF00C0C0C000FFFBEE00FFFEF100C0C0C000FFFF
          F500F8FFF500C0C0C000FFFFF500FFF8F100C0C0C000FFFFFF00FFFFFF008080
          8000BCBC8C00BCBC8C00BCBC8C00BCBC8C00BCBC8C00BCBC8C00BCBC8C00BCBC
          8C00BCBC8C00BCBC8C00BCBC8C00BCBC8C0080808000FFFFFF00FFFFFF00C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF008080
          8000FFD1CB00FFF3EA00FFF3EA00BCBC8C00FFF9ED00FFFFF500BCBC8C00FFF6
          E900EFEFE100BCBC8C00FFF8EE00FFF4EE0080808000FFFFFF00FFFFFF00C0C0
          C000FFFFFF00FFF3EA00FFF3EA00C0C0C000FFF9ED00FFFFF500C0C0C000FFF6
          E900EFEFE100C0C0C000FFF8EE00FFF4EE00C0C0C000FFFFFF00FFFFFF008080
          8000EDB5B000FFF8F000FFF8F000BCBC8C00FCE1D700FFFFF500BCBC8C00FFFF
          F500FFFFF300BCBC8C00FFF2EA00FFEDE80080808000FFFFFF00FFFFFF00C0C0
          C000FFFFFF00FFF8F000FFF8F000C0C0C000FCE1D700FFFFF500C0C0C000FFFF
          F500FFFFF300C0C0C000FFF2EA00FFEDE800C0C0C000FFFFFF00FFFFFF008080
          8000808080008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FFFFFF00FFFFFF00C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF008080
          8000E8C9C000E8C9C000E8C9C000E8C9C000E8C9C000E8C9C000E8C9C000E8C9
          C00080808000E8C9C000E8C9C000E8C9C00080808000FFFFFF00FFFFFF00C0C0
          C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00C0C0C000FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF008080
          8000808080008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FFFFFF00FFFFFF00C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
        ButtonWidth = 26
        NumGlyphs = 2
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = dbeCodKeyPress
      end
      object dbcdedtemailfornecedor: TRxDBComboEdit
        Left = 136
        Top = 137
        Width = 448
        Height = 26
        ButtonHint = 'Clique para enviar e-mail para o fornecedor'
        CharCase = ecLowerCase
        Ctl3D = True
        DataField = 'email'
        DataSource = DataSource
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -15
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
        ButtonWidth = 26
        NumGlyphs = 1
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
      end
      object dbcdedthomepagefornecedor: TRxDBComboEdit
        Left = 136
        Top = 168
        Width = 448
        Height = 25
        ButtonHint = 'Clique para entrar na home-page do fornecedor'
        CharCase = ecLowerCase
        Ctl3D = True
        DataField = 'homepa'
        DataSource = DataSource
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
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
        ButtonWidth = 26
        NumGlyphs = 1
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        OnButtonClick = dbcdedthomepagefornecedorButtonClick
      end
      object dblcbBanco: TDBLookupComboBox
        Left = 243
        Top = 79
        Width = 342
        Height = 23
        Ctl3D = False
        DataField = 'procurabanco'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 3
      end
      object dbeCodBanco: TDBEdit
        Left = 137
        Top = 79
        Width = 100
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'cdbanco'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 2
        OnExit = dbeCodBancoExit
      end
    end
    object tsRepresentante: TTabSheet
      Caption = 'Representantes'
      ImageIndex = 2
      object Label23: TLabel
        Left = 0
        Top = 10
        Width = 120
        Height = 17
        Caption = 'Representante.:'
        FocusControl = debRep1
        Transparent = True
      end
      object Label24: TLabel
        Left = 0
        Top = 39
        Width = 120
        Height = 17
        Caption = 'Contato.......:'
        FocusControl = dbeCont1
        Transparent = True
      end
      object Label25: TLabel
        Left = 0
        Top = 68
        Width = 120
        Height = 17
        Caption = 'Telefone......:'
        FocusControl = dbeTelefon1
        Transparent = True
      end
      object Label26: TLabel
        Left = 340
        Top = 68
        Width = 40
        Height = 17
        Caption = 'Fax.:'
        FocusControl = dbefax1
        Transparent = True
      end
      object Label28: TLabel
        Left = 0
        Top = 97
        Width = 120
        Height = 17
        Caption = 'E-mail........:'
        Transparent = True
      end
      object Bevel2: TBevel
        Left = 1
        Top = 130
        Width = 603
        Height = 4
      end
      object Label27: TLabel
        Left = 0
        Top = 146
        Width = 120
        Height = 17
        Caption = 'Representante.:'
        FocusControl = dbeRep2
        Transparent = True
      end
      object Label29: TLabel
        Left = 0
        Top = 175
        Width = 120
        Height = 17
        Caption = 'Contato.......:'
        FocusControl = dbeCont2
        Transparent = True
      end
      object Label30: TLabel
        Left = 0
        Top = 204
        Width = 120
        Height = 17
        Caption = 'Telefone......:'
        FocusControl = dbeTelefone2
        Transparent = True
      end
      object Label31: TLabel
        Left = 0
        Top = 233
        Width = 120
        Height = 17
        Caption = 'E-mail........:'
        Transparent = True
      end
      object Label32: TLabel
        Left = 340
        Top = 204
        Width = 40
        Height = 17
        Caption = 'Fax.:'
        FocusControl = dbeFax2
        Transparent = True
      end
      object Bevel1: TBevel
        Left = -9
        Top = 266
        Width = 613
        Height = 4
      end
      object Label33: TLabel
        Left = 0
        Top = 282
        Width = 120
        Height = 17
        Caption = 'Representante.:'
        FocusControl = dbeRep3
        Transparent = True
      end
      object Label34: TLabel
        Left = 0
        Top = 311
        Width = 120
        Height = 17
        Caption = 'Contato.......:'
        FocusControl = dbeCont3
        Transparent = True
      end
      object Label35: TLabel
        Left = 0
        Top = 341
        Width = 120
        Height = 17
        Caption = 'Telefone......:'
        FocusControl = dbeTelefone3
        Transparent = True
      end
      object Label36: TLabel
        Left = 0
        Top = 370
        Width = 120
        Height = 17
        Caption = 'E-mail........:'
        Transparent = True
      end
      object Label37: TLabel
        Left = 340
        Top = 340
        Width = 40
        Height = 17
        Caption = 'Fax.:'
        FocusControl = dbeFax3
        Transparent = True
      end
      object debRep1: TDBEdit
        Left = 126
        Top = 10
        Width = 458
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'repre1'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 0
      end
      object dbeCont1: TDBEdit
        Left = 126
        Top = 39
        Width = 458
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'rpcon1'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 1
      end
      object dbeTelefon1: TDBEdit
        Left = 126
        Top = 68
        Width = 196
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'rptel1'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = dbeCodKeyPress
      end
      object dbefax1: TDBEdit
        Left = 389
        Top = 68
        Width = 195
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'rpfax1'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = dbeCodKeyPress
      end
      object dbcdedtemailrepresentante1: TRxDBComboEdit
        Left = 129
        Top = 98
        Width = 456
        Height = 26
        ButtonHint = 'Clique para enviar um e-mail'
        CharCase = ecLowerCase
        Ctl3D = True
        DataField = 'rpema1'
        DataSource = DataSource
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FFFFFF00CCDC
          DF00ACB9BC00939EA00097A3A500AAB8BA00BECDCF00CADADD00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8BD
          B000E2AB9200B78F7D008C7D75007D8180008B9698009FACAE00B1BFC100BFCE
          D000C9D9DB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7B7
          A000FECAAA00FED1B300EBBB9E00BF9681009E8376007C787600788283008893
          950099A5A800ABB9BB00BAC9CC00C6D6D900FFFFFF00FFFFFF00D5E5E800EDBF
          A700FFE0C500FECFB400FFE3CB00FFE3CB00FFDABF00F3C6AC00D2A08900A88B
          7C00867B7400727B7D00828C8E0095A1A300B0BEC100FFFFFF00D2DFE000F7CB
          B300FFE8D200FFDFC700FDD3BD00FFEBDC00FFEBDA00FFE9D700FFEAD600FFE2
          CC00FAD4BB00E4B7A000B18C7B008E7B73008F9A9C00C2D1D400D5CBC500FEDE
          CC00FFEBDB00FFEAD700FEE0CB00FEDFCE00FFF4EA00FFF1E600FFEFE300FFEF
          E300FFF0E200FEE7D500FED7C000E8A98D0089949600C0CFD200DBC9C000FFEB
          DE00FFF0E400FFEFE200FFF5E500FFD6C000F7DDD400FFFFFD00FFFEF600FFF2
          E800FDDCCC00FDD6C000FFE5D000D1A59000939FA100C5D5D800DEC3B600FFF5
          EE00FFFAF100FFF2E400DFCEC70075A0C000649AC200DDD6D800D4CCCF00E7C6
          BA00FFEAD800FFEEDF00FFEEDE00BA9383009DA9AB00CADADD00E9C6B900FFFF
          FB00E8D8D3008EAAC1004FA5D80047B6F10047B3EE004B97C900409BD300649F
          C800F8E2D400FFF6EC00FFEBDE00A9928900A7B4B600D0E0E300F5CBB900B0C6
          D30066B4DA0053C0F4005FCAF9005FC6F6005DC4F50057C4F80057C3F80048B5
          EF0090ACC300FFF5EB00FEEEE4009A887F00B3C1C300D5E5E80092AEC50051AF
          DC0060C4ED0067C7EF0065C7EF0066C8F10063C6F10062C5F10064C8F50062CA
          F80051B8EB00C0C9D200F5DACB0093959500BFCFD100FFFFFF00D2E6EA0072AE
          D00065C1E30076D5F20076D4F3006FCEEF006DCCEF006BCBEF0066C6ED0065C6
          ED005FC6F10067B7DE00D8ADA100AFBBBE00FFFFFF00FFFFFF00FFFFFF00D4E6
          EA0075B0D0006EC7E50081DDF40085E3F90082E0F80080DEF7007EDCF70079D8
          F50063C0E5004A9AC700B3BABC00CFDFE200FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00D3E6EA0077B1D00072C9E3008AE4F40090EBF9008BE6F7007ED9F0005EB5
          D80074A4BE00C0D1D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00D5E6EA008EBED60076CBE20092EAF4007AD1E70064A8C7009EBA
          C800CFDFE200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF0096C4D9006CB9D40088B5CC00C6D7DB00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
        ButtonWidth = 26
        NumGlyphs = 1
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
      end
      object dbcdedtemailrepresentante2: TRxDBComboEdit
        Left = 128
        Top = 234
        Width = 456
        Height = 26
        ButtonHint = 'Clique para enviar um e-mail'
        CharCase = ecLowerCase
        Ctl3D = True
        DataField = 'rpema2'
        DataSource = DataSource
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FFFFFF00CCDC
          DF00ACB9BC00939EA00097A3A500AAB8BA00BECDCF00CADADD00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8BD
          B000E2AB9200B78F7D008C7D75007D8180008B9698009FACAE00B1BFC100BFCE
          D000C9D9DB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7B7
          A000FECAAA00FED1B300EBBB9E00BF9681009E8376007C787600788283008893
          950099A5A800ABB9BB00BAC9CC00C6D6D900FFFFFF00FFFFFF00D5E5E800EDBF
          A700FFE0C500FECFB400FFE3CB00FFE3CB00FFDABF00F3C6AC00D2A08900A88B
          7C00867B7400727B7D00828C8E0095A1A300B0BEC100FFFFFF00D2DFE000F7CB
          B300FFE8D200FFDFC700FDD3BD00FFEBDC00FFEBDA00FFE9D700FFEAD600FFE2
          CC00FAD4BB00E4B7A000B18C7B008E7B73008F9A9C00C2D1D400D5CBC500FEDE
          CC00FFEBDB00FFEAD700FEE0CB00FEDFCE00FFF4EA00FFF1E600FFEFE300FFEF
          E300FFF0E200FEE7D500FED7C000E8A98D0089949600C0CFD200DBC9C000FFEB
          DE00FFF0E400FFEFE200FFF5E500FFD6C000F7DDD400FFFFFD00FFFEF600FFF2
          E800FDDCCC00FDD6C000FFE5D000D1A59000939FA100C5D5D800DEC3B600FFF5
          EE00FFFAF100FFF2E400DFCEC70075A0C000649AC200DDD6D800D4CCCF00E7C6
          BA00FFEAD800FFEEDF00FFEEDE00BA9383009DA9AB00CADADD00E9C6B900FFFF
          FB00E8D8D3008EAAC1004FA5D80047B6F10047B3EE004B97C900409BD300649F
          C800F8E2D400FFF6EC00FFEBDE00A9928900A7B4B600D0E0E300F5CBB900B0C6
          D30066B4DA0053C0F4005FCAF9005FC6F6005DC4F50057C4F80057C3F80048B5
          EF0090ACC300FFF5EB00FEEEE4009A887F00B3C1C300D5E5E80092AEC50051AF
          DC0060C4ED0067C7EF0065C7EF0066C8F10063C6F10062C5F10064C8F50062CA
          F80051B8EB00C0C9D200F5DACB0093959500BFCFD100FFFFFF00D2E6EA0072AE
          D00065C1E30076D5F20076D4F3006FCEEF006DCCEF006BCBEF0066C6ED0065C6
          ED005FC6F10067B7DE00D8ADA100AFBBBE00FFFFFF00FFFFFF00FFFFFF00D4E6
          EA0075B0D0006EC7E50081DDF40085E3F90082E0F80080DEF7007EDCF70079D8
          F50063C0E5004A9AC700B3BABC00CFDFE200FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00D3E6EA0077B1D00072C9E3008AE4F40090EBF9008BE6F7007ED9F0005EB5
          D80074A4BE00C0D1D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00D5E6EA008EBED60076CBE20092EAF4007AD1E70064A8C7009EBA
          C800CFDFE200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF0096C4D9006CB9D40088B5CC00C6D7DB00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
        ButtonWidth = 26
        NumGlyphs = 1
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 9
      end
      object dbeTelefone2: TDBEdit
        Left = 126
        Top = 204
        Width = 196
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'rptel2'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 7
        OnKeyPress = dbeCodKeyPress
      end
      object dbeCont2: TDBEdit
        Left = 126
        Top = 175
        Width = 458
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'rpcon2'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 6
      end
      object dbeRep2: TDBEdit
        Left = 126
        Top = 146
        Width = 458
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'repre2'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 5
      end
      object dbeFax2: TDBEdit
        Left = 389
        Top = 204
        Width = 195
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'rpfax2'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 8
        OnKeyPress = dbeCodKeyPress
      end
      object dbcdedtemailrepresentante3: TRxDBComboEdit
        Left = 131
        Top = 370
        Width = 457
        Height = 26
        ButtonHint = 'Clique para enviar um e-mail'
        CharCase = ecLowerCase
        Ctl3D = True
        DataField = 'rpema3'
        DataSource = DataSource
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FFFFFF00CCDC
          DF00ACB9BC00939EA00097A3A500AAB8BA00BECDCF00CADADD00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8BD
          B000E2AB9200B78F7D008C7D75007D8180008B9698009FACAE00B1BFC100BFCE
          D000C9D9DB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7B7
          A000FECAAA00FED1B300EBBB9E00BF9681009E8376007C787600788283008893
          950099A5A800ABB9BB00BAC9CC00C6D6D900FFFFFF00FFFFFF00D5E5E800EDBF
          A700FFE0C500FECFB400FFE3CB00FFE3CB00FFDABF00F3C6AC00D2A08900A88B
          7C00867B7400727B7D00828C8E0095A1A300B0BEC100FFFFFF00D2DFE000F7CB
          B300FFE8D200FFDFC700FDD3BD00FFEBDC00FFEBDA00FFE9D700FFEAD600FFE2
          CC00FAD4BB00E4B7A000B18C7B008E7B73008F9A9C00C2D1D400D5CBC500FEDE
          CC00FFEBDB00FFEAD700FEE0CB00FEDFCE00FFF4EA00FFF1E600FFEFE300FFEF
          E300FFF0E200FEE7D500FED7C000E8A98D0089949600C0CFD200DBC9C000FFEB
          DE00FFF0E400FFEFE200FFF5E500FFD6C000F7DDD400FFFFFD00FFFEF600FFF2
          E800FDDCCC00FDD6C000FFE5D000D1A59000939FA100C5D5D800DEC3B600FFF5
          EE00FFFAF100FFF2E400DFCEC70075A0C000649AC200DDD6D800D4CCCF00E7C6
          BA00FFEAD800FFEEDF00FFEEDE00BA9383009DA9AB00CADADD00E9C6B900FFFF
          FB00E8D8D3008EAAC1004FA5D80047B6F10047B3EE004B97C900409BD300649F
          C800F8E2D400FFF6EC00FFEBDE00A9928900A7B4B600D0E0E300F5CBB900B0C6
          D30066B4DA0053C0F4005FCAF9005FC6F6005DC4F50057C4F80057C3F80048B5
          EF0090ACC300FFF5EB00FEEEE4009A887F00B3C1C300D5E5E80092AEC50051AF
          DC0060C4ED0067C7EF0065C7EF0066C8F10063C6F10062C5F10064C8F50062CA
          F80051B8EB00C0C9D200F5DACB0093959500BFCFD100FFFFFF00D2E6EA0072AE
          D00065C1E30076D5F20076D4F3006FCEEF006DCCEF006BCBEF0066C6ED0065C6
          ED005FC6F10067B7DE00D8ADA100AFBBBE00FFFFFF00FFFFFF00FFFFFF00D4E6
          EA0075B0D0006EC7E50081DDF40085E3F90082E0F80080DEF7007EDCF70079D8
          F50063C0E5004A9AC700B3BABC00CFDFE200FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00D3E6EA0077B1D00072C9E3008AE4F40090EBF9008BE6F7007ED9F0005EB5
          D80074A4BE00C0D1D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00D5E6EA008EBED60076CBE20092EAF4007AD1E70064A8C7009EBA
          C800CFDFE200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF0096C4D9006CB9D40088B5CC00C6D7DB00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
        ButtonWidth = 26
        NumGlyphs = 1
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 14
      end
      object dbeTelefone3: TDBEdit
        Left = 126
        Top = 340
        Width = 196
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'rptel3'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 12
        OnKeyPress = dbeCodKeyPress
      end
      object dbeFax3: TDBEdit
        Left = 389
        Top = 340
        Width = 195
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'rpfax3'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 13
        OnKeyPress = dbeCodKeyPress
      end
      object dbeCont3: TDBEdit
        Left = 126
        Top = 311
        Width = 458
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'rpcon3'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 11
      end
      object dbeRep3: TDBEdit
        Left = 126
        Top = 282
        Width = 458
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'rpema3'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 10
      end
    end
  end
  inherited DataSource: TDataSource
    Left = 96
    Top = 312
  end
end
