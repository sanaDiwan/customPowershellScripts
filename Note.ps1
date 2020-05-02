param
(
    $name,
    $format,
    $category
)
if(!$name) {$name = (get-date).ToString('dddd MM-dd-yyyy HH-mm')}
if(!$format) {$format = "docx"}
if(!$category) {$category = "Default"}

$allCategories = "Default"
$path = 'C:\Users\sdiwan\OneDrive - eshopworld\Notes\'

function CreateCategory($category)
{
    if(!(Test-Path $path$category))
    {
        mkdir $category
        $allCategories += $category
    }
}

function Open($location, $format){
    if($format -eq "docx"){
        Invoke-Item $location
    }
    if(!($format -eq "docx")){code $location}
}

function GenerateFile($file, $location)
{
    Set-Location $location
    New-Item $file -ItemType File
}

#Creating folder in one-note so that it can be synced online
Write-Host 'creating note '$name'.'$format' in category '$category'... '

if ($category -eq "Default")
{
    GenerateFile "$name.$format" $path
    Open $path$name.$format $format
}
if (!($category -eq "Default")) 
{
    CreateCategory $category
    GenerateFile "$name.$format" $path$category
    Open $path$category$name.$format $format
}