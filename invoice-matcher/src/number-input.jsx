import {h, useSharedState} from 'web-app-tools'

const wrap = number =>
  number.length > 3? number.slice(3): number

const placeholder = {
  '3digits': '輸入發票後三碼',
  'reader': '掃描發票條碼'
}

const numberInput = () => {
  const [mode] = useSharedState('mode')
  const [number, setNumber] = useSharedState('number-input')
  const [date=''] = useSharedState('date')

  return (
    <div class="number-input">
      {mode === 'reader' &&
        <div class="invoice-date">{date.slice(0, 10)}</div>
      }
      <input
        // For a numeric keyboard: https://stackoverflow.com/a/31619707/4578017
        type="tel" pattern="[0-9]*"
        placeholder={placeholder[mode]}
        autocomplete="off"
        disabled={mode === 'reader'}
        value={number}
        onInput={e => setNumber(wrap(e.target.value))}
      />
    </div>
  )
}

export default numberInput
