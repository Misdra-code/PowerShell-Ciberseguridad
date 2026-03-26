function Investigar-IP {

    param(
        [string]$IP
	)

    # Tu API Key de AbuseIPDB
    $ApiKey = "252135369f5d444b4020f1150d0aba39b5375c31b66407a454ab2fab85b7f61de81c3d0b1d0c2d88"

    $Headers = @{
        "Key" = $ApiKey
        "Accept" = "application/json"
    }

    $Url = "https://api.abuseipdb.com/api/v2/check?ipAddress=$IP&maxAgeInDays=90"

    $Respuesta = Invoke-RestMethod -Uri $Url -Headers $Headers -Method Get

    $Resultado = [PSCustomObject]@{
        IP = $IP
        PuntajeAbuso = $Respuesta.data.abuseConfidenceScore
        TotalReportes = $Respuesta.data.totalReports
        Pais = $Respuesta.data.countryCode
    }

    return $Resultado
}

Investigar-IP -IP "10.0.204.73"
