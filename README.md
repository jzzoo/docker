# docker

    
    # docker build -t php:5.6-fpm .
    ......
    ......
    Step 10/10 : CMD ["tee","/dev/null"]
     ---> Running in f30821a06bd9
    Removing intermediate container f30821a06bd9
     ---> 2b718d2cc43b
    Successfully built 2b718d2cc43b
    Successfully tagged php-fpm:5.6
    SECURITY WARNING: You are building a Docker image from Windows against a non-Windows Docker host. All files and directories added to build context will have '-rwxr-xr-x' permissions. It is recommended to double check and reset permissions for sensitive files and directories.```

    
    
    # docker run -p 9056:9056 --name php5.6.39 -v D:\wwwroot:/data -v D:\data\php-fpm\conf:/usr/local/php56/etc  -p 0.0.0.0:8056:80 -d php:5.6-fpm
    161d51b8d7cdbbebf4315d222d7553f0417cc1f357b2fa66e3f238ff773bb8ea
    
