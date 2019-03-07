import {h, useSharedState} from 'web-app-tools'
import numberLists from './number-lists.json'

const modeSelection = () => {
  const [mode, setMode] = useSharedState('mode', '3digits')
  const [dateIndex, setDateIndex] = useSharedState('date-index', 0)

  return (
    <div class="controls">
      <div class="modes">
        <label
          for="invoice-number"
          class={mode === '3digits'? 'active': ''}
          onClick={() => setMode('3digits')} >
          3碼連續
          <span>連續輸入後三碼</span>
        </label>
        <label
          class={mode === 'reader'? 'active': ''}
        >
          掃描(即將推出)
          <span>用相機掃描發票條碼</span>
        </label>
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
