dCategory Partition:
	SELECT
	 
	        IDCATEGORIA,
	
	        CDCATEGORIA AS Código Categoria
	,
	        DENOME AS Categoria
	,
	        DEDOMINIOAS  Domínio
	,
	        DECATEGORIADEFEITO   AS Categoria Defeito,
	 
FROM dwh.dbo.dCategory;


dCausaRaiz Partition:
	SELECT
	 
	       IDCAUSARAIZ,
	
	       CDCAUSARAIZ AS Código Causa Raíz
	,
	       DENOME AS Causa Raíz,
	 
FROM dwh.dbo.dcausaraiz;


dFaseCiclo Partition:
	SELECT
	 
	 IDFASECICLO,
	
	 CDFASECICLOAS Código Fase Ciclo
		 DENOMEAS Fase Ciclo
		 DEAMBIENTEAS Atividade Fase Ciclo,
	 
FROM dwh.dbo.dfaseciclo;


dPlanejadoPara Partition:
	SELECT
	 
	 IDITERACAO,
	
	 CDITERACAOAS Código Planejado para
	,
	 DENOMEAS Planejado para,
	 
FROM dwh.dbo.diteracao;


dModuloFuncional Partition:
	SELECT
	 
	 IDMODULOFUNCIONAL,
	 
	 CDMODULOFUNCIONALAS Código Módulo Funcional
	,
	 DENOMEAS Módulo Funcional,
	 
FROM dwh.dbo.dmodulofuncional;


dPrioridade Partition:
	SELECT
	 
	 IDPRIORIDADE,
	
	 CDPRIORIDADE                AS Código Prioridade
	,
	 DENOMEAS Prioridade,
	 
FROM dwh.dbo.dprioridade;


dPrioridadeNegociada Partition:
	SELECT
	 
	 IDPRIORIDADENEGOCIADA,
	 
	 CDPRIORIDADENEGOCIADAAS Código Prioridade Negociada
	,
	 DENOMEAS Prioridade Negociada,
	 
FROM dwh.dbo.dprioridadenegociada;


dProjeto Partition:
	SELECT
	 
	 IDPROJETO,
	
	 CDPROJETOAS Código Projeto
	,
	 DENOMEAS Projeto,
	 
FROM dwh.dbo.dprojeto;


dSimuladoBaseInterna Partition:
	SELECT
	 
	 IDSIMULADOBASEINTERNA,
	
	 CDSIMULADOBASEINTERNAAS Código Simulado Base Interna
	,
	 DENOMEAS Simulado Base Interna - origem,
	 
FROM dwh.dbo.dsimuladobaseinterna;


dTester Partition:
	SELECT
	 
	 IDTESTER,
	 
	 CDTESTERAS Código Tester
	,
	 DENOMEAS Tester,
	 
FROM dwh.dbo.dtester;


dTipoChamado Partition:
	SELECT
	 
	 IDTIPOCHAMADO,
	
	 CDTIPOCHAMADOAS Código Tipo Chamado
	,
	 DENOMEAS Tipo Chamado,
	 
FROM dwh.dbo.dtipochamado;


dUsuario Partition:
	SELECT
	 
	 IDUSUARIO,
	
	 CDUSUARIOAS Código Usuário
	,
	 DENOMEAS Usuário
	,
	 DENOMEABVAS Login,
	 
FROM dwh.dbo.dusuario;


Medidas Partition:
	SELECT
	 1 AS Medidas;


dAtividade Partition:
	SELECT
	 
	    IDATIVIDADE,
	
	    CDATIVIDADEAS  Código Atividade
	,
	    DENOME AS  Atividade,
	 
FROM dwh.dbo.datividade;


dTarefa Partition:
	SELECT
	 
	 IDTAREFA,
	
	 CDTAREFAAS Código Tarefa
	,
	 DENOMEAS Tarefa
	,
	 DEURLAS URL,
	 
FROM dwh.dbo.dtarefa;


dChamado Partition:
	SELECT
	 IDCHAMADO,
	
	       CDCHAMADOAS Código Chamado
	,
	       NUCHAMADOAS Número Chamado
	,
	       NUSCCDAS Numero SCCD
	,
	       DETITULOAS Título
	,
	       DENOMEAS Chamado
	,
	       DETAGAS Tag
	,
	       DESTATUSAS Status
	,
	       NUSALTAS Número Salt
	,
	       DECAUSAAS Causa
	,
	       DEURLAS URL
	,
	       FLBLOQUEADO                AS Binário Flag Bloqueado
	,
	       FLPERFORMANCEAS Flag Performace - origem
	,
	       FLPERFORMANCEENCAMINHADA  AS Flag Performace Encaminhada - origem
	,
	       DEVERSAOORIGEMAS Versão Origem
	,
	       FLINTERNACIONALAS Flag Internacional
	,
	       demotivoreproducaoAS Motivo Reprodução,
	 
FROM dwh.dbo.dchamado;


dCliente Partition:
	SELECT
	 
	       IDCLIENTE,
	
	       CDCLIENTE AS Código Cliente
	,
	       DENOMEAS Cliente
	,
	       DESIGLAAS Sigla,
	 
FROM dwh.dbo.dcliente;


dTempo Partition:
	SELECT
	 
	 IDDATA                     AS IDDATA,
	
	 [DATA] AS Data
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo
	 
WHERE CDANO >= 2015 AND CDANO <= YEAR(GETDATE()) + 1


fChamadoApontamento Partition:
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
	
	       IDTIPOAPONTAMENTO,
	
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
	
	 SUM ( ( minutos / 60.00 ) / 8.00 ) over ( partition by fchamadoapontamento.idusuario,
	 fchamadoapontamento.iddata ) AS IHT,
	 replace ( SUM ( ( minutos / 60.00 ) / 8.00 ) over ( partition by fchamadoapontamento.idusuario,
	 fchamadoapontamento.iddata ),
	 .
	 
	 ) AS IHT_calc,
	,
	       DTCARGA
	 
FROM dwh.dbo.fchamadoapontamento;


fChamadoArtefatoEvolucao Partition:
	SELECT
	 * 
FROM fChamadoArtefatoEvolucao;


fChamadoBacklog Partition:
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
	 
FROM dwh.dbo.fChamadoBacklog;


fChamadoEntrada Partition:
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
	 
	 QTENTRADA,
	 
	 DTCARGA
	 
FROM dwh.dbo.fChamadoEntrada;


fChamadoNegociado Partition:
	SELECT
	 * 
FROM fChamadoNegociado;


fChamadoSaida Partition:
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
	 
	 QTSAIDA,
	 
	 DTCARGA
	 
FROM dwh.dbo.fChamadoSaida;


fChamadoTempoMedio Partition:
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
	 
	 IDDESENVOLVEDOR
	 
FROM dwh.dbo.fChamadoTempoMedio;


dStatusChamado Partition:
	SELECT
	 
	 IDSTATUSCHAMADO,
	
	 CDSTATUSCHAMADOAS Código Status Chamado
	,
	 DENOMEAS Status Chamado,
	 
FROM dwh.dbo.dstatuschamado;


fChamadoBacklogZero Partition:
	SELECT
	 * 
FROM fChamadoBacklogZero;


dDesenvolvedor Partition:
	SELECT
	 
	 IDUSUARIOAS IDDESENVOLVEDOR,
	
	 CDUSUARIOAS Código Desenvolvedor
	,
	 DENOMEAS Desenvolvedor
	,
	 DENOMEABVAS Desenvolvedor Abrev,
	 
FROM  dwh.dbo.dusuario;


