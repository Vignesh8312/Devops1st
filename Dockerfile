FROM ubuntu:20.04
LABEL maintainer="Vignesh <vignesh.murugan1312@gmail.com>"

# Install apache2, zip, and unzip
RUN apt-get update && apt-get install -y apache2 zip unzip

# Add and extract website template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
RUN unzip /var/www/html/photogenic.zip -d /var/www/html/ && rm /var/www/html/photogenic.zip

# Start apache2 in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80