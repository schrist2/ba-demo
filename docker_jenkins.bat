@ECHO OFF

SET HOME_DIR=%~dp0

docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v %HOME_DIR%:/var/jenkins_home/project jenkins/jenkins:lts
