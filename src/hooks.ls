import 'web-app-tools': {use-state, use-store-state, update-model}

function get-model data: {app}, {id} => app[id]

function use-model id
  {dispatch, ...values} = use-store-state get-model, {id}
  update = -> dispatch update-model {id, values: it}
  * values, update

export {use-model}
