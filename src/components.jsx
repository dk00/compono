import {h} from 'web-app-tools'

const intro = ({signIn}) =>
<div class="intro">
  <p>
    儲存發票號碼, 自動通知中獎!    
  </p>
  <button onClick={signIn}>開始使用</button>
</div>

const appBar = ({photoURL, signOut}) =>
<div class="app-bar">
  <h3>Invoices</h3>
  <div class="user">
    <img src={photoURL} />
    <button onClick>Sign Out</button>
  </div>
</div>

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

export {intro, appBar, numberList, numberInput}
