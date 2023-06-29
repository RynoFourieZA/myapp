# syntax=docker/dockerfile:1
FROM ubuntu

ENV WORK_PLACE=/home/comegetcred

# Update and install package
RUN apt-get update && \
    apt-get install --only-upgrade bash && \
    apt-get install -y nodejs && \
    apt-get install -y npm && \
    apt-get install -y git && \
    apt-get install -y dos2unix && \
    apt-get install -y nano

RUN sed -i 's,^path-exclude=/usr/share/man/,#path-exclude=/usr/share/man/,' /etc/dpkg/dpkg.cfg.d/excludes

RUN apt-get install -y man && \
    apt-get install -y manpages-posix

# Copy the necessary files
COPY bash/ /root/

WORKDIR /home/

RUN dos2unix /root/.bashrc /root/.bash_profile /root/.bash_aliases /root/.git_aliases

RUN git clone https://github.com/RynoFourieZA/comegetcred.git

RUN git config --global alias.credential-manager "credential-manager-core"

#Work Directory
WORKDIR $WORK_PLACE

# Install dependencies

RUN npm install

# Expose the desired port for the React app
EXPOSE 3000

# Set the command to run the React app
CMD ["npm", "start"]