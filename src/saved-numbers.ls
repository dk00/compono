import
  './firebase': {use-realtime-updated}
  './components': {number-list}

function saved-numbers
  data = use-realtime-updated \numbers

  number-list {data}

export default: saved-numbers
