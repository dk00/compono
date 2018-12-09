import {h} from 'web-app-tools'
import '../style'
import {firebaseLogin} from './firebase'
import {intro} from './components'
import header from './header'
import addNumber from './add-number'
import invoices from './invoices'

const app = () =>
<div>
  <firebase-login render={intro}>
    <header />
    <invoices />
    <add-number />
  </firebase-login>
</div>

export default app
