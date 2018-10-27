import {h} from 'web-app-scripts'
import '../style'
import codeReader from './code-reader'
import codeList from './code-list'

export default props =>
<div>
  <script src="https://unpkg.com/jsqr@1.0.4/dist/jsQR.js"></script>
  <code-reader />
  <code-list />
</div>
