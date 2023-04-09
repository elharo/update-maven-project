#! /bin/bash

set -e
set +x
git branch 39

mvn clean

# update parent pom
find . -name 'pom.xml' -print0 | xargs -0 sed -i '' 's/<version>3\d<\/version>/<version>39<\/version>/g'

# strip existing licenses
find . -name '*.java' -print | ~/update-maven-project/strip_license.py

# reformat
mvn spotless:apply

git commit "update parent POM to 39"
git push