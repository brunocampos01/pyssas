-------------------------------------------------------------------------------
-- Partition: dCategoria
SELECT
IDCATEGORIA,
	CDCATEGORIA AS 'Código Categoria',
	 DENOME AS 'Categoria',
	 DEDOMINIO AS 'Domínio',
	 DECATEGORIADEFEITOAS 'Categoria Defeito'
FROM dwh.dbo.dcategoria;

-------------------------------------------------------------------------------
-- Partition: dCausaRaiz
SELECT
IDCAUSARAIZ,
	CDCAUSARAIZ AS 'Código Causa Raíz',
	DENOME AS 'Causa Raíz'
FROM dwh.dbo.dcausaraiz;

-------------------------------------------------------------------------------
-- Partition: dFaseCiclo
SELECT
	IDFASECICLO,
	CDFASECICLO AS 'Código Fase Ciclo',
	DENOME AS 'Fase Ciclo',
	DEAMBIENTE AS 'Atividade Fase Ciclo'
FROM dwh.dbo.dfaseciclo;

-------------------------------------------------------------------------------
-- Partition: dPlanejadoPara
SELECT
	IDITERACAO,
	CDITERACAO AS 'Código Planejado para',
	DENOME AS 'Planejado para'
FROM dwh.dbo.diteracao;

-------------------------------------------------------------------------------
-- Partition: dModuloFuncional
SELECT
	IDMODULOFUNCIONAL,
	CDMODULOFUNCIONAL AS 'Código Módulo Funcional',
	DENOME AS 'Módulo Funcional'
FROM dwh.dbo.dmodulofuncional;

-------------------------------------------------------------------------------
-- Partition: dPrioridade
SELECT
	IDPRIORIDADE,
	CDPRIORIDADE AS 'Código Prioridade',
	DENOME AS 'Prioridade'
FROM dwh.dbo.dprioridade;

-------------------------------------------------------------------------------
-- Partition: dPrioridadeNegociada
SELECT
	IDPRIORIDADENEGOCIADA,
	CDPRIORIDADENEGOCIADA AS 'Código Prioridade Negociada',
	DENOME AS 'Prioridade Negociada'
FROM dwh.dbo.dprioridadenegociada;

-------------------------------------------------------------------------------
-- Partition: dProjeto
SELECT
	IDPROJETO,
	CDPROJETO AS 'Código Projeto',
	DENOME AS 'Projeto'
FROM dwh.dbo.dprojeto;

-------------------------------------------------------------------------------
-- Partition: dSimuladoBaseInterna
SELECT
	IDSIMULADOBASEINTERNA,
	CDSIMULADOBASEINTERNA AS 'Código Simulado Base Interna',
	DENOME AS 'Simulado Base Interna - origem'
FROM dwh.dbo.dsimuladobaseinterna;

-------------------------------------------------------------------------------
-- Partition: dTester
SELECT
	IDTESTER,
	CDTESTER AS 'Código Tester',
	DENOME AS 'Tester'
FROM dwh.dbo.dtester;

-------------------------------------------------------------------------------
-- Partition: dTipoChamado
SELECT
	IDTIPOCHAMADO,
	CDTIPOCHAMADO AS 'Código Tipo Chamado',
	DENOME AS 'Tipo Chamado'
FROM dwh.dbo.dtipochamado;

-------------------------------------------------------------------------------
-- Partition: dUsuario
SELECT
	IDUSUARIO,
	CDUSUARIO AS 'Código Usuário',
	DENOME AS 'Usuário',
	DENOMEABV AS 'Login'
FROM dwh.dbo.dusuario;

-------------------------------------------------------------------------------
-- Partition: Medidas
SELECT
	1 AS Medidas;

-------------------------------------------------------------------------------
-- Partition: dAtividade
SELECT
	IDATIVIDADE,
	CDATIVIDADE AS 'Código Atividade',
	DENOME AS 'Atividade'
FROM dwh.dbo.datividade;

-------------------------------------------------------------------------------
-- Partition: dTarefa
SELECT
	IDTAREFA,
	CDTAREFA AS 'Código Tarefa',
	DENOME AS 'Tarefa',
	DEURL AS 'URL'
FROM dwh.dbo.dtarefa;

