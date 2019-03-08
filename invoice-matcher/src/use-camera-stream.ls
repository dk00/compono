import 'web-app-tools': {use-state, use-effect, use-ref}

function use-camera-stream
  stream = use-ref!
  [status, set-status] = use-state if stream.current then \streaming
  else \waiting-permission
  use-effect ->
    navigator.media-devices.get-user-media video: facing-mode: \environment
    .then ->
      stream.current = it
      set-status \streaming

    -> stream.current?get-tracks!for-each -> it.stop!
  , []

  {status, stream: stream.current}

export default: use-camera-stream
