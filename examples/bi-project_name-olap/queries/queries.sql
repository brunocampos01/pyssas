-------------------------------------------------------------------------------
-- Partition: dCategoria
SELECT
IDCATEGORIA,
	CDCATEGORIA AS 'Code Categoria',
	 DEName AS 'Categoria',
	 DEDOMINIO AS 'Domínio',
	 DECATEGORIADEFEITOAS 'Categoria Defeito'
FROM dwh.dbo.dcategoria;

-------------------------------------------------------------------------------
-- Partition: dCausaRaiz
SELECT
IDCAUSARAIZ,
	CDCAUSARAIZ AS 'Code Causa Raíz',
	DEName AS 'Causa Raíz'
FROM dwh.dbo.dcausaraiz;

-------------------------------------------------------------------------------
-- Partition: dFaseCiclo
SELECT
	IDFASECICLO,
	CDFASECICLO AS 'Code Fase Ciclo',
	DEName AS 'Fase Ciclo',
	DEAMBIENTE AS 'Atividade Fase Ciclo'
FROM dwh.dbo.dfaseciclo;

-------------------------------------------------------------------------------
-- Partition: dPlanejadoPara
SELECT
	IDITERACAO,
	CDITERACAO AS 'Code Planejado para',
	DEName AS 'Planejado para'
FROM dwh.dbo.diteracao;

-------------------------------------------------------------------------------
-- Partition: dModuloFuncional
SELECT
	IDMODULOFUNCIONAL,
	CDMODULOFUNCIONAL AS 'Code Módulo Funcional',
	DEName AS 'Módulo Funcional'
FROM dwh.dbo.dmodulofuncional;

-------------------------------------------------------------------------------
-- Partition: dPrioridade
SELECT
	IDPRIORIDADE,
	CDPRIORIDADE AS 'Code Prioridade',
	DEName AS 'Prioridade'
FROM dwh.dbo.dprioridade;

-------------------------------------------------------------------------------
-- Partition: dPrioridadeNegociada
SELECT
	IDPRIORIDADENEGOCIADA,
	CDPRIORIDADENEGOCIADA AS 'Code Prioridade Negociada',
	DEName AS 'Prioridade Negociada'
FROM dwh.dbo.dprioridadenegociada;

-------------------------------------------------------------------------------
-- Partition: dProjeto
SELECT
	IDPROJETO,
	CDPROJETO AS 'Code Projeto',
	DEName AS 'Projeto'
FROM dwh.dbo.dprojeto;

-------------------------------------------------------------------------------
-- Partition: dSimuladoBaseInterna
SELECT
	IDSIMULADOBASEINTERNA,
	CDSIMULADOBASEINTERNA AS 'Code Simulado Base Interna',
	DEName AS 'Simulado Base Interna - origem'
FROM dwh.dbo.dsimuladobaseinterna;

-------------------------------------------------------------------------------
-- Partition: dTester
SELECT
	IDTESTER,
	CDTESTER AS 'Code Tester',
	DEName AS 'Tester'
FROM dwh.dbo.dtester;

-------------------------------------------------------------------------------
-- Partition: dRegistryCall
SELECT
	IDRegistryCall,
	CDRegistryCall AS 'Code Tipo Chamado',
	DEName AS 'Tipo Chamado'
FROM dwh.dbo.dRegistryCall;

-------------------------------------------------------------------------------
-- Partition: dUser
SELECT
	IDUser,
	CDUser AS 'Code Usuário',
	DEName AS 'Usuário',
	DENameABV AS 'Login'
FROM dwh.dbo.dUser;

-------------------------------------------------------------------------------
-- Partition: Medidas
SELECT
	1 AS Medidas;

-------------------------------------------------------------------------------
-- Partition: dAtividade
SELECT
	IDATIVIDADE,
	CDATIVIDADE AS 'Code Atividade',
	DEName AS 'Atividade'
FROM dwh.dbo.datividade;

-------------------------------------------------------------------------------
-- Partition: dTarefa
SELECT
	IDTAREFA,
	CDTAREFA AS 'Code Tarefa',
	DEName AS 'Tarefa',
	DEURL AS 'URL'
