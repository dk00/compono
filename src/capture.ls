import \web-app-scripts : {h, create-class}

function camera-video-strem {width=640 height=640}={}
  video = facing-mode: \environment
  result = new Promise ->
  try
    result := navigator.media-devices.get-user-media {video}
    .catch ->
  result

function stop-camera
  it?get-tracks!0.stop!

function render-capture {stream, placeholder, on-frame}
  if !stream then placeholder?!
  else
    on-timeupdate = if on-frame then ~> on-frame it.target
    h \video {autoplay: true src-object: stream, on-timeupdate}

spec =
  constructor: !->
    @load-stream = camera-video-strem!
    @load-stream?then ~>
      @stream = it
      @set-state!
  render: -> render-capture Object.assign stream: @stream, @props
  component-will-unmount: -> @load-stream.then stop-camera

capture = create-class spec

export default: capture
