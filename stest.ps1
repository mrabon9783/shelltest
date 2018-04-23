[CmdletBinding()]
Param (
    , , 
)
function GetAuthToken {
    [CmdletBinding()]
    Param (
        , ,  
    )
    

     = {https://login.windows.net/ {0}/oauth2/token} -f  
     = https://management.core.windows.net/;
    
     = @{
        'resource'      = 
        'client_id'     = 
        'grant_type'    = 'client_credentials'
        'client_secret' = 
    }
    
     = @{
        ContentType = 'application/x-www-form-urlencoded'
        Headers     = @{'accept' = 'application/json'}
        Body        = 
        Method      = 'Post'
        URI         = 
    }
    
     = Invoke-RestMethod @params
    
    return 
}
 
# Getting authentication token
 = GetAuthToken -ClientID  -ClientSecret  -TenantID 

Add-AzureRMAccount -AccessToken .Access_Token -AccountId  | Out-Null
