import {h, useSharedState} from 'web-app-tools'
import numberLists from './number-lists.json'

const matchResult = () => {
  const [number] = useSharedState('number-input')
  const [dateIndex=0] = useSharedState('date-index')
  const result =
    number.length === 3 &&
    numberLists[dateIndex].numbers.find(it => it.endsWith(number))

  return (
    <div class="match-result">
      {result?
        <div>
          <h1>中獎了!!</h1>
          <h1>{result}</h1>
        </div>:
      '..'}
    </div>
  )
}

export default matchResult
