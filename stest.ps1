[CmdletBinding()]
Param (
    $ClientID, $ClientSecret, $TenantID
)
function GetAuthToken {
    [CmdletBinding()]
    Param (
        $ClientID, $ClientSecret, $TenantID 
    )
    

    $TokenEndpoint = {https://login.windows.net/ {0}/oauth2/token} -f $TenantID 
    $ARMResource = "https://management.core.windows.net/";
    
    $Body = @{
        'resource'      = $ARMResource
        'client_id'     = $ClientID
        'grant_type'    = 'client_credentials'
        'client_secret' = $ClientSecret
    }
    
    $params = @{
        ContentType = 'application/x-www-form-urlencoded'
        Headers     = @{'accept' = 'application/json'}
        Body        = $Body
        Method      = 'Post'
        URI         = $TokenEndpoint
    }
    
    $token = Invoke-RestMethod @params
    
    return $token
}
 
# Getting authentication token
$token = GetAuthToken -ClientID $ClientID -ClientSecret $ClientSecret -TenantID $TenantID

Add-AzureRMAccount -AccessToken $token.Access_Token -AccountId $TenantID | Out-Null

Add-AzureRMAccount -AccessToken .Access_Token -AccountId  | Out-Null

New-AzureRmResourceGroup -Name jenkinsmaderg -Location EastUS2
