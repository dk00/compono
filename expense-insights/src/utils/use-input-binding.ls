import 'web-app-tools': {use-state}

function use-input-binding initial
  [model, set-model] = use-state initial

  bind = (field) ->
    value: model[field]
    on-input: (target: {value}) -> set-model {...model, (field): value}

  * model, bind, set-model

export default: use-input-binding
