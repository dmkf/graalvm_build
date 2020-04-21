#!/bin/bash
cd /app
mvn -Dmaven.test.skip=true -Pnative clean package
