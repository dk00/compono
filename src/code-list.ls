import
  \web-app-scripts : {compose, with-state, map-props}
  \./code-display : code-display

const message = 'Scan code with the camera'

function code-state data: app: {reader}
  code: reader?last || message
  content: reader?[reader?last]

function list-props => it

code-list = compose (with-state code-state), (map-props list-props)
<| code-display

export default: code-list
