import {h, useSharedState} from 'web-app-tools'
import cameraVideo from './camera-video'
import {parseCode} from 'taiwan-invoice'

const readQRCode = imageData =>
  new Promise(resolve => {
    const channel = new MessageChannel()
    channel.port1.onmessage = ({data}) => resolve(data)
    navigator.serviceWorker.controller?.postMessage({
      type: 'read-qr-code',
      payload: imageData
    }, [channel.port2])
  })

const invoiceReader = () => {
  const [mode] = useSharedState('mode')
  const [number, setNumber] = useSharedState('number-input')
  const [date='', setDate] = useSharedState('date')

  const getInvoiceData = ({width, height, getImageData}) =>
    readQRCode(getImageData(0, 0, width / 2, height))
    .then(result => {
      if (result && result.data) {
        const {serial, date} = parseCode(result.data)
        if (serial != number) {
          navigator.vibrate([250])
          setNumber(serial)
          setDate(date)
        }
      }
    })
    .catch(e => console.log(e))
    .then(() =>
      new Promise(resolve => requestIdleCallback(resolve))
    )

  return mode === 'reader' &&
    <div class="reader">
      <camera-video onImage={getInvoiceData} />
    </div>
}

export default invoiceReader
