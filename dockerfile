# 基于 Windows Serve Core 镜像
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# 安装 Python 3.11.2
RUN powershell -Command \
	$ErrorActionPreference = 'Stop'; \
	[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; \
	wget https://www.python.org/ftp/python/3.11.2/python-3.11.2-amd64.exe -OutFile c:\python-3.11.2-amd64.exe ; \
	Start-Process c:\python-3.11.2-amd64.exe -ArgumentList '/quiet InstallAllUsers=1 PrependPath=1' -Wait ; \
	Remove-Item c:\python-3.11.2-amd64.exe -Force

RUN ["pip", "install", "mingw-8.1"]
