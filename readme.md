# README File for GitHub Actions Workflow

This workflow is designed to build a Maven project, push a Docker image to Docker Hub, and deploy the application. The workflow consists of two jobs: "build" and "deploy".

# Job: Build

The "build" job performs the following tasks:

    Check out the source code from GitHub repository
    Set up Java Development Kit (JDK) 8
    Bump the version of the jar file
    Build a Docker image and run tests
    Login to Docker Hub
    Push the Docker image to Docker Hub
    Push the updated version of the jar file to the GitHub repository

# Job: Deploy

The "deploy" job performs the following tasks:

    Login to Docker Hub
    Run the Docker image

# Requirements

Before using this workflow, make sure you have the following:

    A GitHub repository with the Maven project and pom.xml file
    Docker Hub account with a repository to push the Docker image
    The following secrets set in your GitHub repository:
        GITHUB_TOKEN
        DOCKERHUB_USERNAME
        DOCKERHUB_PASSWD
        EMAIL_GITHUB
        USERNAME_GITHUB

# How to Use

    Create a new branch in your GitHub repository
    Copy the code from this README file into the main.yml file in the .github/workflows folder in your repository
    Replace the values for the Docker repository name and Docker image name with your own
    Commit the changes and push the branch to GitHub
    Open a pull request to merge the branch into the master branch
    The workflow will start automatically when the pull request is opened or when changes are pushed to the master branch.