-------------------------------------------------------------------------------
-- Partition: dChamado
SELECT
	IDCHAMADO,
	CDCHAMADO AS 'Código Chamado',
	NUCHAMADO AS 'Número Chamado',
	NUSCCD AS 'Numero SCCD',
	DETITULO AS 'Título',
	DENOME AS 'Chamado',
	DETAG AS 'Tag',
	DESTATUS AS 'Status',
	NUSALT AS 'Número Salt',
	DECAUSA AS 'Causa',
	DEURL AS 'URL',
	FLBLOQUEADO AS 'Binário Flag Bloqueado',
	FLPERFORMANCE AS 'Flag Performace - origem',
	FLPERFORMANCEENCAMINHADA AS 'Flag Performace Encaminhada - origem',
	DEVERSAOORIGEM AS 'Versão Origem',
	FLINTERNACIONAL AS 'Flag Internacional',
	demotivoreproducao AS 'Motivo Reprodução'
FROM dwh.dbo.dchamado;

-------------------------------------------------------------------------------
-- Partition: dCliente
SELECT
IDCLIENTE,
	CDCLIENTE AS 'Código Cliente',
	DENOME AS 'Cliente',
	DESIGLA AS 'Sigla'
FROM dwh.dbo.dcliente;

-------------------------------------------------------------------------------
-- Partition: dTempo
SELECT
	IDDATA AS IDDATA,
	[DATA]  AS 'Data',
	CDDIA AS 'Código Dia',
	CDANO AS 'Código Ano',
	CDMES AS 'Código Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Código Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Código Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Código Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Código Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Código Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Código Semestre',
	DESEMESTRE AS 'Semestre',
	DTINICIOSEMANA AS 'Data Início Semana',
	DTFIMSEMANA AS 'Data Fim Semana',
	DEPERIODOSEMANA AS 'Período Semana'
FROM dwh.dbo.dtempo
WHERE  CDANO >= 2015 AND CDANO <= YEAR(GETDATE()) + 1 ]

-------------------------------------------------------------------------------
-- Partition: factRegistry
SELECT
IDCATEGORIA,
IDCHAMADO,
IDATIVIDADE,
IDUSUARIO,
IDEQUIPECHAMADO,
IDITERACAO,
IDTAREFA,
IDPROJETO,
IDTIPOCHAMADO,
IDSTATUSCHAMADO,
IDDATA,
MINUTOS,
HORAS,
IDTIPORegistry,
IDSISTEMA,
IDSISTEMAORIGEM,
IDEQUIPEUSUARIO,
IDCCUSTOUSUARIO,
IDTAREFASERP,
IDPROJETOSERP,
IDEQUIPEUSUARIOHIST,
IDUSUARIOUX,
IDUSUARIOPO,
IDUSUARIOPM,
IDVERTICALCHAMADO,
IDUNIDADECHAMADO,
IDTIPOENTREGA,
IDTIPOCONFIGURACAO,
IDINCIDENTECLIENTE,
	SUM ( ( minutos / 60.00 ) / 8.00 ) over ( partition by factRegistry.idusuario,
	factRegistry.iddata )AS IHT,
	replace ( SUM ( ( minutos / 60.00 ) / 8.00 ) over ( partition by factRegistry.idusuario,
	factRegistry.iddata ).',
)AS IHT_calc,
	DTCARGA
FROM dwh.dbo.factRegistry;

-------------------------------------------------------------------------------
-- Partition: factArtefatoEvolucao
SELECT
	* 
FROM factArtefatoEvolucao;

-------------------------------------------------------------------------------
-- Partition: factBacklog
SELECT
	IDCHAMADO,
	IDTESTER,
	IDTIPOCHAMADO,
	IDSTATUSCHAMADO,
	IDEQUIPECHAMADO,
	IDPRIORIDADE,
	IDUSUARIOCRIACAO,
	IDUSUARIOSOLUCAO,
	IDUSUARIOPROPRIETARIO,
	IDMODULOFUNCIONAL,
	IDCAUSARAIZ,
	IDPROJETO,
	IDFASECICLO,
	IDCLIENTE,
	IDPRIORIDADENEGOCIADA,
	IDSIMULADOBASEINTERNA,
	IDCATEGORIA,
	IDITERACAO,
	IDMODULO,
	IDDTCRIACAO,
	IDHRCRIACAO,
	IDDTRESOLUCAO,
	IDHRRESOLUCAO,
	IDDTPRAZOSLA,
	IDHRPRAZOSLA,
	IDDTCRIACAOSAC,
	IDHRCRIACAOSAC,
	IDDTPREVISTA,
	IDHRPREVISTA,
	IDDTAPURACAO,
	IDPERFORMANCE,
	IDPERFORMANCEENCAMINHADA,
	IDORIUNDOREJEITE,
	IDSISTEMAORIGEM,
	IDSISTEMA,
	IDUSUARIOUX,
	IDUSUARIOPO,
	IDUSUARIOPM,
	IDVERTICALCHAMADO,
	IDUNIDADECHAMADO,
	IDEQUIPEUSUARIOEXCEL,
	IDCOMPLEXIDADE,
	IDSEVERIDADE,
	IDEQUIPEESPECIALISTA,
	QTBACKLOG,
	DTCARGA
