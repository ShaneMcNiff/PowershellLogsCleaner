$final_print = $args[0]

$bool = Read-Host 'Would you like to have these results printed in a document and saved to a location? (Will be asked for Directory,filename,format)'
if($bool -eq 'yes' -or $bool -eq 'YES' -or $bool -eq 'y' -or $bool -eq 'Y'){

    while($true){
        $final_print_location = Read-Host "Where would you like the results saved"
        $results_file_name = Read-Host "What would you like the file to be called"
        $file_type = Read-Host 'What format would you like the file to be saved in (.txt, .csv. etc)'
        $full_path = $final_print_location + $results_file_name +  $file_type

        if(![System.IO.File]::Exists($full_path)){
            $final_print>>$full_path
            exit
        }else{
        echo 'File already exists, please change either path or file name'
        }
    }

}else{
    echo "Here are the results...`n`n"
    $final_print
    echo ''

}