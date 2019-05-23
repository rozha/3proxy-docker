Dockerised 3proxy.  Easily socksify your Telegram.  3proxy is much more capable than that, refer to the [original documentation](https://3proxy.ru/documents) to know more about its features.

Build your own image using a command like following.  You can either edit the configuration file before building to include it into your image or store the configuration on your host system, more about this below.

`docker build -t changeme/3proxy --no-cache=true .`

Then to start it:

`docker run -d --restart=always -p 31337:41337/tcp changeme/3proxy`

It's not recommended but you can use Docker image created by me some time ago.  The image is [available](https://hub.docker.com/r/rozha/3proxy) from the Docker Hub.  If you go for the pre-built image, prepare a configuration file and mount it to the container.  The following example assumes 3proxy configuration is stored in **/etc/3proxy.cfg** on the host system.

`docker run -d --restart=always -p 31337:41337/tcp -v /etc/3proxy.cfg:/etc/3proxy.cfg rozha/3proxy`
