FROM nginx:latest

RUN mkdir -p /var/www/html

VOLUME /var/www/html

COPY ./www /var/www

RUN rm /etc/nginx/conf.d/default.conf

COPY ./config/01-default.conf /etc/nginx/conf.d/01-default.conf

RUN chown --recursive www-data:www-data /var/www
RUN chmod --recursive 755 /var/www

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
 
