function New-RandomPassword
{
Param(
[Parameter()]
[ValidateSet('strong','medium','easy')][string]$Complexity='easy'
)
    $UpperVowels = (65,69,73,79,85)
    $LowerVowels = (97,101,105,111,117)
    
    $Length = 8
    $asciiNumbers = @(48..57)
    $asciiUpper = @(65..90)
    $asciiLower = @(97..122)
    $asciiAll = @(33..126)

    Switch($Complexity)
    {

        easy 
        {

            $Initial = [CHAR](($asciiUpper | Where-Object {$_ -notin $UpperVowels}) | Get-Random)
            $Vowels = $LowerVowels | Get-Random -count 2 | ForEach-Object {[CHAR]$_}
            $midLetter = [CHAR](($asciiLower | Where-Object {$_ -notin $LowerVowels}) | Get-Random)
            $NumberStream = -Join ((0..9) | Get-Random -count 4)

            $Output = "$Initial$($Vowels[0])$MidLetter$($Vowels[1])$NumberStream"

        }

        strong 
        {
            $Length = 16
            $Output = -join ( $asciiAll | Get-Random -Count $Length | Foreach-Object {[CHAR]$_})           
        }

        medium 
        {
            $Length = 10
            $charset = $asciiNumbers + $asciiUpper + $asciiLower
            $Output = -join ( $charSet | Get-Random -Count $Length | Foreach-Object {[CHAR]$_})            
        }

    }

    return $Output

}
