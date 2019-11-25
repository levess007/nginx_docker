FROM nginx:latest

RUN mkdir -p /var/www

VOLUME /var/www

COPY ./www /var/www

RUN rm /etc/nginx/conf.d/default.conf

COPY ./config/01-default.conf /etc/nginx/conf.d/01-default.conf

RUN chown --recursive www-data:www-data /var/www/html
RUN chmod --recursive 755 /var/www/html

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
 
