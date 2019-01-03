import
  'web-app-tools': {use-state, use-effect, use-ref}
  './utils': {feedback}
  './hooks': {use-model}
  './components': {reader-preview}

function h type, attributes
  element = document.create-element type
  Object.assign element, attributes
  element

function get-image video
  return if !(video?video-width > 0)
  crop = 0.07
  width = video.video-width * (1 - 2*crop)
  height = video.video-height * 0.15
  sx = video.video-width * crop
  sy = video.video-height * 0.15

  canvas = h \canvas {width, height}
  context = canvas.get-context \2d
  context.draw-image video, sx, sy, width, height, 0 0 width, height
  context.get-image-data 0 0 width, height

function get-camera-stream
  navigator.media-devices.get-user-media video: facing-mode: \environment

function stop-camera => it?get-tracks!for-each -> it.stop!

function use-camera {enabled}
  preview = use-ref!
  video = use-ref!
  update-ref = ->
    if video.current && preview.current && video.current.src-object != preview.current
      video.current.src-object = preview.current
  use-effect ->
    clean-up = -> stop-camera preview.current, video.current
    if enabled then get-camera-stream!then ->
      preview.current = it
      update-ref!
    else clean-up!
    clean-up
  , [enabled]
  ref = ->
    if it
      video.current = it
      update-ref!
  * video, ref

function is-playing video
  !video.paused && !video.ended &&
  video.current-time > 0 && video.ready-state > 2

ocrad-options = [\upper_num_only]

function read-number video, emit
  return if !is-playing video
  data = get-image video
  if data
    ocrad data, ocrad-options .then emit .then -> read-number video, emit

function extract-number
  it.match /\d{8}/ ?.0

function reader
  [options, set-options] = use-model \user-input
  [video, video-ref] = use-camera enabled: options.reader
  [ready, set-ready] = use-state!
  last = use-ref {}
  last.current.number = options.number
  use-effect !->
    ready && read-number video.current, ->
      if it != last.current.result
        last.current.result = it
        extracted = extract-number it
        if extracted && extracted != last.current.number
          feedback!
          set-options number: extracted
  , [ready]
  on-play = -> ready || set-ready true

  if options.reader then reader-preview {video-ref, on-play} else ''

export default: reader
