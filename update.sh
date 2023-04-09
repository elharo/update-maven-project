#! /bin/bash

set -e
git branch 39

mvn clean

# update parent pom
find . -name 'pom.xml' -print0 | xargs -0 sed -i '' 's/<version>3\d<\/version>/<version>39<\/version>/g'

# strip existing licenses
find . -name '*.java' -print0 | ~/update_maven_project/strip_license.py

# reformat
mvn spotless:apply