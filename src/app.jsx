import {h} from 'web-app-tools'
import '../style'
import numberInput from './number-input'
import dateSelection from './date-selection'
import matchResult from './match-result'

const app = () =>
<div>
  <h1>發票號碼對獎</h1>
  <number-input />
  <date-selection />
  <match-result />
</div>

export default app
