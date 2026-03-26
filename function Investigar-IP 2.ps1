function Investigar-IP {

    param(
        [string]$IP
	)

    # Tu API Key de AbuseIPDB
    $ApiKey = "[TU API KEY]"

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
