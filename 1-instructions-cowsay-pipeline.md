# Cowsay Pipeline
Today you will create a CI/CD pipeline for Cowsay.

## Tasks
1. (Dev) Development setup:
   1.1. Register/recieve a user on our course GitLab server.
   1.2. Create a new GitLab repository (name it `cowsay-<your_name>`) and upload the Cowsay sources to a new repository.

2. (DevOps) Write a Jenkins pipeline (name it `Cowsay - <your_name>`):
   2.1. Register/recieve a user on our course GitLab and Jenkins servers.
   2.2. Write a Jenkins pipeline that:
   2.2.1. Builds Cowsay image (this can also be done using the Jenkins plugin or with the local path's Docker that is available). Make sure to tag it also with your name (`cowsay-<your_name>:<docker_tag>`).
   2.2.2. Runs a local Cowsay container and executes a sanity test (`curl`).
   2.2.3. Publishes (pushes) to our private Docker image registry (details will be shared by instructor).
   2.2.4. Deploys on a static EC2 instance (for now, simply `scp` a bash script and call it with `ssh`).
            Note:
            - The static instance is one you have created beforehand, with a security group allowing access to Cowsay via its public IP.
   2.3. Automation of your pipeline - trigger a build of the job on each commit pushed to `main` branch.

3. Bonus:
   3.1. Write a Kubernetes deployment and service YAML manifest for Cowsay and add them to the repository.
   3.2. Upgrade your pipeline to deploy to your Kubernetes cluster instead of EC2.

## Tips
- Be mindful of your Docker image tags (`<image_repository>/<image_repo_name>:<tag_name>`), especially the *tag* component in your automation (latest vs. setting a version number).
