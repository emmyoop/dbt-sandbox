CREATE USER EBIT_APP023_DBT IDENTIFIED BY EBIT_APP023_DBT;


CREATE USER ASMP_APP023 IDENTIFIED BY ASMP_APP023;

GRANT CONNECT TO EBIT_APP023_DBT;
GRANT CREATE SESSION TO EBIT_APP023_DBT;
GRANT UNLIMITED TABLESPACE TO EBIT_APP023_DBT;

CREATE TABLE ASMP_APP023.RAW_JOBS(
        ACTION_EVENT_WID VARCHAR2(32),
        BUSINESS_PROCESS_TYPE VARCHAR2(99),
        INITIATED VARCHAR2(99),
        COMPLETED VARCHAR2(99),
        STATUS VARCHAR2(50),
        EFFECTIVE VARCHAR2(99),
        RESCINDED VARCHAR2(99),
        CORRECTED VARCHAR2(99),
        WORKER_WID VARCHAR2(32),
        WORKER_RID VARCHAR2(8),
        WORKER_NAME_LEGAL VARCHAR2(255),
        WORKER_NAME_PREFERRED VARCHAR2(255),
        CURRENT_POS_RID VARCHAR2(13),
        CURRENT_POS_VACATE_DATE DATE,
        POSITION_WID VARCHAR2(32),
        POSITION_RID VARCHAR2(13),
        HIRE_DATE VARCHAR2(10),
        START_DATE VARCHAR2(10),
        VACATE_DATE VARCHAR2(10),
        "PRIMARY" VARCHAR2(1),
        JOB_PROFILE_WID VARCHAR2(32),
        JOB_PROFILE_RID VARCHAR2(6),
        JOB_FAMILY_WID VARCHAR2(32),
        JOB_FAMILY_RID VARCHAR2(99),
        SUP_ORG_WID VARCHAR2(32),
        SUP_ORG_RID VARCHAR2(13),
        BUSINESS_TITLE VARCHAR2(255),
        BASIS VARCHAR2(2),
        FTE NUMBER,
        SWH NUMBER,
        PAY_RATE_TYPE_WID VARCHAR2(32),
        PAY_RATE_TYPE_RID VARCHAR2(99),
        COMP_PLANS VARCHAR2(4000),
        SUP_ORG_NAME VARCHAR2(255),
        JOB_PROFILE_NAME VARCHAR2(255),
        DISBURSEMENT_PLAN_PERIOD_RID VARCHAR2(255),
        SYS_LAST_UPDATED DATE,
        JOB_FAMILY_GROUP_RID VARCHAR2(99),
        JOB_FAMILY_GROUP VARCHAR2(99),
        WORK_SHIFT_RID VARCHAR2(99),
        WORK_SHIFT VARCHAR2(255),
        END_EMPLOYMENT_DATE DATE,
        EMPLOYEE_TYPE VARCHAR2(255)
);

CREATE TABLE ASMP_APP023.RAW_JOBS_COMPENSATION(
        ACTION_EVENT_WID VARCHAR2(32),
        ACTUAL_END DATE,
        AMOUNT VARCHAR2(25),
        COMP_ELEMENT VARCHAR2(99),
        COMP_PLAN VARCHAR2(255),
        COMP_PLAN_RID VARCHAR2(255),
        EFFECTIVE DATE,
        EXPECTED_END DATE,
        FREQUENCY VARCHAR2(99),
        PLAN_END DATE,
        PLAN_START DATE,
        POSITION_RID VARCHAR2(13),
        POSITION_WID VARCHAR2(32),
        WORKER_RID VARCHAR2(8),
        WORKER_WID VARCHAR2(32)
);

CREATE TABLE ASMP_APP023.SYS_LOAD_TABLES(
        TABLE_NAME VARCHAR2(30),
        LAST_INT_RUN_DATE DATE,
        REFRESH VARCHAR2(1),
        PROC VARCHAR2(61),
        NOTES VARCHAR2(255),
        INTEGRATION_ID VARCHAR2(25)
);

GRANT CONNECT, RESOURCE TO EBIT_APP023_DBT;
GRANT CREATE SESSION TO EBIT_APP023_DBT;
GRANT UNLIMITED TABLESPACE TO EBIT_APP023_DBT;
ALTER USER EBIT_APP023_DBT QUOTA UNLIMITED ON USERS;
GRANT UNLIMITED TABLESPACE TO ASMP_APP023;
GRANT SELECT, INSERT, UPDATE, DELETE ON ASMP_APP023.RAW_JOBS TO EBIT_APP023_DBT;
GRANT SELECT, INSERT, UPDATE, DELETE ON ASMP_APP023.RAW_JOBS_COMPENSATION TO EBIT_APP023_DBT;
GRANT SELECT, INSERT, UPDATE, DELETE ON ASMP_APP023.SYS_LOAD_TABLES TO EBIT_APP023_DBT;

--GRANT ALTER, SELECT, INSERT, UPDATE, DELETE ON ASMP_APP023.RAW_JOBS TO EBIT_APP023_DBT;
-- GRANT ALTER ANY TABLE, CREATE ANY TABLE, CREATE ANY VIEW TO EBIT_APP023_DBT;