Configuration cAppxProvisionedPackageSet
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet('Present', 'Absent')]
        [string]
        $Ensure,

        [parameter(Mandatory = $true)]
        [string[]]
        $PackageName,

        [Parameter()]
        [bool]
        $AllUsers = $false
    )

    if ($Ensure -ne 'Absent') {
        Write-Error 'This resource supports only removing apps. Please specify the Ensure parameter as "Absent".'
        return
    }

    $TemplateString = @"
    cAppxProvisionedPackage Resource{0}
    {{
        Ensure = '{1}'
        PackageName   = '{2}'
        AllUsers = {3}
    }}
"@

    $ResourceCount = 0
    $ResourceString = ($PackageName | foreach {
            if ($AllUsers) {
                $AllUsersString = '$true'
            }
            else {
                $AllUsersString = '$false'
            }
            ($TemplateString -f $ResourceCount, $Ensure, $_, $AllUsersString)
            $ResourceCount++
        }) -join "`r`n"

    . ([ScriptBlock]::Create($ResourceString))
}