# we need to add a line in our Dockerfile that tells Docker
# what base image we would like to use for our application.


# Docker images can be inherited from other images. Therefore, instead of creating our own base image, 
# we’ll use the official Node.js image that already has all the tools and packages that we need to run a Node.js application. 
# You can think of this in the same way you would think about class inheritance in object oriented programming. 
# For example, if we were able to create Docker images in JavaScript, we might write something like the following.
# class MyImage extends NodeBaseImage {}
# In the same way, when we use the FROM command, we tell Docker to include in our image all the functionality from the node:12.18.1 image.

FROM node:12.18.1

# The NODE_ENV environment variable specifies the environment in which an application is running (usually, development or production). 
# One of the simplest things you can do to improve performance is to set NODE_ENV to production.
ENV NODE_ENV=production

# To make things easier when running the rest of our commands, let’s create a working directory. 
# This instructs Docker to use this path as the default location for all subsequent commands. 
# This way we do not have to type out full file paths but can use relative paths based on the working directory.
WORKDIR /app


# we need to do is to add our source code into the image.
# The COPY command takes all the files located in the current directory and copies them into the image.
COPY . .

RUN npm ci
# Now, all we have to do is to tell Docker what command we want to run when our image is run inside of a container. 
# We do this with the CMD command.
CMD [ "node", "index.js" ]