FROM dwh.dbo.dtarefa;

-------------------------------------------------------------------------------
-- Partition: dRegistry
SELECT
	IdRegistry,
	CdRegistry AS 'Code Chamado',
	NUCHAMADO AS 'Número Chamado',
	NUSCCD AS 'Numero SCCD',
	DETITULO AS 'Título',
	DEName AS 'Chamado',
	DETAG AS 'Tag',
	DESTATUS AS 'Status',
	NUSALT AS 'Número Salt',
	DECAUSA AS 'Causa',
	DEURL AS 'URL',
	FLBLOQUEADO AS 'Bynary Flag Bloqueado',
	FLPERFORMANCE AS 'Flag Performace - origem',
	FLPERFORMANCEENCAMINHADA AS 'Flag Performace Encaminhada - origem',
	DEVERSAOORIGEM AS 'Versão Origem',
	FLINTERNACIONAL AS 'Flag Internacional',
	demotivoreproducao AS 'Motivo Reprodução'
FROM dwh.dbo.dRegistry;

-------------------------------------------------------------------------------
-- Partition: dCliente
SELECT
IDCLIENTE,
	CDCLIENTE AS 'Code Cliente',
	DEName AS 'Cliente',
	DESIGLA AS 'Sigla'
FROM dwh.dbo.dcliente;

-------------------------------------------------------------------------------
-- Partition: dTempo
SELECT
	IDDATA AS IDDATA,
	[DATA]  AS 'Data',
	CDDIA AS 'Code Dia',
	CDANO AS 'Code Ano',
	CDMES AS 'Code Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Code Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Code Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Code Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Code Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Code Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Code Semestre',
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
IdRegistry,
IDATIVIDADE,
IDUser,
IDEQUIPECHAMADO,
IDITERACAO,
IDTAREFA,
IDPROJETO,
IDRegistryCall,
IDSTATUSCHAMADO,
IDDATA,
MINUTOS,
HORAS,
IDTIPORegistry,
IDSISTEMA,
IDSISTEMAORIGEM,
IDEQUIPEUser,
IDCCUSTOUser,
IDTAREFASERP,
IDPROJETOSERP,
IDEQUIPEUserHIST,
IDUserUX,
IDUserPO,
IDUserPM,
IDVERTICALCHAMADO,
IDUNIDADECHAMADO,
IDTIPOENTREGA,
IDTIPOCONFIGURACAO,
IDINCIDENTECLIENTE,
	SUM ( ( minutos / 60.00 ) / 8.00 ) over ( partition by factRegistry.idUser,
	factRegistry.iddata )AS IHT,
	replace ( SUM ( ( minutos / 60.00 ) / 8.00 ) over ( partition by factRegistry.idUser,
	factRegistry.iddata ).',
)AS IHT_calc,
	DTCARGA
FROM dwh.dbo.factRegistry;

-------------------------------------------------------------------------------
-- Partition: factSample
SELECT
	* 
FROM factSample;

-------------------------------------------------------------------------------
-- Partition: factBacklog
SELECT
	IdRegistry,
	IDTESTER,
	IDRegistryCall,
	IDSTATUSCHAMADO,
	IDEQUIPECHAMADO,
	IDPRIORIDADE,
	IDUserCRIACAO,
	IDUserSOLUCAO,
	IDUserPROPRIETARIO,
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
	IDUserUX,
	IDUserPO,
	IDUserPM,
	IDVERTICALCHAMADO,
	IDUNIDADECHAMADO,
	IDEQUIPEUserEXCEL,
	IDCOMPLEXIDADE,
	IDSEVERIDADE,
	IDEQUIPEESPECIALISTA,
	QTBACKLOG,
	DTCARGA
FROM dwh.dbo.factBacklog;

