# Building and starting containers
## First time
0. Create a directory where you will store all project-related repositories (including this one), e.g. `microfood`
0. Clone all repositories to this folder

**The file structure is important since build script relies on relative paths** 
## Prerequisites
0. Maven
0. Docker

##  Building and running images
0. Run `./build-all-images.sh`, this will build java packages and docker images
0. Run `./start.sh` this will start all services specified in `microfood-compose.yml`

# Adding new service
0. Create you repository with microservice
0. Create Dockerfile in the repository in the same directory as your pom.xml file
0. Add (SERVICE_NAME)_HOST variable to `.env` file. 
0. Add your service to `microfood-compose.yml` file.
0. Add your service to `build-all-images.yml` by adding `image-name:service-relative-path` to `dockerfiles` variable

# Additional information
Since we need services to be able to communicate with each other in docker containers we use a common network for them. This is done by declaring a 
`microfood-network` in `microfood-compose.yml` and then we add this network to all services. We also expose ports for each service, so we can reach them from 
our local machines, e.g. by curl or from Postman. 

Also since we use Eureka for service discovery we need to tell which hostname will be used so that it can be automatically resolved to ip addresses inside 
docker containers (see `hostname` in `microfood-compose.yml` ). This is done by providing variables such as `EUREKA_HOST`, `GATEWAY_HOST`, `ORDERS_HOST` etc. 
These are environment variables which will be passed to Spring applications, for example see `application.yml` in respective services to see how it's used.   