dTempoApuracao Partition:
	SELECT
	 
	 IDDATA                     AS IDDTAPURACAO,
	
	 [DATA] AS Data Apuração
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoCriacao Partition:
	SELECT
	 
	 IDDATA                     AS IDDTCRIACAO,
	
	 [DATA] AS Data Criação
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoCriacaoSAC Partition:
	SELECT
	 
	 IDDATA                     AS IDDTCRIACAOSAC,
	
	 [DATA] AS Data Criação SAC
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoFinalStatus Partition:
	SELECT
	 
	 IDDATA                     AS IDDTFINALSTATUS,
	
	 [DATA] AS Data Final Status
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoInicioStatus Partition:
	SELECT
	 
	 IDDATA                     AS IDDTINICIOSTATUS,
	
	 [DATA] AS Data Início Status
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoPrazoSLA Partition:
	SELECT
	 
	 IDDATA                     AS IDDTPRAZOSLA,
	
	 [DATA] AS Data Prazo SLA
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoPrevista Partition:
	SELECT
	
	 IDDATAAS IDDTPREVISTA,
	
	 [DATA]                                       AS Data Prevista
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMES AS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                               AS Data Início Semana
	,
	 DTFIMSEMANA                                        AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROMdwh.dbo.dtempo;


dTempoResolucao Partition:
	SELECT
	 
	 IDDATA                     AS IDDTRESOLUCAO,
	
	 [DATA] AS Data Resolução
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoSolucao Partition:
	SELECT
	 
	 IDDATA                     AS IDDTSOLUCAO,
	
	 [DATA] AS Data Solução
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoPriorizado Partition:
	SELECT
	 
	 IDDATA                     AS IDDTPRIORIZADO,
	
	 [DATA] AS Data Priorizado
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTipoApontamento Partition:
	SELECT
	 
	 IDTIPOAPONTAMENTO,
	 
	 CDTIPOAPONTAMENTOAS Código Tipo Apontamento
	,
	 DENOMEAS Tipo Apontamento,
	 
FROM dwh.dbo.dtipoapontamento;


dSistema Partition:
	SELECT
	 
	 IDSISTEMA,
	
	 CDSISTEMAAS Código Sistema
	,
	 DENOMEAS Sistema,
	 
FROM dwh.dbo.dsistema;


dTempoApontamento Partition:
	SELECT
	
	 IDDATA                               AS IDDATA,
	
	 [DATA]                                      AS Data Apontamento
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANA          AS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMES                                AS Número Semana Mês
	,
	 DESEMANAMESAS Semana por Extenso
	,
	 NUSEMANAANO                  AS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTRE                     AS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTRE                 AS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTRE                  AS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                     AS Data Início Semana
	,
	 DTFIMSEMANA                          AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROMdwh.dbo.dtempo
	 
WHERE   EXISTS
	 (
	 SELECT
	 
	 TOP 1 1
	 
FROM dwh.dbo.fchamadoapontamento
	 
WHERELEFT( dwh.dbo.fchamadoapontamento.iddata,
	 4 ) = LEFT( dwh.dbo.dtempo.iddata,
	 4 )
	 )


fChamadoApontamentoPerfilSeguranca Partition:
	SELECT
	 * 
FROM fChamadoApontamento;


dModulo Partition:
	SELECT
	 
	 IDMODULO,
	
	 DENOMEAS Módulo,
	 
FROM dwh.dbo.dmodulo;


dPerformance Partition:
	SELECT
	 
	 IDPERFORMANCE,
	
	 CDPERFORMANCE                AS Código Performance
	,
	 DENOMEAS Performance,
	 
FROM dwh.dbo.dperformance;


dPerformanceEncaminhada Partition:
	SELECT
	 
	 IDPERFORMANCEENCAMINHADA,
	
	 CDPERFORMANCEENCAMINHADA                                AS Código Performance Encaminhada
	,
	 DENOMEAS Performance Encaminhada,
	 
FROM dwh.dbo.dperformanceencaminhada;


dOriundoRejeite Partition:
	SELECT
	 
	 IDORIUNDOREJEITE,
	
	 CDORIUNDOREJEITE                AS Código Oriundo Rejeite
		 DENOMEAS Oriundo Rejeite,
	 
FROM dwh.dbo.doriundorejeite;


dEquipeUsuario Partition:
	SELECT
	 
	 IDEQUIPEUSUARIO,
	
	 IDEQUIPEAS Código Equipe Usuário
		 DEEQUIPEAS Equipe Usuário,
	 
FROM dwh.dbo.dequipeusuario;


dCCustoUsuario Partition:
	SELECT
	 
	 IDCCUSTOUSUARIO,
	
	 CDCCUSTOUSUARIOAS  Código Centro de Custo Usuário
	,
	 DECCUSTOUSUARIOAS  Centro de Custo Usuário,
	 
FROMdwh.dbo.dccustousuario;


dTarefaSerp Partition:
	SELECT
	 
	 IDTAREFASERP,
	
	 CDTAREFASERPAS Código Tarefa Serp
	,
	 DENOMEAS Tarefa Serp,
	 
FROM dwh.dbo.dtarefaserp;


dProjetoSerp Partition:
	SELECT
	
	 IDPROJETOSERP,
	
	 CDPROJETOSERP    AS Código Projeto Serp
	,
	 DENOME AS Nome Projeto Serp,
	 
FROM dwh.dbo.dprojetoserp;


dSistemaOrigem Partition:
	SELECT
	 
	 IDSISTEMAORIGEM,
	
	 DENOMEAS Sistema Origem,
	 
FROM dwh.dbo.dsistemaorigem;


dIteracao Partition:
	SELECT
	 
	 IDITERACAO,
	
	 CDITERACAOAS Código Iteração
	,
	 DENOMEAS Iteração,
	 
FROM dwh.dbo.diteracao;


dEquipeUsuarioHist Partition:
	SELECT
	 
	 IDEQUIPEUSUARIOHIST,
	
	 IDUSUARIOHIST                                      AS IDUSUARIOHIST,
	 
	 IDEQUIPEHIST                AS Código Equipe Usuário
		 DEEQUIPEHISTAS Equipe Usuário
		 dtinicioperiodo                AS Início Período
	 	 dtfimperiodo AS Fim Período
	 	 FLREGISTROATUALAS Flag Registro Atual,
	 
FROM dwh.dbo.dequipeusuariohist;


fChamadoApontamentoIHT Partition:
	SELECT
	
	 fchamadoapontamento.idusuario,
	
	 fchamadoapontamento.iddata,
	
	 fchamadoapontamento.idequipeusuariohist,
	
	 fchamadoapontamento.idequipeusuario,
	
	 fchamadoapontamento.IDTIPOENTREGA,
	
	 SUM( minutos / 60.00 ) / 8.00 AS IHT,
	 
FROM fchamadoapontamento
	 GROUP BY
	 fchamadoapontamento.idusuario,
	
	 fchamadoapontamento.iddata,
	
	 fchamadoapontamento.idequipeusuariohist,
	
	 fchamadoapontamento.idequipeusuario,
	
	                fchamadoapontamento.IDTIPOENTREGA;


dEquipeChamado Partition:
	SELECT
	 
	       IDEQUIPECHAMADO,
	
	       CDEQUIPEAS Código Equipe
		       DENOMEAS Equipe
	 -- stg.rivw_vw_team.team,
	       DESIGLAAS Sigla Equipe
	,
	       URLIMAGEM1AS Imagem Quadrada
	,
	       URLIMAGEM2AS Imagem Redonda,
	 
FROM dwh.dbo.dequipechamado;


dUsuarioCriacao Partition:
	SELECT
	
	  IDUSUARIO AS IDUSUARIOCRIACAO
	,
	  CDUSUARIO AS Código Usuário
	,
	  DENOME AS Usuário Criação
	,
	  DENOMEABV AS Login	 
FROM dwh.dbo.dusuario;


dUsuarioPriorizado Partition:
	SELECT
	
	  IDUSUARIO AS IDUSUARIOPRIORIZADO
	,
	  CDUSUARIO AS Código Usuário
	,
	  DENOME AS Usuário Priorizado
	,
	  DENOMEABV AS Login	 
FROM dwh.dbo.dusuario;


dUsuarioProprietario Partition:
	SELECT
	
	  IDUSUARIO AS  IDUSUARIOPROPRIETARIO
	,
	  CDUSUARIO AS Código Usuário
	,
	  DENOME AS Usuário Proprietário
	,
	  DENOMEABV AS Login	 
FROM dwh.dbo.dusuario;


dUsuarioSolucao Partition:
	SELECT
	
	  IDUSUARIO AS IDUSUARIOSOLUCAO
	,
	  CDUSUARIO AS Código Usuário
	,
	  DENOME AS Usuário Solução
	,
	  DENOMEABV AS Login	 
