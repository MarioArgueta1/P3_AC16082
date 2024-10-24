if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FACTESTADOVUELO') and o.name = 'FK_FACTESTA_RELATIONS_DIMVUELO')
alter table FACTESTADOVUELO
   drop constraint FK_FACTESTA_RELATIONS_DIMVUELO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FACTESTADOVUELO') and o.name = 'FK_FACTESTA_RELATIONS_DIMCAUSA')
alter table FACTESTADOVUELO
   drop constraint FK_FACTESTA_RELATIONS_DIMCAUSA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FACTESTADOVUELO') and o.name = 'FK_FACTESTA_RELATIONS_DIMTIEMP')
alter table FACTESTADOVUELO
   drop constraint FK_FACTESTA_RELATIONS_DIMTIEMP
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FACTESTADOVUELO') and o.name = 'FK_FACTESTA_RELATIONS_DIMAEREO')
alter table FACTESTADOVUELO
   drop constraint FK_FACTESTA_RELATIONS_DIMAEREO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DIMAEREOPUERTO')
            and   type = 'U')
   drop table DIMAEREOPUERTO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DIMCAUSA')
            and   type = 'U')
   drop table DIMCAUSA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DIMTIEMPO')
            and   type = 'U')
   drop table DIMTIEMPO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DIMVUELO')
            and   type = 'U')
   drop table DIMVUELO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FACTESTADOVUELO')
            and   name  = 'RELATIONSHIP_4_FK'
            and   indid > 0
            and   indid < 255)
   drop index FACTESTADOVUELO.RELATIONSHIP_4_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FACTESTADOVUELO')
            and   name  = 'RELATIONSHIP_3_FK'
            and   indid > 0
            and   indid < 255)
   drop index FACTESTADOVUELO.RELATIONSHIP_3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FACTESTADOVUELO')
            and   name  = 'RELATIONSHIP_2_FK'
            and   indid > 0
            and   indid < 255)
   drop index FACTESTADOVUELO.RELATIONSHIP_2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FACTESTADOVUELO')
            and   name  = 'RELATIONSHIP_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index FACTESTADOVUELO.RELATIONSHIP_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FACTESTADOVUELO')
            and   type = 'U')
   drop table FACTESTADOVUELO
go

/*==============================================================*/
/* Table: DIMAEREOPUERTO                                        */
/*==============================================================*/
create table DIMAEREOPUERTO (
   IDAEREOPUERTO        INT IDENTITY(1,1)    not null,
   IDAEREOPUERTON       int                  not null,
   IDORIGENAEREOPUERTO  int                  not null,
   IDDESTINOAEREOPUERTO int                  not null,
   NOMBREAEREOPUERTOORIGEN               varchar(500)         not null,
   NOMBREAEREOPUERTODESTINO               varchar(500)         not null,
   constraint PK_DIMAEREOPUERTO primary key nonclustered (IDAEREOPUERTO)
)
go

/*==============================================================*/
/* Table: DIMCAUSA                                              */
/*==============================================================*/
create table DIMCAUSA (
   IDCAUSA              INT IDENTITY(1,1)     not null,
   IDCAUSAN             int                  not null,
   RETRASOCLIMA         int                  not null,
   RETRASOPROVEEDOR     int                  not null,
   RETRASOSEGURIDAD     int                  not null,
   RETRASOSISTEMANACIONALAVIACION int                  not null,
   RETRASOAEREONAVE     int                  not null,
   MOTIVO               varchar(250)         not null,
   CODIGOCANCELACION    varchar(50)          not null,
   INDICADORCANCELACION int                  not null,
   CANCELADO            varchar(2)           not null,
   constraint PK_DIMCAUSA primary key nonclustered (IDCAUSA)
)
go

/*==============================================================*/
/* Table: DIMTIEMPO                                             */
/*==============================================================*/
create table DIMTIEMPO (
   IDTIEMPO             int                  not null,
   FECHACOMPLETA        datetime             not null,
   DIADELASEMANA        int                  not null,
   NUMERODEDIADELMES    int                  not null,
   NUMERODEDIAENGENERAL int                  not null,
   NOMBREDELDIA         varchar(15)          not null,
   NOMBREDELDIAABREVIADO varchar(3)           not null,
   BANDERDIALUNESAVIERNRES varchar(25)          not null,
   NUMEROSEMANAENELANO  int                  not null,
   NUMERODESEMANAENGENERAL int                  not null,
   FECHADEINICIODESEMANA datetime             not null,
   CLAVEFECHAINICIODESEMANA int                  not null,
   NUMERODEMES          int                  not null,
   NUMERODEMESENGENERAL int                  not null,
   NOMBREDELMES         varchar(15)          not null,
   NOMBREDELMESABREVIADO varchar(3)           not null,
   CUARTO               int                  not null,
   NUMERODEANO          int                  not null,
   ANOMES               int                  not null,
   MESFISCAL            int                  not null,
   CUARTOFISCAL         int                  not null,
   ANOFISCAL            int                  not null,
   BANDERAFINDEMES      varchar(50)          not null,
   FECHADEMISMODIAHACEUNANO datetime             not null,
   constraint PK_DIMTIEMPO primary key nonclustered (IDTIEMPO)
)
go

/*==============================================================*/
/* Table: DIMVUELO                                              */
/*==============================================================*/
create table DIMVUELO (
   IDVUELO              INT IDENTITY(1,1)    not null,
   IDVUELON             int                  not null,
   NUMEROVUELO          int                  not null,
   AEREOLINEA           varchar(100)         null,
   CIUDADORIGEN         varchar(50)          not null,
   CIUDADDESTINO        varchar(50)          not null,
   FECHA                int                  not null,
   constraint PK_DIMVUELO primary key nonclustered (IDVUELO)
)
go

/*==============================================================*/
/* Table: FACTESTADOVUELO                                       */
/*==============================================================*/
create table FACTESTADOVUELO (
   IDVUELO              int                  null,
   IDCAUSA              int                  null,
   IDTIEMPO             int                  null,
   IDAEREOPUERTO        int                  null,
   MINUTOSRETRASOSALIDA int                  not null,
   MINUTOSRETRASOLLEGADA int                  not null,
   CANTIDADVUELOS       int                  not null,
   DISTANCIARECORRIDA   int                  not null
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on FACTESTADOVUELO (
IDVUELO ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on FACTESTADOVUELO (
IDCAUSA ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on FACTESTADOVUELO (
IDTIEMPO ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on FACTESTADOVUELO (
IDAEREOPUERTO ASC
)
go

alter table FACTESTADOVUELO
   add constraint FK_FACTESTA_RELATIONS_DIMVUELO foreign key (IDVUELO)
      references DIMVUELO (IDVUELO)
go

alter table FACTESTADOVUELO
   add constraint FK_FACTESTA_RELATIONS_DIMCAUSA foreign key (IDCAUSA)
      references DIMCAUSA (IDCAUSA)
go

alter table FACTESTADOVUELO
   add constraint FK_FACTESTA_RELATIONS_DIMTIEMP foreign key (IDTIEMPO)
      references DIMTIEMPO (IDTIEMPO)
go

alter table FACTESTADOVUELO
   add constraint FK_FACTESTA_RELATIONS_DIMAEREO foreign key (IDAEREOPUERTO)
      references DIMAEREOPUERTO (IDAEREOPUERTO)
go

