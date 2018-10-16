$global:log = $args[0]
$global:Print = ''
$array_of_split_log = $global:log.Split("[""]")
for($i = 0; $i -lt $array_of_split_log.Length; $i++){
    if($i % 2 -eq 1){
        $global:Print += $array_of_split_log[$i] + "`n`n"
    }
}

$global:Print = $global:Print.Replace('','|') #Hidden symbol is pasted in first ''

./SubScripts/PrintResults.ps1 $global:Print