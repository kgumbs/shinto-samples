import {Testing} from 'cdk8s';
import { CDK8SChart } from './index';

describe('cdk8s', () => {
  test('charts', () => {
    const app = Testing.app();
    const chart = new CDK8SChart(app, 'CDK8SChart');
    const results = Testing.synth(chart)
    expect(results).toMatchSnapshot();
  });
});
