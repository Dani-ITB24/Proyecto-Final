# Walkthrough

## Recognition 

``We start doing an nmap to discover the ports that are open. We see that it has 3 ports, ftp, ssh, http. And we see that the versions of the services are up to date and are not vulnerable.``

![](/Assets/walkthrough/2024-03-07_18-19.png)

``We access the website, to see if it has anything interesting.``

![](/Assets/walkthrough/2024-03-07_18-21.png)

``As we did not find anything we are going to fuzzing to discover hidden subdirectories.``

![](/Assets/walkthrough/2024-03-07_18-26.png)

``We find a robots.txt and a folder where the css styles are stored.``

![](/Assets/walkthrough/2024-03-07_18-26_1.png)

![](/Assets/walkthrough/2024-03-07_18-27.png)

``Let's take a look at the css styles in case they have something interesting.``

![](/Assets/walkthrough/2024-03-07_18-28.png)

``We found the path to a possible file, so let's look for it.``

![](/Assets/walkthrough/2024-03-07_18-28_1.png)

``A file containing the following is downloaded:``

![](/Assets/walkthrough/2024-03-07_18-30.png)

![](/Assets/walkthrough/2024-03-07_18-34.png)

``If we download the photo and check if it has hidden content we find this:``

![](/Assets/walkthrough/2024-03-07_18-41.png)

![](/Assets/walkthrough/2024-03-07_18-42.png)

``We got a zip.zip file but it has a password, so we are going to crack it with the jhon tool.``

![](/Assets/walkthrough/2024-03-07_18-46.png)

``Inside the zip we find a file that gives us a possible path, and so we access to it we find a login panel for a control panel.``

![](/Assets/walkthrough/2024-03-07_18-48.png)

![](/Assets/walkthrough/2024-03-07_18-48_1.png)

``After investigating the control panel we find that we can't do anything, and we can't force-route because it is blocked.``

![](/Assets/login.jpg)

``So we are going to try to breach another service:``

![](/Assets/walkthrough/2024-03-07_18-56.png)

``We can access the ftp server with the user anonymous, and in it we find a file with the control panel credentials.``

![](/Assets/walkthrough/image.png)

![](/Assets/walkthrough/2024-04-03_17-12.png)

![](/Assets/walkthrough/2024-03-07_18-58.png)

``Once in the panel we navigate through the page and find several interesting things, such as a list of users and also a series of actions to perform on the server.``

![](/Assets/walkthrough/2024-03-07_18-58_1.png)

![](/Assets/walkthrough/2024-03-08_17-33.png)

![](/Assets/walkthrough/2024-03-08_17-33_1.png)

``All shares are protected with a password, except one:``

![](/Assets/walkthrough/2024-03-08_17-34.png)

![](/Assets/walkthrough/2024-03-08_17-34_1.png)

``We accept the request with BurpSuite and we see that there is a command parameter which has a linux terminal command, so let's try to enter there.``

![](/Assets/walkthrough/2024-03-08_17-36.png)

``It works!``

![](/Assets/walkthrough/2024-03-08_17-37.png)


![](/Assets/walkthrough/2024-03-08_17-39.png)

## Exploitation
``After trying to get the reverse shell in different ways nothing works, so let's try to upload a php file with a reverse shell.``

---

![](/Assets/walkthrough/2024-03-08_17-43.png)

![](/Assets/walkthrough/2024-03-08_17-43_1.png)

![](/Assets/walkthrough/2024-03-08_17-44.png)

``We already have the file ready, so we create a web server with python and try to copy the arcfile.``

![](/Assets/walkthrough/2024-03-08_17-51.png)

![](/Assets/walkthrough/2024-03-08_17-51_1.png)

``We see that using wget the server does not receive any request, so let's try another way.``

![](/Assets/walkthrough/2024-03-08_17-51_2.png)

![](/Assets/walkthrough/2024-03-08_17-52.png)

``By doing it with curl we do have the request, so let's put the attacker on listen and access the malicious file.``

![](/Assets/walkthrough/2024-03-08_17-53.png)

![](/Assets/walkthrough/2024-03-08_17-54.png)

![](/Assets/walkthrough/2024-03-08_17-54_1.png)

``We are already inside.``


![](/Assets/walkthrough/2024-03-08_17-55.png)

## Post exploitation

``We log in as the user www-data, so let's look for any binaries with suid, and they all look normal except for one that if we run it we see the following:``

![](/Assets/walkthrough/2024-03-08_18-02.png)

![](/Assets/walkthrough/2024-03-08_18-06.png)

``If we copy the haxadecimal string 20 and decrypt it we get what looks like a password.``

![](/Assets/walkthrough/2024-03-08_18-18.png)

![](/Assets/walkthrough/2024-03-08_18-22.png)

``We try the password and log in as bumblebee.``

![](/Assets/walkthrough/2024-03-08_18-23_1.png)

``Once we are inside bumblebee, we look to see if we can find anything.``

![](/Assets/walkthrough/2024-03-11_16-37.png)

``We found the private SSH key.``

![](/Assets/walkthrough/2024-03-11_16-38.png)

``Copy the key into a text document.``

![](/Assets/walkthrough/2024-03-11_16-41.png)

![](/Assets/walkthrough/2024-03-11_16-42.png)

``We use john to decrypt the SSH key.``

![](/Assets/walkthrough/2024-03-11_16-46.png)

``Using the newly found password, we access the Mayan user account via SSh.``

![](/Assets/walkthrough/2024-03-11_16-47.png)

``Once in Maya we search.``

![](/Assets/walkthrough/2024-03-11_17-09.png)

![](/Assets/walkthrough/2024-03-11_17-09_1.png)

``After some searching we find a SUID of wget and we use it to escalate privileges. Once we are root we get the last flag.``

![](/Assets/walkthrough/2024-03-11_17-10.png)
