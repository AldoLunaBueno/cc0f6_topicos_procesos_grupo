param(
    [string]$BaseDir = "."
)

$diagramsDir = Join-Path $BaseDir "diagramas"
$imagesDir = Join-Path $BaseDir "images"

if (-not (Test-Path $diagramsDir)) {
    exit 0
}

$pumlFiles = Get-ChildItem -Path $diagramsDir -Filter "*.puml" -File
if ($pumlFiles.Count -eq 0) {
    exit 0
}

# Locate plantuml.jar from VS Code extensions directory
$jar = (Get-ChildItem -Path "$env:USERPROFILE\.vscode\extensions" -Filter "plantuml.jar" -Recurse | Select-Object -First 1).FullName
if (-not $jar) {
    Write-Warning "No se encontró plantuml.jar en las extensiones de VS Code."
    exit 0
}

if (-not (Test-Path $imagesDir)) {
    New-Item -ItemType Directory -Path $imagesDir -Force | Out-Null
}

foreach ($file in $pumlFiles) {
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $targetPng = Join-Path $imagesDir "$baseName.png"
    
    # Incremental compilation: compile only if target PNG doesn't exist or PUML was modified after PNG
    if ((-not (Test-Path $targetPng)) -or ($file.LastWriteTime -gt (Get-Item $targetPng).LastWriteTime)) {
        Write-Host "Compilando $($file.Name) -> $baseName.png con PlantUML..."
        java -jar "$jar" -charset UTF-8 -tpng -o "$imagesDir" "$($file.FullName)"
    }
}

