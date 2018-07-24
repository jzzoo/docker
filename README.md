# docker uses a little note

Record the pit I met with docker


* **About build**

```
$  docker build -t php-fpm:5.6 .
......
......
Step 10/10 : CMD ["php-fpm56"," --nodaemonize"]
 ---> Running in f30821a06bd9
Removing intermediate container f30821a06bd9
 ---> 2b718d2cc43b
Successfully built 2b718d2cc43b
Successfully tagged php-fpm:5.6
SECURITY WARNING: ... Windows ... '-rwxr-xr-x' permissions......  directories.
````


* **About run**

```
$ docker run -p 9056:9056 --name php5.6 -v D:\wwwroot:/data -d php-fpm:5.6
161d51b8d7cdbbebf4315d222d7553f0417cc1f357b2fa66e3f238ff773bb8ea
or 
$ docker run -p 9066:9056 --name YourName -v D:\www:/data -p 0.0.0.0:8066:80 -itd php-fpm:5.6
161d51b8d7cdbbebf4315d222d7553f0417cc1f357b2fa66e3f238ff773bb8ea
```


* **About starting**

Docker must be a "foreground process", otherwise docker will stop immediately after startup, there are usually several ways to deal with it. As follows:

 > 1. When using ``php-fpm``, add`` --nodaemonize`` parameters, such as: ``php-fpm56 --nodaemonize``
 > 2. Use ``top/tail`` type commands, such as: ``tail -f /dev/null``
 > 3. Install and use the ``supervisor`` tool, which is written in ``Python``, so install ``Python`` and ``python-setuptools`` first.
 > 4. When performing ``docker run``, run a loop at the back, 
    such as: ``docker run -d php-fpm:5.6 /bin/sh -c "while true; do echo 123; sleep 1; done"``

* **About network**

 In addition, the problem of network port mapping is sometimes normal, but it can not be accessed.
 
> 1. Replace ``127.0.0.0:9000`` in ``php-fpm.conf`` with ``[::]: 9056``,such as:``sed -i 's/127.0.0.1:9000/[::]:9056/' ./php-fpm.conf ``
> 2. We used to use ``php -S 127.0.0.1:80`` before, and now we can: ``php -S [::]:80``
> 3. In a word, it can't appear ``127.0.0.1``,5555.In this way, you can play: ``netstat -ano``, ``docker port a3a0cfd83232``, ``setenforce 0 ``and so on.

* **About nginx**

When nginx and php-fpm are not in one place, the configuration of nginx is different from the traditional configuration.

> 1. Do not use ``UNIX socket`` communication mode. You should use ``TCP socket`` mode.
> 2. Pay attention to configuring the script path, the ``SCRIPT_FILENAME`` parameter should take the file root path, such as:`` fastcgi_param SCRIPT_FILENAME /data/XXX/$real_script_name; ``, of course, you can also use ``$document_root``, such as: ``fastcgi_param SCRIPT_FILENAME $document_root/$fastcgi_script_name;``.



 