FROM dwh.dbo.factBacklog;

-------------------------------------------------------------------------------
-- Partition: factInput
SELECT
	IDCHAMADO,
	IDTESTER,
	IDTIPOCHAMADO,
	IDSTATUSCHAMADO,
	IDEQUIPECHAMADO,
	IDPRIORIDADE,
	IDUSUARIOCRIACAO,
	IDUSUARIOSOLUCAO,
	IDUSUARIOPROPRIETARIO,
	IDMODULOFUNCIONAL,
	IDCAUSARAIZ,
	IDPROJETO,
	IDFASECICLO,
	IDCLIENTE,
	IDPRIORIDADENEGOCIADA,
	IDSIMULADOBASEINTERNA,
	IDCATEGORIA,
	IDITERACAO,
	IDMODULO,
	IDDTCRIACAO,
	IDHRCRIACAO,
	IDDTRESOLUCAO,
	IDHRRESOLUCAO,
	IDDTPRAZOSLA,
	IDHRPRAZOSLA,
	IDDTCRIACAOSAC,
	IDHRCRIACAOSAC,
	IDDTPREVISTA,
	IDHRPREVISTA,
	IDDTAPURACAO,
	IDPERFORMANCE,
	IDPERFORMANCEENCAMINHADA,
	IDORIUNDOREJEITE,
	IDSISTEMAORIGEM,
	IDSISTEMA,
	IDUSUARIOUX,
	IDUSUARIOPO,
	IDUSUARIOPM,
	IDVERTICALCHAMADO,
	IDUNIDADECHAMADO,
	IDEQUIPEUSUARIOEXCEL,
	IDCOMPLEXIDADE,
	IDSEVERIDADE,
	IDEQUIPEESPECIALISTA,
	QTInput,
	DTCARGA
FROM dwh.dbo.factInput;

-------------------------------------------------------------------------------
-- Partition: factNegociado
SELECT
	* 
FROM factNegociado;

-------------------------------------------------------------------------------
-- Partition: factOutput
SELECT
	IDCHAMADO,
	IDTESTER,
	IDTIPOCHAMADO,
	IDSTATUSCHAMADO,
	IDEQUIPECHAMADO,
	IDPRIORIDADE,
	IDUSUARIOCRIACAO,
	IDUSUARIOSOLUCAO,
	IDUSUARIOPROPRIETARIO,
	IDMODULOFUNCIONAL,
	IDCAUSARAIZ,
	IDPROJETO,
	IDFASECICLO,
	IDCLIENTE,
	IDPRIORIDADENEGOCIADA,
	IDSIMULADOBASEINTERNA,
	IDCATEGORIA,
	IDITERACAO,
	IDMODULO,
	IDDTCRIACAO,
	IDHRCRIACAO,
	IDDTRESOLUCAO,
	IDHRRESOLUCAO,
	IDDTPRAZOSLA,
	IDHRPRAZOSLA,
	IDDTCRIACAOSAC,
	IDHRCRIACAOSAC,
	IDDTPREVISTA,
	IDHRPREVISTA,
	IDDTAPURACAO,
	IDPERFORMANCE,
	IDPERFORMANCEENCAMINHADA,
	IDORIUNDOREJEITE,
	IDSISTEMAORIGEM,
	IDSISTEMA,
	IDUSUARIOUX,
	IDUSUARIOPO,
	IDUSUARIOPM,
	IDVERTICALCHAMADO,
	IDUNIDADECHAMADO,
	IDEQUIPEUSUARIOEXCEL,
	IDCOMPLEXIDADE,
	IDSEVERIDADE,
	IDEQUIPEESPECIALISTA,
	QTOutput,
	DTCARGA