-------------------------------------------------------------------------------
-- Partition: factInput
SELECT
	IdRegistry,
	IDTESTER,
	IDRegistryCall,
	IDSTATUSCHAMADO,
	IDEQUIPECHAMADO,
	IDPRIORIDADE,
	IDUserCRIACAO,
	IDUserSOLUCAO,
	IDUserPROPRIETARIO,
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
	IDUserUX,
	IDUserPO,
	IDUserPM,
	IDVERTICALCHAMADO,
	IDUNIDADECHAMADO,
	IDEQUIPEUserEXCEL,
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
	IdRegistry,
	IDTESTER,
	IDRegistryCall,
	IDSTATUSCHAMADO,
	IDEQUIPECHAMADO,
	IDPRIORIDADE,
	IDUserCRIACAO,
	IDUserSOLUCAO,
	IDUserPROPRIETARIO,
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
	IDUserUX,
	IDUserPO,
	IDUserPM,
	IDVERTICALCHAMADO,
	IDUNIDADECHAMADO,
	IDEQUIPEUserEXCEL,
	IDCOMPLEXIDADE,
	IDSEVERIDADE,
	IDEQUIPEESPECIALISTA,
	QTOutput,
	DTCARGA
FROM dwh.dbo.factOutput;

-------------------------------------------------------------------------------
-- Partition: factTempoMedio
SELECT
	IdRegistry,
	IDSTATUSCHAMADOANTERIOR,
	IDSTATUSCHAMADOFUTURO,
	IDRegistryCall,
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
	CDSTATUSCHAMADO AS 'Code Status Chamado',
	DEName AS 'Status Chamado'
FROM dwh.dbo.dstatuschamado;

-------------------------------------------------------------------------------
-- Partition: factBacklogZero
SELECT
	* 
FROM factBacklogZero;

-------------------------------------------------------------------------------
-- Partition: dDesenvolvedor
SELECT
	IDUser AS IDDESENVOLVEDOR,
	CDUser AS 'Code Desenvolvedor',
	DEName AS 'Desenvolvedor',
	DENameABV AS 'Desenvolvedor Abrev'
FROMdwh.dbo.dUser;

-------------------------------------------------------------------------------
-- Partition: dTempoApuracao
SELECT
	IDDATA AS IDDTAPURACAO,
	[DATA]  AS 'Data Apuração',
	CDDIA AS 'Code Dia',
	CDANO AS 'Code Ano',
	CDMES AS 'Code Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Code Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Code Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Code Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Code Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Code Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Code Semestre',
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
	CDDIA AS 'Code Dia',
	CDANO AS 'Code Ano',
	CDMES AS 'Code Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Code Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Code Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Code Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Code Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Code Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Code Semestre',
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
	CDDIA AS 'Code Dia',
	CDANO AS 'Code Ano',
	CDMES AS 'Code Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Code Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Code Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Code Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Code Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Code Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Code Semestre',
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
	CDDIA AS 'Code Dia',
	CDANO AS 'Code Ano',
	CDMES AS 'Code Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Code Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Code Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Code Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Code Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Code Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Code Semestre',
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
	CDDIA AS 'Code Dia',
	CDANO AS 'Code Ano',
	CDMES AS 'Code Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Code Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Code Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Code Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Code Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Code Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Code Semestre',
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
	CDDIA AS 'Code Dia',
	CDANO AS 'Code Ano',
	CDMES AS 'Code Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Code Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Code Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Code Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Code Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Code Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Code Semestre',
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
	CDDIA AS 'Code Dia',
	CDANO AS 'Code Ano',
	CDMES AS 'Code Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Code Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Code Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES  AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Code Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Code Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Code Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Code Semestre',
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
	CDDIA AS 'Code Dia',
	CDANO AS 'Code Ano',
	CDMES AS 'Code Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Code Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Code Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Code Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Code Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Code Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Code Semestre',
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
	CDDIA AS 'Code Dia',
	CDANO AS 'Code Ano',
	CDMES AS 'Code Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Code Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Code Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Code Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Code Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Code Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Code Semestre',
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
	CDDIA AS 'Code Dia',
	CDANO AS 'Code Ano',
	CDMES AS 'Code Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Code Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Code Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Code Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Code Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Code Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Code Semestre',
	DESEMESTRE AS 'Semestre',
	DTINICIOSEMANA AS 'Data Início Semana',
	DTFIMSEMANA AS 'Data Fim Semana',
	DEPERIODOSEMANA AS 'Período Semana'
