import 'web-app-tools': {use-state, use-effect}

function use-json-data url, placeholder
  [data, set-data] = use-state []
  use-effect ->
    fetch url .then (.json!) .then -> set-data it
  , []

  data

function use-number-lists
  use-json-data 'https://api.jsonbin.io/b/5f201ebd91806166284a9638/latest' []

export default: use-number-lists
