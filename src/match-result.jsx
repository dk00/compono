import {h, useEffect, useSharedState} from 'web-app-tools'
import numberLists from './number-lists.json'

const matchResult = () => {
  const [number=''] = useSharedState('number-input')
  const [dateIndex=0] = useSharedState('date-index')
  const matchIndex = number.length === 3 &&
    numberLists[dateIndex].numbers.findIndex(it => it.endsWith(number))
  const result = matchIndex >= 0? {
    grand: matchIndex <= 1,
    number: numberLists[dateIndex].numbers[matchIndex]
  }: {}
  const matched = result.number && !result.grand
  useEffect(() => {
    matched && navigator.vibrate([200, 100, 200, 100, 200])
  }, [matched])

  return (
    <div class="match-result">
      {result.number?
        <div>
          <h1>
            {result.grand?
              '可能是特獎？':
              '中獎了！'
            }
          </h1>
          <h1>{result.number}</h1>
        </div>:
      ''}
    </div>
  )
}

export default matchResult
