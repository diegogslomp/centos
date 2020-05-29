FROM centos:8

RUN yum -y update; yum clean all
RUN yum -y install openssh-server passwd; yum clean all

ENV USER=root 
ENV PASSWORD=newpass

RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 
# For no root user uncomment
# RUN useradd "$USER"
RUN echo -e "$PASSWORD\n$PASSWORD" | (passwd --stdin "$USER")
# "Fix" System is booting up ssh error 
RUN rm -rf /run/nologin
CMD /usr/sbin/sshd -D
EXPOSE 22
