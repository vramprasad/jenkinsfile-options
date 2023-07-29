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
sed "s/$dummyvar/$release_ver/g" pom.xml