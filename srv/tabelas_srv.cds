using {br.agr.fs.td.tabelas.tabelas as dbTabelas} from '../db/schema';

service TabelasServices {

    entity Prospeccao     as projection on dbTabelas.ProspeccaoCab;
    entity ProspeccaoItem as projection on dbTabelas.ProspeccaoItem;

}
