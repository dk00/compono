import {h} from 'web-app-tools'

const cameraPreview = ({videoProps, openCamera, done}) =>
<div class="camera-preview">
  {videoProps?
    <video autoplay {...videoProps} />:
    <div class="ask-camera">
      Add numbers by scanning QR code with your camera!
      <button type="button" onClick={openCamera}>Open Camera</button>
    </div>
  }
  <button type="button" onClick={done}>Done</button>
</div>

export default cameraPreview
