inherited frmManuGrupoProdutos: TfrmManuGrupoProdutos
  Left = 352
  Top = 171
  Caption = 'Manuten'#231#227'o de Grupos de Produtos'
  ClientHeight = 210
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  inherited tbManutencao: TToolBar
    Top = 150
  end
  object pgGruposProdutos: TPageControl [1]
    Left = 0
    Top = 0
    Width = 534
    Height = 150
    ActivePage = tbDadosPrincipais
    Align = alClient
    TabOrder = 1
    object tbDadosPrincipais: TTabSheet
      Caption = 'In'#237'cio'
      object Label1: TLabel
        Left = 1
        Top = 11
        Width = 119
        Height = 14
        Caption = 'C'#243'digo..........:'
      end
      object Label3: TLabel
        Left = 0
        Top = 35
        Width = 119
        Height = 14
        Caption = 'Descri'#231#227'o.......:'
        FocusControl = dbeDescricao
      end
      object Label5: TLabel
        Left = 0
        Top = 78
        Width = 119
        Height = 14
        Caption = 'Desc. M'#225'ximo(%).:'
        FocusControl = dbeValorDesconto
      end
      object Label18: TLabel
        Left = 296
        Top = 10
        Width = 105
        Height = 14
        Caption = 'Data Cadastro.:'
        Transparent = True
      end
      object dbeDescricao: TDBEdit
        Left = 120
        Top = 34
        Width = 393
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'descri'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 2
        OnExit = dbeDescricaoExit
      end
      object dbeValorDesconto: TDBEdit
        Left = 120
        Top = 77
        Width = 73
        Height = 20
        Ctl3D = False
        DataField = 'vldesc'
        DataSource = DataSource
        Enabled = False
        ParentCtl3D = False
        TabOrder = 4
        OnKeyPress = dbeValorDescontoKeyPress
      end
      object dbeCod: TDBEdit
        Left = 120
        Top = 10
        Width = 89
        Height = 20
        Color = 13425885
        Ctl3D = False
        DataField = 'cdgrup'
        DataSource = DataSource
        Enabled = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object dbcbControlarDesconto: TDBCheckBox
        Left = 120
        Top = 57
        Width = 169
        Height = 17
        Caption = 'Controlar Desconto?'
        Ctl3D = True
        DataField = 'acdesc'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 3
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = dbcbControlarDescontoClick
      end
      object dbdateedtdatacadastro: TDBDateEdit
        Left = 401
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
    object tsPromocao: TTabSheet
      Caption = 'Promo'#231#227'o'
      ImageIndex = 1
      object dbcbxGrupoPromocao: TDBCheckBox
        Left = 5
        Top = 1
        Width = 180
        Height = 17
        Caption = 'Grupo em Promo'#231#227'o?'
        Ctl3D = False
        DataField = 'grupro'
        DataSource = DataSource
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = dbcbxGrupoPromocaoClick
      end
      object gbPromocional: TGroupBox
        Left = 2
        Top = 18
        Width = 513
        Height = 102
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 1
        object Label2: TLabel
          Left = 304
          Top = 23
          Width = 203
          Height = 14
          Caption = 'Valor do Desc.(%) Promocional'
        end
        object Bevel1: TBevel
          Left = 295
          Top = 10
          Width = 4
          Height = 87
        end
        object dbValidoAteData: TDBCheckBox
          Left = 5
          Top = 12
          Width = 164
          Height = 17
          Caption = 'At'#233'................:'
          DataField = 'tpprom'
          DataSource = DataSource
          TabOrder = 0
          ValueChecked = 'VD'
          ValueUnchecked = 'N'
          OnClick = dbValidoAteDataClick
        end
        object dbValidoAteDiaSemana: TDBCheckBox
          Left = 6
          Top = 42
          Width = 163
          Height = 17
          Caption = 'Todo Dia...........:'
          DataField = 'tpprom'
          DataSource = DataSource
          TabOrder = 1
          ValueChecked = 'TD'
          ValueUnchecked = 'N'
          OnClick = dbValidoAteDiaSemanaClick
        end
        object ValidoTodosOsdia: TDBCheckBox
          Left = 7
          Top = 71
          Width = 154
          Height = 17
          Caption = 'Apenas em todas a..:'
          DataField = 'tpprom'
          DataSource = DataSource
          TabOrder = 2
          ValueChecked = 'DS'
          ValueUnchecked = 'N'
          OnClick = ValidoTodosOsdiaClick
        end
        object dbdeClienteDesd: TDBDateEdit
          Left = 162
          Top = 10
          Width = 128
          Height = 21
          DataField = 'dtvali'
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
          TabOrder = 3
        end
        object dbeDia: TDBEdit
          Left = 163
          Top = 40
          Width = 127
          Height = 20
          DataField = 'vlddia'
          DataSource = DataSource
          TabOrder = 4
        end
        object dbcbDiasSemanas: TDBComboBox
          Left = 163
          Top = 67
          Width = 128
          Height = 22
          Style = csDropDownList
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'vldsem'
          DataSource = DataSource
          ItemHeight = 14
          Items.Strings = (
            '0 - SEGUNDA-FEIRA'
            '1 - TER'#199'A-FEIRA'
            '2 - QUARTA-FEIRA'
            '3 - QUINTA-FEIRA'
            '4 - SEXTA-FEIRA'
            '5 - S'#193'BADO'
            '6 - DOMINGO')
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
        object dbeValor: TRxDBCalcEdit
          Left = 369
          Top = 39
          Width = 137
          Height = 21
          DataField = 'despro'
          DataSource = DataSource
          ButtonHint = 'Clique para abrir a calculadora'
          Ctl3D = False
          DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
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
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
        end
      end
    end
  end
  inherited imManutencao: TImageList
    Left = 376
    Top = 152
  end
  inherited DataSource: TDataSource
    DataSet = dm.cdsGRPro
    Left = 224
    Top = 160
  end
end
