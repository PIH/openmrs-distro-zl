# openmrs-distro-zl 
=============================== 

This project defines the "ZL EMR" distribution of OpenMRS, which it inherits from a parent distribution that defines a specific OpenMRS war and modules. It uses an OpenMRS 3.x frontend package designed for use with the parent distribution. It installs an OpenMRS content package that defines the needed config for the distribution and frontend.

The parent distro, frontend, and config that make up this distribution are Open-Source Software available at the following repositories. The versions of these packages are defined in pom.xml. 

https://github.com/PIH/openmrs-distro-pihemr
https://github.com/PIH/openmrs-frontend-pihemr
https://github.com/PIH/openmrs-config-zl

# Overview of the OpenMRS

The *ZL EMR* is a *distribution* of *OpenMRS*, an open-source medical record system.  

A few links from the OpenMRS wiki that are worth reading: 

* High-level overview of OpenMRS: https://wiki.openmrs.org/display/docs/Introduction+to+OpenMRS 
* Overview of the OpenMRS data model: https://wiki.openmrs.org/display/docs/Data+Model 
* Definition of an "OpenMRS distribution": https://wiki.openmrs.org/display/docs/OpenMRS+Distributions

# Setting up the ZL EMR 

The ZL EMR supports installation using the OpenMRS SDK (recommended for development environments) or in containers (recommended for production instances). This readme only covers installing the ZL EMR in Linux. For Windows installation, WSL is recommended.

Setting up an instance of the ZL EMR using the OpenMRS SDK requires either a local MySQL instance or a docker installation that can run MySQL for the server. If you are going to use Docker, the OpenMRS SDK can configure the database container for you. If you are going to use a local MySQL instance, it must be available when setting up the SDK. You will also need to have Java and Maven installed to run the server using the OpenMRS SDK. Running in containers requires a local maven and docker installation. You can confirm that the prerequisites are installed by running these commands.

``` 
java -version 

``` 

``` 
mvn -version 

``` 

``` 
mysql --version 

``` 

``` 
docker --version 
``` 

*Installing the ZL EMR with the OpenMRS SDK*

To setup a new OpenMRS server running the ZL EMR, use setupSdk.sh, you will be prompted for the ports, database settings, and pih-config to use. For more information on available pih-config options, refer to the openmrs-config-zl project. The server will be installed to `~/openmrs/[serverId]`. 

``` 
./setupSDK.sh 

``` 

To update your server using the OpenMRS SDK user the updateSdk.sh script. You will be prompted for the serverId to update.

``` 
./updateSDK.sh 

``` 

*Installing the ZL EMR with the Docker* 

Container installations do not prompt for ports or pih.config like the OpenMRS SDK. Environment variables for the container-based installation are configured in the .env file. The setupDocker.sh script will create this file if it does not exist using defaults apropriate for a dev/test instance, with http on port 8080, debug on port 1044, and mysql on port 3306 with the pih.config "haiti,haiti-central,haiti-local-idgen". To adjust these settings, make a copy of `dev.env` named `.env` and make your changes before running setupDocker.sh. To setup a docker environment run setupDocker.sh. The script will create an environment file (if needed), install the distro files using maven (if needed), and copy the distro files to a local container image based on openmrs/openmrs-core.

``` 
./setupDocker.sh 

``` 

To update the local container image with the latest ZL EMR components, run updateDocker.sh. This script will install the distro files using maven, rebuild the local container image with the new distro components, and replace the running containers. Application and Database data are maintianed in docker volumes when the containers are replaced.

``` 
./updateDocker.sh 

``` 

You can tail the logs for the running containers by running "docker compose logs -f -n 10" or output the logs to a host file by running "docker compose logs >> zlemr.log"

# Advanced Setup

The setup and install scripts provided here are intended as a convenience for getting started with the ZL EMR. Implementers familiar with the OpenMRS SDK or Docker may want to consider the many additional options available in those ecosystems to adjust the ZL EMR to meet their needs. 