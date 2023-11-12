-- Gerado por Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   em:        2023-08-28 15:31:35 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g


/*
DROP TABLE t_agf_cidade CASCADE CONSTRAINTS;

DROP TABLE t_agf_custo_fixo CASCADE CONSTRAINTS;

DROP TABLE t_agf_custo_operacional CASCADE CONSTRAINTS;

DROP TABLE t_agf_custo_variavel CASCADE CONSTRAINTS;

DROP TABLE t_agf_depreciacao CASCADE CONSTRAINTS;

DROP TABLE t_agf_despesa CASCADE CONSTRAINTS;

DROP TABLE t_agf_lavoura CASCADE CONSTRAINTS;

DROP TABLE t_agf_outros_fixos CASCADE CONSTRAINTS;

DROP TABLE t_agf_pessoa_fisica CASCADE CONSTRAINTS;

DROP TABLE t_agf_pessoa_juridica CASCADE CONSTRAINTS;

DROP TABLE t_agf_pos_colheita CASCADE CONSTRAINTS;

DROP TABLE t_agf_preco_despesa CASCADE CONSTRAINTS;

DROP TABLE t_agf_producao CASCADE CONSTRAINTS;

DROP TABLE t_agf_produtor CASCADE CONSTRAINTS;

*/

CREATE TABLE t_agf_cidade (
    cd_cidade NUMBER(5) NOT NULL,
    ds_cidade VARCHAR2(30) NOT NULL,
    sg_estado CHAR(2) NOT NULL
);

ALTER TABLE t_agf_cidade ADD CONSTRAINT pk_t_agf_cidade PRIMARY KEY ( cd_cidade );

CREATE TABLE t_agf_custo_fixo (
    cd_custo_fixo NUMBER(5) NOT NULL,
    cd_producao   NUMBER(5) NOT NULL,
    sg_custo_fixo CHAR(3) NOT NULL
);

CREATE UNIQUE INDEX idx__t_agf_cf ON
    t_agf_custo_fixo (
        cd_producao
    ASC );

ALTER TABLE t_agf_custo_fixo ADD CONSTRAINT pk_t_agf_cf PRIMARY KEY ( cd_custo_fixo );

CREATE TABLE t_agf_custo_operacional (
    cd_custo_op NUMBER(5) NOT NULL,
    cd_producao NUMBER(5) NOT NULL,
    sg_custo_op CHAR(3) NOT NULL
);

CREATE UNIQUE INDEX idx__t_agf_custo_op ON
    t_agf_custo_operacional (
        cd_producao
    ASC );

ALTER TABLE t_agf_custo_operacional ADD CONSTRAINT pk_t_agf_custo_op PRIMARY KEY ( cd_custo_op );

CREATE TABLE t_agf_custo_variavel (
    cd_variavel NUMBER(5) NOT NULL,
    cd_producao NUMBER(5) NOT NULL,
    sg_variavel CHAR(3) NOT NULL
);

CREATE UNIQUE INDEX idx__t_agf_cv ON
    t_agf_custo_variavel (
        cd_producao
    ASC );

ALTER TABLE t_agf_custo_variavel ADD CONSTRAINT pk_t_agf_cv PRIMARY KEY ( cd_variavel );

CREATE TABLE t_agf_depreciacao (
    cd_depreciacao   NUMBER(5) NOT NULL,
    cd_producao      NUMBER(5) NOT NULL,
    sg_depreciacao   CHAR(3) NOT NULL,
    vl_preco_dep_ben NUMBER(7, 2) NOT NULL,
    vl_preco_dep_imp NUMBER(7, 2) NOT NULL,
    vl_preco_dep_anm NUMBER(7, 2) NOT NULL,
    vl_preco_dep_maq NUMBER(7, 2) NOT NULL
);

CREATE UNIQUE INDEX idx__t_agf_deprec ON
    t_agf_depreciacao (
        cd_producao
    ASC );

