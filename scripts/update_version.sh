#!/bin/bash
#cd ${WORKSPACE}
pwd
# Check DOCAPPVERSION exists
grep -cE "DOCAPPVERSION" pom.xml
if [[ $? != "0" ]]; then
    echo "Version variable not found"
    exit 1
fi
dummyvar='DOCAPPVERSION'
release_ver=${BUILD_NUMBER}
sed "s/$dummyvar/$release_ver/g" pom.xml > pom1.xml
mv pom1.xml pom.xml

#mvn sonar:sonar \
# -Dsonar.projectKey=docapp01 \
#  -Dsonar.host.url=http://localhost:9000 \
#  -Dsonar.login=f9c54e719f23870eca50e027693bddc871ee41b8