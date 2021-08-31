$Lan = $null;
$WiFi = $null;

Get-NetAdapter -Physical | % {

    if ($_.Name.StartsWith("Ethernet") -and $Lan -eq $null)
    {
        $Lan = $_.MacAddress;
    }

    if ($_.Name.StartsWith("Wi-Fi") -and $WiFi -eq $null)
    {
        $WiFi = $_.MacAddress;
    }
}

if ($Lan -eq $null)
{
    "LAN adresse ikke fundet. Forbind din PC via et kabel."
    return;
}
else
{
    "LAN adresse fundet: ${Lan}"
}

if ($WiFi -eq $null)
{
    "Wi-Fi adresse ikke fundet. Forbind din PC til et Wi-Fi."
    return;
}
else
{
    "Wi-Fi adresse fundet: ${WiFi}"
}
