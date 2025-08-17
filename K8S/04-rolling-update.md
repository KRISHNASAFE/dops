Before starting with this, I hope you have visited and once have go-through of all previous set-up ot tutorials or if you wish you can fork the repo and try at your end like hands-on lab. 

Here in this setup/example, we will be going into practical approach for rollback, update containerized application.
So my set up is pretty easy peasy which involves very basic simple multiplication application which I have used previously. 
Let's run,
```
kubectl get pods -A
```
After running this, will get insights into pods running on our node.  
<img width="740" height="204" alt="image" src="https://github.com/user-attachments/assets/e4b16edb-e771-4d87-9ef8-8ecd37ce4a6a" />

Now will check application our application. 
![Uploading image.png…]()

This is currently running version of our application.
Now I will change or update some content in file and regenerate new Dockerfile so that will get new image with changes. 
The current image is v3 of application, after generating new image will tag it as v4 for sake of our understanding or undoing changes with previous stable version.
So just go to your application folder, change any file like html or css as per your need and save the file. 
I am changing html file and writing one simple sentence as: 
```
<h4> This is updated version of game </h4>
```
Save the file, and run 
```
docker build -t multi:v4
```
This will build image, you can see what docker does when you run this command using instructions written in your **Dockerfile** on screen .
```
docker images
```
<img width="638" height="159" alt="image" src="https://github.com/user-attachments/assets/3f21ab93-4a9a-4a07-9772-efb0d349e407" />
This will list our latest image with tag v4.

















