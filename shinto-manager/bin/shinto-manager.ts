#!/usr/bin/env node
import { RegionType } from '@mrwconsulting/shinto';
import { ControlHubProps,ShintoManagerApi } from '@mrwconsulting/shinto';
import 'source-map-support/register';

const props: ControlHubProps = {
  account: "570602336658",
  region: RegionType.US_EAST_1
}
const api = new ShintoManagerApi(props)
api.stack()