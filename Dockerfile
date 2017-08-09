FROM debian:jessie

#ENV FRAPPE_USER frappe

#VOLUME ["/var/lib/mysql", "/home/frappe/frappe-bench/sites/site1.local/"]
#COPY all.conf /etc/supervisor/conf.d/

COPY setup.sh /tmp
RUN bash /tmp/setup.sh

EXPOSE 80
CMD ["/usr/bin/supervisord","-n"]
