# syntax=docker/dockerfile:1
FROM ubuntu

ENV WORK_PLACE=/home/comegetcred

# Stop from blocking install of man pages 
RUN yes| unminimize
# Update package
RUN apt-get update 

# Install package
RUN apt-get install -y man 
RUN apt-get install -y manpages-posix
RUN apt-get install --only-upgrade bash 
RUN apt-get install -y nodejs 
RUN apt-get install -y git
RUN apt-get install -y dos2unix
RUN apt-get install -y nano
RUN apt-get install -y npm 



# Copy the necessary files
COPY bash/ /root/

WORKDIR /home/

RUN dos2unix /root/.bashrc /root/.bash_profile /root/.bash_aliases /root/.git_aliases

RUN git clone https://github.com/RynoFourieZA/comegetcred.git

#Work Directory
WORKDIR $WORK_PLACE

# Install dependencies

RUN npm install

# Expose the desired port for the React app
EXPOSE 3000

# Set the command to run the React app
CMD ["npm", "start"]