$playniteDirectory = GET-CONTENT 'C:\Playnite-Shell\Playnite.LOCATION' -RAW
$configPath = [System.IO.Path]::Combine($playniteDirectory, 'config.json')
$config = [System.IO.File]::ReadAllLines($configPath) | ConvertFrom-Json
$config.AppStartupScript = 'if((get-process "EXPLORER" -ea SilentlyContinue) -eq $Null){ 
        "Not Running" 
        #not running
}

else{ 
        "Running"
        if ($PlayniteApi.ApplicationInfo.Mode -eq "Fullscreen")
        {
        TASKKILL /IM EXPLORER.EXE /F
        }
        else
        {
            #DESKTOPmode
        }
    
 }'
$config.AppShutdownScript = 'if ($PlayniteApi.ApplicationInfo.Mode -eq "Fullscreen")
{
START-PROCESS "C:\Motion-Shell\Playnite\Windows-Shell.EXE"
}
else
{
    # Execute when running in Fullscreen mode
}'
$config | ConvertTo-Json -depth 10 | Out-File $configPath -Encoding utf8