FROM dwh.dbo.dtempo;

-------------------------------------------------------------------------------
-- Partition: dTipoRegistry
SELECT
	IDTIPORegistry,
	CDTIPORegistry AS 'Code Tipo Registry',
	DEName AS 'Tipo Registry'
FROM dwh.dbo.dtipoRegistry;

-------------------------------------------------------------------------------
-- Partition: dSistema
SELECT
	IDSISTEMA,
	CDSISTEMA AS 'Code Sistema',
	DEName AS 'Sistema'
FROM dwh.dbo.dsistema;

-------------------------------------------------------------------------------
-- Partition: dTempoRegistry
SELECT
	IDDATA AS IDDATA,
	[DATA] AS 'Data Registry',
	CDDIA AS 'Code Dia',
	CDANO AS 'Code Ano',
	CDMES AS 'Code Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Code Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Code Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Semana por Extenso',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Code Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Code Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Code Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Code Semestre',
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
	DEName AS 'Módulo'
FROM dwh.dbo.dmodulo;

-------------------------------------------------------------------------------
-- Partition: dPerformance
SELECT
	IDPERFORMANCE,
	CDPERFORMANCE AS 'Code Performance',
	DEName AS 'Performance'
FROM dwh.dbo.dperformance;

-------------------------------------------------------------------------------
-- Partition: dPerformanceEncaminhada
SELECT
	IDPERFORMANCEENCAMINHADA,
	CDPERFORMANCEENCAMINHADA AS 'Code Performance Encaminhada',
	DEName AS 'Performance Encaminhada'
FROM dwh.dbo.dperformanceencaminhada;

-------------------------------------------------------------------------------
-- Partition: dOriundoRejeite
SELECT
	IDORIUNDOREJEITE,
	CDORIUNDOREJEITE AS 'Code Oriundo Rejeite',
	DEName AS 'Oriundo Rejeite'
FROM dwh.dbo.doriundorejeite;

-------------------------------------------------------------------------------
-- Partition: dEquipeUser
SELECT
	IDEQUIPEUser,
	IDEQUIPE AS 'Code Equipe Usuário',
	DEEQUIPE AS 'Equipe Usuário'
FROM dwh.dbo.dequipeUser;

-------------------------------------------------------------------------------
-- Partition: dCCustoUser
SELECT
	IDCCUSTOUser,
	CDCCUSTOUser AS 'Code Centro de Custo Usuário',
	DECCUSTOUser AS 'Centro de Custo Usuário'
FROM
	dwh.dbo.dccustoUser;

-------------------------------------------------------------------------------
-- Partition: dTarefaSerp
SELECT
	IDTAREFASERP,
	CDTAREFASERP AS 'Code Tarefa Serp',
	DEName AS 'Tarefa Serp'
FROM dwh.dbo.dtarefaserp;

-------------------------------------------------------------------------------
-- Partition: dProjetoSerp
SELECT
	IDPROJETOSERP,
	CDPROJETOSERP AS 'Code Projeto Serp',
	DEName AS 'Name Projeto Serp'
FROM dwh.dbo.dprojetoserp;

-------------------------------------------------------------------------------
-- Partition: dSistemaOrigem
SELECT
	IDSISTEMAORIGEM,
	DEName AS 'Sistema Origem'
FROM dwh.dbo.dsistemaorigem;

-------------------------------------------------------------------------------
-- Partition: dIteracao
SELECT
	IDITERACAO,
	CDITERACAO AS 'Code Iteração',
	DEName AS 'Iteração'
FROM dwh.dbo.diteracao;

-------------------------------------------------------------------------------
-- Partition: dEquipeUserHist
SELECT
	IDEQUIPEUserHIST,
	IDUserHIST AS IDUserHIST,
	IDEQUIPEHIST AS 'Code Equipe Usuário',
	DEEQUIPEHIST AS 'Equipe Usuário',
	dtinicioperiodo AS 'Início Período',
	dtfimperiodo AS 'Fim Período',
	FLREGISTROCurrent AS 'Flag Registro Current'
FROM dwh.dbo.dequipeUserhist;

