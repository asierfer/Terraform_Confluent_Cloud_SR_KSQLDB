CREATE OR REPLACE STREAM "visualizaciones_stream" (PAGEID STRING, USERID STRING, VIEWTIME BIGINT)
  WITH (kafka_topic='visualizaciones_t', partitions=3, value_format='AVRO');

CREATE OR REPLACE STREAM "visualizaciones_filtrado_stream"
  WITH (kafka_topic='visualizaciones_filtro', partitions=3, value_format='AVRO')
  AS SELECT * FROM "visualizaciones_stream" WHERE PAGEID='Page_31';

CREATE OR REPLACE STREAM "usuarios_p_stream" (GENDER STRING, REGIONID STRING, USERID STRING)
  WITH (kafka_topic='usuarios_visual_t', partitions=3, value_format='AVRO');

CREATE OR REPLACE STREAM "visualizaciones_enrq_stream"
  WITH (kafka_topic='visualizaciones_enriq_t', partitions=3, value_format='AVRO')
  AS SELECT * FROM "usuarios_p_stream" U INNER JOIN "visualizaciones_stream" S
    WITHIN 1 MINUTE GRACE PERIOD 0 MINUTE
  ON U.USERID = S.USERID;

CREATE OR REPLACE TABLE "NUM_VISUALIZACIONES_TABLE"
  WITH (kafka_topic='VisualizacionesPaginas_t', partitions=3, value_format='AVRO')
  AS SELECT AS_VALUE(U_GENDER) AS GENDER, COUNT(S_PAGEID) AS NUM_PAGES, U_GENDER FROM "visualizaciones_enrq_stream" WINDOW SESSION (1 MINUTE, RETENTION 1 HOUR, GRACE PERIOD 0 DAY) GROUP BY U_GENDER;