FROM dwh.dbo.dusuario;


dTempoPrazoPPF Partition:
	SELECT
	 
	 IDDATA                                       AS IDDTPRAZOPPF,
	
	 [DATA]AS Data Prazo PPF
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANA             AS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMES                      AS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANO        AS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTRE            AS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTRE                   AS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTRE                AS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANAAS Data Início Semana
	,
	 DTFIMSEMANA AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoPrazoAnalise Partition:
	SELECT
	 
	 IDDATA                                       AS IDDTPRAZOANALISE,
	
	 [DATA] AS Data Prazo Análise
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANA             AS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMES                      AS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANO        AS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTRE            AS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTRE                   AS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTRE                AS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANAAS Data Início Semana
	,
	 DTFIMSEMANAAS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoPrazoEspecificacao Partition:
	SELECT
	 
	 IDDATA                                       AS IDDTPRAZOESPECIFICACAO,
	
	 [DATA]AS Data Prazo Especificação
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANA             AS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMES                      AS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANO        AS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTRE            AS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTRE                   AS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTRE                AS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANAAS Data Início Semana
	,
	 DTFIMSEMANAAS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dUsuarioPO Partition:
	SELECT
	 
	 IDUSUARIOAS IDUSUARIOPO
	,
	 CDUSUARIOAS Código Usuário
	,
	 DENOMEAS Usuário PO
	,
	 DENOMEABVAS Login,
	 
FROM dwh.dbo.dusuario;


dUsuarioPM Partition:
	SELECT
	 
	 IDUSUARIOAS IDUSUARIOPM
	,
	 CDUSUARIOAS Código Usuário
	,
	 DENOMEAS Usuário PM
	,
	 DENOMEABVAS Login,
	 
FROM dwh.dbo.dusuario;


dUsuarioUX Partition:
	SELECT
	 
	 IDUSUARIOAS IDUSUARIOUX
	,
	 CDUSUARIOAS Código Usuário
	,
	 DENOMEAS Usuário UX
	,
	 DENOMEABVAS Login,
	 
FROM dwh.dbo.dusuario;


dUnidade Partition:
	SELECT
	 
	 IDUNIDADE AS IDUNIDADECHAMADO
	,
	 CDUNIDADEAS Código Unidade
	,
	 DENOMEAS Unidade
	,
	 DESIGLAAS Sigla Unidade,
	 
FROM dwh.dbo.dunidade;


dVertical Partition:
	SELECT
	 
	 IDVERTICALAS IDVERTICALCHAMADO
	,
	 CDVERTICALAS Código Vertical
	,
	 DENOMEAS Vertical
	,
	 DESIGLAAS Sigla Vertical,
	 
FROM dwh.dbo.dvertical;


dEquipeUsuarioExcel Partition:
	SELECT
	 
	 IDEQUIPEUSUARIOEXCEL,
	 
	 IDDTAPURACAO,
	 
	 DENOMEUSUARIO                AS Usuário
		 DENOMEEQUIPE                AS Equipe
		 DESTATUSUSUARIOAS Status Usuário,
	 
FROM dwh.dbo.dequipeusuarioexcel;


dTipoEntrega Partition:
	SELECT
	 
	 IDTIPOENTREGA,
	
	 CDTIPOENTREGA                AS Código Tipo Entrega
	,
	 DENOMEAS Tipo Entrega,
	 
FROM dwh.dbo.dtipoentrega;


dTipoConfiguracao Partition:
	SELECT
	 
	 IDTIPOCONFIGURACAO,
	
	 CDTIPOCONFIGURACAO                AS Código Tipo Configuração
	,
	 DENOMEAS Tipo Configuração,
	 
FROM dwh.dbo.dtipoconfiguracao;


dIncidenteCliente Partition:
	SELECT
	 
	 IDINCIDENTECLIENTE,
	 
	 CDINCIDENTECLIENTE AS Código Incidente Cliente
	,
	 DENOME                 AS Incidente Cliente,
	 
FROM dwh.dbo.dincidentecliente;


dComplexidade Partition:
	SELECT
	 
	 IDCOMPLEXIDADE,
	 
	 CDCOMPLEXIDADE                AS Código Complexidade
		 DENOMEAS Complexidade,
	 
FROM dwh.dbo.dComplexidade;


dEquipeEspecialista Partition:
	SELECT
	 
	 IDEQUIPEESPECIALISTA,
	 
	 CDEQUIPEESPECIALISTA             AS Código Equipe Especialista
	,
	 DENOME                                       AS Equipe Especialista,
	 
FROM dwh.dbo.dEquipeEspecialista;


dSeveridade Partition:
	SELECT
	 
	 IDSEVERIDADE,
	
	 CDSEVERIDADE                AS Código Severidade
		 DENOMEAS Severidade,
	 
FROM dwh.dbo.dSeveridade;


dCategory Partition:
	SELECT
	 
	        IDCATEGORIA,
	
	        CDCATEGORIA AS Código Categoria
	,
	        DENOME AS Categoria
	,
	        DEDOMINIOAS  Domínio
	,
	        DECATEGORIADEFEITO   AS Categoria Defeito,
	 
FROM dwh.dbo.dCategory;


dCausaRaiz Partition:
	SELECT
	 
	       IDCAUSARAIZ,
	
	       CDCAUSARAIZ AS Código Causa Raíz
	,
	       DENOME AS Causa Raíz,
	 
FROM dwh.dbo.dcausaraiz;


dFaseCiclo Partition:
	SELECT
	 
	 IDFASECICLO,
	
	 CDFASECICLOAS Código Fase Ciclo
		 DENOMEAS Fase Ciclo
		 DEAMBIENTEAS Atividade Fase Ciclo,
	 
FROM dwh.dbo.dfaseciclo;


dPlanejadoPara Partition:
	SELECT
	 
	 IDITERACAO,
	
	 CDITERACAOAS Código Planejado para
	,
	 DENOMEAS Planejado para,
	 
FROM dwh.dbo.diteracao;


dModuloFuncional Partition:
	SELECT
	 
	 IDMODULOFUNCIONAL,
	 
	 CDMODULOFUNCIONALAS Código Módulo Funcional
	,
	 DENOMEAS Módulo Funcional,
	 
FROM dwh.dbo.dmodulofuncional;


dPrioridade Partition:
	SELECT
	 
	 IDPRIORIDADE,
	
	 CDPRIORIDADE                AS Código Prioridade
	,
	 DENOMEAS Prioridade,
	 
FROM dwh.dbo.dprioridade;


dPrioridadeNegociada Partition:
	SELECT
	 
	 IDPRIORIDADENEGOCIADA,
	 
	 CDPRIORIDADENEGOCIADAAS Código Prioridade Negociada
	,
	 DENOMEAS Prioridade Negociada,
	 
FROM dwh.dbo.dprioridadenegociada;


dProjeto Partition:
	SELECT
	 
	 IDPROJETO,
	
	 CDPROJETOAS Código Projeto
	,
	 DENOMEAS Projeto,
	 
FROM dwh.dbo.dprojeto;


dSimuladoBaseInterna Partition:
	SELECT
	 
	 IDSIMULADOBASEINTERNA,
	
	 CDSIMULADOBASEINTERNAAS Código Simulado Base Interna
	,
	 DENOMEAS Simulado Base Interna - origem,
	 
FROM dwh.dbo.dsimuladobaseinterna;


dTester Partition:
	SELECT
	 
	 IDTESTER,
	 
	 CDTESTERAS Código Tester
	,
	 DENOMEAS Tester,
	 
FROM dwh.dbo.dtester;


dTipoChamado Partition:
	SELECT
	 
	 IDTIPOCHAMADO,
	
	 CDTIPOCHAMADOAS Código Tipo Chamado
	,
	 DENOMEAS Tipo Chamado,
	 
FROM dwh.dbo.dtipochamado;


dUsuario Partition:
	SELECT
	 
	 IDUSUARIO,
	
	 CDUSUARIOAS Código Usuário
	,
	 DENOMEAS Usuário
	,
	 DENOMEABVAS Login,
	 
