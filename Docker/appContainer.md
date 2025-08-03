In last tutorial we see how to install docker and create container, run hello-world. 
Here we are creating a simple Dockerfile. 
What is Dockerfile ?
A Dockerfile is a text document in which you can lay down all the instructions that you want for an image to be created.
In provided link ( https://docs.docker.com/reference/dockerfile/ ) we can find references to write dockerfile. 

Step 1: -
Create a directory of your choice & cd into it.
Create Dockerfile, I have a simple multiplication app with below files: -
multiplication-app.html
multiplication-app.css
multiplication-app.js
I will also upload this files for reference.
My dockerfile for this simple app: -
# Image that we will be using, nginx:alpine image is light weight so using it.
FROM nginx:alpine
# Created another directory and added the required app files in it.
# using below instruction we are adding those files from machine directory to a loation/directory inside container.
ADD multi-app/ /usr/nginx/share/html
# Mentioning port to expose port so application can be accessed. 
EXPOSE 80

Step 2: -
Now will build image from Dockerfile.
Go to directory where dockerfile is created and run.
docker build -t multi:v2 .
This command is buidning image from dockerfile present current directory hence we mentioned ( . ) at end.
Also -t gives tag to your image so that we can have history and version information about image. 

Step 3: -
After image building is done, it's time to create and run container. 
docker run -d -p 8080:80 multi:v2
-d : run conatiner in detached mode.
-p : port to run container
multi:v2 : image name
8080:80 : maps port 8080 of host to container

Step 4: -
For now when hit on port 8080 from machine nginx std page is displayed, we have not copied our conf file at specified location. 
So either we can create our conf file even before creating container so that application can be served or we can manually change entry.
Like after doing docker exec -it $container_id /bin.sh, we will go to /etc/nginx/conf.d/*.conf file.
Then will change index value to our html file. Reload file & check now application is served on port 8080 from machine.

Thank you so much, Any suggestions/improvements are always welcome !!!
In this way we can conainerize any language application very simply.
































