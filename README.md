# desktop-agent-core

Ex. docker build command where Dockerfile is stored at C:\build\Dockerfile

`docker build -t desktop-agent c:\build --build-arg CLASSIC_AGENT_HOST=<IP or hostname of Desktop 8.0 server> --build-arg CLASSIC_AGENT_PORT=443 --build-arg CLASSIC_AGENT_KEY=<unencrypted key> --build-arg CLASSIC_AGENT_KEY_ENCRYPTED=False`
