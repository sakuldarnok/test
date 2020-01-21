#!/bin/bash
apt-get update
apt-get upgrade
apt-get install nginx

systemctl start nginx
systemctl enable nginx

cp /etc/nginx/nginx.conf /etc/nginx/nginx.backup

echo "server {
    listen       80;
    listen       [::]:80;
    server_name  www.piratpage.cz;
    autoindex on;
    autoindex_exact_size off;

    location / {
        root /usr/share/nginx/html;
    }

    
}" >>  /etc/nginx/nginx.conf

echo "Ahoj svete" > /usr/share/nginx/html/hello.txt

systemctl reload nginx

