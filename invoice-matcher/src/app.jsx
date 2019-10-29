import {h} from 'web-app-tools'
import '../style'
import numberInput from './number-input'
import controls from './controls'
import matchResult from './match-result'
import invoiceReader from './invoice-reader'

const app = () =>
  <div>
    <match-result />
    <label class="top">
      <number-input />
      <controls />
    </label>
    <invoice-reader />
  </div>

export default app
