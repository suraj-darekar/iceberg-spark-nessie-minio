### Steps to Configure

1️⃣ git clone [https://github.com/suraj-darekar/iceberg-spark-nessie-minio.gi](https://github.com/suraj-darekar/iceberg-spark-nessie-minio.git)

NOTE! - Make sure entrypoint.sh file has LF set not CRLF (Windows)

2️⃣ Start the services

--docker-compose up --build -d

3️⃣ Access Services

--Jupyter Notebook: http://localhost:8888

--MinIO Console: http://localhost:9001 (User: admin, Password: password)

--Nessie: http://localhost:19120

--Iceberg REST API: http://localhost:8181

4️⃣ Stopping Services

--docker-compose down
