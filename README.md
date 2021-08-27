### Windows

1. Åbn en frisk Powershell terminal

2. Kør følgende script af

<pre>
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/DineroRegnskab/mac-grabber/main/Windows.ps1'));
</pre>

### MacOS

1. Åbn en frisk terminal

2. Kør følgende script af

<pre>
curl -s -fSSL https://raw.githubusercontent.com/DineroRegnskab/mac-grabber/main/MacOS.sh | sh
</pre>