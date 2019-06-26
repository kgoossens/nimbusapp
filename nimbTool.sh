#!/bin/bash

cmd='ps'
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
  nimbusapp devops:1.1.7.2 $cmd
  nimbusapp jira:8.0.2 $cmd
  nimbusapp mfconnect:4.1.0-beta8 $cmd
  nimbusapp intellij:1.1.7.2 $cmd
  nimbusapp octane:12.60.47.88 $cmd
  nimbusapp alm:12.61 $cmd
  nimbusapp aos:1.1.7 $cmd
  nimbusapp sv:5.0.1 $cmd
  nimbusapp ssc:18.10 $cmd
  nimbusapp sca:18.20 $cmd
  nimbusapp ppm-octane:9.50-12.60.21.98 $cmd
  nimbusapp mc:3.1 $cmd
  nimbusapp leanft-chrome:14.52 $cmd
  nimbusapp da:6.2.1 $cmd
  nimbusapp autopass:10.8.0 $cmd
  nimbusapp auditworkbench:18.20 $cmd
  nimbusapp ppm:9.51 $cmd
}

if [ "$#" -ne 1 ] 
then
  usage
else
  cmd=$1
  create
  #docker-app render "../nimbus-dockerapp/$cmd.dockerapp" | docker-compose -p ${filename%.*} -f - $2
fi
