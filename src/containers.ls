import
  'web-app-tools': {
    compose, update-model, unshift-collection,
    with-state, map-props
  }
  './components': {number-list, number-input}

with-saved-data = compose do
  with-state ({collection: {receipt: {items}}, data: {receipt}}) ->
    {items, data: receipt}
  map-props ({items, data}) ->
    data: items.map (data.)

function random-string =>
  Math.random!to-string 16 .slice 2

with-receipt-input = compose do
  with-state ({data: {app: {input}}}) -> values: input
  map-props ({values={}, dispatch}) ->
    value: values.number
    on-change: ->
      dispatch update-model id: \input filed: \number values:
        number: it.target.value
    on-submit: ->
      it.prevent-default!
      dispatch update-model id: \input filed: \number values:
        number: ''
      dispatch unshift-collection id: \receipt model: \receipt models:
        * id: random-string!, number: values.number
        ...

saved-numbers = with-saved-data number-list
add-number = with-receipt-input number-input

export {saved-numbers, add-number}
