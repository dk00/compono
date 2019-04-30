import 'web-app-tools': {use-state, use-effect}

function use-snap name, initial
  [state, set-state] = use-state ->
    try return JSON.parse local-storage[name]
    initial
  use-effect ->
    local-storage[name] = JSON.stringify state
  * state, set-state

export default: use-snap