FROM dwh.dbo.dusuario;


Medidas Partition:
	SELECT
	 1 AS Medidas;


dAtividade Partition:
	SELECT
	 
	    IDATIVIDADE,
	
	    CDATIVIDADEAS  Código Atividade
	,
	    DENOME AS  Atividade,
	 
FROM dwh.dbo.datividade;


dTarefa Partition:
	SELECT
	 
	 IDTAREFA,
	
	 CDTAREFAAS Código Tarefa
	,
	 DENOMEAS Tarefa
	,
	 DEURLAS URL,
	 
FROM dwh.dbo.dtarefa;


dChamado Partition:
	SELECT
	 IDCHAMADO,
	
	       CDCHAMADOAS Código Chamado
	,
	       NUCHAMADOAS Número Chamado
	,
	       NUSCCDAS Numero SCCD
	,
	       DETITULOAS Título
	,
	       DENOMEAS Chamado
	,
	       DETAGAS Tag
	,
	       DESTATUSAS Status
	,
	       NUSALTAS Número Salt
	,
	       DECAUSAAS Causa
	,
	       DEURLAS URL
	,
	       FLBLOQUEADO                AS Binário Flag Bloqueado
	,
	       FLPERFORMANCEAS Flag Performace - origem
	,
	       FLPERFORMANCEENCAMINHADA  AS Flag Performace Encaminhada - origem
	,
	       DEVERSAOORIGEMAS Versão Origem
	,
	       FLINTERNACIONALAS Flag Internacional
	,
	       demotivoreproducaoAS Motivo Reprodução,
	 
FROM dwh.dbo.dchamado;


dCliente Partition:
	SELECT
	 
	       IDCLIENTE,
	
	       CDCLIENTE AS Código Cliente
	,
	       DENOMEAS Cliente
	,
	       DESIGLAAS Sigla,
	 
FROM dwh.dbo.dcliente;


dTempo Partition:
	SELECT
	 
	 IDDATA                     AS IDDATA,
	
	 [DATA] AS Data
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo
	 
WHERE CDANO >= 2015 AND CDANO <= YEAR(GETDATE()) + 1


fChamadoApontamento Partition:
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
	
	       IDTIPOAPONTAMENTO,
	
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
	
	 SUM ( ( minutos / 60.00 ) / 8.00 ) over ( partition by fchamadoapontamento.idusuario,
	 fchamadoapontamento.iddata ) AS IHT,
	 replace ( SUM ( ( minutos / 60.00 ) / 8.00 ) over ( partition by fchamadoapontamento.idusuario,
	 fchamadoapontamento.iddata ),
	 .
	 
	 ) AS IHT_calc,
	,
	       DTCARGA
	 
FROM dwh.dbo.fchamadoapontamento;


fChamadoArtefatoEvolucao Partition:
	SELECT
	 * 
FROM fChamadoArtefatoEvolucao;


fChamadoBacklog Partition:
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
	 
FROM dwh.dbo.fChamadoBacklog;


fChamadoEntrada Partition:
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
	 
	 QTENTRADA,
	 
	 DTCARGA
	 
FROM dwh.dbo.fChamadoEntrada;


fChamadoNegociado Partition:
	SELECT
	 * 
FROM fChamadoNegociado;


fChamadoSaida Partition:
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
	 
	 QTSAIDA,
	 
	 DTCARGA
	 
FROM dwh.dbo.fChamadoSaida;


fChamadoTempoMedio Partition:
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
	 
	 IDDESENVOLVEDOR
	 
FROM dwh.dbo.fChamadoTempoMedio;


dStatusChamado Partition:
	SELECT
	 
	 IDSTATUSCHAMADO,
	
	 CDSTATUSCHAMADOAS Código Status Chamado
	,
	 DENOMEAS Status Chamado,
	 
FROM dwh.dbo.dstatuschamado;


fChamadoBacklogZero Partition:
	SELECT
	 * 
FROM fChamadoBacklogZero;


dDesenvolvedor Partition:
	SELECT
	 
	 IDUSUARIOAS IDDESENVOLVEDOR,
	
	 CDUSUARIOAS Código Desenvolvedor
	,
	 DENOMEAS Desenvolvedor
	,
	 DENOMEABVAS Desenvolvedor Abrev,
	 
FROM  dwh.dbo.dusuario;


dTempoApuracao Partition:
	SELECT
	 
	 IDDATA                     AS IDDTAPURACAO,
	
	 [DATA] AS Data Apuração
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoCriacao Partition:
	SELECT
	 
	 IDDATA                     AS IDDTCRIACAO,
	
	 [DATA] AS Data Criação
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoCriacaoSAC Partition:
	SELECT
	 
	 IDDATA                     AS IDDTCRIACAOSAC,
	
	 [DATA] AS Data Criação SAC
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoFinalStatus Partition:
	SELECT
	 
	 IDDATA                     AS IDDTFINALSTATUS,
	
	 [DATA] AS Data Final Status
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoInicioStatus Partition:
	SELECT
	 
	 IDDATA                     AS IDDTINICIOSTATUS,
	
	 [DATA] AS Data Início Status
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoPrazoSLA Partition:
	SELECT
	 
	 IDDATA                     AS IDDTPRAZOSLA,
	
	 [DATA] AS Data Prazo SLA
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoPrevista Partition:
	SELECT
	
	 IDDATAAS IDDTPREVISTA,
	
	 [DATA]                                       AS Data Prevista
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMES AS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                               AS Data Início Semana
	,
	 DTFIMSEMANA                                        AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROMdwh.dbo.dtempo;


dTempoResolucao Partition:
	SELECT
	 
	 IDDATA                     AS IDDTRESOLUCAO,
	
	 [DATA] AS Data Resolução
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoSolucao Partition:
	SELECT
	 
	 IDDATA                     AS IDDTSOLUCAO,
	
	 [DATA] AS Data Solução
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoPriorizado Partition:
	SELECT
	 
	 IDDATA                     AS IDDTPRIORIZADO,
	
	 [DATA] AS Data Priorizado
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTipoApontamento Partition:
	SELECT
	 
	 IDTIPOAPONTAMENTO,
	 
	 CDTIPOAPONTAMENTOAS Código Tipo Apontamento
	,
	 DENOMEAS Tipo Apontamento,
	 
FROM dwh.dbo.dtipoapontamento;


dSistema Partition:
	SELECT
	 
	 IDSISTEMA,
	
	 CDSISTEMAAS Código Sistema
	,
	 DENOMEAS Sistema,
	 
FROM dwh.dbo.dsistema;


dTempoApontamento Partition:
	SELECT
	
	 IDDATA                               AS IDDATA,
	
	 [DATA]                                      AS Data Apontamento
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANA          AS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMES                                AS Número Semana Mês
	,
	 DESEMANAMESAS Semana por Extenso
	,
	 NUSEMANAANO                  AS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTRE                     AS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTRE                 AS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTRE                  AS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                     AS Data Início Semana
	,
	 DTFIMSEMANA                          AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROMdwh.dbo.dtempo
	 
WHERE   EXISTS
	 (
	 SELECT
	 
	 TOP 1 1
	 
FROM dwh.dbo.fchamadoapontamento
	 
WHERELEFT( dwh.dbo.fchamadoapontamento.iddata,
	 4 ) = LEFT( dwh.dbo.dtempo.iddata,
	 4 )
	 )


fChamadoApontamentoPerfilSeguranca Partition:
	SELECT
	 * 
FROM fChamadoApontamento;


dModulo Partition:
	SELECT
	 
	 IDMODULO,
	
	 DENOMEAS Módulo,
	 
FROM dwh.dbo.dmodulo;


dPerformance Partition:
	SELECT
	 
	 IDPERFORMANCE,
	
	 CDPERFORMANCE                AS Código Performance
	,
	 DENOMEAS Performance,
	 
FROM dwh.dbo.dperformance;


dPerformanceEncaminhada Partition:
	SELECT
	 
	 IDPERFORMANCEENCAMINHADA,
	
	 CDPERFORMANCEENCAMINHADA                                AS Código Performance Encaminhada
	,
	 DENOMEAS Performance Encaminhada,
	 
