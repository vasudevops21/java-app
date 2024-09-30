# Spring home Sample Application
# Modified By DevOps Shack  https://www.youtube.com/@devopsshack

[![Java CI with Maven](https://github.com/spring-home/spring-framework-home/actions/workflows/maven-build.yml/badge.svg)](https://github.com/spring-home/spring-framework-home/actions/workflows/maven-build.yml)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=spring-home_spring-framework-home&metric=alert_status)](https://sonarcloud.io/dashboard?id=spring-home_spring-framework-home)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=spring-home_spring-framework-home&metric=coverage)](https://sonarcloud.io/dashboard?id=spring-home_spring-framework-home)

This project allows the Spring community to maintain a home version with a plain old **Spring Framework configuration**
and with a **3-layer architecture** (i.e. presentation --> service --> repository).
The "canonical" implementation is now based on Spring Boot, Thymeleaf and [aggregate-oriented domain]([https://github.com/spring-projects/spring-home/pull/200).


## Understanding the Spring home application with a few diagrams

[See the presentation here](http://fr.slideshare.net/AntoineRey/spring-framework-home-sample-application) (2017 update)

## Running home locally

### With Maven command line
```
git clone https://github.com/spring-home/spring-framework-home.git
cd spring-framework-home
./mvnw jetty:run-war
# For Windows : ./mvnw.cmd jetty:run-war
```

### With Docker
```
docker run -p 8080:8080 springcommunity/spring-framework-home
```

You can then access home here: [http://localhost:8080/](http://localhost:8080/)

<img width="1042" alt="home-screenshot" src="https://cloud.githubusercontent.com/assets/838318/19727082/2aee6d6c-9b8e-11e6-81fe-e889a5ddfded.png">

## In case you find a bug/suggested improvement for Spring home

Our issue tracker is available here: https://github.com/spring-home/spring-framework-home/issues


## Database configuration

In its default configuration, home uses an in-memory database (H2) which gets populated at startup with data.

A similar setups is provided for MySQL and PostgreSQL in case a persistent database configuration is needed.
To run home locally using persistent database, it is needed to run with profile defined in main pom.xml file.

For MySQL database, it is needed to run with 'MySQL' profile defined in main pom.xml file.

```
./mvnw jetty:run-war -P MySQL
```

Before do this, would be good to check properties defined in MySQL profile inside pom.xml file.

```
<properties>
    <jpa.database>MYSQL</jpa.database>
    <jdbc.driverClassName>com.mysql.cj.jdbc.Driver</jdbc.driverClassName>
    <jdbc.url>jdbc:mysql://localhost:3306/home?useUnicode=true</jdbc.url>
    <jdbc.username>home</jdbc.username>
    <jdbc.password>home</jdbc.password>
</properties>
```

You could start MySQL locally with whatever installer works for your OS, or with docker:

```
docker run -e MYSQL_USER=home -e MYSQL_PASSWORD=home -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=home -p 3306:3306 mysql:5.7.8
```

For PostgreSQL database, it is needed to run with 'PostgreSQL' profile defined in main pom.xml file.

```
./mvnw jetty:run-war -P PostgreSQL
```

Before do this, would be good to check properties defined in PostgreSQL profile inside pom.xml file.

```
<properties>
    <jpa.database>POSTGRESQL</jpa.database>
    <jdbc.driverClassName>org.postgresql.Driver</jdbc.driverClassName>
    <jdbc.url>jdbc:postgresql://localhost:5432/home</jdbc.url>
    <jdbc.username>postgres</jdbc.username>
    <jdbc.password>home</jdbc.password>
</properties>
```
You could also start PostgreSQL locally with whatever installer works for your OS, or with docker:

```
docker run --name postgres-home -e POSTGRES_PASSWORD=home -e POSTGRES_DB=home -p 5432:5432 -d postgres:9.6.0
```

## Persistence layer choice

The persistence layer have 3 available implementations: JPA (default), JDBC and Spring Data JPA.
The default JPA implementation could be changed by using a Spring profile: `jdbc`, `spring-data-jpa` and `jpa`.
As an example, you may use the `-Dspring.profiles.active=jdbc` VM options to start the application with the JDBC implementation.

```
./mvnw jetty:run-war -Dspring.profiles.active=jdbc
```


## Working with home in your IDE

### Prerequisites
The following items should be installed in your system:
* Java 8 or newer (full JDK not a JRE)
* Maven 3.3+ (http://maven.apache.org/install.html)
* git command line tool (https://help.github.com/articles/set-up-git)
* Jetty 9.4+ or Tomcat 9+
* Your prefered IDE
  * Eclipse with the m2e plugin. Note: when m2e is available, there is an m2 icon in Help -> About dialog. If m2e is not there, just follow the install process here: http://www.eclipse.org/m2e/
  * [Spring Tools Suite](https://spring.io/tools) (STS)
  * IntelliJ IDEA


### Steps:

1) On the command line
```
git clone https://github.com/spring-home/spring-framework-home.git
```

2) Inside Eclipse or STS
```
File -> Import -> Maven -> Existing Maven project
```
Then either build on the command line `./mvnw generate-resources` or using the Eclipse launcher (right click on project and `Run As -> Maven install`) to generate the CSS.
Configure a Jetty or a Tomcat web container then deploy the `spring-home.war` file.

3) Inside IntelliJ IDEA

In the main menu, select `File > Open` and select the home [pom.xml](pom.xml). Click on the `Open` button.

CSS files are generated from the Maven build. You can either build them on the command line `./mvnw generate-resources`
or right click on the `spring-home` project then `Maven -> Generates sources and Update Folders`.

Go to the `Run -> Edit Configuration` then configure a Tomcat or a Jetty web container. Deploy the `spring-home.war` file.
Run the application by clicking on the `Run` icon.


4) Navigate to home

Visit [http://localhost:8080](http://localhost:8080) in your browser.


## Working with home in IntelliJ IDEA

### prerequisites
The following items should be installed in your system:


## Looking for something in particular?

| Java Config |   |
|-------------|---|
| Java config branch | home uses XML configuration by default. In case you'd like to use Java Config instead, there is a Java Config branch available [here](https://github.com/spring-home/spring-framework-home/tree/javaconfig) |

| Inside the 'Web' layer | Files |
|------------------------|-------|
| Spring MVC - XML integration | [mvc-view-config.xml](src/main/resources/spring/mvc-view-config.xml)  |
| Spring MVC - ContentNegotiatingViewResolver| [mvc-view-config.xml](src/main/resources/spring/mvc-view-config.xml) |
| JSP custom tags | [WEB-INF/tags](src/main/webapp/WEB-INF/tags), [createOrUpdateOwnerForm.jsp](src/main/webapp/WEB-INF/jsp/owners/createOrUpdateOwnerForm.jsp)|
| JavaScript dependencies | [JavaScript libraries are declared as webjars in the pom.xml](pom.xml) |
| Static resources config | [Resource mapping in Spring configuration](/src/main/resources/spring/mvc-core-config.xml#L30) |
| Static resources usage | [htmlHeader.tag](src/main/webapp/WEB-INF/tags/htmlHeader.tag), [footer.tag](src/main/webapp/WEB-INF/tags/footer.tag) |
| Thymeleaf | In the late 2016, the original [Spring home](https://github.com/spring-projects/spring-home) has moved from JSP to Thymeleaf. |

| 'Service' and 'Repository' layers | Files |
|-----------------------------------|-------|
| Transactions | [business-config.xml](src/main/resources/spring/business-config.xml), [ClinicServiceImpl.java](src/main/java/org/springframework/samples/home/service/ClinicServiceImpl.java) |
| Cache | [tools-config.xml](src/main/resources/spring/tools-config.xml), [ClinicServiceImpl.java](src/main/java/org/springframework/samples/home/service/ClinicServiceImpl.java) |
| Bean Profiles | [business-config.xml](src/main/resources/spring/business-config.xml), [ClinicServiceJdbcTests.java](src/test/java/org/springframework/samples/home/service/ClinicServiceJdbcTests.java), [homeInitializer.java](src/main/java/org/springframework/samples/home/homeInitializer.java) |
| JDBC | [business-config.xml](src/main/resources/spring/business-config.xml), [jdbc folder](src/main/java/org/springframework/samples/home/repository/jdb) |
| JPA | [business-config.xml](src/main/resources/spring/business-config.xml), [jpa folder](src/main/java/org/springframework/samples/home/repository/jpa) |
| Spring Data JPA | [business-config.xml](src/main/resources/spring/business-config.xml), [springdatajpa folder](src/main/java/org/springframework/samples/home/repository/springdatajpa) |


## Publishing a Docker image

This application uses [Google Jib]([https://github.com/GoogleContainerTools/jib) to build an optimized Docker image
into the [Docker Hub](https://cloud.docker.com/u/springcommunity/repository/docker/springcommunity/spring-framework-home/)
repository.
The [pom.xml](pom.xml) has been configured to publish the image with a the `springcommunity/spring-framework-home` image name.

Jib containerizes this WAR project by using the [distroless Jetty](https://github.com/GoogleContainerTools/distroless/tree/master/java/jetty) as a base image.

Build and push the container image of home to the Docker Hub registry:
```
mvn jib:build
```


## Interesting Spring home forks

The Spring home master branch in the main [spring-projects](https://github.com/spring-projects/spring-home)
GitHub org is the "canonical" implementation, currently based on Spring Boot and Thymeleaf.

This [spring-framework-home](https://github.com/spring-home/spring-framework-home) project is one of the [several forks](https://spring-home.github.io/docs/forks.html)
hosted in a special GitHub org: [spring-home](https://github.com/spring-home).
If you have a special interest in a different technology stack
that could be used to implement the Pet Clinic then please join the community there.


## Interaction with other open source projects

One of the best parts about working on the Spring home application is that we have the opportunity to work in direct contact with many Open Source projects. We found some bugs/suggested improvements on various topics such as Spring, Spring Data, Bean Validation and even Eclipse! In many cases, they've been fixed/implemented in just a few days.
Here is a list of them:

| Name | Issue |
|------|-------|
| Spring JDBC: simplify usage of NamedParameterJdbcTemplate | [SPR-10256](https://jira.springsource.org/browse/SPR-10256) and [SPR-10257](https://jira.springsource.org/browse/SPR-10257) |
| Bean Validation / Hibernate Validator: simplify Maven dependencies and backward compatibility |[HV-790](https://hibernate.atlassian.net/browse/HV-790) and [HV-792](https://hibernate.atlassian.net/browse/HV-792) |
| Spring Data: provide more flexibility when working with JPQL queries | [DATAJPA-292](https://jira.springsource.org/browse/DATAJPA-292) |
| Dandelion: improves the DandelionFilter for Jetty support | [113](https://github.com/dandelion/dandelion/issues/113) |


# Contributing

Approved by the Spring team, this repo is a fork of the [spring-projects/spring-home](https://github.com/spring-projects/spring-home).

The [issue tracker](/issues) is the preferred channel for bug reports, features requests and submitting pull requests.

For pull requests, editor preferences are available in the [editor config](.editorconfig) for easy use in common text editors. Read more and download plugins at <http://editorconfig.org>.
