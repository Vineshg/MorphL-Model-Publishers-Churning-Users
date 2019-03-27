MODEL_DAY_AS_STR=$(date +"%Y-%m-%d")
UNIQUE_HASH=$(openssl rand -hex 64 | cut -c1-20)
IS_MODEL_VALID=False
echo ${MODEL_DAY_AS_STR} > /tmp/ga_chp_training_pipeline_model_day_as_str.txt
echo ${UNIQUE_HASH} > /tmp/ga_chp_training_pipeline_unique_hash.txt
sed "s/MODEL_DAY_AS_STR/${MODEL_DAY_AS_STR}/;s/UNIQUE_HASH/${UNIQUE_HASH}/;s/ACCURACY/0/;s/LOSS/0/;s/THRESHOLD/0/;s/IS_MODEL_VALID/${IS_MODEL_VALID}/" /opt/ga_chp/training/pipeline_wrapup/insert_into_ga_chp_valid_models.cql.template > /tmp/ga_chp_training_pipeline_insert_into_valid_models.cql
cqlsh ${MORPHL_SERVER_IP_ADDRESS} -u morphl -p ${MORPHL_CASSANDRA_PASSWORD} -f /tmp/ga_chp_training_pipeline_insert_into_valid_models.cql

