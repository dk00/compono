import {h, useState, useEffect} from 'web-app-tools'
import {useSnap, useInputBinding} from './utils'

const add = (a, b) => a + b

const initialInput = () => ({
  date: new Date().toJSON().slice(0, 10)
})

const byMonthReverse = (a, b) =>
  a[0] < b[0]? 1: a[0] > b[0]? -1: 0

const byDateReverse = (a, b) =>
  a.date < b.date? 1:
  a.date > b.date? -1: 0

const byMonth = it => it.date.slice(0, 7)

const randomDigits = () =>
  Math.random().toString().slice(2)

const merge = (activities, entry) => {
  const id = `${entry.date}-${randomDigits().slice(0, 2)}`
  console.log(id)
  return Object.assign({}, activities, {[id]: entry})
}

const grouped = (items, getKey) => {
  const data = {}
  Object.values(items).forEach(it => {
    const key = getKey(it)
    data[key] || (data[key] = [])
    data[key].push(it)
  })
  return data
}

const expenseList = ({items}) =>
  <div class="expense-list">
    {Object.entries(items).sort(byMonthReverse).map(([month, rows]) =>
      <div>
        <div class="month">
          {month}
          <div class="amount">{rows.map(it => +it.amount).reduce(add, 0)}</div>
        </div>
        {rows.slice().sort(byDateReverse).map(({date, note, amount}) =>
          <div class="item">
            {date.slice(5)} - {note}
            <div class="amount">{amount}</div>
          </div>
        )}
      </div>
    )}
  </div>

const addExpense = ({add = () => []}) => {
  const [model, bind, setModel] = useInputBinding(initialInput)

  const handleSubmit = e => {
    e.preventDefault()
    add(model)
    setModel({...model, note: '', amount: undefined})
  }

  return (
    <form class="add-expense" onSubmit={handleSubmit}>
      <input type="date" {...bind('date')} />
      <input type="text" {...bind('note')} />
      <input type="number" {...bind('amount')} required step={1} autofocus />
      <button type="submit">✓</button>
    </form>
  )
}

const home = () => {
  const [activities, setActivities] = useSnap('activities', {})

  return (
    <div class="home">
      <expense-list items={grouped(activities, byMonth)} />
      <add-expense add={model => setActivities(merge(activities, model))} />
    </div>
  )
}

export default home