FROM dwh.dbo.factOutput;

-------------------------------------------------------------------------------
-- Partition: factTempoMedio
SELECT
	IDCHAMADO,
	IDSTATUSCHAMADOANTERIOR,
	IDSTATUSCHAMADOFUTURO,
	IDTIPOCHAMADO,
	IDEQUIPECHAMADO,
	IDCATEGORIA,
	IDCLIENTE,
	IDDTINICIOSTATUS,
	IDHRINICIOSTATUS,
	IDDTFINALSTATUS,
	IDHRFINALSTATUS,
	IDDTCRIACAO,
	IDHRCRIACAO,
	IDDTRESOLUCAO,
	IDHRRESOLUCAO,
	IDSISTEMAORIGEM,
	IDSISTEMA,
	IDVERTICALCHAMADO,
	IDUNIDADECHAMADO,
	IDPROJETO,
	QTTEMPOMEDIO,
	DTCARGA,
	IDDESENVOLVEDOR'
FROM dwh.dbo.factTempoMedio;

-------------------------------------------------------------------------------
-- Partition: dStatusChamado
SELECT
	IDSTATUSCHAMADO,
	CDSTATUSCHAMADO AS 'Código Status Chamado',
	DENOME AS 'Status Chamado'
FROM dwh.dbo.dstatuschamado;

-------------------------------------------------------------------------------
-- Partition: factBacklogZero
SELECT
	* 
FROM factBacklogZero;

-------------------------------------------------------------------------------
-- Partition: dDesenvolvedor
SELECT
	IDUSUARIO AS IDDESENVOLVEDOR,
	CDUSUARIO AS 'Código Desenvolvedor',
	DENOME AS 'Desenvolvedor',
	DENOMEABV AS 'Desenvolvedor Abrev'
FROMdwh.dbo.dusuario;

-------------------------------------------------------------------------------
-- Partition: dTempoApuracao
SELECT
	IDDATA AS IDDTAPURACAO,
	[DATA]  AS 'Data Apuração',
	CDDIA AS 'Código Dia',
	CDANO AS 'Código Ano',
	CDMES AS 'Código Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Código Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Código Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Código Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Código Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Código Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Código Semestre',
	DESEMESTRE AS 'Semestre',
	DTINICIOSEMANA AS 'Data Início Semana',
	DTFIMSEMANA AS 'Data Fim Semana',
	DEPERIODOSEMANA AS 'Período Semana'
FROM dwh.dbo.dtempo;

-------------------------------------------------------------------------------
-- Partition: dTempoCriacao
SELECT
	IDDATA AS IDDTCRIACAO,
	[DATA]  AS 'Data Criação',
	CDDIA AS 'Código Dia',
	CDANO AS 'Código Ano',
	CDMES AS 'Código Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Código Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Código Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Código Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Código Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Código Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Código Semestre',
	DESEMESTRE AS 'Semestre',
	DTINICIOSEMANA AS 'Data Início Semana',
	DTFIMSEMANA AS 'Data Fim Semana',
	DEPERIODOSEMANA AS 'Período Semana'
FROM dwh.dbo.dtempo;

-------------------------------------------------------------------------------
-- Partition: dTempoCriacaoSAC
SELECT
	IDDATA AS IDDTCRIACAOSAC,
	[DATA]  AS 'Data Criação SAC',
	CDDIA AS 'Código Dia',
	CDANO AS 'Código Ano',
	CDMES AS 'Código Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Código Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Código Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Código Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Código Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Código Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Código Semestre',
	DESEMESTRE AS 'Semestre',
	DTINICIOSEMANA AS 'Data Início Semana',
	DTFIMSEMANA AS 'Data Fim Semana',
	DEPERIODOSEMANA AS 'Período Semana'
FROM dwh.dbo.dtempo;

-------------------------------------------------------------------------------
-- Partition: dTempoFinalStatus
SELECT
	IDDATA AS IDDTFINALSTATUS,
	[DATA]  AS 'Data Final Status',
	CDDIA AS 'Código Dia',
	CDANO AS 'Código Ano',
	CDMES AS 'Código Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Código Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Código Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Código Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Código Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Código Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Código Semestre',
	DESEMESTRE AS 'Semestre',
	DTINICIOSEMANA AS 'Data Início Semana',
	DTFIMSEMANA AS 'Data Fim Semana',
	DEPERIODOSEMANA AS 'Período Semana'
