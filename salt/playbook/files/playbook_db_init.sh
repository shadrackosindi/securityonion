{%- set MYSQLPASS = salt['pillar.get']('secrets:mysql', None) -%}
#!/bin/sh

default_salt_dir=/opt/so/saltstack/default

docker cp $default_salt_dir/salt/playbook/files/playbook_db_init.sql so-mysql:/tmp/playbook_db_init.sql
docker exec so-mysql /bin/bash -c "/usr/bin/mysql -b  -uroot -p{{MYSQLPASS}}  < /tmp/playbook_db_init.sql"