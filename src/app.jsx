import {h} from 'web-app-tools'
import '../style'
import {savedNumbers, addNumber} from './containers'

const app = () =>
<div>
  <saved-numbers />
  <add-number />
</div>

export default app
