import 'web-app-tools': {
  use-store, use-store-state, get-document, update-document
}

function get-model state, props => get-document state, props

function use-model id
  {dispatch} = use-store!
  values = use-store-state get-model, {id}
  update = -> dispatch update-document {id, values: it}
  * values, update

export {use-model}
