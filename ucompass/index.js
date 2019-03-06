(() => {
  const subscribeDeviceOrientation = handler => {
    const eventName = 'ondeviceorientationabsolute' in window?
      'deviceorientationabsolute': 'deviceorientation'
    window.addEventListener(eventName, handler)
  }

  const rose = document.querySelector('#compass-rose')
  const info = document.querySelector('#info')
  const state = {}

  const render = ({heading, type}) => {
    rose.style.transform = `rotateZ(${heading}deg)`
    const typeText =
      type === 'absolute'? '✓ Absolute':
      type === 'not absolute'? '⚠ Not absolute': ''
    info.textContent = `${typeText} ${heading.toFixed()}`
  }

  const setState = next => {
    state.current = next
    if (!state.scheduled) {
      state.scheduled = true
      requestAnimationFrame(() => {
        render(state.current)
        state.scheduled = false
      })
    }
  }

  setState({heading: 0, type: 'pending'})
  subscribeDeviceOrientation(data =>
    setState({
      heading: data.alpha || 0,
      type: data.absolute? 'absolute': 'not absolute'
    })
  )
  navigator.serviceWorker.register('/service-worker.js')
})()
