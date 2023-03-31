#!/usr/bin/env node
import * as fs from 'fs'
import { Shinto } from '@mrwconsulting/shinto';
import 'source-map-support/register';

if (fs.existsSync('./props.json')) {
    let props = JSON.parse(fs.readFileSync('./props.json', 'utf-8'))
    let config = JSON.parse(fs.readFileSync('./config.json', 'utf-8'))
    let shinto = new Shinto(props,config)
    shinto.synth()
} else {
    console.log('Missing properties file...')
}
