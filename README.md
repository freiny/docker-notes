# dockerpack-apps

## Intro

DockerPack Apps are multi-container docker projects that make use of docker-compose for setup.

Projects usually have a reverse-proxy/load-balancer (nginx) in front of either a cluster of backend servers (api) or frontend servers (webapp). Some projects may have a container for a database or cache (MySQL, Mongo, Redis, ...).

Code for the frontend or backend servers is cloned down from a Github project. Usually dockerpack-be-xxxx or dockerpack-fe-xxxx.

## Usage

In each project folder there is an init script that builds either a development or production version of the project.

There is also a clean script that deletes the project's images, containers, and cloned-down repos.

### Setup
From the project path:

	For Clean-up:

		$ ./clean

	For Setup:

		$ ./init dev

		$ ./init prod

### From a web browser:

	FrontEnd Projects

		Development: http://localhost:3000
		Production: http://localhost

	BackEnd Projects

		Development: http://localhost:4000
		Production: http://localhost




## Notes

The development build treats the source code folder as a mounted host volume and reloads the server whenever a change is detected in the folder.
