#!/bin/sh
set -e

# Install Python dependencies
pip install -r /home/iceberg/requirements.txt

# Optionally write a default Spark config with environment values
cat <<EOF >> /opt/spark/conf/spark-defaults.conf
spark.sql.catalog.nessie=${CATALOG_NESSIE_CATALOG__IMPL}
spark.sql.catalog.nessie.uri=${CATALOG_NESSIE_URI}
spark.sql.catalog.nessie.ref=${CATALOG_NESSIE_REF}
spark.sql.catalog.nessie.io-impl=${CATALOG_NESSIE_IO__IMPL}
spark.sql.catalog.nessie.warehouse=${CATALOG_NESSIE_WAREHOUSE}
spark.hadoop.fs.s3a.endpoint=${CATALOG_S3_ENDPOINT}
spark.hadoop.fs.s3a.access.key=${AWS_ACCESS_KEY_ID}
spark.hadoop.fs.s3a.secret.key=${AWS_SECRET_ACCESS_KEY}
spark.hadoop.fs.s3a.path.style.access=true
spark.hadoop.fs.s3a.connection.ssl.enabled=false
EOF

echo "[Entrypoint] Starting Jupyter Notebook..."
exec jupyter notebook \
    --ip=0.0.0.0 \
    --port=8888 \
    --no-browser \
    --allow-root \
    --NotebookApp.token='' \
    --NotebookApp.password=''
