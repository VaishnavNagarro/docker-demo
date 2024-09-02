# Steps to run the application

1. Installed docker using wsl ubuntu in windows application.
2. Created a simple Spring boot Application and opened terminal.
3. selected Ubuntu-22.04 terminal
4. cd /mnt to access windows drives and files.
5. Created a docker file with base image with jdk 11 and run the java jar file on 8080.
6. Created a docker-compose.yml file to just run multi container using single file but in my project there is only 1 container so it is not best use of it.
7. to run the spring application first build the maven project using mvn clean install and it will create jar file of the project in target directory and then just need to run command - docker compose up
8. to stop the container - docker compose stop
9. To push the image followed these steps - docker build -t docker-demo . to build the docker demo project in current directory
10. then tagged it using - docker tag docker-demo vaishno10796/docker-demo:latest
11. then pushed the image in my docker hub account - docker push vaishno10796/docker-demo:latest