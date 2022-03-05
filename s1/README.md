Solution:

AWK is used here to process data, since it's a command-line text manipulation tool inside Linux and very efficient, along with cornjob as scheduling, given the requirement. We may considert python + airflow, to provide a more sustainable data pipeline, for example, retry more times if there's any error.

script:
~/dataeng_test/s1/etl.sh

cronjob setting:
0 1 * * * sh ~/dataeng_test/s1/etl.sh > ~/dataeng_test/s1/result.csv