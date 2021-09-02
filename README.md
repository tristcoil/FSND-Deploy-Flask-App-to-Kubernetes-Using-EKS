# Deploying a Flask API

This is the project starter repo for the fourth course in the [Udacity Full Stack Nanodegree](https://www.udacity.com/course/full-stack-web-developer-nanodegree--nd004): Server Deployment, Containerization, and Testing.

In this project you will containerize and deploy a Flask API to a Kubernetes cluster using Docker, AWS EKS, CodePipeline, and CodeBuild.

The Flask app that will be used for this project consists of a simple API with three endpoints:

- `GET '/'`: This is a simple health check, which returns the response 'Healthy'.
- `POST '/auth'`: This takes a email and password as json arguments and returns a JWT based on a custom secret.
- `GET '/contents'`: This requires a valid JWT, and returns the un-encrpyted contents of that token.

The app relies on a secret set as the environment variable `JWT_SECRET` to produce a JWT. The built-in Flask server is adequate for local development, but not production, so you will be using the production-ready [Gunicorn](https://gunicorn.org/) server when deploying the app.

## Initial setup
1. Fork this project to your Github account.
2. Locally clone your forked version to begin working on the project.

## Dependencies

- Docker Engine
    - Installation instructions for all OSes can be found [here](https://docs.docker.com/install/).
    - For Mac users, if you have no previous Docker Toolbox installation, you can install Docker Desktop for Mac. If you already have a Docker Toolbox installation, please read [this](https://docs.docker.com/docker-for-mac/docker-toolbox/) before installing.
 - AWS Account
     - You can create an AWS account by signing up [here](https://aws.amazon.com/#).

## Project Steps

Completing the project involves several steps:

1. Write a Dockerfile for a simple Flask API
2. Build and test the container locally
3. Create an EKS cluster
4. Store a secret using AWS Parameter Store
5. Create a CodePipeline pipeline triggered by GitHub checkins
6. Create a CodeBuild stage which will build, test, and deploy your code

For more detail about each of these steps, see the project lesson [here](https://classroom.udacity.com/nanodegrees/nd004/parts/1d842ebf-5b10-4749-9e5e-ef28fe98f173/modules/ac13842f-c841-4c1a-b284-b47899f4613d/lessons/becb2dac-c108-4143-8f6c-11b30413e28d/concepts/092cdb35-28f7-4145-b6e6-6278b8dd7527).

## Sources
1.  https://docs.docker.com/engine/install/ubuntu/
2.  https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html
3.  https://eksctl.io/
4.  https://stackoverflow.com/questions/63313662/unable-to-create-aws-eks-cluster-with-eksctl
5.  https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
6.  https://stackoverflow.com/questions/44017410/signature-expired-is-now-earlier-than-error-invalidsignatureexception

reg. the docker throttling AWS issue:
7.  https://stackoverflow.com/questions/65806330/toomanyrequests-you-have-reached-your-pull-rate-limit-you-may-increase-the-lim
8.  https://knowledge.udacity.com/questions/662315
9.  https://www.docker.com/increase-rate-limit
10. https://cloudkatha.com/too-many-requests-you-reached-pull-rate-limit/
11. https://aws.amazon.com/premiumsupport/knowledge-center/codebuild-docker-pull-image-error/

 
## Issues
getting error while using code build from AWS

Step 1/6 : FROM python:stretch
toomanyrequests: You have reached your pull rate limit. You may increase the limit by authenticating and upgrading: https://www.docker.com/increase-rate-limit

----
