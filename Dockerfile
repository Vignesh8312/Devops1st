FROM ubuntu:20.04
LABEL maintainer="Vignesh <vignesh.murugan1312@gmail.com>"

# Install necessary packages: apache2 (HTTP server), zip, and unzip
RUN apt-get update && \
    apt-get install -y apache2 zip unzip && \
    apt-get clean

# Download and extract the website template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Start apache2 service in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]

# Expose port 80 for the HTTP server
EXPOSE 80


