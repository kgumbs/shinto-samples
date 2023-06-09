import { Construct } from 'constructs';
import { App, Chart } from 'cdk8s';

import { KubeDeployment, KubeService, IntOrString } from './imports/k8s';

export class CDK8SChart extends Chart {
  constructor(scope: Construct, id: string) {
    super(scope, id);

    const label = { app: 'cdk8s-typescript' };

    new KubeService(this, 'service', {
      spec: {
        type: 'LoadBalancer',
        ports: [{ port: 80, targetPort: IntOrString.fromNumber(8080) }],
        selector: label
      }
    });

    new KubeDeployment(this, 'deployment', {
      spec: {
        replicas: 1,
        selector: {
          matchLabels: label
        },
        template: {
          metadata: { labels: label },
          spec: {
            containers: [
              {
                name: 'cdk8s-typescript',
                image: `${process.env.TARGET_REPOSITORY}:${process.env.TARGET_IMAGE_TAG}`,
                ports: [{ containerPort: 8080 }]
              }
            ]
          }
        }
      }
    });
  }
}

const app = new App();
new CDK8SChart(app, 'cdk8s-typescript');
app.synth();