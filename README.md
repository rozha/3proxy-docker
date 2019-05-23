Run 3proxy in a [Docker](https://www.docker.com) container.  I'm personally using 3proxy to access Telegram via SOCKS5 but this piece of software is much more capable than that, please refer to its [documentation](https://3proxy.ru/documents) for more details.

Build your own image using a command like following.  You can either edit the configuration file before building to include it into your image or store the configuration on your host system, more about this below.

`docker build -t changeme/3proxy --no-cache=true .`

Run it

`docker run -d --restart=always -p 31337:41337/tcp changeme/3proxy`

It's not recommended but you can use my Docker image [available](https://hub.docker.com/r/rozha/3proxy) from the Docker Hub.  If you go for the prebuilt image, prepare a configuration file and mount it to the container.  The following example assumes it is stored as **/etc/3proxy.cfg** on the host system.

`docker run -d --restart=always -p 31337:41337/tcp -v /etc/3proxy.cfg:/etc/3proxy.cfg rozha/3proxy`
