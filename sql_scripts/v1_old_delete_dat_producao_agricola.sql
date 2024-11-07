-- Script de exclusão delete_dat_producao_agricola.sql
-- Este script deve ser executado com o usuário SYSTEM ou usrfiap para remover as tabelas criadas no schema usrfiap

DECLARE
    v_confirmacao VARCHAR2(3) := 'SIM';  -- Altere para 'SIM' para prosseguir com a exclusão
BEGIN
    -- Listagem das tabelas que serão excluídas no schema usrfiap
    DBMS_OUTPUT.PUT_LINE('A tabela T_PRODUTO será excluída');
    DBMS_OUTPUT.PUT_LINE('A tabela T_SAFRA será excluída');
    DBMS_OUTPUT.PUT_LINE('A tabela T_PRODUCAO_ANUAL será excluída');
    DBMS_OUTPUT.PUT_LINE('A tabela T_PRODUCAO_HISTORICA será excluída');

    -- Confirmar antes de prosseguir com a exclusão
    IF v_confirmacao = 'SIM' THEN
        BEGIN
            EXECUTE IMMEDIATE 'DROP TABLE usrfiap.T_PRODUCAO_HISTORICA CASCADE CONSTRAINTS';
            DBMS_OUTPUT.PUT_LINE('Tabela T_PRODUCAO_HISTORICA excluída com sucesso.');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Erro ao excluir T_PRODUCAO_HISTORICA: ' || SQLERRM);
        END;

        BEGIN
            EXECUTE IMMEDIATE 'DROP TABLE usrfiap.T_PRODUCAO_ANUAL CASCADE CONSTRAINTS';
            DBMS_OUTPUT.PUT_LINE('Tabela T_PRODUCAO_ANUAL excluída com sucesso.');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Erro ao excluir T_PRODUCAO_ANUAL: ' || SQLERRM);
        END;

        BEGIN
            EXECUTE IMMEDIATE 'DROP TABLE usrfiap.T_SAFRA CASCADE CONSTRAINTS';
            DBMS_OUTPUT.PUT_LINE('Tabela T_SAFRA excluída com sucesso.');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Erro ao excluir T_SAFRA: ' || SQLERRM);
        END;

        BEGIN
            EXECUTE IMMEDIATE 'DROP TABLE usrfiap.T_PRODUTO CASCADE CONSTRAINTS';
            DBMS_OUTPUT.PUT_LINE('Tabela T_PRODUTO excluída com sucesso.');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Erro ao excluir T_PRODUTO: ' || SQLERRM);
        END;

        DBMS_OUTPUT.PUT_LINE('Todas as tabelas foram excluídas com sucesso.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Operação de exclusão cancelada. Nenhuma tabela foi excluída.');
    END IF;
END;
/
