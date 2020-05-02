param
(
    [parameter(Position=0, Mandatory=$false)][string] $fileName ,
    [parameter(Position=1, Mandatory=$false)][string] $fileFormat,
    [parameter(Position=2, Mandatory=$false)][string] $category
)
if(!$fileName) {$fileName = (get-date).ToString('dddd MM-dd-yyyy HH-mm')}
if(!$fileFormat) {$fileFormat = "docx"}
if(!$category) {$category = "Default"}
$allCategories = "Default"
$path = 'C:\Users\sdiwan\OneDrive - eshopworld\Notes\'

#Creating folder in one-note so that it can be synced online
Set-Location $path

#Create file with filename
Write-Host 'creating note '$filename'.'$fileFormat' in category '$category'... '

if ($category -eq "Default"){
    New-Item "$fileName.$fileFormat" -ItemType File
    code .
}
else {
    mkdir $category
    $allCategories += $category
    Set-Location $path+$category
    New-Item "$fileName.$fileFormat" -ItemType File
    Set-Location $path
    code .
}