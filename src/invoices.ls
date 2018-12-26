import
  './firebase': {use-collection, use-user-data}
  './components': {number-list}

function pack-entry values, saved
  {...values, remove: -> saved.doc values.number .delete!}

function get-issue delta=0
  d = new Date
  m = d.get-month!
  offset = -d.get-timezone-offset!
  d.set-month m - m%2 + 2 * delta
  d.set-date 1
  d.set-hours 0 offset, 0 0

  start = d.toJSON!slice 0 10
  d.set-month d.get-month! + 2
  end = d.toJSON!slice 0 10

  {name: start.slice 0 7; start, end}

function in-range ref, issue
  ref.order-by \date \desc
  .where \date \>= issue.start
  .where \date \< issue.end
  .limit 16

function invoices
  saved = use-collection \numbers
  issues =
    current: get-issue!
    prev: get-issue -1
  current = use-user-data \numbers (ref) -> in-range ref, issues.current
  prev = use-user-data \numbers (ref) -> in-range ref, issues.prev
  props =
    data: {current, prev}
    issues: issues

  number-list props

export default: invoices
