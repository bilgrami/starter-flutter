## Docker based Flutter Web Project 

This repo contains a docker based flutter web project. 

## to build your container for the flutter web project 
```bash
./build-docker.sh
```

## to run your container running the flutter web project 
```bash
./run.sh
```

then go to localhost:8080 to visit your website.

## to stop/remove the container, and run your flutter web project 
Just add 1 as parameter

```bash
./run.sh 1
```

then go to localhost:8080 to visit your website.


## to stop/remove your container running the flutter web project 
```bash
./stop.sh
```

## screenshot
![Screenshot](./docs/Screenshot%202023-02-22%20at%202.15.51%20AM.png)

---

# Troubleshooting 

## platform (linux/arm64/v8) does not match the detected host platform (linux/amd64)
If you build this image on M1 Mac, and then someone uses it on Intel, they get below warning 

```
WARNING: The requested image's platform (linux/arm64/v8) does not match the detected host platform (linux/amd64) and no specific platform was requested
```

Please visit this link to get guidance on how to rebuild this image on your m1 mac

https://stackoverflow.com/questions/66662820/m1-docker-preview-and-keycloak-images-platform-linux-amd64-does-not-match-th

---
