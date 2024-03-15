import type { JSX } from "preact"
import { h } from "preact"
import { renderToString } from "preact-render-to-string"

declare global {
  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "o-code-listing": any
      }
    }
  }
}

export interface RootParameters {
  // todo: replace with slots
  groups: ([string, any])[]
  // children: any
}

export function Root(
  {
    groups
    // children
  }: RootParameters
): JSX.Element {
  return (
    <o-code-listing class="code-listing">
      <header class="code-listing__header">
        <div class="code-listing__tabs">
          {groups.map(([g], i) => {
            if (i === 0) {
              return <button class="code-listing__tab code-listing__tab_active">{g}</button>
            }
            return <button class="code-listing__tab">{g}</button>
          })}
        </div>
      </header>
      <pre class="code-listing__body"><code>{groups[0][1]}</code></pre>
      {groups.map(([g, c]) => (
        <Template data-group={g}><pre class="code-listing__body"><code>{c}</code></pre></Template>
      ))}
    </o-code-listing>
  )
}

// todo: move to separate file

declare global {
  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        template: HTMLAttributes<HTMLTemplateElement>
      }
    }
  }
}

type TemplateElement = JSX.IntrinsicElements["template"]

interface TemplateParameters extends TemplateElement {
  children: any
}

function Template({ children, ...attrs }: TemplateParameters) {
  const s = renderToString(children)
  return (
    <template {...attrs} dangerouslySetInnerHTML={{ __html: s }} />
  )
}

// function CodeListingHeader({ }) {
// <header class="code-listing__header">
//   <div class="code-listing__tabs">
//     <!-- <span @text="tab" class="code-listing__tab"></span> -->
//     <span class="code-listing__tab">tab</span>
//   </div>
//   <!-- todo: separate to web component -->
//   <!-- <div class="code-listing__actions">
//     <button class="code-listing__action" type="button">
//       <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
//         <path fill-rule="evenodd" clip-rule="evenodd" d="M17 14.5C17 14.7761 17.2239 15 17.5 15C17.7761 15 18 14.7761 18 14.5V8.5C18 7.11929 16.8807 6 15.5 6H9.5C9.22386 6 9 6.22386 9 6.5C9 6.77614 9.22386 7 9.5 7H15.5C16.3284 7 17 7.67157 17 8.5V14.5ZM14 9H8C7.44772 9 7 9.44772 7 10V16C7 16.5523 7.44772 17 8 17H14C14.5523 17 15 16.5523 15 16V10C15 9.44772 14.5523 9 14 9ZM8 8C6.89543 8 6 8.89543 6 10V16C6 17.1046 6.89543 18 8 18H14C15.1046 18 16 17.1046 16 16V10C16 8.89543 15.1046 8 14 8H8Z" fill="#A3A9AE"/>
//       </svg>
//     </button>
//   </div> -->
// </header>
// }
