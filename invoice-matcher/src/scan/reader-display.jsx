import {h} from 'web-app-scripts'
import capture from './capture'
import test from './test'

const placeholder = () =>
<div class="capture-placeholder">
  <img src="/favicon.png" />
  <div>
    Grant permission to open the camera
  </div>
</div>

const readerDisplay = ({active=true, handleVideo}) =>
<div class="code-reader">
  {active &&
    <capture onFrame={handleVideo} placeholder={placeholder} />
  }
</div>

export default readerDisplay
