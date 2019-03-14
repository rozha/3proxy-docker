Run 3proxy in a [Docker](https://www.docker.com) container.  I'm personally using 3proxy to access Telegram via SOCKS5 but this piece of software is much more capable than that, please refer to its [documentation](https://3proxy.ru/documents) for more details.

You can either build your own image using the command specified below (but please don't foget to edit the configuration file to at least change the authentication settings)

`docker build -t changeme/3proxy --no-cache=true .`

Then run it using something like

`docker run -d --restart=always -p 31337:41337/tcp changeme/3proxy`

Or (not recommended though) you can use my Docker image [available](https://hub.docker.com/r/rozha/3proxy) from the Docker Hub.  If you go for the prebuilt image, again, don't forget to edit your configuration file and mount it to the container (assuming your configuration is stored in **/etc/3proxy.cfg** on the host system)

`docker run -d --restart=always -p 31337:41337/tcp -v /etc/3proxy.cfg:/etc/3proxy.cfg rozha/3proxy`
