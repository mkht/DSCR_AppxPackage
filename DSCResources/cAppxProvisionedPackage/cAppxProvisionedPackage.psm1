function Get-TargetResource {
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [string]
        $PackageName
    )

    $GetRes = @{
        Ensure         = 'Absent'
        PackageName    = $PackageName
        PackagePath    = ''
        DependencyPackagePath = ''
        LicensePath    = ''
    }

    $Appx = Get-AppxProvisionedPackage -Online | ? {$_.PackageName -like ($PackageName + '*')} | select -First 1
    if ($Appx) {
        $GetRes.Ensure = 'Present'
        $GetRes.PackageName = $Appx.PackageName
    }
    else {
        $GetRes.Ensure = 'Absent'
    }

    $GetRes
} # end of Get-TargetResource

# ////////////////////////////////////////////////////////////////////////////////////////
# ////////////////////////////////////////////////////////////////////////////////////////
function Test-TargetResource {
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [ValidateSet("Present", "Absent")]
        [string]
        $Ensure = 'Present',

        [parameter(Mandatory = $true)]
        [string]
        $PackageName,

        [parameter()]
        [string]
        $PackagePath,

        [parameter()]
        [string[]]
        $DependencyPackagePath,

        [parameter()]
        [string]
        $LicensePath
    )

    $CurrentState = Get-TargetResource -PackageName $PackageName
    if ($Ensure -ne $CurrentState.Ensure) {
        # Not match Ensure state
        Write-Verbose ('Not match Ensure state. your desired "{0}" but current "{1}"' -f $Ensure, $CurrentState.Ensure)
        return $false
    }
    else {
        return $true
    }
} # end of Test-TargetResource

# ////////////////////////////////////////////////////////////////////////////////////////
# ////////////////////////////////////////////////////////////////////////////////////////
function Set-TargetResource {
    [CmdletBinding()]
    param
    (
        [ValidateSet("Present", "Absent")]
        [string]
        $Ensure = 'Present',

        [parameter(Mandatory = $true)]
        [string]
        $PackageName,

        [parameter()]
        [string]
        $PackagePath,

        [parameter()]
        [string[]]
        $DependencyPackagePath,

        [parameter()]
        [string]
        $LicensePath
    )

    switch ($Ensure) {
        'Absent' {
            $Appx = Get-TargetResource -PackageName $PackageName
            Remove-AppxProvisionedPackage -Online -PackageName $Appx.PackageName -ErrorAction Stop
        }
        'Present' {
            if ((-not $PackagePath) -or (-not (Test-Path $PackagePath))) {
                Write-Error ('PackagePath:"{0}" not found.' -f $PackagePath)
                return
            }

            $AppxParam = @{
                PackagePath = $PackagePath
            }

            if ($DependencyPackagePath) {
                $AppxParam.DependencyPackagePath = $DependencyPackagePath
            }

            if ($LicensePath) {
                $AppxParam.LicensePath = $LicensePath
            }
            else{
                $AppxParam.SkipLicense = $true
            }

            Add-AppxProvisionedPackage @AppxParam -Online -ErrorAction Stop
        }
    }

} # end of Set-TargetResource

# ////////////////////////////////////////////////////////////////////////////////////////
# ////////////////////////////////////////////////////////////////////////////////////////
Export-ModuleMember -Function *-TargetResource
