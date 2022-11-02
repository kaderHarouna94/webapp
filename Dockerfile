FROM ubuntu
LABEL kader (kaderharouna54@gmail.com)
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx git
EXPOSE 80
#ADD static-webpage-example/src/ /var/www/html/
RUN rm -rf /var/www/html/*
RUN git clone https://github.com/daviddias/static-webpage-example.git /var/www/html/
RUN cp -r /var/www/html/src/* /var/www/html/
RUN rm -rf /var/www/html/src/
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]