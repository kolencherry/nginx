#
# Nginx Dockerfile
#
# https://github.com/dockerfile/nginx
#

# Pull base image.
FROM centos:centos6

RUN echo -e "[nginx]\nname=nginx repo\nbaseurl=http://nginx.org/packages/centos/6/x86_64/\ngpgcheck=0\nenabled=1" \
  > /etc/yum.repos.d/nginx.repo

# Install Nginx.
RUN \
  yum clean all && \
  yum update -y && \
  yum install nginx -y && \
  echo -e "\ndaemon off;" >> /etc/nginx/nginx.conf

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
