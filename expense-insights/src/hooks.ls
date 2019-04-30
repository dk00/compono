import 'web-app-tools': {use-state, use-effect}

function use-snap name, initial
  [state, set-state] = use-state ->
    try JSON.parse local-storage[name]
    initial
  use-effect -> local-storage[name] = JSON.stringify state
  return [state, set-state]

export {use-snap}
