FROM centos:7
LABEL maintainer="Vignesh <vignesh.murugan1312@gmail.com>"

# Install necessary packages: httpd, zip, unzip
RUN yum install -y httpd zip unzip

# Download and extract the website template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip \
    && cp -rvf photogenic/* . \
    && rm -rf photogenic photogenic.zip

# Set the command to run Apache HTTPD
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80 for the HTTP server
EXPOSE 80

