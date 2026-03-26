$usuarios = Get-LocalUser
$sinLogon = @()
$conLogon = @()
foreach ($u in $usuarios) {
    if (-not $u.LastLogon) {
        $sinLogon += "$($u.Name): Estado = $($u.Enabled), Ultimo acceso = NUNCA"
    } else {
        $conLogon += "$($u.Name): Estado = $($u.Enabled), Ultimo acceso = $($u.LastLogon)"
        }
}
#Guardar en archivos separados
$sinLogon | Out-File -FilePath "C:\Users\user\Escritorio\PS\Actividad12_usuarios_sin_logon.txt"
$conLogon | Out-File -FilePath "C:\Users\user\Escritorio\PS\Actividad12_usuarios_con_logon.txt"
#Mostrar en pantalla
$reporte = @()
$reporte += Write-Output "`n Usuarios que NUNCA han iniciado sesión:"
$reporte += $sinLogon | ForEach-Object {Write-Output $_}
$reporte += Write-Output "`n Usuarios que SÍ han iniciado sesión"
$reporte += $conLogon | ForEach-Object {Write-Output $_}
$reporte | Out-File -FilePath "C:\Users\user\Escritorio\PS\Actividad12_reporte_usuarios.txt"
