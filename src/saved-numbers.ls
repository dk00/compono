import
  './firebase': {use-collection, use-realtime-updated}
  './components': {number-list}

function saved-numbers
  saved = use-collection \numbers
  data = use-realtime-updated \numbers

  number-list data: data.map (values) ->
    {...values, remove: -> saved.doc values.number .delete!}

export default: saved-numbers
