#! /bin/bash
userClasspath=$(find target/docker -type d -name maven)
if [ $? -eq 1 ]; then
   echo "Can't find docker depencies for user classpath. Go build your eclipse project with mvn docker:build"
   return 1
fi

set -x
jmeter \
   -J user.classpath=$userClasspath \
   -q docker/user.properties