@echo off
SET JAVA_HOME=C:\Users\Administrator\AppData\Local\Programs\Eclipse Adoptium\jdk-17.0.18.8-hotspot
SET PATH=%JAVA_HOME%\bin;%PATH%
cd /d %~dp0
echo Starting Haitang ERP Backend with Java %JAVA_HOME%
java -version
echo.
echo Running Maven Spring Boot...
call mvn spring-boot:run -pl haitang-admin
pause