FROM dwh.dbo.dtempo;

-------------------------------------------------------------------------------
-- Partition: dTempoInicioStatus
SELECT
	IDDATA AS IDDTINICIOSTATUS,
	[DATA]  AS 'Data Início Status',
	CDDIA AS 'Código Dia',
	CDANO AS 'Código Ano',
	CDMES AS 'Código Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Código Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Código Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Código Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Código Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Código Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Código Semestre',
	DESEMESTRE AS 'Semestre',
	DTINICIOSEMANA AS 'Data Início Semana',
	DTFIMSEMANA AS 'Data Fim Semana',
	DEPERIODOSEMANA AS 'Período Semana'
FROM dwh.dbo.dtempo;

-------------------------------------------------------------------------------
-- Partition: dTempoPrazoSLA
SELECT
	IDDATA AS IDDTPRAZOSLA,
	[DATA]  AS 'Data Prazo SLA',
	CDDIA AS 'Código Dia',
	CDANO AS 'Código Ano',
	CDMES AS 'Código Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Código Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Código Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Código Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Código Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Código Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Código Semestre',
	DESEMESTRE AS 'Semestre',
	DTINICIOSEMANA AS 'Data Início Semana',
	DTFIMSEMANA AS 'Data Fim Semana',
	DEPERIODOSEMANA AS 'Período Semana'
FROM dwh.dbo.dtempo;

-------------------------------------------------------------------------------
-- Partition: dTempoPrevista
SELECT
	IDDATA AS IDDTPREVISTA,
	[DATA] AS 'Data Prevista',
	CDDIA AS 'Código Dia',
	CDANO AS 'Código Ano',
	CDMES AS 'Código Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Código Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Código Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES  AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Código Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Código Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Código Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Código Semestre',
	DESEMESTRE AS 'Semestre',
	DTINICIOSEMANA AS 'Data Início Semana',
	DTFIMSEMANA AS 'Data Fim Semana',
	DEPERIODOSEMANA AS 'Período Semana'
FROM
	dwh.dbo.dtempo;

-------------------------------------------------------------------------------
-- Partition: dTempoResolucao
SELECT
	IDDATA AS IDDTRESOLUCAO,
	[DATA]  AS 'Data Resolução',
	CDDIA AS 'Código Dia',
	CDANO AS 'Código Ano',
	CDMES AS 'Código Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Código Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Código Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Código Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Código Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Código Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Código Semestre',
	DESEMESTRE AS 'Semestre',
	DTINICIOSEMANA AS 'Data Início Semana',
	DTFIMSEMANA AS 'Data Fim Semana',
	DEPERIODOSEMANA AS 'Período Semana'
FROM dwh.dbo.dtempo;

-------------------------------------------------------------------------------
-- Partition: dTempoSolucao
SELECT
	IDDATA AS IDDTSOLUCAO,
	[DATA]  AS 'Data Solução',
	CDDIA AS 'Código Dia',
	CDANO AS 'Código Ano',
	CDMES AS 'Código Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Código Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Código Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Código Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Código Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Código Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Código Semestre',
	DESEMESTRE AS 'Semestre',
	DTINICIOSEMANA AS 'Data Início Semana',
	DTFIMSEMANA AS 'Data Fim Semana',
	DEPERIODOSEMANA AS 'Período Semana'
FROM dwh.dbo.dtempo;

-------------------------------------------------------------------------------
-- Partition: dTempoPriorizado
SELECT
	IDDATA AS IDDTPRIORIZADO,
	[DATA]  AS 'Data Priorizado',
	CDDIA AS 'Código Dia',
	CDANO AS 'Código Ano',
	CDMES AS 'Código Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Código Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Código Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Código Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Código Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Código Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Código Semestre',
	DESEMESTRE AS 'Semestre',
	DTINICIOSEMANA AS 'Data Início Semana',
	DTFIMSEMANA AS 'Data Fim Semana',
	DEPERIODOSEMANA AS 'Período Semana'
FROM dwh.dbo.dtempo;

-------------------------------------------------------------------------------
-- Partition: dTipoRegistry
SELECT
	IDTIPORegistry,
	CDTIPORegistry AS 'Código Tipo Registry',
	DENOME AS 'Tipo Registry'
FROM dwh.dbo.dtipoRegistry;

