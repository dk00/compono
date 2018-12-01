import {h} from 'web-app-tools'

const numberList = ({data = []}) =>
<div class="number-list">
  {data.map(({number}) =>
    <div>
      {number}
    </div>
  )}
</div>

const numberInput = ({number, date, onSubmit, onNumberChange, onDateChange}) =>
<form class="add-number" onSubmit={onSubmit}>
  <input value={number} onChange={onNumberChange} placeholder="Add number" />
  <input type="date" value={date} onChange={onDateChange} />
  <button hidden type="submit">Add</button>
</form>

export {numberList, numberInput}
