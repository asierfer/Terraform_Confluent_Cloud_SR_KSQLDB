# Terraform_Confluent_Cloud_SR_KSQLDB
Terraform_Confluent_Cloud_SR_KSQLDB is Terraform code that builds a Confluent Cloud Standard cluster with Schema Registry, one topic with a schema, and KSQLDB activated. This code is for demo purposes and has two parts:

1- It demonstrates how Terraform can manage schemas (specifically, user-purchase-avsc)
2- It shows how to activate KSQLDB and import a pipeline code using Confluent CLI to display in Stream Designer. This process is easy using the CLI and the example attached (ksqldb-pipeline.sql) and the following steps
  
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


