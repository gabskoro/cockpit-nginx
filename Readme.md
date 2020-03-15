### Docker image + Nginx + PHP 7.2 setup for the cockpit project
* https://github.com/agentejo/cockpit

#### Build image
```
docker build -t gabskoro/cockpit-nginx .
```

#### Start interactively (comment out ENTRYPOINT and build again)
```
docker run -p 8080:80 -it gabskoro/cockpit-nginx /bin/bash
```

#### Start normaly
```
docker run -p 8080:80 gabskoro/cockpit-nginx
```
