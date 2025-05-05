FROM tabulario/spark-iceberg

USER root

# Add required JARs for Spark 3.5.x, Iceberg 1.9.0, and Nessie 0.103.3
ADD https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.2/hadoop-aws-3.3.2.jar /opt/spark/jars/
ADD https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.901/aws-java-sdk-bundle-1.11.901.jar /opt/spark/jars/
ADD https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/3.3.2/hadoop-common-3.3.2.jar /opt/spark/jars/

# Iceberg JAR for Spark 3.5.x
ADD https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-3.5_2.12/1.9.0/iceberg-spark-runtime-3.5_2.12-1.9.0.jar /opt/spark/jars/

# Nessie Spark extension JAR for Spark 3.5.x
ADD https://repo1.maven.org/maven2/org/projectnessie/nessie-integrations/nessie-spark-extensions-3.5_2.12/0.103.3/nessie-spark-extensions-3.5_2.12-0.103.3.jar /opt/spark/jars/

# Set appropriate permissions
RUN chmod -R 644 /opt/spark/jars/

# Install required Python packages
RUN pip install pynessie confuse

# Copy custom entrypoint script
COPY entrypoint.sh /home/iceberg/entrypoint.sh
RUN chmod +x /home/iceberg/entrypoint.sh

# Set the working directory
WORKDIR /home/iceberg

# Expose necessary ports
EXPOSE 8888 8080 10000 10001

# Use custom entrypoint
ENTRYPOINT ["/home/iceberg/entrypoint.sh"]
