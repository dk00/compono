import {h, useSharedState} from 'web-app-tools'

const wrap = number =>
  number.length > 3? number.slice(3): number

const numberInput = () => {
  const [number, setNumber] = useSharedState('number-input')

  return (
    <div class="number-input">
      <input
        autoFocus
        placeholder="輸入發票號碼"
        value={number}
        onChange={e => setNumber(wrap(e.target.value))}
      />
    </div>
  )
}

export default numberInput
