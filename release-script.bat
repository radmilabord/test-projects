
REM update all dependencies to the latest released version
mvn versions:use-latest-versions -Dincludes=com.rada:* 

REM This will strip off SNAPSHOT from the project version
mvn -B build-helper:parse-version versions:set -DnewVersion=${parsedVersion.majorVersion}.${parsedVersion.minorVersion}.${parsedVersion.incrementalVersion}

REM deploy artifact - this might not be needed if next step is to commit released version. Depends if branches are automatically built. If they are, then deploying is not needed. If they don't and release happens in the release branch, then this step is needed
mvn deploy

REM commit released version
git add .
git commit -m "Commiting released version"
git push

REM update project version to the next snapshot
mvn -B release:update-versions

REM commit released version
git add .
git commit -m "Commiting new snapshot version"
git push
