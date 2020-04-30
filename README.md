Dockerised 3proxy.  3proxy is widely used to socksify Telegram or any other software supporting SOCKS5.  This tool is much more capable than included in the provided 3proxy.cfg, refer to its [documentation](https://3proxy.ru/documents) to learn about a broad range of features it supports.

Build your own image using a command like this:

`docker build -t changeme/3proxy --no-cache=true .`

You can either edit the configuration file before building to include it into your image or store the configuration on your host system, read more about storing configuration on the host system below.

Then to run a container using the image you prepared at the previous step:

`docker run -d --restart=always -p 31337:41337/tcp changeme/3proxy`

It's not recommended but you can use Docker image created by me some time ago, that image is [available](https://hub.docker.com/r/rozha/3proxy) from the Docker Hub.  If you go for the pre-built image, prepare a configuration file and mount it to the container.  The following example assumes 3proxy configuration is stored in **/etc/3proxy.cfg** on the host system:

`docker run -d --restart=always -p 31337:41337/tcp -v /etc/3proxy.cfg:/etc/3proxy.cfg rozha/3proxy`
