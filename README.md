# CKA Practice Environment Next Gen!

Based on the original repo [arush-sal/cka-practice-environment](https://github.com/arush-sal/cka-practice-environment) 
and integrating modification from [satomic/cka-practice-environment](https://github.com/satomic/cka-practice-environment) 
but with enough changes to warrant a name change (in my mind):

  * Using [ttyd](https://github.com/tsl0922/ttyd) for the web terminal emulator.  Need a well maintained version.
  * Able to easily run local or in the cloud, with no dependency on docker-compose. (using Kustomize)
  * Map questions to the latest CKA exam ([V1.17 curriculum](https://github.com/cncf/curriculum/blob/master/CKA_Curriculum_V1.17.pdf), released Feb 4th, 2020)

Target is to support deployment on either a local Kubernetes environment, or on a cloud provider of some sort

![avatar](/images/cka-exam.png)

## Deploying the Tutorial

Below are detailed instructions for several cloud providers.  The tutorial is designed to be deployed on any Kubernetes system - although 
some questions/examples may not directly correspond, depending on the exact environment.

### Local Environment (kind)

### Cloud - GKE

### Cloud - Civo (hosted k3s)
