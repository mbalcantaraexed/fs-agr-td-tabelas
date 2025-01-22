using {
    managed,
    cuid,
    Currency,
    sap.common.CodeList
} from '@sap/cds/common';

namespace br.agr.fs.td.tabelas.db;

entity ModalidaPag : CodeList {
    key code      : Int16;
        descricao : localized String(100) not null
};

entity Spot : CodeList {
    key code : Int16;
}

entity StatusContrato : CodeList {
    key code      : Int16;
        descricao : localized String(100) not null
};

entity CompraVenda : CodeList {
    key code      : Int16;
        descricao : String(100) not null
};

aspect ProspeccaoNumber {
    ProspeccaoNumber : String(10) not null;
}

entity ProspeccaoCab : cuid, ProspeccaoNumber, managed {
    ProspeccaoItem        : Composition of many ProspeccaoItem
                                on ProspeccaoItem.Cabecalho = $self;
    Empresa               : String(4);
    ClienteEmissor        : String(10);
    Fornecedor            : String(10);
    DataCriacao           : Date;
    GrupoCompradores      : String(3);
    OrganizacaoCompras    : String(4);
    CondPagamento         : String(4);
    PrazoCotacao          : String(4);
    InicioPeriodoVal      : Date;
    FimPeriodoVal         : Date;
    SuaReferencia         : String(10);
    Vendedor              : String(12);
    TipoMeioTransporte    : String(4);
    ModalidadePagamento   : Association[1] to ModalidaPag;
    Safra                 : String(3);
    StatusContrato        : Association[1] to StatusContrato;
    Incoterms             : String(3);
    DataRetirada          : Date;
    ReferenciaCliente     : String(35);
    FormaPagamentoVenda   : String(1);
    DataEfetiva           : Date;
    ClienteRecebedor      : String(10);
    DataReferenciaCliente : Date;
    Congenere             : String(10);
    ClienteDescarga       : String(10);
    AreaVendas            : String(4);
    CondPagamentoVenda    : String(4);
    TipoListaPreco        : String(2);
    CDI                   : String(10);
}

entity ProspeccaoItem : cuid, ProspeccaoNumber {
    Cabecalho       : Association to ProspeccaoCab;
    Item            : String(5);
    Material        : String(40);
    QuantidadeTotal : Decimal(13, 2);
    Centro          : String(4);
    Deposito        : String(4);
    IVA             : String(2);

    @Semantics.amount.currencyCode: 'currency'
    ValorLiquido    : Decimal(10, 2);
    Moeda           : Currency
}

entity ProspeccaoIndex : cuid, ProspeccaoNumber {
    Cabecalho            : Association to ProspeccaoCab;
    Item                 : String(5);
    Modalidade           : Association[1] to Spot;
    Material             : String(40);
    QuantidadeTotal      : Decimal(13, 2);
    Centro               : String(4);
    Deposito             : String(4);
    IVA                  : String(2);

    @Semantics.amount.currencyCode: 'currency'
    PrecoVenda           : Decimal(10, 2);

    @Semantics.amount.currencyCode: 'currency'
    PrecoCompra          : Decimal(10, 2);
    CompraVenda          : Association[1] to CompraVenda;
    MesPrecificacao      : String(2);
    SemanaPrecificacao   : String(2);
    TipoMeioTransporte   : String(2);
    DiferencialLogistico : Decimal(10, 2);

    @Semantics.amount.currencyCode: 'currency'
    AjusteCalculo        : Decimal(10, 2);
    TakeOrPaty           : Decimal(10, 2);

    @Semantics.amount.currencyCode: 'currency'
    CustoGanhoFinanceiro : Decimal(10, 2);
    Ptax                 : Decimal(10, 2);

    @Semantics.amount.currencyCode: 'currency'
    PrecoSpot            : Decimal(10, 2);

    @Semantics.amount.currencyCode: 'currency'
    CustoLogistico       : Decimal(10, 2);

    OutrosCustos         : Decimal(10, 2);
    PisCofins            : Decimal(10, 2);
    Icms                 : Decimal(10, 2);
    ValorIcms            : Decimal(10, 2);
    PautaFiscal          : Decimal(10, 2);
    PrecoFinal           : Decimal(10, 2);
    PlBasis              : Decimal(10, 2);
}

entity Programacao : cuid, ProspeccaoNumber {
    Item       : String(5);
    MesAno     : String(6);
    Quantidade : Decimal(10, 3);
}
