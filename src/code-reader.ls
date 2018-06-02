import
  \web-app-scripts : {compose, with-state, map-props}
  \./capture : capture
  \./utils : {get-image, get-split-images}
  \./reader-display : reader-display

function reader-state {data: app: reader} props
  Object.assign last-code: reader?last, props

function add-code
  key = it.slice 0 10
  content = it.slice 10
  values = (key): content, last: key

  type: \update-model payload: id: \reader values

function read-qr-code {data, width, height}
  {data: result, location}? = b = jsQR data, width, height
  console.log b
  result

function read-code-multiple images
  images.map read-qr-code .filter -> it .join ' / '

function placeholder
  'Waiting for the camera'

function reader-props {last-code, dispatch}: state
  placeholder: placeholder
  handle-video: (video) ->
    console.log video
    code-list = read-code-multiple get-image video
    dispatch add-code code, state if code && code != last-code

reader = compose (with-state reader-state), (map-props reader-props)
<| reader-display

export default: reader
