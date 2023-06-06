**Shinto Framework** is an accelerator for DevOps teams for CDK-based pipelines. CICD Pipeline is the reference implementation for self-service AWS CodePipeline. Development teams submit a property file to the service to register a CDK pipeline. This will kick off the provisioning of the pipeline. In addition, pipelines will self-configure (mutate) based on different values and attributes set within a property file.

**Quality Gates** (Code Coverage) are verifications inside the CICD pipeline to prevent code from moving forward if it doesn't meet the specified quality criteria. Some examples are below:

- Finding what parts of code are covered by tests
- Finding what parts of code are not covered by tests
- Remove dead code.

> CDK CICD Pipeline supports following quality gates:
>> - Codacy  (https:www.codacy.com)
>> - Snyk (https://snyk.io/)

>>*Shinto Framework can easily be updated to support other vendor implementations like SonarQube, Shiftleft etc.*

**Containerize Applications** (No more writing dockerfiles)—build optimized docker images for applications without deep mastery of docker best-practices.
- Fast - Deploy changes quickly by separating applications into multiple layers, splitting dependencies from classes.
- Reproducible - Rebuilding a container image with the same contents always generates the same image. Never trigger an unnecessary update again.

> CDK CICD Pipeline supports following docker image building technologies: 
>> - Cloud Native Buildpacks (https://buildpacks.io/)
>> - Google JiB (https://cloud.google.com/java/getting-started/jib)

>>*Shinto Framework can easily be updated to support other vendor implementations*

**prerequisites**

https://github.com/mrwconsulting/shinto-samples/assets/82276384/1fe68a53-bdbb-4f47-97af-b775b682b2bc

