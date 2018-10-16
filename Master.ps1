Set-Location $PSScriptRoot

Write-Host '---Welcome to the hub!---'

while($true){
    $allFiles = Get-ChildItem $PSScriptRoot -Filter '*.ps1' -Exclude '*Master*'
    Write-Host 'What Script would you like to run?' + "`n"
    Write-Host 'ID  Filename' + "`n"

    for($i = 0; $i -le $allFiles.Length -1; $i++){
       write-host $i  ':'  $allFiles[$i] 
    }

    $userChoice = Read-Host 'Please choose the associated ID'

    $runFile = './'+ $allfiles[$userChoice]
    &$runFile

    $bool = Read-Host 'Would you like to run another script?'
    if($bool -eq 'yes' -or $bool -eq 'YES' -or $bool -eq 'y' -or $bool -eq 'Y'){}
    else{exit}
}
