
# BurgerOrder

## Authors
- [@r4andom1](https://github.com/r4andom1)
- [@Jesper-R](https://github.com/Jesper-R)
- [@anrn24](https://github.com/anrn24)
- [@Maugust04](https://github.com/Maugust04)

## About
BurgerOrder is a system that allows users to order different items and modify their order through different webpages. 

The purpose of the project is for the team members to experience collaborating together with extensive use of several modern software engineering tools. 

## Tools used
To isolate the different systems in the project we put every system inside its own container using docker. That allows us to use docker-compose for a simple start up for the entire system.
We primarily used Python and the Flask framework to allow connection to different routes. 

For the database we used PostgreSQL and connected it to our server using Psycopg2. To allow easy collaboration for everyone in the project we used Git & Github and split up the different systems into their own branches as to not interfere with other files while adding new features.
We also put in automatic tests for checking that the correct values can be extracted when running the program.

## Run Project
To run the project, make sure you have docker installed.
Run the following commands in your terminal:

__Start project:__ docker-compose up --build

__Delete docker containers:__ docker-compose down

__Run tests:__ docker-compose run test
