import
  './firebase': {use-collection, use-user-data, use-shared-data}
  './components': {number-list}
  './match-number': match-number

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
  .limit 66

function use-numbers issue, saved
  winning = use-shared-data \winning-numbers ->
    it.where \issue \== issue.name
  data = use-user-data \numbers (ref) -> in-range ref, issue
  data.map -> {
    ...it
    match: match-number it.number, winning
    remove: (_) -> saved.doc it.number .delete!
  }

function invoices
  saved = use-collection \numbers
  issues =
    current: get-issue!
    prev: get-issue -1
  current = use-numbers issues.current, saved
  prev = use-numbers issues.prev, saved
  props =
    data: {current, prev}
    issues: issues

  number-list props

export default: invoices
