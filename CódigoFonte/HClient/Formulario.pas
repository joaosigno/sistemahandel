unit Formulario;

interface

uses
  Forms, DBClient;

type
  TFormulario = class
      constructor Create(tabela : String);
      procedure montaGrid();
      private
        FTabela:String;
      public
        Identificador : String;  
  end;

var
  FormDAO : TFormulario;

implementation

uses untVisualizaDados, untManuFornecedores, untManutencao, untDM,
  untPrincipal, Controls;

{ TFormluario }


constructor TFormulario.Create(tabela: String);
begin
  FTabela := tabela;
end;

procedure TFormulario.montaGrid();
begin
   if FTabela = 'forne' then
   begin
      with frmVizualizaDados do
      begin
        grid.Columns.Add;
        grid.Columns[0].FieldName := 'cdforn';
        grid.Columns[0].Width := 80;

        grid.Columns.Add;
        grid.Columns[1].FieldName := 'pesfis';
        grid.Columns[1].Width := 65;

        grid.Columns.Add;
        grid.Columns[2].FieldName := 'nmfant';
        grid.Columns[2].Width := 325;

        grid.Columns.Add;
        grid.Columns[3].FieldName := 'rzsoci';
        grid.Columns[3].Width := 325;

        grid.Columns.Add;
        grid.Columns[4].FieldName := 'cidade';
        grid.Columns[4].Width := 205;

        grid.Columns.Add;
        grid.Columns[5].FieldName := 'uf';
        grid.Columns[5].Width :=  22;

        grid.Columns.Add;
        grid.Columns[6].FieldName := 'telefo';
        grid.Columns[6].Width :=  130;

        grid.Columns.Add;
        grid.Columns[7].FieldName := 'fax';
        grid.Columns[7].Width :=  130;

      end;
   end

   else if FTabela = 'empre' then
   begin
    with frmVizualizaDados do
      begin
        grid.Columns.Add;
        grid.Columns[0].FieldName := 'cdempr';
        grid.Columns[0].Width := 65;

        grid.Columns.Add;
        grid.Columns[1].FieldName := 'nmfant';
        grid.Columns[1].Width := 285;

        grid.Columns.Add;
        grid.Columns[2].FieldName := 'rzsoci';
        grid.Columns[2].Width := 285;

        grid.Columns.Add;
        grid.Columns[3].FieldName := 'cgc';
        grid.Columns[3].Width := 100;

        grid.Columns.Add;
        grid.Columns[4].FieldName := 'insest';
        grid.Columns[4].Width := 100;

        grid.Columns.Add;
        grid.Columns[5].FieldName := 'cidade';
        grid.Columns[5].Width :=  155;

        grid.Columns.Add;
        grid.Columns[6].FieldName := 'uf';
        grid.Columns[6].Width :=  22;

        grid.Columns.Add;
        grid.Columns[7].FieldName := 'tpempr';
        grid.Columns[7].Width :=  285;

      end;
   end

   else if FTabela = 'grpro' then
   begin
    with frmVizualizaDados do
      begin
        grid.Columns.Add;
        grid.Columns[0].FieldName := 'cdgrup';
        grid.Columns[0].Width := 80;

        grid.Columns.Add;
        grid.Columns[1].FieldName := 'descri';
        grid.Columns[1].Width := 300;

        grid.Columns.Add;
        grid.Columns[2].FieldName := 'acdesc';
        grid.Columns[2].Width := 70;

        grid.Columns.Add;
        grid.Columns[3].FieldName := 'vldesc';
        grid.Columns[3].Width := 130;
      end;
   end

   else if FTabela = 'depar' then
   begin
    with frmVizualizaDados do
      begin
        grid.Columns.Add;
        grid.Columns[0].FieldName := 'cddepa';
        grid.Columns[0].Width := 80;

        grid.Columns.Add;
        grid.Columns[1].FieldName := 'descri';
        grid.Columns[1].Width := 300;
      end;
   end

   else if FTabela = 'profi' then
   begin
    with frmVizualizaDados do
      begin
        grid.Columns.Add;
        grid.Columns[0].FieldName := 'cdprof';
        grid.Columns[0].Width := 80;

        grid.Columns.Add;
        grid.Columns[1].FieldName := 'descri';
        grid.Columns[1].Width := 300;
      end;
   end

   else if FTabela = 'funci' then
   begin
    with frmVizualizaDados do
      begin
        grid.Columns.Add;
        grid.Columns[0].FieldName := 'cdfunc';
        grid.Columns[0].Width := 80;

        grid.Columns.Add;
        grid.Columns[1].FieldName := 'ativo';
        grid.Columns[1].Width := 50;

        grid.Columns.Add;
        grid.Columns[2].FieldName := 'nome';
        grid.Columns[2].Width := 300;

        grid.Columns.Add;
        grid.Columns[3].FieldName := 'sexo';
        grid.Columns[3].Width := 100;

        grid.Columns.Add;
        grid.Columns[4].FieldName := 'endere';
        grid.Columns[4].Width := 300;

        grid.Columns.Add;
        grid.Columns[5].FieldName := 'cidade';
        grid.Columns[5].Width := 200;

        grid.Columns.Add;
        grid.Columns[6].FieldName := 'uf';
        grid.Columns[6].Width :=  30;

        grid.Columns.Add;
        grid.Columns[7].FieldName := 'telefo';
        grid.Columns[7].Width :=  150;
      end;
   end

   else if FTabela = 'clien' then
   begin
      with frmVizualizaDados do
      begin
        grid.Columns.Add;
        grid.Columns[0].FieldName := 'cdclie';
        grid.Columns[0].Width := 80;

        grid.Columns.Add;
        grid.Columns[1].FieldName := 'pesjur';
        grid.Columns[1].Width := 65;

        grid.Columns.Add;
        grid.Columns[2].FieldName := 'ativo';
        grid.Columns[2].Width := 65;

        grid.Columns.Add;
        grid.Columns[3].FieldName := 'nome';
        grid.Columns[3].Width := 325;

        grid.Columns.Add;
        grid.Columns[4].FieldName := 'sexo';
        grid.Columns[4].Width := 100;

        grid.Columns.Add;
        grid.Columns[5].FieldName := 'endere';
        grid.Columns[5].Width :=  300;

        grid.Columns.Add;
        grid.Columns[6].FieldName := 'cidade';
        grid.Columns[6].Width :=  200;

        grid.Columns.Add;
        grid.Columns[7].FieldName := 'uf';
        grid.Columns[7].Width :=  30;

        grid.Columns.Add;
        grid.Columns[8].FieldName := 'telefo';
        grid.Columns[8].Width :=  130;

      end;
   end

   else if FTabela = 'banco' then
   begin
    with frmVizualizaDados do
      begin
        grid.Columns.Add;
        grid.Columns[0].FieldName := 'cdban';
        grid.Columns[0].Width := 80;

        grid.Columns.Add;
        grid.Columns[1].FieldName := 'dtcada';
        grid.Columns[1].Width := 100;

        grid.Columns.Add;
        grid.Columns[2].FieldName := 'descri';
        grid.Columns[2].Width := 325;

      end;
   end

   else if FTabela = 'crfid' then
   begin
    with frmVizualizaDados do
      begin
        grid.Columns.Add;
        grid.Columns[0].FieldName := 'nrcart';
        grid.Columns[0].Width := 200;

        grid.Columns.Add;
        grid.Columns[1].FieldName := 'ativo';
        grid.Columns[1].Width := 80;

        grid.Columns.Add;
        grid.Columns[2].FieldName := 'dtcada';
        grid.Columns[2].Width := 100;

        grid.Columns.Add;
        grid.Columns[3].FieldName := 'nmcart';
        grid.Columns[3].Width := 325;


        grid.Columns.Add;
        grid.Columns[4].FieldName := 'email';
        grid.Columns[4].Width := 325;

      end;
    end

   else if FTabela = 'cheqs' then
   begin
    with frmVizualizaDados do
      begin
        grid.Columns.Add;
        grid.Columns[0].FieldName := 'cdchq';
        grid.Columns[0].Width := 150;

        grid.Columns.Add;
        grid.Columns[1].FieldName := 'dtcada';
        grid.Columns[1].Width := 130;

        grid.Columns.Add;
        grid.Columns[2].FieldName := 'codage';
        grid.Columns[2].Width := 80;

        grid.Columns.Add;
        grid.Columns[3].FieldName := 'codban';
        grid.Columns[3].Width := 100;

        grid.Columns.Add;
        grid.Columns[4].FieldName := 'numchq';
        grid.Columns[4].Width := 150;

        grid.Columns.Add;
        grid.Columns[5].FieldName := 'numcco';
        grid.Columns[5].Width := 150;

        grid.Columns.Add;
        grid.Columns[6].FieldName := 'numc3';
        grid.Columns[6].Width := 50;

        grid.Columns.Add;
        grid.Columns[7].FieldName := 'emtchq';
        grid.Columns[7].Width := 320;

        grid.Columns.Add;
        grid.Columns[8].FieldName := 'valor';
        grid.Columns[8].Width := 150;

        grid.Columns.Add;
        grid.Columns[9].FieldName := 'status';
        grid.Columns[9].Width := 100;

        grid.Columns.Add;
        grid.Columns[10].FieldName := 'cmc7';
        grid.Columns[10].Width := 325;

      end;
    end

   else if FTabela = 'vende' then
   begin
    with frmVizualizaDados do
      begin
        grid.Columns.Add;
        grid.Columns[0].FieldName := 'cdvend';
        grid.Columns[0].Width := 80;

        grid.Columns.Add;
        grid.Columns[1].FieldName := 'nome';
        grid.Columns[1].Width := 300;

        grid.Columns.Add;
        grid.Columns[2].FieldName := 'procuraFuncionario';
        grid.Columns[2].Width := 300;

        grid.Columns.Add;
        grid.Columns[3].FieldName := 'reccom';
        grid.Columns[3].Width := 150;

        grid.Columns.Add;
        grid.Columns[4].FieldName := 'comiss';
        grid.Columns[4].Width := 150;

      end;
    end

    else if FTabela = 'mcpro' then
   begin
    with frmVizualizaDados do
      begin
        grid.Columns.Add;
        grid.Columns[0].FieldName := 'cdmarc';
        grid.Columns[0].Width := 80;

        grid.Columns.Add;
        grid.Columns[1].FieldName := 'dtcada';
        grid.Columns[1].Width := 150;

        grid.Columns.Add;
        grid.Columns[2].FieldName := 'descri';
        grid.Columns[2].Width := 300;

      end;
    end

    else if FTabela = 'produ' then
   begin
    with frmVizualizaDados do
      begin
        grid.Columns.Add;
        grid.Columns[0].FieldName := 'cdprod';
        grid.Columns[0].Width := 80;

        grid.Columns.Add;
        grid.Columns[1].FieldName := 'codfab';
        grid.Columns[1].Width := 130;

        grid.Columns.Add;
        grid.Columns[2].FieldName := 'refere';
        grid.Columns[2].Width := 130;

        grid.Columns.Add;
        grid.Columns[3].FieldName := 'tipopr';
        grid.Columns[3].Width := 100;


        grid.Columns.Add;
        grid.Columns[4].FieldName := 'descri';
        grid.Columns[4].Width := 225;

        grid.Columns.Add;
        grid.Columns[5].FieldName := 'procuraMarca';
        grid.Columns[5].Width := 140;

        grid.Columns.Add;
        grid.Columns[6].FieldName := 'procuraGrupo';
        grid.Columns[6].Width := 140;

        grid.Columns.Add;
        grid.Columns[7].FieldName := 'unidad';
        grid.Columns[7].Width := 90;

        grid.Columns.Add;
        grid.Columns[8].FieldName := 'estatu';
        grid.Columns[8].Width := 90;

        grid.Columns.Add;
        grid.Columns[9].FieldName := 'estmin';
        grid.Columns[9].Width := 90;

        grid.Columns.Add;
        grid.Columns[10].FieldName := 'preven';
        grid.Columns[10].Width := 90;
      end;
    end

    else if FTabela = 'conta' then
   begin
    with frmVizualizaDados do
      begin
        grid.Columns.Add;
        grid.Columns[0].FieldName := 'codcon';
        grid.Columns[0].Width := 80;

        if Identificador = 'R' then
        begin
          grid.Columns.Add;
          grid.Columns[1].FieldName := 'procuraCliente';
          grid.Columns[1].Width := 300;
        end else if Identificador = 'P' then
        begin
          grid.Columns.Add;
          grid.Columns[1].FieldName := 'procuraFornecedor';
          grid.Columns[1].Width := 300;
        end;

        grid.Columns.Add;
        grid.Columns[2].FieldName := 'titulo';
        grid.Columns[2].Width := 80;

        grid.Columns.Add;
        grid.Columns[3].FieldName := 'notcon';
        grid.Columns[3].Width := 80;

        grid.Columns.Add;
        grid.Columns[4].FieldName := 'dtemit';
        grid.Columns[4].Width := 100;

        grid.Columns.Add;
        grid.Columns[5].FieldName := 'vlcont';
        grid.Columns[5].Width := 100;

        grid.Columns.Add;
        grid.Columns[6].FieldName := 'dtvenc';
        grid.Columns[6].Width := 100;

        grid.Columns.Add;
        grid.Columns[7].FieldName := 'dtpaga';
        grid.Columns[7].Width := 100;

        grid.Columns.Add;
        grid.Columns[8].FieldName := 'jurpag';
        grid.Columns[8].Width := 80;

        grid.Columns.Add;
        grid.Columns[9].FieldName := 'mulpag';
        grid.Columns[9].Width := 80;

        grid.Columns.Add;
        grid.Columns[10].FieldName := 'descon';
        grid.Columns[10].Width := 80;

        grid.Columns.Add;
        grid.Columns[11].FieldName := 'valpag';
        grid.Columns[11].Width := 100;
      end;
    end

    else if FTabela = 'trans' then
   begin
    with frmVizualizaDados do
      begin
        grid.Columns.Add;
        grid.Columns[0].FieldName := 'cdtran';
        grid.Columns[0].Width := 80;

        grid.Columns.Add;
        grid.Columns[1].FieldName := 'nmfant';
        grid.Columns[1].Width := 230;

        grid.Columns.Add;
        grid.Columns[2].FieldName := 'rzsoci';
        grid.Columns[2].Width := 230;

        grid.Columns.Add;
        grid.Columns[3].FieldName := 'cidade';
        grid.Columns[3].Width := 200;

        grid.Columns.Add;
        grid.Columns[4].FieldName := 'uf';
        grid.Columns[4].Width := 60;

        grid.Columns.Add;
        grid.Columns[5].FieldName := 'telefo';
        grid.Columns[5].Width := 140;

        grid.Columns.Add;
        grid.Columns[6].FieldName := 'fax';
        grid.Columns[6].Width := 140;

        grid.Columns.Add;
        grid.Columns[7].FieldName := 'respon';
        grid.Columns[7].Width := 230;
      end;
    end

     else if FTabela = 'grcli' then
   begin
    with frmVizualizaDados do
      begin
        grid.Columns.Add;
        grid.Columns[0].FieldName := 'cdgrup';
        grid.Columns[0].Width := 80;

        grid.Columns.Add;
        grid.Columns[1].FieldName := 'descri';
        grid.Columns[1].Width := 300;

        grid.Columns.Add;
        grid.Columns[2].FieldName := 'grbloq';
        grid.Columns[2].Width := 150;
      end;
    end

    else if FTabela = 'ctban' then
   begin
      with frmVizualizaDados do
      begin
        grid.Columns.Add;
        grid.Columns[0].FieldName := 'cdcont';
        grid.Columns[0].Width := 80;

        grid.Columns.Add;
        grid.Columns[1].FieldName := 'dtaber';
        grid.Columns[1].Width := 80;

        grid.Columns.Add;
        grid.Columns[2].FieldName := 'descri';
        grid.Columns[2].Width := 280;

        grid.Columns.Add;
        grid.Columns[3].FieldName := 'agenci';
        grid.Columns[3].Width := 100;

        grid.Columns.Add;
        grid.Columns[4].FieldName := 'nrcont';
        grid.Columns[4].Width := 100;

        grid.Columns.Add;
        grid.Columns[5].FieldName := 'procuraBanco';
        grid.Columns[5].Width :=  200;

        grid.Columns.Add;
        grid.Columns[6].FieldName := 'gerent';
        grid.Columns[6].Width :=  280;

        grid.Columns.Add;
        grid.Columns[7].FieldName := 'limite';
        grid.Columns[7].Width :=  90;

        grid.Columns.Add;
        grid.Columns[8].FieldName := 'dtvenc';
        grid.Columns[8].Width :=  80;

      end;
   end;

   with frmVizualizaDados do
   begin
      Width := frmPrincipal.Width-10;
      Left := frmPrincipal.Left+5;
      Height := frmPrincipal.imgPrincipal.Height+20;
      Top := frmPrincipal.imgPrincipal.Top+25;
   end;
end;

end.
