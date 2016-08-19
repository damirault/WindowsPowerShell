if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Output "*********************"
    Write-Output "Need to run as admin!"
    Write-Output "*********************"
    Break
}

# Allow running of remote and custom scripts
$policy = Get-ExecutionPolicy
if ($policy -ne 'Unrestricted')
{
    Set-ExecutionPolicy Unrestricted
}

# Install Chocolatey
if (!(gcm cinst -ErrorAction SilentlyContinue)){
	iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
}

# Password Managers
choco install lastpass -y
# choco install 1password -y

# Text Editors
choco install notepadplusplus.install -y
choco install visualstudiocode -y
# choco install notepad2 -y 
# choco install atom -y

# GIT/SSH/Linux
choco install git.install -y
choco install gitextensions -y
choco install putty -y
choco install cygwin -y


# Nice Things
choco install googlechrome -y
choco install f.lux -y
choco install paint.net -y
choco install vlc -y
choco install skype -y

# Coding 
# choco install python -y


# Powershell Enhancement
cd ~
git clone https://github.com/donovanlange/WindowsPowerShell.git