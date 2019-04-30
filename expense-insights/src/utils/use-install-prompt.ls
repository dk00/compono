import
  'web-app-tools': {use-state, use-effect}
  './get-install-prompt': get-install-prompt

function use-install-prompt
  [status, set-status] = use-state \initial

  use-effect ->
    get-install-prompt!then ->
      set-status if it then \can-install else \installed
    window.add-event-listener \appinstalled -> set-status \installed
  , []

  install = if status == \can-install then ->
    get-install-prompt!then -> it.prompt!
    .then -> set-status \initial

  * install, status

export default: use-install-prompt
