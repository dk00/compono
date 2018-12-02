import {h} from 'web-app-tools'

const numberList = ({data = []}) =>
<div class="number-list">
  {data.map(({number, remove}) =>
    <div>
      {number}
      <button class="remove" onClick={remove}>X</button>
    </div>
  )}
</div>

const numberInput = ({number, date, onSubmit, onNumberChange, onDateChange}) =>
<form class="add-number" onSubmit={onSubmit}>
  <input type="date" value={date} onChange={onDateChange} />
  <input value={number} onChange={onNumberChange} placeholder="Add number" />
  <button hidden type="submit">Add</button>
</form>

export {numberList, numberInput}