-------------------------------------------------------------------------------
-- Partition: dSistema
SELECT
	IDSISTEMA,
	CDSISTEMA AS 'Código Sistema',
	DENOME AS 'Sistema'
FROM dwh.dbo.dsistema;

-------------------------------------------------------------------------------
-- Partition: dTempoRegistry
SELECT
	IDDATA AS IDDATA,
	[DATA] AS 'Data Registry',
	CDDIA AS 'Código Dia',
	CDANO AS 'Código Ano',
	CDMES AS 'Código Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Código Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Código Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Semana por Extenso',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Código Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Código Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Código Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Código Semestre',
	DESEMESTRE AS 'Semestre',
	DTINICIOSEMANA AS 'Data Início Semana',
	DTFIMSEMANA AS 'Data Fim Semana',
	DEPERIODOSEMANA AS 'Período Semana'
FROM
	dwh.dbo.dtempo
WHERE  EXISTS',
	(',
	SELECT
	TOP 1 1 ,
	
FROM ,
	dwh.dbo.factRegistry',
	
WHERE,
	LEFT( dwh.dbo.factRegistry.iddata,
	4 ) = LEFT( dwh.dbo.dtempo.iddata,
	4 )',
	)

-------------------------------------------------------------------------------
-- Partition: factRegistryPerfilSeguranca
SELECT
	* 
FROM factRegistry;

-------------------------------------------------------------------------------
-- Partition: dModulo
SELECT
	IDMODULO,
	DENOME AS 'Módulo'
FROM dwh.dbo.dmodulo;

-------------------------------------------------------------------------------
-- Partition: dPerformance
SELECT
	IDPERFORMANCE,
	CDPERFORMANCE AS 'Código Performance',
	DENOME AS 'Performance'
FROM dwh.dbo.dperformance;

-------------------------------------------------------------------------------
-- Partition: dPerformanceEncaminhada
SELECT
	IDPERFORMANCEENCAMINHADA,
	CDPERFORMANCEENCAMINHADA AS 'Código Performance Encaminhada',
	DENOME AS 'Performance Encaminhada'
FROM dwh.dbo.dperformanceencaminhada;

-------------------------------------------------------------------------------
-- Partition: dOriundoRejeite
SELECT
	IDORIUNDOREJEITE,
	CDORIUNDOREJEITE AS 'Código Oriundo Rejeite',
	DENOME AS 'Oriundo Rejeite'
FROM dwh.dbo.doriundorejeite;

-------------------------------------------------------------------------------
-- Partition: dEquipeUsuario
SELECT
	IDEQUIPEUSUARIO,
	IDEQUIPE AS 'Código Equipe Usuário',
	DEEQUIPE AS 'Equipe Usuário'
FROM dwh.dbo.dequipeusuario;

-------------------------------------------------------------------------------
-- Partition: dCCustoUsuario
SELECT
	IDCCUSTOUSUARIO,
	CDCCUSTOUSUARIO AS 'Código Centro de Custo Usuário',
	DECCUSTOUSUARIO AS 'Centro de Custo Usuário'
FROM
	dwh.dbo.dccustousuario;

-------------------------------------------------------------------------------
-- Partition: dTarefaSerp
SELECT
	IDTAREFASERP,
	CDTAREFASERP AS 'Código Tarefa Serp',
	DENOME AS 'Tarefa Serp'
FROM dwh.dbo.dtarefaserp;

-------------------------------------------------------------------------------
-- Partition: dProjetoSerp
SELECT
	IDPROJETOSERP,
	CDPROJETOSERP AS 'Código Projeto Serp',
	DENOME AS 'Nome Projeto Serp'
FROM dwh.dbo.dprojetoserp;

-------------------------------------------------------------------------------
-- Partition: dSistemaOrigem
SELECT
	IDSISTEMAORIGEM,
	DENOME AS 'Sistema Origem'
FROM dwh.dbo.dsistemaorigem;

-------------------------------------------------------------------------------
-- Partition: dIteracao
SELECT
	IDITERACAO,
	CDITERACAO AS 'Código Iteração',
	DENOME AS 'Iteração'
FROM dwh.dbo.diteracao;

-------------------------------------------------------------------------------
-- Partition: dEquipeUsuarioHist
SELECT
	IDEQUIPEUSUARIOHIST,
	IDUSUARIOHIST AS IDUSUARIOHIST,
	IDEQUIPEHIST AS 'Código Equipe Usuário',
	DEEQUIPEHIST AS 'Equipe Usuário',
	dtinicioperiodo AS 'Início Período',
	dtfimperiodo AS 'Fim Período',
	FLREGISTROATUAL AS 'Flag Registro Atual'
