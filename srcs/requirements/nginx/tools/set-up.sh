#!/bin/bash

echo "
server {
         listen 443 ssl;
         listen [::]:443 ssl;

         ssl_protocols TLSv1.2 TLSv1.3;
         ssl_certificate $SSL_CERT;
         ssl_certificate_key $SSL_KEY;

        root /var/www/wordpress;

        index index.php index.html index.htm;

        server_name $DOMAIN;

        location / {
                try_files \$uri \$uri/ =404;
        }

        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass wordpress:9000;
                include fastcgi_params;
                fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        }

        location ~ /\.ht {
                deny all;
        }
}

" > /etc/nginx/sites-available/default

sleep 5

nginx -g "daemon off;"
