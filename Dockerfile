# escape=`
FROM microsoft/windowsservercore
ARG AGENT_VERSION
ARG CLASSIC_AGENT_KEY
ARG CLASSIC_AGENT_HOST
ARG CLASSIC_AGENT_PORT
ARG CLASSIC_AGENT_KEY_ENCRYPTED

ADD https://download.spiceworks.com/SpiceworksAgent/0.3.16/SpiceworksAgentShell_classic-agent.msi C:\

SHELL ["powershell", "-Command"]

RUN $args = \"/i C:\SpiceworksAgentShell_classic-agent.msi /qn CLASSIC_AGENT_KEY=\" + $Env:CLASSIC_AGENT_KEY + \" CLASSIC_AGENT_KEY_ENCRYPTED=\" + $Env:CLASSIC_AGENT_KEY_ENCRYPTED + \" CLASSIC_AGENT_PORT=\" + $Env:CLASSIC_AGENT_PORT + \" CLASSIC_AGENT_HOST=\" + $Env:CLASSIC_AGENT_HOST + \" /lv install.log\"; `
Start-Process msiexec.exe -Wait -ArgumentList $args;

RUN Remove-Item C:\SpiceworksAgentShell_classic-agent.msi -Force;
