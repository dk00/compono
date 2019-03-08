import {h} from 'web-app-tools'
import '../style'
import numberInput from './number-input'
import controls from './controls'
import matchResult from './match-result'
import invoiceReader from './invoice-reader'

const app = () =>
  <label class="top">
    <match-result />
    <number-input />
    <controls />
    <invoice-reader />
  </label>

export default app
