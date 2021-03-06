# desktop-agent-core

Use docker to build a container that installs and runs the Spiceworks Agent Shell "Classic Agent" module. This agent module checks in with the Spiceworks Desktop (v8.0+) to create a new sample/test device record in the Inventory.

## Initial Setup
This can likely be done in any VirtualBox host. In macOS/Sierra (10.12):
  * install latest VirtualBox
  * Create a 2016 Server VM within VirtualBox

In the Server 2016 VM:
  * Install latest Docker
  * Pull down Windows server core from docker:  
  `docker pull microsoft/windowsservercore` (this should be vanilla Server 2016 with .Net 4.5)
 
Note: looks like MSI requires WindowsServerCore, and can't be done with NanoServer. 
ref. https://blog.sixeyed.com/how-to-dockerize-windows-applications/ 

## Example docker build command

Ex. docker build command where Dockerfile is stored at C:\build\Dockerfile

`docker build -t desktop-agent c:\build --build-arg CLASSIC_AGENT_HOST=desktopapp --build-arg CLASSIC_AGENT_PORT=443 --build-arg CLASSIC_AGENT_KEY=<unencrypted key> --build-arg CLASSIC_AGENT_KEY_ENCRYPTED=False --build-arg AGENT_VERSION="0.3.16"`

Note: `desktopapp` is the hostname of the Desktop app container.

After a successful build:

## View images 
`docker images`

## Run the new image in a container
`docker run -dit desktop-agent`
 
The container is launched in the background with interactive mode enabled, which means we can "attach" to the container's console.

## Lookup the name of the container (its dynamic)
`docker ps -a`
 
## Then attach to the console using
`docker attach <dynamic name>`
 
After running docker attach you'll have a cmd console. You can call powershell to get a PS console.
You can detach and leave the container running using Ctrl+P , Ctrl+Q.
