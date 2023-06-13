import { Construct } from 'constructs';
import * as cdk8s from 'cdk8s';

import { KubeDeployment, KubeService, IntOrString } from './imports/k8s';

export class Chart extends cdk8s.Chart {
  constructor(scope: Construct, id: string) {
    super(scope, id, {
      namespace: 'springboot'
    });

    const label = { app: 'springboot-k8s' };

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
                name: 'springboot-k8s',
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

const app = new cdk8s.App();
new Chart(app, 'springboot-chart');
app.synth();