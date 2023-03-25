#!/usr/bin/env node
import { ShintoManagerApi } from '@mrwconsulting/shinto-api';
import 'source-map-support/register';

const api = new ShintoManagerApi()
api.stack()