JARFILE="pipeline-demo-1.0-SNAPSHOT.jar"

# 杀掉之前的
ps -ef | grep $JARFILE | grep -v grep | awk '{print $2}' | xargs kill -9

# 休息5秒，等待之前的实例关闭
sleep 2
#
java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=10001 -jar "target/$JARFILE"  > log.txt &