-------------------------------------------------------------------------------
-- Partition: factRegistryIHT
SELECT
	factRegistry.idUser,
	factRegistry.iddata,
	factRegistry.idequipeUserhist,
	factRegistry.idequipeUser,
	factRegistry.IDTIPOENTREGA,
	SUM( minutos / 60.00 ) / 8.00AS 'IHT'
FROM factRegistry'GROUP BY',
	factRegistry.idUser,
	factRegistry.iddata,
	factRegistry.idequipeUserhist,
	factRegistry.idequipeUser,
factRegistry.IDTIPOENTREGA;

-------------------------------------------------------------------------------
-- Partition: dEquipeChamado
SELECT
IDEQUIPECHAMADO,
	CDEQUIPE AS 'Code Equipe',
	DEName AS 'Equipe',
	-- stg.rivw_vw_team.team,
	DESIGLA AS 'Sigla Equipe',
	URLIMAGEM1 AS 'Imagem Quadrada',
	URLIMAGEM2 AS 'Imagem Redonda'
FROM dwh.dbo.dequipechamado;

-------------------------------------------------------------------------------
-- Partition: dUserCriacao
SELECT
	IDUser AS 'IDUserCRIACAO',
	 CDUser AS 'Code Usuário',
	 DEName AS 'Usuário Criação',
	 DENameABV AS 'Login' 
FROM dwh.dbo.dUser;

-------------------------------------------------------------------------------
-- Partition: dUserPriorizado
SELECT
	IDUser AS 'IDUserPRIORIZADO',
	 CDUser AS 'Code Usuário',
	 DEName AS 'Usuário Priorizado',
	 DENameABV AS 'Login' 
FROM dwh.dbo.dUser;

-------------------------------------------------------------------------------
-- Partition: dUserProprietario
SELECT
	IDUser AS ' IDUserPROPRIETARIO',
	 CDUser AS 'Code Usuário',
	 DEName AS 'Usuário Proprietário',
	 DENameABV AS 'Login' 
FROM dwh.dbo.dUser;

-------------------------------------------------------------------------------
-- Partition: dUserSolucao
SELECT
	IDUser AS 'IDUserSOLUCAO',
	 CDUser AS 'Code Usuário',
	 DEName AS 'Usuário Solução',
	 DENameABV AS 'Login' 
FROM dwh.dbo.dUser;

-------------------------------------------------------------------------------
-- Partition: dTempoPrazoPPF
SELECT
	IDDATA AS IDDTPRAZOPPF,
	[DATA] AS 'Data Prazo PPF',
	CDDIA AS 'Code Dia',
	CDANO AS 'Code Ano',
	CDMES AS 'Code Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Code Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Code Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Code Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Code Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Code Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Code Semestre',
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
	CDDIA AS 'Code Dia',
	CDANO AS 'Code Ano',
	CDMES AS 'Code Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Code Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Code Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Code Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Code Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Code Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Code Semestre',
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
	CDDIA AS 'Code Dia',
	CDANO AS 'Code Ano',
	CDMES AS 'Code Mês',
	DEMES AS 'Mês',
	DEMESABV AS 'Mês Abrev',
	CDPERIODO AS 'Code Período',
	DEPERIODO AS 'Período',
	CDDIASEMANA AS 'Code Dia Semana',
	DEDIASEMANA AS 'Dia Semana',
	DEDIASEMANAABV AS 'Dia Semana Abrev',
	NUSEMANAMES AS 'Número Semana Mês',
	DESEMANAMES AS 'Descrição Semana Mês',
	NUSEMANAANO AS 'Número Semana Ano',
	FLFIMSEMANA AS 'Flag Fim de Semana',
	FLDIASEMANA AS 'Flag Dia de Semana',
	FLFERIADO AS 'Flag Feriado',
	CDBIMESTRE AS 'Code Bimestre',
	DEBIMESTRE AS 'Bimestre',
	CDTRIMESTRE AS 'Code Trimestre',
	DETRIMESTRE AS 'Trimestre',
	CDQUADRIMESTRE AS 'Code Quadrimestre',
	DEQUADRIMESTRE AS 'Quadrimestre',
	CDSEMESTRE AS 'Code Semestre',
	DESEMESTRE AS 'Semestre',
	DTINICIOSEMANA AS 'Data Início Semana',
	DTFIMSEMANA AS 'Data Fim Semana',
	DEPERIODOSEMANA AS 'Período Semana'
