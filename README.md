# Terraform_Confluent_Cloud_SR_KSQLDB
Terraform code to build a Confluent Cloud Standard cluster with Schema Registry, one topic with a schema, and KSQLDB activated

This code is for demo purpouises and has two parts;
1- Show how Terraform allows to manage schemas (user-purchase-avsc)
2- Activate a KSQLDB to import using Confluent CLI a pipeline code to show Stream Designer
  This is easy using CLI and the example attached (ksqldb-pipeline.sql) and the following steps
  
  a)confluent login
  b)confluent environment use ENVIRONMENTID
  c)confluent kafka cluster use CLUSTERID
  d)confluent pipeline create \
	  --ksql-cluster KSQLDBCLUSTERID \
	  --name "test-pipeline" \
	  --description "simple pipeline" \
	  --secret PAGEVIEWS_SOURCE_KAFKA_API_KEY=YOURCLUSTERAPIKEY \
	  --secret PAGEVIEWS_SOURCE_KAFKA_API_SECRET=YOURCLUSTERAPISECRET \
    --sql-file "./ksqldb-pipeline.sql"


