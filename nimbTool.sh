#!/bin/bash

function usage()
{
   output "Usage: createnimbusapp COMMAND"
   output -e ""
   output -e "Commands:"
   output -e "  down     Stop and remove containers"
   output -e "  inspect  Shows metadata and settings for a given application"
   output -e "  logs     Shows logs for containers"
   output -e "  ps       Lists containers"
   output -e "  pull     pull service images"
   output -e "  render   Render the Compose file for the application"
   output -e "  rm       Remove stopped containers"
   output -e "  restart  Restart containers"
   output -e "  start    Start existing containers"
   output -e "  stop     Stop existing containers"
   output -e "  up       Creates and start containers"
   output -e "  version  Prints version information"
   output -e "  help     Prints this help message"
}

function output() {
  echo "$@"
}

##########
# create #
##########
function create()
{
  nimbusapp devops:1.1.7.2 $1
  nimbusapp jira:8.0.2 $1
  nimbusapp mfconnect:4.1.0-beta8 $1
  nimbusapp intellij:1.1.7.2 $1
  nimbusapp octane:12.60.47.88 $1
  nimbusapp alm:12.61 $1
  nimbusapp aos:1.1.7 $1
  nimbusapp sv:5.0.1 $1
  nimbusapp ssc:18.10 $1
  nimbusapp sca:18.20 $1
  nimbusapp ppm-octane:9.50-12.60.21.98 $1
  nimbusapp mc:3.1 $1
  nimbusapp leanft-chrome:14.52 $1
  nimbusapp da:6.2.1 $1
  nimbusapp autopass:10.8.0 $1
  nimbusapp auditworkbench:18.20 $1
  nimbusapp ppm:9.51 $1
}

if [ "$#" -ne 1 ] 
then
  usage
else
  create
  #docker-app render "../nimbus-dockerapp/$1.dockerapp" | docker-compose -p ${filename%.*} -f - $2
fi