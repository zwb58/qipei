$env:JAVA_HOME = "C:\Users\Administrator\AppData\Local\Programs\Eclipse Adoptium\jdk-17.0.18.8-hotspot"
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"
Set-Location "d:\erp\qixiu-erp"
Write-Host "Using Java version:"
& java -version
Write-Host "`nStarting Spring Boot application..."
mvn spring-boot:run -pl haitang-admin
