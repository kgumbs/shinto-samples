**Shinto Framework** is an accelerator for DevOps teams for CDK-based pipelines. CICD Pipeline is the reference implementation for self-service AWS CodePipeline. Development teams submit a property file to the service to register a CDK pipeline. This will kick off the provisioning of the pipeline. In addition, pipelines will self-configure (mutate) based on different values and attributes set within a property file.

![shinto](https://github.com/mrwconsulting/shinto-samples/assets/82276384/5e88c6b9-8708-4d0c-a22e-eb63d703a697)

**Quality Gates** (Code Coverage) are verifications inside the CICD pipeline to prevent code from moving forward if it doesn't meet the specified quality criteria. Some examples are below:

- Finding what parts of code are covered by tests
- Finding what parts of code are not covered by tests
- Remove dead code.

> CDK CICD Pipeline supports following quality gates:
>> - [Codacy](https:www.codacy.com)
>> - [Snyk](https://snyk.io/)

>>*Shinto Framework can easily be updated to support other vendor implementations like SonarQube, Shiftleft etc.*

https://github.com/mrwconsulting/shinto-samples/assets/82276384/f69c277b-e9d5-4c69-8bf8-d382e69755c1

https://github.com/mrwconsulting/shinto-samples/assets/82276384/546f5425-e76a-4532-91b9-6f6d5e7a71a3

**Containerize Applications** (no more writing dockerfiles)—build optimized docker images for applications without deep mastery of docker best-practices.
- Fast - Deploy changes quickly by separating applications into multiple layers, splitting dependencies from classes.
- Reproducible - Rebuilding a container image with the same contents always generates the same image. Never trigger an unnecessary update again.

> CDK CICD Pipeline supports following docker image building technologies: 
>> - [Cloud Native Buildpacks](https://buildpacks.io/)
>> - [Google JiB](https://cloud.google.com/java/getting-started/jib)

>>*Shinto Framework can easily be updated to support other vendor implementations*

**Prerequisites**
> - [AWS CLI Version 2.11.6 or greater](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
> - [Node.js Version 18.16 or greater](https://nodejs.org/en/download)
> - [Docker Version 24.0.2 or greater](https://docs.docker.com/engine/install/)
> - [AWS CDK Version 2.81.0 or greater](https://aws.amazon.com/getting-started/guides/setup-cdk/module-two/)
> - Shinto Access Token (email: mark@mrwconsulting)

https://github.com/mrwconsulting/shinto-samples/assets/82276384/e28a80f7-a7ad-4dcf-ade1-b2edc47ed68c

**Install Steps**
1. Request Shinto access token (email: mark@mrwconsulting.tech)
2. Update npmrc file with access token
>> <img width="521" alt="Screenshot 2023-06-06 at 2 55 41 PM" src="https://github.com/mrwconsulting/shinto-samples/assets/82276384/bd628b4d-1c24-4d6a-a9ed-3484310ea8c1">

4. Install Shinto Manager (npm install @mrwconsulting/shinto-manager --global)
5. Create git repository for samples