FROM dwh.dbo.dequipeusuariohist;

-------------------------------------------------------------------------------
-- Partition: factRegistryIHT
SELECT
	factRegistry.idusuario,
	factRegistry.iddata,
	factRegistry.idequipeusuariohist,
	factRegistry.idequipeusuario,
	factRegistry.IDTIPOENTREGA,
	SUM( minutos / 60.00 ) / 8.00AS 'IHT'
FROM factRegistry'GROUP BY',
	factRegistry.idusuario,
	factRegistry.iddata,
	factRegistry.idequipeusuariohist,
	factRegistry.idequipeusuario,
factRegistry.IDTIPOENTREGA;

-------------------------------------------------------------------------------
-- Partition: dEquipeChamado
SELECT
IDEQUIPECHAMADO,
	CDEQUIPE AS 'Código Equipe',
	DENOME AS 'Equipe',
	-- stg.rivw_vw_team.team,
	DESIGLA AS 'Sigla Equipe',
	URLIMAGEM1 AS 'Imagem Quadrada',
	URLIMAGEM2 AS 'Imagem Redonda'
FROM dwh.dbo.dequipechamado;

-------------------------------------------------------------------------------
-- Partition: dUsuarioCriacao
SELECT
	IDUSUARIO AS 'IDUSUARIOCRIACAO',
	 CDUSUARIO AS 'Código Usuário',
	 DENOME AS 'Usuário Criação',
	 DENOMEABV AS 'Login' 
FROM dwh.dbo.dusuario;

-------------------------------------------------------------------------------
-- Partition: dUsuarioPriorizado
SELECT
	IDUSUARIO AS 'IDUSUARIOPRIORIZADO',
	 CDUSUARIO AS 'Código Usuário',
	 DENOME AS 'Usuário Priorizado',
	 DENOMEABV AS 'Login' 
FROM dwh.dbo.dusuario;

-------------------------------------------------------------------------------
-- Partition: dUsuarioProprietario
SELECT
	IDUSUARIO AS ' IDUSUARIOPROPRIETARIO',
	 CDUSUARIO AS 'Código Usuário',
	 DENOME AS 'Usuário Proprietário',
	 DENOMEABV AS 'Login' 
FROM dwh.dbo.dusuario;

-------------------------------------------------------------------------------
-- Partition: dUsuarioSolucao
SELECT
	IDUSUARIO AS 'IDUSUARIOSOLUCAO',
	 CDUSUARIO AS 'Código Usuário',
	 DENOME AS 'Usuário Solução',
	 DENOMEABV AS 'Login' 
FROM dwh.dbo.dusuario;

-------------------------------------------------------------------------------
-- Partition: dTempoPrazoPPF
SELECT
	IDDATA AS IDDTPRAZOPPF,
	[DATA] AS 'Data Prazo PPF',
	CDDIA AS 'Código Dia',
	CDANO AS 'Código Ano',
	CDMES AS 'Código Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Código Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Código Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Código Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Código Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Código Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Código Semestre',
	DESEMESTRE AS 'Semestre',
	DTINICIOSEMANA AS 'Data Início Semana',
	DTFIMSEMANA  AS 'Data Fim Semana',
	DEPERIODOSEMANA AS 'Período Semana'
FROM dwh.dbo.dtempo;

-------------------------------------------------------------------------------
-- Partition: dTempoPrazoAnalise
SELECT
	IDDATA AS IDDTPRAZOANALISE,
	[DATA] AS 'Data Prazo Análise',
	CDDIA AS 'Código Dia',
	CDANO AS 'Código Ano',
	CDMES AS 'Código Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Código Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Código Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Código Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Código Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Código Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Código Semestre',
	DESEMESTRE AS 'Semestre',
	DTINICIOSEMANA AS 'Data Início Semana',
	DTFIMSEMANA AS 'Data Fim Semana',
	DEPERIODOSEMANA AS 'Período Semana'
FROM dwh.dbo.dtempo;

