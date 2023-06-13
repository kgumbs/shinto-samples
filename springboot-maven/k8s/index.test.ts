import {Testing} from 'cdk8s';
import { Chart } from './index';

describe('cdk8s', () => {
  test('charts', () => {
    const app = Testing.app();
    const chart = new Chart(app, 'springboot-chart');
    const results = Testing.synth(chart)
    expect(results).toMatchSnapshot();
  });
});
