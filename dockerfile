FROM python:3.10-slim
# RUN addgroup --gid 65548 ardumower
# RUN adduser --gecos "" --disabled-password --uid 1053 --gid 65548 ardumower
COPY CaSSAndRA.git/CaSSAndRA /usr/src/cassandra
COPY CaSSAndRA.git/requirements.txt /usr/src/cassandra/
WORKDIR /usr/src/cassandra
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY CaSSAndRA.git/bugfix_dash_daq_min/dash_daq.min.js /usr/local/lib/python3.10/site-packages/dash_daq
# RUN chown -R ardumower:ardumower /usr/src/cassandra
# RUN chmod 777 /usr/src/cassandra
# USER ardumower
CMD ["python3","app.py"]
