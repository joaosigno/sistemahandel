inherited frmManuCheques: TfrmManuCheques
  Left = 805
  Top = 118
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
      Caption = 'In'#237'cio'
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
        TabOrder = 4
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
        TabOrder = 5
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
        TabOrder = 6
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
        TabOrder = 7
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
        TabOrder = 8
      end
      object dbeEmitente: TDBEdit
        Left = 80
        Top = 153
        Width = 225
        Height = 22
        CharCase = ecUpperCase
        DataField = 'emtChq'
        DataSource = DataSource
        TabOrder = 10
        OnExit = dbeEmitenteExit
      end
      object dbeCMC7: TDBEdit
        Left = 81
        Top = 46
        Width = 440
        Height = 22
        DataField = 'cmc7'
        DataSource = DataSource
        TabOrder = 3
        OnExit = dbeCMC7Exit
        OnKeyPress = dbeCMC7KeyPress
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
        TabOrder = 2
        ValueChecked = 'N'
        ValueUnchecked = 'S'
        OnClick = dbcbEmitidoClick
      end
      object dbdtCadastro: TDBDateEdit
        Left = 273
        Top = 18
        Width = 107
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
        TabOrder = 1
      end
      object dbDtVencimento: TDBDateEdit
        Left = 409
        Top = 151
        Width = 112
        Height = 21
        DataField = 'dtVenc'
        DataSource = DataSource
        ButtonHint = 'Clique para abrir o calend'#225'rio'
        Ctl3D = True
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
        TabOrder = 11
      end
      object ddbcbStatus: TDBComboBox
        Left = 79
        Top = 234
        Width = 194
        Height = 22
        Style = csDropDownList
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'status'
        DataSource = DataSource
        ItemHeight = 14
        Items.Strings = (
          'BAIXADO'
          'DEVOLVIDO'
          'PENDENTE')
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
      end
      object dbeCodCli: TDBEdit
        Left = 80
        Top = 208
        Width = 105
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'codcli'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 13
      end
      object dblkpcbCliente: TDBLookupComboBox
        Left = 189
        Top = 208
        Width = 327
        Height = 20
        Ctl3D = False
        DataField = 'procuraCLiente'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 14
      end
      object dbeValor: TRxDBCalcEdit
        Left = 345
        Top = 124
        Width = 174
        Height = 21
        DataField = 'valor'
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
        TabOrder = 9
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
        Ctl3D = False
        DataField = 'obs'
        DataSource = DataSource
        ParentCtl3D = False
        TabOrder = 0
      end
    end
  end
  inherited imManutencao: TImageList
    Left = 256
    Top = 0
  end
  inherited DataSource: TDataSource
    Left = 168
    Top = 16
  end
end
