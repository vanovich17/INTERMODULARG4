Write-Host "🛑 Deteniendo y eliminando contenedores..."
docker-compose down -v --remove-orphans

if (Test-Path "./data/mysql") {
    Write-Host "🧹 Eliminando datos antiguos de MySQL..."
    Remove-Item -Path "./data/mysql" -Recurse -Force
}

Write-Host "🏗️ Construyendo y arrancando servicios..."
docker-compose up -d --build

Write-Host "⏳ Esperando a que la base de datos esté lista..."
Start-Sleep -Seconds 20

Write-Host "✅ ¡Todo listo!"
Write-Host "   - Frontend: http://localhost:5173"
Write-Host "   - Backend: http://localhost:4000"
Write-Host "   - MySQL: localhost:3307"
