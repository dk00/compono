import {h} from 'web-app-tools'
import '../style'
import {firebaseLogin} from './firebase'
import loginBlock from './login-block'
import savedNumbers from './saved-numbers'
import addNumber from './add-number'

const app = () =>
<div>
  <firebase-login render={loginBlock}>
    logged in
    <add-number />
    <saved-numbers />
  </firebase-login>
</div>

export default app