FROM dwh.dbo.dperformanceencaminhada;


dOriundoRejeite Partition:
	SELECT
	 
	 IDORIUNDOREJEITE,
	
	 CDORIUNDOREJEITE                AS Código Oriundo Rejeite
		 DENOMEAS Oriundo Rejeite,
	 
FROM dwh.dbo.doriundorejeite;


dEquipeUsuario Partition:
	SELECT
	 
	 IDEQUIPEUSUARIO,
	
	 IDEQUIPEAS Código Equipe Usuário
		 DEEQUIPEAS Equipe Usuário,
	 
FROM dwh.dbo.dequipeusuario;


dCCustoUsuario Partition:
	SELECT
	 
	 IDCCUSTOUSUARIO,
	
	 CDCCUSTOUSUARIOAS  Código Centro de Custo Usuário
	,
	 DECCUSTOUSUARIOAS  Centro de Custo Usuário,
	 
FROMdwh.dbo.dccustousuario;


dTarefaSerp Partition:
	SELECT
	 
	 IDTAREFASERP,
	
	 CDTAREFASERPAS Código Tarefa Serp
	,
	 DENOMEAS Tarefa Serp,
	 
FROM dwh.dbo.dtarefaserp;


dProjetoSerp Partition:
	SELECT
	
	 IDPROJETOSERP,
	
	 CDPROJETOSERP    AS Código Projeto Serp
	,
	 DENOME AS Nome Projeto Serp,
	 
FROM dwh.dbo.dprojetoserp;


dSistemaOrigem Partition:
	SELECT
	 
	 IDSISTEMAORIGEM,
	
	 DENOMEAS Sistema Origem,
	 
FROM dwh.dbo.dsistemaorigem;


dIteracao Partition:
	SELECT
	 
	 IDITERACAO,
	
	 CDITERACAOAS Código Iteração
	,
	 DENOMEAS Iteração,
	 
FROM dwh.dbo.diteracao;


dEquipeUsuarioHist Partition:
	SELECT
	 
	 IDEQUIPEUSUARIOHIST,
	
	 IDUSUARIOHIST                                      AS IDUSUARIOHIST,
	 
	 IDEQUIPEHIST                AS Código Equipe Usuário
		 DEEQUIPEHISTAS Equipe Usuário
		 dtinicioperiodo                AS Início Período
	 	 dtfimperiodo AS Fim Período
	 	 FLREGISTROATUALAS Flag Registro Atual,
	 
FROM dwh.dbo.dequipeusuariohist;


fChamadoApontamentoIHT Partition:
	SELECT
	
	 fchamadoapontamento.idusuario,
	
	 fchamadoapontamento.iddata,
	
	 fchamadoapontamento.idequipeusuariohist,
	
	 fchamadoapontamento.idequipeusuario,
	
	 fchamadoapontamento.IDTIPOENTREGA,
	
	 SUM( minutos / 60.00 ) / 8.00 AS IHT,
	 
FROM fchamadoapontamento
	 GROUP BY
	 fchamadoapontamento.idusuario,
	
	 fchamadoapontamento.iddata,
	
	 fchamadoapontamento.idequipeusuariohist,
	
	 fchamadoapontamento.idequipeusuario,
	
	                fchamadoapontamento.IDTIPOENTREGA;


dEquipeChamado Partition:
	SELECT
	 
	       IDEQUIPECHAMADO,
	
	       CDEQUIPEAS Código Equipe
		       DENOMEAS Equipe
	 -- stg.rivw_vw_team.team,
	       DESIGLAAS Sigla Equipe
	,
	       URLIMAGEM1AS Imagem Quadrada
	,
	       URLIMAGEM2AS Imagem Redonda,
	 
FROM dwh.dbo.dequipechamado;


dUsuarioCriacao Partition:
	SELECT
	
	  IDUSUARIO AS IDUSUARIOCRIACAO
	,
	  CDUSUARIO AS Código Usuário
	,
	  DENOME AS Usuário Criação
	,
	  DENOMEABV AS Login	 
FROM dwh.dbo.dusuario;


dUsuarioPriorizado Partition:
	SELECT
	
	  IDUSUARIO AS IDUSUARIOPRIORIZADO
	,
	  CDUSUARIO AS Código Usuário
	,
	  DENOME AS Usuário Priorizado
	,
	  DENOMEABV AS Login	 
FROM dwh.dbo.dusuario;


dUsuarioProprietario Partition:
	SELECT
	
	  IDUSUARIO AS  IDUSUARIOPROPRIETARIO
	,
	  CDUSUARIO AS Código Usuário
	,
	  DENOME AS Usuário Proprietário
	,
	  DENOMEABV AS Login	 
FROM dwh.dbo.dusuario;


dUsuarioSolucao Partition:
	SELECT
	
	  IDUSUARIO AS IDUSUARIOSOLUCAO
	,
	  CDUSUARIO AS Código Usuário
	,
	  DENOME AS Usuário Solução
	,
	  DENOMEABV AS Login	 
FROM dwh.dbo.dusuario;


dTempoPrazoPPF Partition:
	SELECT
	 
	 IDDATA                                       AS IDDTPRAZOPPF,
	
	 [DATA]AS Data Prazo PPF
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANA             AS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMES                      AS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANO        AS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTRE            AS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTRE                   AS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTRE                AS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANAAS Data Início Semana
	,
	 DTFIMSEMANA AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoPrazoAnalise Partition:
	SELECT
	 
	 IDDATA                                       AS IDDTPRAZOANALISE,
	
	 [DATA] AS Data Prazo Análise
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANA             AS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMES                      AS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANO        AS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTRE            AS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTRE                   AS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTRE                AS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANAAS Data Início Semana
	,
	 DTFIMSEMANAAS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoPrazoEspecificacao Partition:
	SELECT
	 
	 IDDATA                                       AS IDDTPRAZOESPECIFICACAO,
	
	 [DATA]AS Data Prazo Especificação
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANA             AS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMES                      AS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANO        AS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTRE            AS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTRE                   AS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTRE                AS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANAAS Data Início Semana
	,
	 DTFIMSEMANAAS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dUsuarioPO Partition:
	SELECT
	 
	 IDUSUARIOAS IDUSUARIOPO
	,
	 CDUSUARIOAS Código Usuário
	,
	 DENOMEAS Usuário PO
	,
	 DENOMEABVAS Login,
	 
FROM dwh.dbo.dusuario;


dUsuarioPM Partition:
	SELECT
	 
	 IDUSUARIOAS IDUSUARIOPM
	,
	 CDUSUARIOAS Código Usuário
	,
	 DENOMEAS Usuário PM
	,
	 DENOMEABVAS Login,
	 
FROM dwh.dbo.dusuario;


dUsuarioUX Partition:
	SELECT
	 
	 IDUSUARIOAS IDUSUARIOUX
	,
	 CDUSUARIOAS Código Usuário
	,
	 DENOMEAS Usuário UX
	,
	 DENOMEABVAS Login,
	 
FROM dwh.dbo.dusuario;


dUnidade Partition:
	SELECT
	 
	 IDUNIDADE AS IDUNIDADECHAMADO
	,
	 CDUNIDADEAS Código Unidade
	,
	 DENOMEAS Unidade
	,
	 DESIGLAAS Sigla Unidade,
	 
FROM dwh.dbo.dunidade;


dVertical Partition:
	SELECT
	 
	 IDVERTICALAS IDVERTICALCHAMADO
	,
	 CDVERTICALAS Código Vertical
	,
	 DENOMEAS Vertical
	,
	 DESIGLAAS Sigla Vertical,
	 
FROM dwh.dbo.dvertical;


dEquipeUsuarioExcel Partition:
	SELECT
	 
	 IDEQUIPEUSUARIOEXCEL,
	 
	 IDDTAPURACAO,
	 
	 DENOMEUSUARIO                AS Usuário
		 DENOMEEQUIPE                AS Equipe
		 DESTATUSUSUARIOAS Status Usuário,
	 
FROM dwh.dbo.dequipeusuarioexcel;


