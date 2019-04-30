import {h, route} from 'web-app-tools'
import '../style'
import mainNav from './main-nav'
import home from './home'
import settings from './settings'

const app = () =>
  <div>
    <route path="/" exact render={home} />
    <route path="/settings" exact render={settings} />
    <route path="/:whatever?" render={mainNav} />
  </div>

export default app
