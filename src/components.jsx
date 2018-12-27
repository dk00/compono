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
    <button onClick={signOut}>Sign Out</button>
  </div>
</div>

const numberEntry = ({number, match, remove}) =>
<div>
  <h1>{number.slice(0, number.length - match)}</h1>
  {match > 0 &&
    <div class="match">{number.slice(-match)}</div>
  }
  <button class="remove" onClick={remove}>X</button>
</div>

const numberList = ({data, issues: {current, prev}}) =>
<div class="number-list">
  <div>{current.name}</div>
  {(data.current || []).map(item =>
    <number-entry key={item.number} {...item} />
  )}
  <div>{prev.name}</div>
  {(data.prev || []).map(item =>
    <number-entry key={item.number} {...item} />
  )}
</div>

const numberInput = ({number, date, onSubmit, onNumberChange, onDateChange}) =>
<form class="add-number" onSubmit={onSubmit}>
  <input type="date" value={date} onChange={onDateChange} />
  <input value={number} onChange={onNumberChange} placeholder="Add number" />
  <div class="actions">
    <div class="space">
    </div>
    <button type="submit" class="add">Add</button>
  </div>
</form>

export {intro, appBar, numberList, numberInput}
