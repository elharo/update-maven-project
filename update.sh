#! /bin/bash

set -e
set +x
git branch 39

mvn clean

# update parent pom
find . -name 'pom.xml' -print0 | xargs -0 sed -i '' 's/<version>3[0-8]<\/version>/<version>39<\/version>/g'

# strip existing licenses
find . -name '*.java' -print | ~/update-maven-project/strip_license.py

# reformat
mvn spotless:apply

it

git commit "update parent POM to 39"
git push