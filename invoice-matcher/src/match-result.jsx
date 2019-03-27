import {h, useEffect, useSharedState} from 'web-app-tools'
import numberLists from './number-lists.json'

const invoicePeriod = date => {
  const d = new Date(date)
  const month = d.getMonth()
  return `${d.getFullYear() - 1911}年${month + 1 - month%2}`
}

const getListIndex = (numberLists, date) => {
  const listDates = numberLists.map(it =>  {
    const [, year, month] = it.date.match(/(\d{3}).(\d{1,2})/)
    return `${+year + 1911}-${month.padStart(2, 0)}`
  })
  const index = listDates.findIndex(it => date?.startsWith(it))
  return index >= 0? index:
    date < listDates[0]? 'expired': 'future'
}

const matchNumber = (numberLists, {number, mode, date, dateIndex}) => {
  const tail = number.slice(-3)
  const index = mode === 'reader'? getListIndex(numberLists, date): dateIndex
  const list = (numberLists[index] || {numbers: []}).numbers
  const matchIndex = tail.length === 3 && list.findIndex(it => it.endsWith(tail))

  return {
    type: (date && list.length === 0)? index:
      matchIndex > 1? 'prize':
      list[matchIndex]? 'maybe-grand':
      'none',
    number: list[matchIndex]
  }
}

const message = {
  none: '發票號碼對獎',
  expired: '已過期',
  'maybe-grand': '可能是特獎？',
  prize: '中獎了！',
  future: '尚未開獎'
}

const matchResult = () => {
  const [number=''] = useSharedState('number-input')
  const [date] = useSharedState('date')
  const [mode] = useSharedState('mode')
  const [dateIndex=0] = useSharedState('date-index')
  const result = matchNumber(numberLists, {number, mode, date, dateIndex})

  useEffect(() => {
    result.type === 'prize' && navigator.vibrate([200, 100, 200, 100, 200])
  }, [result.type === 'prize'])

  return (
    <div class="match-result">
      <h1>{message[result.type]}</h1>
      {result.number &&
        <h2>{result.number}</h2>
      }
    </div>
  )
}

export default matchResult
