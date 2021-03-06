
Import-Module activedirectory
$ADUsers = Import-csv $pwd\users.csv  ### Make sure file is named as users.csv and placed in same directory path
foreach ($User in $ADUsers)
{
	#Read user data from each field in each row and assign the data

	$Username 	= $User.'emp code'
	$Firstname 	= $User.'first name'
	$Lastname 	= $User.'last name'
	$displayname = $user.'full name'
    $OU = 'ou=Application Disabled ,Dc=ajubachn1,Dc=net'
    $email      = $User.'mail id'
    $description   = $User.designation
    $Password = (ConvertTo-SecureString -AsPlainText Ajuba123 -Force)
    
		#User does not exist then proceed to create the new user account
	
		New-ADUser   -SamAccountName $Username `
            -UserPrincipalName "$Username@ajubachn1.net" `
            -Name "$Firstname $Lastname" `
            -GivenName $Firstname `
            -Surname $Lastname `
            -Enabled $True `
            -DisplayName "$firstname $Lastname" `
            -Path $ou `
            -EmailAddress $email `
            -description $description `
            -AccountPassword $Password -ChangePasswordAtLogon $True
            
	
}
