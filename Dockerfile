FROM ubuntu

# Copy the necessary files
COPY bash/ /root/

RUN apt-get update && \
    apt-get install -y man && \
    apt-get install --only-upgrade bash && \
    apt-get install -y nodejs && \
    apt-get install -y npm && \
    apt-get install -y git && \
    apt-get install -y dos2unix && \
    apt-get install -y nano

WORKDIR /home/

RUN dos2unix /root/.bashrc /root/.bash_profile /root/.bash_aliases /root/.git_aliases

RUN git clone https://github.com/RynoFourieZA/comegetcred.git

WORKDIR /home/comegetcred

RUN npm install

# Expose the desired port for the React app
EXPOSE 3000

# Set the command to run the React app
CMD ["npm", "start"]