dTipoEntrega Partition:
	SELECT
	 
	 IDTIPOENTREGA,
	
	 CDTIPOENTREGA                AS Código Tipo Entrega
	,
	 DENOMEAS Tipo Entrega,
	 
FROM dwh.dbo.dtipoentrega;


dTipoConfiguracao Partition:
	SELECT
	 
	 IDTIPOCONFIGURACAO,
	
	 CDTIPOCONFIGURACAO                AS Código Tipo Configuração
	,
	 DENOMEAS Tipo Configuração,
	 
FROM dwh.dbo.dtipoconfiguracao;


dIncidenteCliente Partition:
	SELECT
	 
	 IDINCIDENTECLIENTE,
	 
	 CDINCIDENTECLIENTE AS Código Incidente Cliente
	,
	 DENOME                 AS Incidente Cliente,
	 
FROM dwh.dbo.dincidentecliente;


dComplexidade Partition:
	SELECT
	 
	 IDCOMPLEXIDADE,
	 
	 CDCOMPLEXIDADE                AS Código Complexidade
		 DENOMEAS Complexidade,
	 
FROM dwh.dbo.dComplexidade;


dEquipeEspecialista Partition:
	SELECT
	 
	 IDEQUIPEESPECIALISTA,
	 
	 CDEQUIPEESPECIALISTA             AS Código Equipe Especialista
	,
	 DENOME                                       AS Equipe Especialista,
	 
FROM dwh.dbo.dEquipeEspecialista;


dSeveridade Partition:
	SELECT
	 
	 IDSEVERIDADE,
	
	 CDSEVERIDADE                AS Código Severidade
		 DENOMEAS Severidade,
	 
FROM dwh.dbo.dSeveridade;


dCategory Partition:
	SELECT
	 
	        IDCATEGORIA,
	
	        CDCATEGORIA AS Código Categoria
	,
	        DENOME AS Categoria
	,
	        DEDOMINIOAS  Domínio
	,
	        DECATEGORIADEFEITO   AS Categoria Defeito,
	 
FROM dwh.dbo.dCategory;


dCausaRaiz Partition:
	SELECT
	 
	       IDCAUSARAIZ,
	
	       CDCAUSARAIZ AS Código Causa Raíz
	,
	       DENOME AS Causa Raíz,
	 
FROM dwh.dbo.dcausaraiz;


dFaseCiclo Partition:
	SELECT
	 
	 IDFASECICLO,
	
	 CDFASECICLOAS Código Fase Ciclo
		 DENOMEAS Fase Ciclo
		 DEAMBIENTEAS Atividade Fase Ciclo,
	 
FROM dwh.dbo.dfaseciclo;


dPlanejadoPara Partition:
	SELECT
	 
	 IDITERACAO,
	
	 CDITERACAOAS Código Planejado para
	,
	 DENOMEAS Planejado para,
	 
FROM dwh.dbo.diteracao;


dModuloFuncional Partition:
	SELECT
	 
	 IDMODULOFUNCIONAL,
	 
	 CDMODULOFUNCIONALAS Código Módulo Funcional
	,
	 DENOMEAS Módulo Funcional,
	 
FROM dwh.dbo.dmodulofuncional;


dPrioridade Partition:
	SELECT
	 
	 IDPRIORIDADE,
	
	 CDPRIORIDADE                AS Código Prioridade
	,
	 DENOMEAS Prioridade,
	 
FROM dwh.dbo.dprioridade;


dPrioridadeNegociada Partition:
	SELECT
	 
	 IDPRIORIDADENEGOCIADA,
	 
	 CDPRIORIDADENEGOCIADAAS Código Prioridade Negociada
	,
	 DENOMEAS Prioridade Negociada,
	 
FROM dwh.dbo.dprioridadenegociada;


dProjeto Partition:
	SELECT
	 
	 IDPROJETO,
	
	 CDPROJETOAS Código Projeto
	,
	 DENOMEAS Projeto,
	 
FROM dwh.dbo.dprojeto;


dSimuladoBaseInterna Partition:
	SELECT
	 
	 IDSIMULADOBASEINTERNA,
	
	 CDSIMULADOBASEINTERNAAS Código Simulado Base Interna
	,
	 DENOMEAS Simulado Base Interna - origem,
	 
FROM dwh.dbo.dsimuladobaseinterna;


dTester Partition:
	SELECT
	 
	 IDTESTER,
	 
	 CDTESTERAS Código Tester
	,
	 DENOMEAS Tester,
	 
FROM dwh.dbo.dtester;


dTipoChamado Partition:
	SELECT
	 
	 IDTIPOCHAMADO,
	
	 CDTIPOCHAMADOAS Código Tipo Chamado
	,
	 DENOMEAS Tipo Chamado,
	 
FROM dwh.dbo.dtipochamado;


dUsuario Partition:
	SELECT
	 
	 IDUSUARIO,
	
	 CDUSUARIOAS Código Usuário
	,
	 DENOMEAS Usuário
	,
	 DENOMEABVAS Login,
	 
FROM dwh.dbo.dusuario;


Medidas Partition:
	SELECT
	 1 AS Medidas;


dAtividade Partition:
	SELECT
	 
	    IDATIVIDADE,
	
	    CDATIVIDADEAS  Código Atividade
	,
	    DENOME AS  Atividade,
	 
FROM dwh.dbo.datividade;


dTarefa Partition:
	SELECT
	 
	 IDTAREFA,
	
	 CDTAREFAAS Código Tarefa
	,
	 DENOMEAS Tarefa
	,
	 DEURLAS URL,
	 
FROM dwh.dbo.dtarefa;


dChamado Partition:
	SELECT
	 IDCHAMADO,
	
	       CDCHAMADOAS Código Chamado
	,
	       NUCHAMADOAS Número Chamado
	,
	       NUSCCDAS Numero SCCD
	,
	       DETITULOAS Título
	,
	       DENOMEAS Chamado
	,
	       DETAGAS Tag
	,
	       DESTATUSAS Status
	,
	       NUSALTAS Número Salt
	,
	       DECAUSAAS Causa
	,
	       DEURLAS URL
	,
	       FLBLOQUEADO                AS Binário Flag Bloqueado
	,
	       FLPERFORMANCEAS Flag Performace - origem
	,
	       FLPERFORMANCEENCAMINHADA  AS Flag Performace Encaminhada - origem
	,
	       DEVERSAOORIGEMAS Versão Origem
	,
	       FLINTERNACIONALAS Flag Internacional
	,
	       demotivoreproducaoAS Motivo Reprodução,
	 
FROM dwh.dbo.dchamado;


dCliente Partition:
	SELECT
	 
	       IDCLIENTE,
	
	       CDCLIENTE AS Código Cliente
	,
	       DENOMEAS Cliente
	,
	       DESIGLAAS Sigla,
	 
FROM dwh.dbo.dcliente;


dTempo Partition:
	SELECT
	 
	 IDDATA                     AS IDDATA,
	
	 [DATA] AS Data
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo
	 
WHERE CDANO >= 2015 AND CDANO <= YEAR(GETDATE()) + 1


fChamadoApontamento Partition:
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
	
	       IDTIPOAPONTAMENTO,
	
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
	
	 SUM ( ( minutos / 60.00 ) / 8.00 ) over ( partition by fchamadoapontamento.idusuario,
	 fchamadoapontamento.iddata ) AS IHT,
	 replace ( SUM ( ( minutos / 60.00 ) / 8.00 ) over ( partition by fchamadoapontamento.idusuario,
	 fchamadoapontamento.iddata ),
	 .
	 
	 ) AS IHT_calc,
	,
	       DTCARGA
	 
FROM dwh.dbo.fchamadoapontamento;


fChamadoArtefatoEvolucao Partition:
	SELECT
	 * 
FROM fChamadoArtefatoEvolucao;


fChamadoBacklog Partition:
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
	 
FROM dwh.dbo.fChamadoBacklog;


fChamadoEntrada Partition:
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
	 
	 QTENTRADA,
	 
	 DTCARGA
	 
FROM dwh.dbo.fChamadoEntrada;


fChamadoNegociado Partition:
	SELECT
	 * 
FROM fChamadoNegociado;


