# 基于 Windows Serve Core 镜像
FROM mcr.microsoft.com/windows/servercore:ltsc2019

docker pull python:latest

RUN ["pip", "install", "mingw-8.1"]
