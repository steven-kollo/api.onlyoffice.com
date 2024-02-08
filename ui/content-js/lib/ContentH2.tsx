import { h } from "preact"

function ContentH2({ children }) {
  return (
    <h2 class="content-h2">
      <span class="content-h2__inner">
        {children}
        {/* <!-- todo: <a class="content-h2__anchor" :href="anchor"></a> --></h2> */}
      </span>
    </h2>
  )
}

export { ContentH2 }