fChamadoSaida Partition:
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
	 
	 QTSAIDA,
	 
	 DTCARGA
	 
FROM dwh.dbo.fChamadoSaida;


fChamadoTempoMedio Partition:
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
	 
	 IDDESENVOLVEDOR
	 
FROM dwh.dbo.fChamadoTempoMedio;


dStatusChamado Partition:
	SELECT
	 
	 IDSTATUSCHAMADO,
	
	 CDSTATUSCHAMADOAS Código Status Chamado
	,
	 DENOMEAS Status Chamado,
	 
FROM dwh.dbo.dstatuschamado;


fChamadoBacklogZero Partition:
	SELECT
	 * 
FROM fChamadoBacklogZero;


dDesenvolvedor Partition:
	SELECT
	 
	 IDUSUARIOAS IDDESENVOLVEDOR,
	
	 CDUSUARIOAS Código Desenvolvedor
	,
	 DENOMEAS Desenvolvedor
	,
	 DENOMEABVAS Desenvolvedor Abrev,
	 
FROM  dwh.dbo.dusuario;


dTempoApuracao Partition:
	SELECT
	 
	 IDDATA                     AS IDDTAPURACAO,
	
	 [DATA] AS Data Apuração
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoCriacao Partition:
	SELECT
	 
	 IDDATA                     AS IDDTCRIACAO,
	
	 [DATA] AS Data Criação
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoCriacaoSAC Partition:
	SELECT
	 
	 IDDATA                     AS IDDTCRIACAOSAC,
	
	 [DATA] AS Data Criação SAC
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoFinalStatus Partition:
	SELECT
	 
	 IDDATA                     AS IDDTFINALSTATUS,
	
	 [DATA] AS Data Final Status
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoInicioStatus Partition:
	SELECT
	 
	 IDDATA                     AS IDDTINICIOSTATUS,
	
	 [DATA] AS Data Início Status
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoPrazoSLA Partition:
	SELECT
	 
	 IDDATA                     AS IDDTPRAZOSLA,
	
	 [DATA] AS Data Prazo SLA
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoPrevista Partition:
	SELECT
	
	 IDDATAAS IDDTPREVISTA,
	
	 [DATA]                                       AS Data Prevista
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMES AS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                               AS Data Início Semana
	,
	 DTFIMSEMANA                                        AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROMdwh.dbo.dtempo;


dTempoResolucao Partition:
	SELECT
	 
	 IDDATA                     AS IDDTRESOLUCAO,
	
	 [DATA] AS Data Resolução
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoSolucao Partition:
	SELECT
	 
	 IDDATA                     AS IDDTSOLUCAO,
	
	 [DATA] AS Data Solução
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoPriorizado Partition:
	SELECT
	 
	 IDDATA                     AS IDDTPRIORIZADO,
	
	 [DATA] AS Data Priorizado
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANAAS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMESAS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANOAS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTREAS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTREAS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTREAS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                    AS Data Início Semana
	,
	 DTFIMSEMANA                                            AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTipoApontamento Partition:
	SELECT
	 
	 IDTIPOAPONTAMENTO,
	 
	 CDTIPOAPONTAMENTOAS Código Tipo Apontamento
	,
	 DENOMEAS Tipo Apontamento,
	 
FROM dwh.dbo.dtipoapontamento;


dSistema Partition:
	SELECT
	 
	 IDSISTEMA,
	
	 CDSISTEMAAS Código Sistema
	,
	 DENOMEAS Sistema,
	 
FROM dwh.dbo.dsistema;


dTempoApontamento Partition:
	SELECT
	
	 IDDATA                               AS IDDATA,
	
	 [DATA]                                      AS Data Apontamento
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANA          AS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMES                                AS Número Semana Mês
	,
	 DESEMANAMESAS Semana por Extenso
	,
	 NUSEMANAANO                  AS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTRE                     AS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTRE                 AS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTRE                  AS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANA                                     AS Data Início Semana
	,
	 DTFIMSEMANA                          AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROMdwh.dbo.dtempo
	 
WHERE   EXISTS
	 (
	 SELECT
	 
	 TOP 1 1
	 
FROM dwh.dbo.fchamadoapontamento
	 
WHERELEFT( dwh.dbo.fchamadoapontamento.iddata,
	 4 ) = LEFT( dwh.dbo.dtempo.iddata,
	 4 )
	 )


fChamadoApontamentoPerfilSeguranca Partition:
	SELECT
	 * 
FROM fChamadoApontamento;


dModulo Partition:
	SELECT
	 
	 IDMODULO,
	
	 DENOMEAS Módulo,
	 
FROM dwh.dbo.dmodulo;


dPerformance Partition:
	SELECT
	 
	 IDPERFORMANCE,
	
	 CDPERFORMANCE                AS Código Performance
	,
	 DENOMEAS Performance,
	 
FROM dwh.dbo.dperformance;


dPerformanceEncaminhada Partition:
	SELECT
	 
	 IDPERFORMANCEENCAMINHADA,
	
	 CDPERFORMANCEENCAMINHADA                                AS Código Performance Encaminhada
	,
	 DENOMEAS Performance Encaminhada,
	 
FROM dwh.dbo.dperformanceencaminhada;


dOriundoRejeite Partition:
	SELECT
	 
	 IDORIUNDOREJEITE,
	
	 CDORIUNDOREJEITE                AS Código Oriundo Rejeite
		 DENOMEAS Oriundo Rejeite,
	 
FROM dwh.dbo.doriundorejeite;


dEquipeUsuario Partition:
	SELECT
	 
	 IDEQUIPEUSUARIO,
	
	 IDEQUIPEAS Código Equipe Usuário
		 DEEQUIPEAS Equipe Usuário,
	 
FROM dwh.dbo.dequipeusuario;


dCCustoUsuario Partition:
	SELECT
	 
	 IDCCUSTOUSUARIO,
	
	 CDCCUSTOUSUARIOAS  Código Centro de Custo Usuário
	,
	 DECCUSTOUSUARIOAS  Centro de Custo Usuário,
	 
FROMdwh.dbo.dccustousuario;


dTarefaSerp Partition:
	SELECT
	 
	 IDTAREFASERP,
	
	 CDTAREFASERPAS Código Tarefa Serp
	,
	 DENOMEAS Tarefa Serp,
	 
FROM dwh.dbo.dtarefaserp;


dProjetoSerp Partition:
	SELECT
	
	 IDPROJETOSERP,
	
	 CDPROJETOSERP    AS Código Projeto Serp
	,
	 DENOME AS Nome Projeto Serp,
	 
FROM dwh.dbo.dprojetoserp;


dSistemaOrigem Partition:
	SELECT
	 
	 IDSISTEMAORIGEM,
	
	 DENOMEAS Sistema Origem,
	 
FROM dwh.dbo.dsistemaorigem;


dIteracao Partition:
	SELECT
	 
	 IDITERACAO,
	
	 CDITERACAOAS Código Iteração
	,
	 DENOMEAS Iteração,
	 
FROM dwh.dbo.diteracao;


dEquipeUsuarioHist Partition:
	SELECT
	 
	 IDEQUIPEUSUARIOHIST,
	
	 IDUSUARIOHIST                                      AS IDUSUARIOHIST,
	 
	 IDEQUIPEHIST                AS Código Equipe Usuário
		 DEEQUIPEHISTAS Equipe Usuário
		 dtinicioperiodo                AS Início Período
	 	 dtfimperiodo AS Fim Período
	 	 FLREGISTROATUALAS Flag Registro Atual,
	 
FROM dwh.dbo.dequipeusuariohist;


fChamadoApontamentoIHT Partition:
	SELECT
	
	 fchamadoapontamento.idusuario,
	
	 fchamadoapontamento.iddata,
	
	 fchamadoapontamento.idequipeusuariohist,
	
	 fchamadoapontamento.idequipeusuario,
	
	 fchamadoapontamento.IDTIPOENTREGA,
	
	 SUM( minutos / 60.00 ) / 8.00 AS IHT,
	 
