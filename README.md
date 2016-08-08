# dockerpack-apps

## Intro

DockerPack Apps are multi-container docker apps that make use of docker-compose for setup

Projects usually have a reverse-proxy/load-balancer (nginx) in front of either a cluster of backend servers (api) or frontend servers (webapp). Some projects may have a container for a database or cache (MySQL, Mongo, Redis, ...).

Code for the frontend or backend servers is cloned down from a Github project. Usually dockerpack-be-xxxx or dockerpack-fe-xxxx.

## Usage

In each project folder there is a init script that builds either a development or production version of the project.

$ ./init dev
$ ./init prod

From a web browser:
	FrontEnd Projects
		Development: http://localhost:3000
		Production: http://localhost

	BackEnd Projects
		Development: http://localhost:4000
		Production: http://localhost



Be aware, the init script removes all docker containers and images running or otherwise.

## Notes

The development build treats the source code folder as a mounted host volume and reloads the server whenever a change is detected in the folder.
