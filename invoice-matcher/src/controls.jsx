import {h, useSharedState} from 'web-app-tools'
import numberLists from './number-lists.json'

const modeSelection = () => {
  const [mode, setMode] = useSharedState('mode', '3digits')
  const [, setNumber] = useSharedState('number-input')
  const [, setDate] = useSharedState('date')
  const [dateIndex, setDateIndex] = useSharedState('date-index', 0)
  const changeMode = mode => {
    setNumber('')
    setDate('')
    setMode(mode)
  }

  return (
    <div class="controls">
      <div class="modes">
        <div
          class={mode === '3digits'? 'active': ''}
          onClick={() => changeMode('3digits')} >
          3碼連續
          <span>連續輸入後三碼</span>
        </div>
        <div
          class={mode === 'reader'? 'active': ''}
          onClick={() => changeMode('reader')} >
          掃描<sup>beta</sup>
          <span>用相機掃描發票條碼</span>
        </div>
      </div>
      {mode === '3digits' &&
        <div class="date-selection">
          {numberLists.map((list, index) =>
            <div key={list.date}
              class={index === dateIndex? 'active': ''}
              onClick={() => setDateIndex(index)} >
              {list.date}
            </div>
          )}
        </div>
      }
    </div>
  )
}

export default modeSelection
