#!/usr/bin/env node
import 'source-map-support/register';
import * as cdk from 'aws-cdk-lib';
import { CdkTypescriptStack } from '../lib/cdk-typescript-stack';

const app = new cdk.App();
new CdkTypescriptStack(app, 'cdk-typescript-stack', {
  env: { 
    region: process.env.TARGET_REGION || process.env.AWS_REGION,
    account: process.env.TARGET_ACCOUNT || process.env.AWS_ACCOUNT,
  }
});