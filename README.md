# jmeter-javalib-docker
Maven project to build Docker image containing JMeter with custom Java libraries, timezone, plugins, user.properties.

If you want to run a JMeter distributed it can be pretty handy to build a Docker Image to ensure all workers are configured appropriately. This Maven project facilitates this process of building the image and can define the following:

   1. Custom Java libraries that will be made available in the JMeter classpath along with all dependecies.
   1. Configure JMeter installed plugins.
   1. Configure user properties file.
   1. Configure timezone for the container.  

## Maven Commands
### Build the image

```
mvn clean install docker:build
```

### Push the image 


```
mvn clean install docker:build docker:push
```

## Examples
An example JMeter test script is provided [jmeter/example.jmx](jmeter/example.jmx) it showcases:

   * calling a method from our Java project.
   * asserting that a property defined in our user.properties file is loaded in JMeter.

## Run
### JMeter GUI
If you have JMeter installed locally and on your path use the following script to launch JMeter with the project settings.

Build the image first using the above Maven command, it will create the jars and dependencies to add to the JMeter user classpath. 

Now launch JMeter using the [bin/jmeter_launch.sh](bin/jmeter_launch.sh).

### JMeter Docker
To run the example test script through Docker use the following command:

```
bin/run_jmeter_docker.sh example.jmx senecale/jmeter-javalib-docker:0.0.1
```
The results will be saved to the target/runs folder.
   
   
## References
   1. [https://github.com/fabric8io/docker-maven-plugin](https://github.com/fabric8io/docker-maven-plugin)
   1. [https://jmeter.apache.org/usermanual/component_reference.html](https://jmeter.apache.org/usermanual/component_reference.html)
   