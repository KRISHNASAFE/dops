Before starting with this, I hope you have visited and once have go-through of all previous set-up ot tutorials or if you wish you can fork the repo and try at your end like hands-on lab. 

Here in this setup/example, we will be going into practical approach for rollback, update containerized application.

Diagram below shows deployment lifecycle. 
<img width="740" height="500" alt="image" src="https://garba.org/posts/2020/k8s-life-cycle/k8s-life-cycle-2.jpg" />

So my set up is pretty easy peasy which involves very basic simple multiplication application which I have used previously. 
Let's run,
```
kubectl get pods -A
```
After running this, will get insights into pods running on our node.  
<img width="740" height="204" alt="image" src="https://github.com/user-attachments/assets/e4b16edb-e771-4d87-9ef8-8ecd37ce4a6a" />

Now will check application our application. 
<img width="747" height="360" alt="image" src="https://github.com/user-attachments/assets/4cd4706f-44db-4e2d-a4b4-ec89c55d557e" />

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
Now upload this image to your docker hub account and then will move again k8s. 

After uploading new image, will change our deployment file with latest image as below: 

<img width="432" height="217" alt="image" src="https://github.com/user-attachments/assets/e144102b-f4d1-4dcb-9fb9-42e6e6993e49" />

Here, I have highlighted and ask to use latest v4 image. 

```
kubectl apply -f $deployment_file_name
```
Change your file name and run command.
Then run 
```
kubectl get pods -A
```
I have tried to capture container creating process or lifecycle as below: 

<img width="773" height="620" alt="image" src="https://github.com/user-attachments/assets/10d16f15-8c2b-4c1e-94cf-4e49ca619cbd" />

Here we can see old pods are getting terminated and for new pods it is creating container and as I have specified 2 pods of static-web-app with new image are in running state also we can see container state.............

Once pods are running with new image check the application running and confirm whether updated changes can be seen or not. 

<img width="702" height="355" alt="image" src="https://github.com/user-attachments/assets/a791be1f-f9ff-40bc-b429-3182d9b5030d" />

yuhuuu ! hurray !
Congrats, new updated image has pulled and changes can be seen in application. 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
# How to rollback......?
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
First of all why rollback is needed ?
Let's assume that we deploy our application new version which is having newly added features, UI and some other changes. But after deploying the app to PRODUCTION system some how it started creating various issues which are faced by end user or people who use the application or client. Having such application which is giving issues which are creating major impact hampering maybe even basic functionality incur in huge loss to client, company. 
Hence we want to make the system stable again maybe with some old version for time being so that we can again thoroughly test the new updated changes on lower systems and then deploy which enhances user experience along with existing functionality not getting tampered.

Kubernetes gives us flexibility to do that using CLI also or if companies are using argo CD then they can deploy previous stable version using argo CD web interface or CLI....
We focus on simple thing to understand concept. Run below command.
```
kubectl rollout history deployment $name_of_app
```
If single service is running then just it's fine with 
```
kubectl rollout history deployment
````

On running this command, it gives history about all deployments for the application as follows(involves 2 columns as Revision & Change-Cause)
Below provided are my deployments. 

<img width="701" height="169" alt="image" src="https://github.com/user-attachments/assets/35b4a3c8-d36c-42c8-bd10-39cd3889e603" />

So **5th** Revision is my latest version with updated image. 
Now I have to roll back to previous version that is Revision 4. 

I will be using below command.
```
kubectl rollout undo deployment/static-web-app
```

Here my deployment is static-web-app so using it, you should change as per your naming conventions.

<img width="584" height="208" alt="image" src="https://github.com/user-attachments/assets/3e5c212d-df5c-409f-a701-b24fa7959801" />

SO in above pic previous release was revision 4 and current release is number 5. So on executing above command previous release number 4 becomes latest release removing 4 and adding number of latest release 6. 
Let's test the application whether it is moved to old version or not.

<img width="738" height="432" alt="image" src="https://github.com/user-attachments/assets/1f9c8766-5bd9-4db0-92bd-60695ee088fb" />

So yes old application deployment has been deployed and currently running. 































































