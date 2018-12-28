import
  'web-app-tools': {use-state, use-effect, use-ref}
  './hooks': {use-model}
  './components': {reader-preview}

function get-camera-stream
  navigator.media-devices.get-user-media video: facing-mode: \environment

function stop-camera => it?get-tracks!for-each -> it.stop!

function reader
  [options] = use-model \input-options
  video = use-ref!
  [preview, set-preview] = use-state!
  use-effect ->
    clean-up = -> stop-camera preview, video
    if options.reader then get-camera-stream!then -> set-preview it
    else clean-up!
    clean-up
  , [options.reader]
  video-ref = ->
    if it
      video.current = it
      it.src-object = preview
  if options.reader then reader-preview {video-ref} else ''

export default: reader
