function get-install-prompt
  if get-install-prompt.ref
    return get-install-prompt.ref

  window.add-event-listener \beforeinstallprompt ->
    it.prevent-default!
    get-install-prompt.ref = Promise.resolve it

  get-install-prompt.ref = if window.navigator.standalone || window.match-media '(display-mode: standalone)' .matches
    Promise.resolve null
  else new Promise (resolve) ->
    window.add-event-listener \beforeinstallprompt ->
      it.prevent-default!
      resolve it

export default: get-install-prompt
