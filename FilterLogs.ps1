while($true){
    $Global:path = Read-Host "Enter path of file"

    function does_file_exist($Global:path){
        $file_exists = $false
        while(!$file_exists){
        if(![System.IO.File]::Exists($Global:path)){
            echo 'File does not exist, please check spelling or choose new file...'
            $file_exists = $false
            $Global:path = Read-Host "Enter path of file"
        }
        else{$file_exists = $true}
        }
    }

    function filter_from_file(){
        $new_print = ''
        $keep_filtering = $true
        while($keep_filtering){
            $filter = Read-Host "Please enter search term"

            foreach($line in Get-Content $Global:path | Select-String -Pattern $filter){
                $new_print += $line
            }
            
            $bool = Read-Host 'Would you like to search using another filter? '
            if($bool -eq 'yes' -or $bool -eq 'YES' -or $bool -eq 'y' -or $bool -eq 'Y'){}
            else{$keep_filtering = $false}
        }
        return $new_print
    }
    
    does_file_exist($Global:path)
    
    $new_print = filter_from_file
    ./SubScripts/CleanLog.ps1 $new_print

    $bool = Read-Host 'Would you like to make another search?'
    if($bool -eq 'yes' -or $bool -eq 'YES' -or $bool -eq 'y' -or $bool -eq 'Y'){}
    else{exit}
}