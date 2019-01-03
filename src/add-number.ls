import
  'web-app-tools': {use-state}
  './firebase': {use-collection}
  './utils': {feedback}
  './hooks': {use-model}
  './components': {number-list, number-input}

function model-input values, set-values, keys
  Object.assign ...keys.map (key) ->
    "#{key}InputProps": value: values[key] || '', on-change: ->
      set-values (key): it.target.value

function add-number
  collection = use-collection \numbers
  [user-input, set-user-input] = use-model \user-input
  {number, date, reader} = user-input
  toggle-reader = -> set-user-input reader: !reader
  on-submit = ->
    feedback!
    it.prevent-default!
    collection.doc number .set {number, date}
    set-user-input number: ''
  number-input {
    ...model-input user-input, set-user-input, [\date \number]
    reader, toggle-reader, on-submit
  }

export default: add-number
