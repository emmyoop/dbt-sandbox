FROM fishtownanalytics/dbt:0.19.2

RUN apt-get update && apt-get install -y libaio1 wget unzip && \
    mkdir /opt/oracle && \
    cd /opt/oracle && \
    wget https://download.oracle.com/otn_software/linux/instantclient/instantclient-basiclite-linuxx64.zip && \
    unzip instantclient-basiclite-linuxx64.zip && \
    rm -f instantclient-basiclite-linuxx64.zip && \
    cd instantclient* && \
    rm -f *jdbc* *occi* *mysql* *jar uidrvci genezi adrci && \
    echo /opt/oracle/instantclient* > /etc/ld.so.conf.d/oracle-instantclient.conf && \
    ldconfig

RUN python -m pip install cx_Oracle==7.3.0 dbt-oracle==0.4.3

ENTRYPOINT  /usr/local/bin/entrypoint.sh

COPY entrypoint.sh /usr/local/bin