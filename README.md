**Shinto Framework** is an accelerator for DevOps teams for CDK-based pipelines. CICD Pipeline is the reference implementation for self-service AWS CodePipeline. Development teams submit a property file to the service to register a CDK pipeline. This will kick off the provisioning of the pipeline. In addition, pipelines will self-configure (mutate) based on different values and attributes set within a property file.

![shinto](https://github.com/mrwconsulting/shinto-samples/assets/82276384/33411ce7-dd07-47d3-8bd9-ddf853862595)

**Quality Gates** (Code Coverage) are verifications inside the CICD pipeline to prevent code from moving forward if it doesn't meet the specified quality criteria. Some examples are below:

- Finding what parts of code are covered by tests
- Finding what parts of code are not covered by tests
- Remove dead code.

> CDK CICD Pipeline supports following quality gates:
>> - [Codacy](https:www.codacy.com)
>> - [Snyk](https://snyk.io/)

>>*Shinto Framework can easily be updated to support other vendor implementations like SonarQube, Shiftleft etc.*

https://github.com/mrwconsulting/shinto-samples/assets/82276384/3a0ae7df-7b55-42a7-b122-317de7cc3615

https://github.com/mrwconsulting/shinto-samples/assets/82276384/4f3ab0dc-a2b1-463f-9f56-955f3f5696fb

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

