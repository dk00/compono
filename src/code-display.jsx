import {h} from 'web-app-scripts'

const codeList = ({code, content}) =>
<div class="code-list">
  <div class="name">
    <h3>{code}</h3>
  </div>
  <span class="code-detail">{content}</span>
</div>

export default codeList
