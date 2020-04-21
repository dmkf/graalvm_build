#!/bin/bash
cd /var/app
mvn -Dmaven.test.skip=true -Pnative clean package
