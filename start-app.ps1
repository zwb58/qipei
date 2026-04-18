Set-Location 'd:\erp\qixiu-erp'
$env:JAVA_HOME = 'C:\Users\Administrator\AppData\Local\Programs\Eclipse Adoptium\jdk-17.0.18.8-hotspot'
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"
Write-Host "Java version:"
java -version
Write-Host "`nStarting Spring Boot..."
mvn spring-boot:run -pl haitang-admin
