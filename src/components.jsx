import {h} from 'web-app-tools'

const numberList = ({data = []}) =>
<div class="number-list">
  {data.map(({number}) =>
    <div>
      {number}
    </div>
  )}
</div>

const numberInput = ({value, onSubmit, onChange}) =>
<form class="add-number" onSubmit={onSubmit}>
  <input value={value} onChange={onChange} placeholder="Add number" />
  <button hidden type="submit">Add</button>
</form>

export {numberList, numberInput}
