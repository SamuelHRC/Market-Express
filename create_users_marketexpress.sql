use mysql; 

-- 1. CRIANDO USUÁRIOS
create user 'finaceiro'@'localhost' identified by 'andromeda24#@!0';
/*
Usuário que possui acesso as tables que alimentam as análises financeiras para 
para construção e análise do planejamento financeiro e orçamentário.
*/

create user 'p&d'@'localhost' identified by 'pegasus58@345';
/*
Usário com conhecimento técnico em SQL que desenvolve pesquisa visando otimização
de processos internos e também participa da equipe responsável por melhorar a experiência do usuário.
*/

-- 2. Definindo as permissões
-- user financeiro
 show grants for 'finaceiro'@'localhost';
 grant select on market_express.* to 'finaceiro'@'localhost'; 
 /*
Ao user 'financeio1' foi concedido a ação do SELECT, ou seja de fazer leitura sobre todas
as tables.
 */
 
 -- user p&d
 show grants for 'p&d'@'localhost';
 grant select, insert, update on market_express.* to 'p&d'@'localhost'; 
 /*
Ao user 'p&d' foi concedido as ações: SELECT, INSERT e UPDATE sobre todas
as tables. 
 */ 
 
 
 
