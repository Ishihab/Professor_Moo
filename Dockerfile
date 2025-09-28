FROM httpd:alpine
RUN apk add fortune mysql-client
COPY httpd.conf /usr/local/apache2/conf/httpd.conf
COPY professormoo.conf /usr/local/apache2/conf/extra/professormoo.conf
COPY script/ /usr/local/apache2/cgi-bin/
RUN chmod 755 /usr/local/apache2/cgi-bin/*.sh
COPY htdocs/ /usr/local/apache2/htdocs/
EXPOSE 80
CMD ["httpd-foreground"]
