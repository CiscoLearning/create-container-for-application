######################################################################################################
######################################################################################################
# This application was developed with Python 3.10. The container uses python:3.10.0-slim-bullseye.   #
# Base Image is taken from the docker.io registry.                                                   #
# This dockerfile is intended for educational purposes and is licensed under the MIT License         #
######################################################################################################

# FROM defines the base image to start with. 
FROM python:3.10-slim-bullseye

# LABEL is used to add metadata to the container. These are added as key/vaule pairs.
# The values in the LABELS can be displayed in the 'docker inspect' output. To make the labels easier
# to find use --format='{{json .Config.Labels}}' at the end of the 'docker inspect' command.
# e.g. docker image inspect --format='{{json .Config.Labels}}' image_name
LABEL author="Barry Weiss - barweiss@cisco.com"
LABEL version="1.0"
LABEL description="The Tao of Ron Swanson - A simple Python Flask Demo that does something\
                   better than 'Hello World'. The application uses a 'Ron Swanson Quotes'\
                   API to display random Ron Swanson quotes."

# COPY all files in the current directory ('.') to a directory named /app in the container.
COPY . /app

# The WORKDIR command configures the working directory. 
# All proceeding commands in the dockerfile will run this directory.
WORKDIR /app

# Run tells docker to execute a command. Here docker will run 'pip install -r requirements.txt'
# This command will download & install all dependencies identified in the 'requirements.txt' file.
RUN pip install -r requirements.txt

# Since the application is set to run on TCP port 5000 by default, EXPOSE opens communication
# on this port. If you change the listening port of the app, you will change it here too.
EXPOSE 5000/tcp

# CMD defines the default commands which run when the container is started.
# The is not the same as RUN, which is only used for the build process. The default commands can
# be overwritten when the container is started. If you do not want the default commands to be 
# overwritten then you can use the ENTRYPOINT command.
CMD python /app/main.py

# To build the docker container: 
# NOTE: DO NOT FORGET THERE IS A '.' AT THE END OF THE COMMAND BELOW!
# docker build -t ciscolearning/tutorial-create-container-for-application:1.0 .
#
# To run the container for first time:
# docker run -dit -p 5000:5000 --name tutorial_docker ciscolearning/tutorial-create-container-for-application:1.0
