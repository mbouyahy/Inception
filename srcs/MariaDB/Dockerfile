FROM debian:latest

RUN apt update && \
	apt install -y mariadb-server && \
	apt install -y python3

#create a working dirictory
WORKDIR /app

#copy the script into the working directory
COPY ./script.py /app/script.py

EXPOSE 3306

#execute the script
CMD ["python3","./script.py"]