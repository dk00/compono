import
  'web-app-tools': {
    compose, update-model, replace-collection
    with-state, map-props, with-effect
  }
  './components': {number-list, number-input}

function add-invoice {collection, data: {invoice={}}} {number}
  items = collection.invoice?items || []
  saved = items.map (invoice.)
  [{id: number, number}]concat saved

function on-numbers-change handle-change
  emit = ->
    try
      handle-change JSON.parse local-storage.numbers
  add-event-listener \storage emit
  emit!

function persist-local instances, context
  if instances.length > 0
    {store} = context
    sync-state = ->
      store.dispatch replace-collection id: \invoice model: \invoice models: it
    add-event-listener \message (data: {type, payload}) ->
      if type == \add-invoice
        next = add-invoice store.get-state!, payload
        local-storage.numbers = JSON.stringify next
        sync-state next
    on-numbers-change sync-state

with-saved-data = compose do
  with-effect persist-local
  with-state ({collection, data: {invoice}}) ->
    {items: collection.invoice?items, data: invoice}
  map-props ({items=[], data}) ->
    data: items.map (data.)

with-number-input = compose do
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
      post-message type: \add-invoice payload: values, \*

saved-numbers = with-saved-data number-list
add-number = with-number-input number-input

export {saved-numbers, add-number}
