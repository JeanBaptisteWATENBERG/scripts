#!/bin/sh
git clone http://ec2-54-171-34-222.eu-west-1.compute.amazonaws.com/jbwatenberg/indigoapp.git
cd indigoapp
./mvn clean install
docker-compose up
