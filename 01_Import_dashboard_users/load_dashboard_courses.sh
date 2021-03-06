#!/bin/bash

set -e

source ~/venv/bin/activate
export HTTP_PROXY=http://webproxy:8080
export HTTPS_PROXY=http://webproxy:8080
export http_proxy=http://webproxy:8080
export https_proxy=http://webproxy:8080
export NO_PROXY=127.0.0.1,::1,localhost,.wmnet
export no_proxy=127.0.0.1,::1,localhost,.wmnet

scriptdir="`dirname \"$0\"`"
cd $scriptdir

mkdir /tmp/$$
python3 generate_dashboard_users.py /tmp/$$
echo /tmp/$$
hive -e "
USE urbanecm;

-- Load wmcz_outreach_dashboard_courses_csv
TRUNCATE TABLE wmcz_outreach_dashboard_courses_csv;
LOAD DATA LOCAL INPATH '/tmp/$$/courses.tsv' INTO TABLE wmcz_outreach_dashboard_courses_csv;

-- Load wmcz_outreach_dashboard_courses_users_raw
TRUNCATE TABLE wmcz_outreach_dashboard_courses_users_raw;
LOAD DATA LOCAL INPATH '/tmp/$$/coursesUsers.tsv' INTO TABLE wmcz_outreach_dashboard_courses_users_raw;
"
rm -rf /tmp/$$

bash ../01_Generate_account_data/generate_account_info.sh
HADOOP_HEAPSIZE=2048 hive -f populate_detailed_dashboard_users.hql

