import
  './firebase': {use-collection, use-user-data}
  './components': {number-list}

function invoices
  saved = use-collection \numbers
  data = use-user-data \numbers

  number-list data: data.map (values) ->
    {...values, remove: -> saved.doc values.number .delete!}

export default: invoices
