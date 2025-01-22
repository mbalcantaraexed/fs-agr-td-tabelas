using {br.agr.fs.td.tabelas.db as dbTabelas} from '../db/schema';

service TabelasServices @(path : '/admin'){

    entity Prospeccao     as projection on dbTabelas.ProspeccaoCab;
    entity ProspeccaoItem as projection on dbTabelas.ProspeccaoItem;
    entity ProspeccaoIndex as projection on dbTabelas.ProspeccaoIndex;
    entity Programacao as projection on dbTabelas.Programacao;

}