ALTER TABLE t_agf_depreciacao ADD CONSTRAINT ck_t_agf_deprec_ben CHECK ( vl_preco_dep_ben >= 150 );

ALTER TABLE t_agf_depreciacao ADD CONSTRAINT ck_t_agf_deprec_imp CHECK ( vl_preco_dep_imp >= 200 );

ALTER TABLE t_agf_depreciacao ADD CONSTRAINT ck_t_agf_deprec_anm CHECK ( vl_preco_dep_anm >= 100 );

ALTER TABLE t_agf_depreciacao ADD CONSTRAINT ck_t_agf_deprec_maq CHECK ( vl_preco_dep_maq >= 150 );

ALTER TABLE t_agf_depreciacao ADD CONSTRAINT pk_t_agf_deprec PRIMARY KEY ( cd_depreciacao );

CREATE TABLE t_agf_despesa (
    cd_despesa NUMBER(5) NOT NULL,
    cd_lavoura NUMBER(5) NOT NULL,
    nm_despesa VARCHAR2(50) NOT NULL
);

ALTER TABLE t_agf_despesa ADD CONSTRAINT pk_t_agf_despesa PRIMARY KEY ( cd_despesa );

CREATE TABLE t_agf_lavoura (
    cd_lavoura  NUMBER(5) NOT NULL,
    cd_producao NUMBER(5) NOT NULL,
    sg_lavoura  CHAR(3) NOT NULL
);

CREATE UNIQUE INDEX idx__t_agf_lav ON
    t_agf_lavoura (
        cd_producao
    ASC );

ALTER TABLE t_agf_lavoura ADD CONSTRAINT pk_t_agf_lavoura PRIMARY KEY ( cd_lavoura );

CREATE TABLE t_agf_outros_fixos (
    cd_outros_fixos      NUMBER(5) NOT NULL,
    cd_producao          NUMBER(5) NOT NULL,
    sg_outros_fixos      CHAR(3) NOT NULL,
    vl_preco_man_maq     NUMBER(7, 2) NOT NULL,
    vl_preco_eng_sociais NUMBER(7, 2) NOT NULL,
    vl_preco_seg_fixo    NUMBER(7, 2) NOT NULL
);

CREATE UNIQUE INDEX idx__t_agf_out_fix ON
    t_agf_outros_fixos (
        cd_producao
    ASC );

ALTER TABLE t_agf_outros_fixos ADD CONSTRAINT ck_t_agf_out_fix_maq CHECK ( vl_preco_man_maq >= 400 );

ALTER TABLE t_agf_outros_fixos ADD CONSTRAINT ck_t_agf_out_fix_eng CHECK ( vl_preco_eng_sociais >= 250 );

ALTER TABLE t_agf_outros_fixos ADD CONSTRAINT ck_t_agf_out_fix_seg CHECK ( vl_preco_seg_fixo >= 150 );

ALTER TABLE t_agf_outros_fixos ADD CONSTRAINT pk_t_agf_out_fix PRIMARY KEY ( cd_outros_fixos );

CREATE TABLE t_agf_pessoa_fisica (
    cd_produtor    NUMBER(5) NOT NULL,
    nm_pf          VARCHAR2(80) NOT NULL,
    nr_cpf         NUMBER(9) NOT NULL,
    nr_cpf_digito  NUMBER(2) NOT NULL,
    dt_nasccimento DATE NOT NULL
);

ALTER TABLE t_agf_pessoa_fisica ADD CONSTRAINT pk_t_agf_pf PRIMARY KEY ( cd_produtor );

CREATE TABLE t_agf_pessoa_juridica (
    cd_produtor           NUMBER(5) NOT NULL,
    nm_pj                 VARCHAR2(80),
    nr_cnpj               NUMBER(14) NOT NULL,
    nr_inscricao_estadual NUMBER(10) NOT NULL
);

ALTER TABLE t_agf_pessoa_juridica ADD CONSTRAINT pk_t_agf_pj PRIMARY KEY ( cd_produtor );

