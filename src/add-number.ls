import
  'web-app-tools': {use-state}
  './firebase': {use-collection}
  './hooks': {use-model}
  './components': {number-list, number-input}

function use-dom-input default-value=''
  [value, set-value] = use-state default-value
  * value, -> set-value it.target.value

function local-date d
  result = new Date d
  result.set-minutes result.get-minutes! - result.get-timezone-offset!
  result

function local-today => local-date new Date .toJSON!slice 0 10

function add-number
  [number, on-number-change] = use-dom-input!
  [date, on-date-change] = use-dom-input local-today!
  collection = use-collection \numbers
  [input-options, update-input-options] = use-model \input-options
  on-submit = ->
    it.prevent-default!
    collection.doc number .set {number, date}
    on-number-change target: value: ''
  reader = input-options.reader
  toggle-reader = -> update-input-options reader: !reader

  number-input {
    number, on-number-change, date, on-date-change, on-submit
    reader, toggle-reader
  }

export default: add-number
