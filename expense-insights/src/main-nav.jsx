import {h, navLink, useState, useEffect, useRef} from 'web-app-tools'
import {useInstallPrompt} from './utils'

const installButton = () =>  {
  const [install] = useInstallPrompt()

  return (
    <div>
      {install &&
        <button onClick={install}>
          Install
        </button>
      }
    </div>
  )
}

const mainNav = () =>
  <div class="main-nav">
    <div class="coming-soon">💵</div>
    <div class="coming-soon">💡</div>
    <nav-link to="/">📝</nav-link>
    <div class="coming-soon">⚡</div>
    <install-button />
  </div>

export default mainNav
