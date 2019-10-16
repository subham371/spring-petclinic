#!/bin/bash

set -x

newcontainer=$(buildah from maven)
echo $newcontainer
buildah copy $newcontainer . /app/
buildah config --workingdir='/app' --port 8080 $newcontainer
buildah run $newcontainer mvn package
buildah config --entrypoint '[ "java", "-jar", "target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar" ]' $newcontainer
buildah commit $newcontainer buildahpetclinic:shell
