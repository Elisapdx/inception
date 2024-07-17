FROM debian:bullseye

RUN apt-get update 
RUN apt-get upgrade
RUN apt-get install -y nginx openssl
# dossier pour stocker le certificat et la cle
RUN mkdir /etc/nginx/ssl

# generation du certificat tsl/ssl avec: "-x509" pour le type de certificat, "-nodes" pour eviter de lui donner un mdp, "-out" et "-keyout" pour indiquer a openssl où l'on stock et avec "-subj" on prerempli certaines informations
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/inception.crt \
       -keyout /etc/nginx/ssl/inception.key \
       -subj "/C=FR/ST=PACA/L=NICE/O=42 School/OU=epraduro/CN=epraduro/"

# le fichier de conf de nginx est remplace par le notre au demarrage du container
COPY conf/nginx.conf /etc/nginx/nginx.conf

# RUN mkdir -p /run/nginx

# notre root principal et l'utilisateur principal
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

RUN mkdir /usr/share/nginx/logs/
RUN touch /usr/share/nginx/logs/error.log

# lancement d'nginx
CMD ["nginx", "-g", "daemon off;"]