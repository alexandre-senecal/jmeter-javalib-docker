# jmeter-javalib-docker
Maven project to build Docker image containing JMeter with custom Java libraries, timezone, plugins, user.properties.

If you want to run a JMeter distributed it can be pretty handy to build a Docker Image to ensure all workers are configured appropriately. This Maven project facilitates this process of building the image and can define the following:
   1. Custom Java libraries that will be made available in the JMeter classpath along with all dependecies.
   1. Configure JMeter installed plugins.
   1. Configure user properties file.
   1. Configure timezone for the container.
   
## Requirements
   1. JMeter installed and added to your path.
   1. Java SDK and Maven installed.
   1. Bash to run the launchscript.

## Maven Commands
### Build the image

```
mvn clean install docker:build
```

### Push the image 


```
mvn clean install docker:build docker:push
```


## Run JMeter locally as configured in the image
Build the image first using the above Maven command, it will create the jars and dependencies to add to the JMeter user classpath. Now launch JMeter using the [jmeter_launch.sh](jmeter_launch.sh).

## Example
An example JMeter test script is provided [example/example_lib_use.jmx](example/example_lib_use.jmx) it showcases:
   * calling a method from our Java project.
   * asserting that a property defined in our user.properties file is loaded in JMeter.
   
Launch JMeter using [jmeter_launch.sh](jmeter_launch.sh) and open [example/example_lib_use.jmx](example/example_lib_use.jmx). 
   
## References
   1. [https://github.com/fabric8io/docker-maven-plugin](https://github.com/fabric8io/docker-maven-plugin)
   1. [https://jmeter.apache.org/usermanual/component_reference.html](https://jmeter.apache.org/usermanual/component_reference.html)
   