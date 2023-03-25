#!/usr/bin/env node
import * as fs from 'fs'
import { ContinuousIntegration } from '@mrwconsulting/cicd';
import 'source-map-support/register';

if (fs.existsSync('./props.json')) {
    let props = JSON.parse(fs.readFileSync('./props.json', 'utf-8'))
    let ci = new ContinuousIntegration(props)
    ci.synth()
} else {
    console.log('Missing properties file...')
}
