# 基于 Windows Serve Core 镜像
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# 安装 Chocolatey 包管理器
RUN powershell.exe -Command \
	Set-ExecutionPolicy Bypass -Scope Process -Force; \
	[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; \
	iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# 安装 Python 3.11.2
RUN powershell -Command \
	$ErrorActionPreference = 'Stop'; \
	[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; \
	wget https://www.python.org/ftp/python/3.11.2/python-3.11.2-amd64.exe -OutFile c:\python-3.11.2-amd64.exe ; \
	Start-Process c:\python-3.11.2-amd64.exe -ArgumentList '/quiet InstallAllUsers=1 PrependPath=1' -Wait ; \
	Remove-Item c:\python-3.11.2-amd64.exe -Force

# 安装 Mingw-w64 和 Git
RUN choco install -y git --version 2.39.2 --params "/GitAndUnixToolsOnPath" ; \
	choco install -y mingw --version 8.1.0 ;
	
RUN	choco install -y python --version 3.10.4 ;
