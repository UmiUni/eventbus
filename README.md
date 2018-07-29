# Event Bus

### Ops
#### Digital Ocean
```ssh -x root@142.93.30.221``` with the same old password
Droplet name: jogchat-eventbus-broker

- For now it hosts everything; broker, consumer, producer, and monitoring
- Will decouple when scale is needed.

#### broker

replica factor | host
--- | --- 
1 | 142.93.30.221:9092

- setting in bin/kafka-server-start.sh `KAFKA_HEAP_OPTS="-Xmx200m -Xms50m"`
- look for "default value" for the changes in 

#### setting up zookeeper
```nohup bin/zookeeper-server-start.sh config/zookeeper.properties > /log/zookeeper.log &```
It listens on port 2181.

To make sure that it is working, connect to it via Telnet:
```telnet localhost 2181```

At the Telnet prompt, type in ```ruok``` and press ENTER.

If everything's fine, ZooKeeper will say ```imok``` and end the Telnet session.

#### issues
- out of memory

### Ref
[Event Bus Concept](https://www.confluent.io/blog/stream-data-platform-1/) 

[Setting up Oracle java 8 on Droplet](https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-get-on-ubuntu-16-04)