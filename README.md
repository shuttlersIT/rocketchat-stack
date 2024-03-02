# Rocket.Chat

Rocket.Chat is a Web Chat Server, developed in JavaScript, using the Meteor fullstack framework.

It is a great solution for communities and companies wanting to privately host their own chat service or for developers looking forward to build and evolve their own chat platforms.

%%LOGO%%

# How to use this image
### Docker Compose
If you need both the mongo and Rocket.Chat containers, use a docker compose one-liner:

    docker-compose up -d

Which will run both containers, with Rocket.Chat listening on http://localhost:3000
Then, access it via `http://localhost:3000` in a browser.  Replace `localhost` in `ROOT_URL` with your own domain name if you are hosting at your own domain.

Stop the containers with:

    docker compose down

### Individual containers
First, start an instance of mongo:

    docker run --name db -d mongo:4.0 mongod --smallfiles

Then start Rocket.Chat linked to this mongo instance:

    docker run --name rocketchat --link db:db -d rocket.chat

This will start a Rocket.Chat instance listening on the default Meteor port of 3000 on the container.

If you'd like to be able to access the instance directly at standard port on the host machine:

    docker run --name rocketchat -p 3000:3000 --env ROOT_URL=http://localhost:3000 --link db:db -d rocket.chat

Then, access it via `http://localhost:3000` in a browser.  Replace `localhost` in `ROOT_URL` with your own domain name if you are hosting at your own domain.

If you're using a third party Mongo provider, or working with Kubernetes, you need to override the `MONGO_URL` environment variable:

    docker run --name rocketchat -p 3000:3000 --env ROOT_URL= `http://localhost:3000` --env MONGO_URL= `mongodb://mongodb:27017/rocketchat -d rocket.chat`



MONITORING:
Docker Container Monitoring with cAdvisor, Prometheus, and Grafana using Docker Compose
Command to run docker-compose.yml

$ docker compose up
You can access cAdvisor on http://localhost:8084, Prometheus on http://localhost:9090, and Grafana on http://localhost:3002.