ALTER TABLE t_agf_pessoa_juridica ADD CONSTRAINT un__t_agf_pj_cnpj UNIQUE ( nr_cnpj );

ALTER TABLE t_agf_pessoa_juridica ADD CONSTRAINT un__t_agf_pj_inscr_est UNIQUE ( nr_inscricao_estadual );

CREATE TABLE t_agf_pos_colheita (
    cd_pos_colheita     NUMBER(5) NOT NULL,
    cd_producao         NUMBER(5) NOT NULL,
    sg_pos_colheita     CHAR(3) NOT NULL,
    vl_preco_seg_agro   NUMBER(7, 2) NOT NULL,
    vl_preco_assis_tec  NUMBER(7, 2) NOT NULL,
    vl_preco_transp     NUMBER(7, 2) NOT NULL,
    vl_preco_arm        NUMBER(7, 2) NOT NULL,
    vl_preco_cessr      NUMBER(7, 2) NOT NULL,
    vl_preco_imposto    NUMBER(7, 2) NOT NULL,
    vl_preco_taxas      NUMBER(7, 2) NOT NULL,
    vl_preco_outros_col NUMBER(7, 2) NOT NULL
);

CREATE UNIQUE INDEX idx__t_agf_pos_col ON
    t_agf_pos_colheita (
        cd_producao
    ASC );

ALTER TABLE t_agf_pos_colheita ADD CONSTRAINT ck_t_agf_pos_col_seg CHECK ( vl_preco_seg_agro >= 150 );

ALTER TABLE t_agf_pos_colheita ADD CONSTRAINT ck_t_agf_pos_col_assis CHECK ( vl_preco_assis_tec >= 250 );

ALTER TABLE t_agf_pos_colheita ADD CONSTRAINT ck_t_agf_pos_col_transp CHECK ( vl_preco_transp >= 150 );

ALTER TABLE t_agf_pos_colheita ADD CONSTRAINT ck_t_agf_pos_col_arm CHECK ( vl_preco_arm >= 200 );

ALTER TABLE t_agf_pos_colheita ADD CONSTRAINT ck_t_agf_pos_col_cessr CHECK ( vl_preco_cessr >= 200 );

ALTER TABLE t_agf_pos_colheita ADD CONSTRAINT ck_t_agf_pos_col_imp CHECK ( vl_preco_imposto >= 300 );

ALTER TABLE t_agf_pos_colheita ADD CONSTRAINT ck_t_agf_pos_col_taxas CHECK ( vl_preco_taxas >= 200 );

ALTER TABLE t_agf_pos_colheita ADD CONSTRAINT ck_t_agf_pos_col_outros CHECK ( vl_preco_outros_col >= 100 );

ALTER TABLE t_agf_pos_colheita ADD CONSTRAINT pk_t_agf_pos_col PRIMARY KEY ( cd_pos_colheita );

CREATE TABLE t_agf_preco_despesa (
    cd_preco_despesa   NUMBER(5) NOT NULL,
    cd_despesa         NUMBER(5) NOT NULL,
    data_preco_despesa DATE NOT NULL,
    preco_despesa_ha   NUMBER(8, 2) NOT NULL,
    preco_despesa_kg   NUMBER(8, 2) NOT NULL
);

ALTER TABLE t_agf_preco_despesa ADD CONSTRAINT ck_t_agf_pr_desp_ha CHECK ( preco_despesa_ha >= 500 );

ALTER TABLE t_agf_preco_despesa ADD CONSTRAINT ck_t_agf_pr_desp_kg CHECK ( preco_despesa_kg >= 500 );

ALTER TABLE t_agf_preco_despesa ADD CONSTRAINT pk_t_agf_pr_desp PRIMARY KEY ( cd_preco_despesa );