FROM dwh.dbo.dtempo;

-------------------------------------------------------------------------------
-- Partition: dUserPO
SELECT
	IDUser AS 'IDUserPO',
	CDUser AS 'Code Usuário',
	DEName AS 'Usuário PO',
	DENameABV AS 'Login'
FROM dwh.dbo.dUser;

-------------------------------------------------------------------------------
-- Partition: dUserPM
SELECT
	IDUser AS 'IDUserPM',
	CDUser AS 'Code Usuário',
	DEName AS 'Usuário PM',
	DENameABV AS 'Login'
FROM dwh.dbo.dUser;

-------------------------------------------------------------------------------
-- Partition: dUserUX
SELECT
	IDUser AS 'IDUserUX',
	CDUser AS 'Code Usuário',
	DEName AS 'Usuário UX',
	DENameABV AS 'Login'
FROM dwh.dbo.dUser;

-------------------------------------------------------------------------------
-- Partition: dUnidade
SELECT
	IDUNIDADE AS 'IDUNIDADECHAMADO',
	CDUNIDADE AS 'Code Unidade',
	DEName AS 'Unidade',
	DESIGLA AS 'Sigla Unidade'
FROM dwh.dbo.dunidade;

-------------------------------------------------------------------------------
-- Partition: dVertical
SELECT
	IDVERTICAL AS 'IDVERTICALCHAMADO',
	CDVERTICAL AS 'Code Vertical',
	DEName AS 'Vertical',
	DESIGLA AS 'Sigla Vertical'
FROM dwh.dbo.dvertical;

-------------------------------------------------------------------------------
-- Partition: dEquipeUserExcel
SELECT
	IDEQUIPEUserEXCEL,
	IDDTAPURACAO,
	DENameUser AS 'Usuário',
	DENameEQUIPE AS 'Equipe',
	DESTATUSUser AS 'Status Usuário'
FROM dwh.dbo.dequipeUserexcel;

-------------------------------------------------------------------------------
-- Partition: dTipoEntrega
SELECT
	IDTIPOENTREGA,
	CDTIPOENTREGA AS 'Code Tipo Entrega',
	DEName AS 'Tipo Entrega'
FROM dwh.dbo.dtipoentrega;

-------------------------------------------------------------------------------
-- Partition: dTipoConfiguracao
SELECT
	IDTIPOCONFIGURACAO,
	CDTIPOCONFIGURACAO AS 'Code Tipo Configuração',
	DEName AS 'Tipo Configuração'
FROM dwh.dbo.dtipoconfiguracao;

-------------------------------------------------------------------------------
-- Partition: dIncidenteCliente
SELECT
	IDINCIDENTECLIENTE,
	CDINCIDENTECLIENTE AS 'Code Incidente Cliente',
	DEName AS 'Incidente Cliente'
FROM dwh.dbo.dincidentecliente;

-------------------------------------------------------------------------------
-- Partition: dComplexidade
SELECT
	IDCOMPLEXIDADE,
	CDCOMPLEXIDADE AS 'Code Complexidade',
	DEName AS 'Complexidade'
FROM dwh.dbo.dComplexidade;

-------------------------------------------------------------------------------
-- Partition: dEquipeEspecialista
SELECT
	IDEQUIPEESPECIALISTA,
	CDEQUIPEESPECIALISTAAS 'Code Equipe Especialista',
	DENameAS 'Equipe Especialista'
FROM dwh.dbo.dEquipeEspecialista;

-------------------------------------------------------------------------------
-- Partition: dSeveridade
SELECT
	IDSEVERIDADE,
	CDSEVERIDADE AS 'Code Severidade',
	DEName AS 'Severidade'
FROM dwh.dbo.dSeveridade;