-------------------------------------------------------------------------------
-- Partition: dTempoPrazoEspecificacao
SELECT
	IDDATA AS IDDTPRAZOESPECIFICACAO,
	[DATA] AS 'Data Prazo Especificação',
	CDDIA AS 'Código Dia',
	CDANO AS 'Código Ano',
	CDMES AS 'Código Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Código Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Código Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Código Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Código Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Código Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Código Semestre',
	DESEMESTRE AS 'Semestre',
	DTINICIOSEMANA AS 'Data Início Semana',
	DTFIMSEMANA AS 'Data Fim Semana',
	DEPERIODOSEMANA AS 'Período Semana'
FROM dwh.dbo.dtempo;

-------------------------------------------------------------------------------
-- Partition: dUsuarioPO
SELECT
	IDUSUARIO AS 'IDUSUARIOPO',
	CDUSUARIO AS 'Código Usuário',
	DENOME AS 'Usuário PO',
	DENOMEABV AS 'Login'
FROM dwh.dbo.dusuario;

-------------------------------------------------------------------------------
-- Partition: dUsuarioPM
SELECT
	IDUSUARIO AS 'IDUSUARIOPM',
	CDUSUARIO AS 'Código Usuário',
	DENOME AS 'Usuário PM',
	DENOMEABV AS 'Login'
FROM dwh.dbo.dusuario;

-------------------------------------------------------------------------------
-- Partition: dUsuarioUX
SELECT
	IDUSUARIO AS 'IDUSUARIOUX',
	CDUSUARIO AS 'Código Usuário',
	DENOME AS 'Usuário UX',
	DENOMEABV AS 'Login'
FROM dwh.dbo.dusuario;

-------------------------------------------------------------------------------
-- Partition: dUnidade
SELECT
	IDUNIDADE AS 'IDUNIDADECHAMADO',
	CDUNIDADE AS 'Código Unidade',
	DENOME AS 'Unidade',
	DESIGLA AS 'Sigla Unidade'
FROM dwh.dbo.dunidade;

-------------------------------------------------------------------------------
-- Partition: dVertical
SELECT
	IDVERTICAL AS 'IDVERTICALCHAMADO',
	CDVERTICAL AS 'Código Vertical',
	DENOME AS 'Vertical',
	DESIGLA AS 'Sigla Vertical'
FROM dwh.dbo.dvertical;

-------------------------------------------------------------------------------
-- Partition: dEquipeUsuarioExcel
SELECT
	IDEQUIPEUSUARIOEXCEL,
	IDDTAPURACAO,
	DENOMEUSUARIO AS 'Usuário',
	DENOMEEQUIPE AS 'Equipe',
	DESTATUSUSUARIO AS 'Status Usuário'
FROM dwh.dbo.dequipeusuarioexcel;

-------------------------------------------------------------------------------
-- Partition: dTipoEntrega
SELECT
	IDTIPOENTREGA,
	CDTIPOENTREGA AS 'Código Tipo Entrega',
	DENOME AS 'Tipo Entrega'
FROM dwh.dbo.dtipoentrega;

-------------------------------------------------------------------------------
-- Partition: dTipoConfiguracao
SELECT
	IDTIPOCONFIGURACAO,
	CDTIPOCONFIGURACAO AS 'Código Tipo Configuração',
	DENOME AS 'Tipo Configuração'
FROM dwh.dbo.dtipoconfiguracao;

-------------------------------------------------------------------------------
-- Partition: dIncidenteCliente
SELECT
	IDINCIDENTECLIENTE,
	CDINCIDENTECLIENTE AS 'Código Incidente Cliente',
	DENOME AS 'Incidente Cliente'
FROM dwh.dbo.dincidentecliente;

-------------------------------------------------------------------------------
-- Partition: dComplexidade
SELECT
	IDCOMPLEXIDADE,
	CDCOMPLEXIDADE AS 'Código Complexidade',
	DENOME AS 'Complexidade'
FROM dwh.dbo.dComplexidade;

-------------------------------------------------------------------------------
-- Partition: dEquipeEspecialista
SELECT
	IDEQUIPEESPECIALISTA,
	CDEQUIPEESPECIALISTAAS 'Código Equipe Especialista',
	DENOMEAS 'Equipe Especialista'
FROM dwh.dbo.dEquipeEspecialista;

-------------------------------------------------------------------------------
-- Partition: dSeveridade
SELECT
	IDSEVERIDADE,
	CDSEVERIDADE AS 'Código Severidade',
	DENOME AS 'Severidade'
FROM dwh.dbo.dSeveridade;

