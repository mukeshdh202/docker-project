# Use the CentOS 7 base image
FROM centos:7

# Set environment variable to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install required packages
RUN yum -y update && \
    yum -y install httpd curl

# Copy the index.html file to the Apache document root directory
COPY index.html /var/www/html/index.html

# Set the working directory to the Apache document root
WORKDIR /var/www/html

# Start Apache HTTP Server when the container starts
ENTRYPOINT ["/usr/sbin/httpd"]

# Set Apache to run in the foreground
CMD ["-D", "FOREGROUND"]

# Expose port 80 for Apache to listen on
EXPOSE 80
