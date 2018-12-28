import
  'web-app-tools': {use-state, use-effect, use-ref}
  './hooks': {use-model}
  './components': {reader-preview}

function h type, attributes
  element = document.create-element type
  Object.assign element, attributes
  element

function get-image video
  crop = 0.07
  width = video.video-width * (1 - 2*crop)
  height = video.video-height * 0.2
  sx = video.video-width * crop
  sy = video.video-height * crop

  canvas = h \canvas {width, height}
  context = canvas.get-context \2d
  context.draw-image video, sx, sy, width, height, 0 0 width, height
  context.get-image-data 0 0 width, height

function get-camera-stream
  navigator.media-devices.get-user-media video: facing-mode: \environment

function stop-camera => it?get-tracks!for-each -> it.stop!

function use-camera enabled
  [preview, set-preview] = use-state!
  video = use-ref!
  use-effect ->
    clean-up = -> stop-camera preview, video
    if enabled then get-camera-stream!then -> set-preview it
    else clean-up!
    clean-up
  , [enabled]
  ref = ->
    if it
      video.current = it
      it.src-object = preview
  * video, ref

function reader
  [options] = use-model \input-options
  [video, video-ref] = use-camera options.reader
  if options.reader then reader-preview {video-ref} else ''

export default: reader