CREATE TABLE t_agf_producao (
    cd_producao      NUMBER(5) NOT NULL,
    cd_produtor      NUMBER(5) NOT NULL,
    cd_cidade        NUMBER(5) NOT NULL,
    nm_produto       VARCHAR2(50) NOT NULL,
    ds_produto       VARCHAR2(80) NOT NULL,
    ds_safra         VARCHAR2(60) NOT NULL,
    dt_inicio        DATE NOT NULL,
    dt_fim           DATE NOT NULL,
    nr_produtividade NUMBER(10) NOT NULL
);

ALTER TABLE t_agf_producao ADD CONSTRAINT ck_t_agf_produc_dt CHECK ( dt_fim > dt_inicio );

ALTER TABLE t_agf_producao ADD CONSTRAINT pk_t_agf_prod PRIMARY KEY ( cd_producao );

CREATE TABLE t_agf_produtor (
    cd_produtor NUMBER(5) NOT NULL,
    nm_produtor VARCHAR2(80) NOT NULL,
    ds_endereco VARCHAR2(100) NOT NULL,
    ds_email    VARCHAR2(70),
    nr_telefone NUMBER(11) NOT NULL
);

ALTER TABLE t_agf_produtor ADD CONSTRAINT pk_t_agf_produtor PRIMARY KEY ( cd_produtor );

ALTER TABLE t_agf_custo_fixo
    ADD CONSTRAINT fk_t_agf_cf_prod FOREIGN KEY ( cd_producao )
        REFERENCES t_agf_producao ( cd_producao );

ALTER TABLE t_agf_custo_operacional
    ADD CONSTRAINT fk_t_agf_custo_op_prod FOREIGN KEY ( cd_producao )
        REFERENCES t_agf_producao ( cd_producao );

ALTER TABLE t_agf_custo_variavel
    ADD CONSTRAINT fk_t_agf_cv_prod FOREIGN KEY ( cd_producao )
        REFERENCES t_agf_producao ( cd_producao );

ALTER TABLE t_agf_depreciacao
    ADD CONSTRAINT fk_t_agf_deprec_prod FOREIGN KEY ( cd_producao )
        REFERENCES t_agf_producao ( cd_producao );

ALTER TABLE t_agf_despesa
    ADD CONSTRAINT fk_t_agf_desp_lavoura FOREIGN KEY ( cd_lavoura )
        REFERENCES t_agf_lavoura ( cd_lavoura );

ALTER TABLE t_agf_lavoura
    ADD CONSTRAINT fk_t_agf_lav_producao FOREIGN KEY ( cd_producao )
        REFERENCES t_agf_producao ( cd_producao );

ALTER TABLE t_agf_outros_fixos
    ADD CONSTRAINT fk_t_agf_out_fix_produ FOREIGN KEY ( cd_producao )
        REFERENCES t_agf_producao ( cd_producao );

ALTER TABLE t_agf_pessoa_fisica
    ADD CONSTRAINT fk_t_agf_pf_produtor FOREIGN KEY ( cd_produtor )
        REFERENCES t_agf_produtor ( cd_produtor );

ALTER TABLE t_agf_pessoa_juridica
    ADD CONSTRAINT fk_t_agf_pj_produtor FOREIGN KEY ( cd_produtor )
        REFERENCES t_agf_produtor ( cd_produtor );

ALTER TABLE t_agf_pos_colheita
    ADD CONSTRAINT fk_t_agf_pos_col_prod FOREIGN KEY ( cd_producao )
        REFERENCES t_agf_producao ( cd_producao );

ALTER TABLE t_agf_preco_despesa
    ADD CONSTRAINT fk_t_agf_pr_desp_desp FOREIGN KEY ( cd_despesa )
        REFERENCES t_agf_despesa ( cd_despesa );

ALTER TABLE t_agf_producao
    ADD CONSTRAINT fk_t_agf_prod_cidade FOREIGN KEY ( cd_cidade )
        REFERENCES t_agf_cidade ( cd_cidade );

ALTER TABLE t_agf_producao
    ADD CONSTRAINT fk_t_agf_prod_produtor FOREIGN KEY ( cd_produtor )
        REFERENCES t_agf_produtor ( cd_produtor );

COMMIT;