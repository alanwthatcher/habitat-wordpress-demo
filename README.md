# Habitat Wordpress Demo

THe purpose of this demo is to show the use of Habitat in a situation where a pipeline may already exist for building, storing, and deploying application artifiacts.  Aside from fetching the package dependencies during the build phase, this demo does not rely on the use of the Habitat Builder (public or private).

## Demo Flow

The packages used in this demo have been included in this repository:
 - MySql 5.7.17 - Database backend
 - Wordpress 4.9.9 - Old version of Wordpress to start demo
 - Wordpress 5.1 - New version of Wordpress for upgrade

In this scenario Wordpress represents an application that a customer has either developed or is using as COTS. 

1. The app will be deployed at the `old` version onto the target platform (Kubernetes in this example), and we will see that an upgrade is recommended.
2. In studio, we will start up the `new` version of the app, showing the consistent local development builds.
3. In order to mimic the upgrade we would see in production, we will bring up a new studio, starting the `currently deployed (old)` version of the app, and then replacing it with the `newly tested upgrade (new)`.
4. We will then test the `upgraded (new)` version in Docker.  This shows that the app is running the same outside of studio in a new platform.
5. Finally complete the process by upgrading the deployed version of the application, showing again that it is running the same on a third platform, and also that the upgrade process will be the same as seen in studio because of the single artifact deployment consistency.

Using Kubernetes deploytments allows for articulating benefit of the single Habitat Operator method to deploy our artifacts.

## Demo Setup
- Clone this repository (all further actions from root of this repo)
- Enter studio `hab studio enter`
- Build the three packages `sh scripts/studio/spinup.sh` - This process will take ~20 mins because of long MySql compilation times
- Optional: export artifacts to containers `hab pkg export docker results/<desired_artifact.hart>`

Exporting the artifacts to containers is optional, as they are available from Docker Hub under the `alanwthatcher` origin already. Exporting your own images will require modifying the `scripts/deploy/docker-compose.yml` and possibly the Kubernetes deployments also in `scripts/deploy`