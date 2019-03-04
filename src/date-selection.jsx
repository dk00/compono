import {h, useSharedState} from 'web-app-tools'
import numberLists from './number-lists.json'

const dateSelection = () => {
  const [dateIndex, setDateIndex] = useSharedState('date-index')

  return (
    <div class="date-selection">
      {numberLists.map((list, index) =>
        <div key={list.date}
          class={index === dateIndex? 'active': ''}
          onClick={() => setDateIndex(index)} >
          {list.date}
        </div>
      )}
    </div>
  )
}

export default dateSelection