FROM fchamadoapontamento
	 GROUP BY
	 fchamadoapontamento.idusuario,
	
	 fchamadoapontamento.iddata,
	
	 fchamadoapontamento.idequipeusuariohist,
	
	 fchamadoapontamento.idequipeusuario,
	
	                fchamadoapontamento.IDTIPOENTREGA;


dEquipeChamado Partition:
	SELECT
	 
	       IDEQUIPECHAMADO,
	
	       CDEQUIPEAS Código Equipe
		       DENOMEAS Equipe
	 -- stg.rivw_vw_team.team,
	       DESIGLAAS Sigla Equipe
	,
	       URLIMAGEM1AS Imagem Quadrada
	,
	       URLIMAGEM2AS Imagem Redonda,
	 
FROM dwh.dbo.dequipechamado;


dUsuarioCriacao Partition:
	SELECT
	
	  IDUSUARIO AS IDUSUARIOCRIACAO
	,
	  CDUSUARIO AS Código Usuário
	,
	  DENOME AS Usuário Criação
	,
	  DENOMEABV AS Login	 
FROM dwh.dbo.dusuario;


dUsuarioPriorizado Partition:
	SELECT
	
	  IDUSUARIO AS IDUSUARIOPRIORIZADO
	,
	  CDUSUARIO AS Código Usuário
	,
	  DENOME AS Usuário Priorizado
	,
	  DENOMEABV AS Login	 
FROM dwh.dbo.dusuario;


dUsuarioProprietario Partition:
	SELECT
	
	  IDUSUARIO AS  IDUSUARIOPROPRIETARIO
	,
	  CDUSUARIO AS Código Usuário
	,
	  DENOME AS Usuário Proprietário
	,
	  DENOMEABV AS Login	 
FROM dwh.dbo.dusuario;


dUsuarioSolucao Partition:
	SELECT
	
	  IDUSUARIO AS IDUSUARIOSOLUCAO
	,
	  CDUSUARIO AS Código Usuário
	,
	  DENOME AS Usuário Solução
	,
	  DENOMEABV AS Login	 
FROM dwh.dbo.dusuario;


dTempoPrazoPPF Partition:
	SELECT
	 
	 IDDATA                                       AS IDDTPRAZOPPF,
	
	 [DATA]AS Data Prazo PPF
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANA             AS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMES                      AS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANO        AS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTRE            AS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTRE                   AS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTRE                AS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANAAS Data Início Semana
	,
	 DTFIMSEMANA AS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoPrazoAnalise Partition:
	SELECT
	 
	 IDDATA                                       AS IDDTPRAZOANALISE,
	
	 [DATA] AS Data Prazo Análise
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANA             AS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMES                      AS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANO        AS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTRE            AS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTRE                   AS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTRE                AS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANAAS Data Início Semana
	,
	 DTFIMSEMANAAS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dTempoPrazoEspecificacao Partition:
	SELECT
	 
	 IDDATA                                       AS IDDTPRAZOESPECIFICACAO,
	
	 [DATA]AS Data Prazo Especificação
	,
	 CDDIAAS Código Dia
	,
	 CDANOAS Código Ano
	,
	 CDMESAS Código Mês
	,
	 DEMESAS Mês
	,
	 DEMESABVAS Mês Abrev
	,
	 CDPERIODOAS Código Período
	,
	 DEPERIODOAS Período
	,
	 CDDIASEMANA             AS Código Dia Semana
	,
	 DEDIASEMANAAS Dia Semana
		 DEDIASEMANAABVAS Dia Semana Abrev
	,
	 NUSEMANAMES                      AS Número Semana Mês
	,
	 DESEMANAMESAS Descrição Semana Mês
	,
	 NUSEMANAANO        AS Número Semana Ano
		 FLFIMSEMANAAS Flag Fim de Semana
		 FLDIASEMANAAS Flag Dia de Semana
	,
	 FLFERIADOAS Flag Feriado
	,
	 CDBIMESTRE            AS Código Bimestre
	,
	 DEBIMESTREAS Bimestre
	,
	 CDTRIMESTREAS Código Trimestre
	,
	 DETRIMESTREAS Trimestre
	,
	 CDQUADRIMESTRE                   AS Código Quadrimestre
	,
	 DEQUADRIMESTREAS Quadrimestre
	,
	 CDSEMESTRE                AS Código Semestre
	,
	 DESEMESTREAS Semestre
	,
	 DTINICIOSEMANAAS Data Início Semana
	,
	 DTFIMSEMANAAS Data Fim Semana
	,
	 DEPERIODOSEMANAAS Período Semana,
	 
FROM dwh.dbo.dtempo;


dUsuarioPO Partition:
	SELECT
	 
	 IDUSUARIOAS IDUSUARIOPO
	,
	 CDUSUARIOAS Código Usuário
	,
	 DENOMEAS Usuário PO
	,
	 DENOMEABVAS Login,
	 
FROM dwh.dbo.dusuario;


dUsuarioPM Partition:
	SELECT
	 
	 IDUSUARIOAS IDUSUARIOPM
	,
	 CDUSUARIOAS Código Usuário
	,
	 DENOMEAS Usuário PM
	,
	 DENOMEABVAS Login,
	 
FROM dwh.dbo.dusuario;


dUsuarioUX Partition:
	SELECT
	 
	 IDUSUARIOAS IDUSUARIOUX
	,
	 CDUSUARIOAS Código Usuário
	,
	 DENOMEAS Usuário UX
	,
	 DENOMEABVAS Login,
	 
FROM dwh.dbo.dusuario;


dUnidade Partition:
	SELECT
	 
	 IDUNIDADE AS IDUNIDADECHAMADO
	,
	 CDUNIDADEAS Código Unidade
	,
	 DENOMEAS Unidade
	,
	 DESIGLAAS Sigla Unidade,
	 
FROM dwh.dbo.dunidade;


dVertical Partition:
	SELECT
	 
	 IDVERTICALAS IDVERTICALCHAMADO
	,
	 CDVERTICALAS Código Vertical
	,
	 DENOMEAS Vertical
	,
	 DESIGLAAS Sigla Vertical,
	 
FROM dwh.dbo.dvertical;


dEquipeUsuarioExcel Partition:
	SELECT
	 
	 IDEQUIPEUSUARIOEXCEL,
	 
	 IDDTAPURACAO,
	 
	 DENOMEUSUARIO                AS Usuário
		 DENOMEEQUIPE                AS Equipe
		 DESTATUSUSUARIOAS Status Usuário,
	 
FROM dwh.dbo.dequipeusuarioexcel;


dTipoEntrega Partition:
	SELECT
	 
	 IDTIPOENTREGA,
	
	 CDTIPOENTREGA                AS Código Tipo Entrega
	,
	 DENOMEAS Tipo Entrega,
	 
FROM dwh.dbo.dtipoentrega;


dTipoConfiguracao Partition:
	SELECT
	 
	 IDTIPOCONFIGURACAO,
	
	 CDTIPOCONFIGURACAO                AS Código Tipo Configuração
	,
	 DENOMEAS Tipo Configuração,
	 
FROM dwh.dbo.dtipoconfiguracao;


dIncidenteCliente Partition:
	SELECT
	 
	 IDINCIDENTECLIENTE,
	 
	 CDINCIDENTECLIENTE AS Código Incidente Cliente
	,
	 DENOME                 AS Incidente Cliente,
	 
FROM dwh.dbo.dincidentecliente;


dComplexidade Partition:
	SELECT
	 
	 IDCOMPLEXIDADE,
	 
	 CDCOMPLEXIDADE                AS Código Complexidade
		 DENOMEAS Complexidade,
	 
FROM dwh.dbo.dComplexidade;


dEquipeEspecialista Partition:
	SELECT
	 
	 IDEQUIPEESPECIALISTA,
	 
	 CDEQUIPEESPECIALISTA             AS Código Equipe Especialista
	,
	 DENOME                                       AS Equipe Especialista,
	 
FROM dwh.dbo.dEquipeEspecialista;


dSeveridade Partition:
	SELECT
	 
	 IDSEVERIDADE,
	
	 CDSEVERIDADE                AS Código Severidade
		 DENOMEAS Severidade,
	 
FROM dwh.dbo.dSeveridade;


