# setting Ubuntu
FROM ubuntu
LABEL maintainer=danielfs

# inside ubuntu docker doesn't need sudo
RUN apt-get update

# install java and python
RUN apt-get install -y default-jdk python

# install 72c
RUN wget https://github.com/influunt/influunt/releases/download/1.0.9/72c_linux_1_9.deb
#COPY 72c_linux_1.8.deb .
RUN dpkg -i 72c_linux_1.9.deb

# open a serial port
COPY openserial.py /root/
RUN chmod 755 /root/openserial.py

# changing 72c application.conf mqtt{host, port} & serial{porta}
COPY application.conf /opt/72c/conf/


# running 72c automatic

#with CMD
#CMD ["./root/openserial.py", "&",  "/etc/init.d/72c", "run"]
#CMD ["/bin/bash", "./root/openserial.py", "&",  "/etc/init.d/72c", "run"]
#CMD ["/bin/bash", "-c", "./root/openserial.py", "&",  "/etc/init.d/72c", "run"]
#CMD ["/bin/bash", "-c", "./root/openserial.py & /etc/init.d/72c run"]
CMD ["./root/openserial.py & /etc/init.d/72c run"]

#with ENTRYPOINT
#ENTRYPOINT ["./root/openserial.py", "&",  "/etc/init.d/72c", "run"]
#ENTRYPOINT ["/bin/bash", "./root/openserial.py", "&",  "/etc/init.d/72c", "run"]
#ENTRYPOINT ["/bin/bash", "-c", "./root/openserial.py", "&",  "/etc/init.d/72c", "run"]
ENTRYPOINT ["/bin/bash", "-c"]

#with SCRIPT
#COPY 72cscript.sh .
#RUN chmod 755 72cscript.sh
#CMD ["./72cscript.sh"]
#ENTRYPOINT ["./72cscript.sh"]
