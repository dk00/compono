import {h} from 'web-app-tools'
import '../style'
import {firebaseLogin} from './firebase'
import {intro} from './components'
import header from './header'
import addNumber from './add-number'
import reader from './reader'
import invoices from './invoices'

const app = () =>
<div>
  <firebase-login render={intro}>
    <header />
    <add-number />
    <reader />
    <invoices />
  </firebase-login>
</div>

export default app
