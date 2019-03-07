import {h, useSharedState} from 'web-app-tools'

const wrap = number =>
  number.length > 3? number.slice(3): number

const numberInput = () => {
  const [number, setNumber] = useSharedState('number-input')

  return (
    <div class="number-input">
      <input
        id="invoice-number"
        // For a numeric keyboard: https://stackoverflow.com/a/31619707/4578017
        type="tel" pattern="[0-9]*"
        placeholder="輸入發票號碼"
        autocomplete="off"
        value={number}
        onInput={e => setNumber(wrap(e.target.value))}
      />
    </div>
  )
}

export default numberInput
