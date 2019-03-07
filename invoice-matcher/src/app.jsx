import {h} from 'web-app-tools'
import '../style'
import numberInput from './number-input'
import controls from './controls'
import matchResult from './match-result'

const app = () =>
<div>
  <h1>發票號碼對獎</h1>
  <match-result />
  <div class="inputs">
    <controls />
    <number-input />
  </div>
</div>

export default app
