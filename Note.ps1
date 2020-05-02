param
(
    [parameter(Position=0, Mandatory=$true)][string] $fileName,
    [parameter(Position=1, Mandatory=$false)][string] $category = "Default"
)

$allCategories = "Default",'Ticket'
$format = "html"

#Creating folder in one-note so that it can be synced online
cd 'C:\Users\sdiwan\OneDrive - eshopworld\Notes\'

#Create file with filename
Write-Host 'creating note '$filename' in category '$category'... '

if ($category -eq "Default"){
    New-Item "$fileName.$format" -ItemType File
    code .
}
if ($category -eq "Ticket"){
    cd Ticket
    Copy-Item -Path "Template.$format" -Destination "$filename.$format"
    cd ../
    code .
}
else {
    mkdir $category
    $allCategories += $category
    cd $category
    New-Item "$fileName.$format" -ItemType File
    cd ../
    code .
}