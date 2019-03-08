import {h, useState, useEffect, useRef} from 'web-app-tools'
import useCameraStream from './use-camera-stream'
import {pipeImages} from './utils'

const setStream = (video, stream) => {
  if (video && video.srcObject !== stream) {
    video.srcObject = stream
  }
}

const cameraVideo = ({onImage}) => {
  const {status, stream} = useCameraStream()

  return (
    <div class="camera-video">
      {status === 'waiting-permission'?
        <p>請允許使用相機</p>:
        <video
          autoPlay
          ref={element => setStream(element, stream)}
          onPlay={event => pipeImages(event.target, onImage)}
        />
      }
      <div class="aim"></div>
    </div>
  )
}

export default cameraVideo
