import colorRegular from "@onlyoffice/documentation-ui-color/color.regular.css?inline"
import srOnly from "@onlyoffice/documentation-ui-sr-only/sr-only.css?inline"
import { Theme as StorybookTheme } from "@onlyoffice/documentation-ui-storybook"
import typography from "@onlyoffice/documentation-ui-typography/typography.css?inline"
import type { JSX } from "preact"
import { Fragment, h } from "preact"
import code from "../fixtures/code.js?raw"
import { Content } from "./content.server.ts"
import content from "./content.css?inline"
import contentRegular from "./content.regular.css?inline"

const styles: string[] = [
  colorRegular,
  typography,
  srOnly,
  content,
  contentRegular
]

export default {
  title: "UI Kit/Content",
  decorators: [
    (Story: any): JSX.Element => (
      <>
        {styles.map((s) => (
          <style key={s} dangerouslySetInnerHTML={{ __html: s }} />
        ))}
        <Story />
      </>
    )
  ]
}

export function Composition(): JSX.Element {
  return (
    <Content>
      <h1>Heading Level 1</h1>
      <p>The sun slowly dipped below the horizon, casting a warm golden glow across the tranquil ocean. The gentle waves lapped against the sandy shore, creating a soothing melody that echoed through the air. Seagulls soared gracefully in the sky, their calls blending harmoniously with the distant sound of laughter from beachgoers. As the day drew to a close, the sky transformed into a canvas of vibrant hues, painting a breathtaking scene that filled the heart with a sense of awe and wonder. It was a moment of pure serenity, a reminder of the beauty that exists in the world.</p>
      <h2>Heading Level 2</h2>
      <p>The world of <b>technology is constantly evolving</b>, with <i>new advancements and innovations</i> being made every day. <a href="https://google.com/">Your advertisement could be here.</a> From smartphones to artificial intelligence, these technological developments have transformed the way we live and work. <code>console.log(this)</code> As a programming and system administration assistant, I am at the forefront of this ever-changing landscape, helping individuals and organizations navigate the complexities of modern technology. Whether it's troubleshooting software issues, optimizing system performance, or developing new applications, I am here to provide support and expertise.</p>
      <h3>Heading Level 3</h3>
      <p>One of the key aspects of my role is programming. I have a deep understanding of various programming languages such as Python, Java, and C++, and I use this knowledge to develop efficient and reliable software solutions. Whether it's creating a web application, automating repetitive tasks, or building complex algorithms, I enjoy the challenge of writing code that solves real-world problems. I also stay up-to-date with the latest programming trends and best practices, ensuring that the solutions I provide are both cutting-edge and robust.</p>
      <ul>
        <li>The quick brown fox jumps over the lazy dog.</li>
        <li>Today is a beautiful day with clear blue skies.</li>
        <li>I enjoy reading books and exploring new ideas.</li>
        <li>The cat meowed loudly, demanding attention from its owner.</li>
      </ul>
      <hr />
      <p>The sun slowly set behind the horizon, casting a warm golden glow across the tranquil meadow. The gentle breeze rustled the leaves of the trees, creating a soothing melody. Birds chirped in the distance,their songs harmonizing with the peaceful ambiance. As the day turned into night, the stars began to twinkle in the darkening sky, illuminating the world with their ethereal light. It was a moment of serenity, a moment to appreciate the beauty of nature and find solace in its embrace.</p>
      <ol>
        <li>The sun is shining brightly in the clear blue sky.</li>
        <li>I love to take long walks on the beach during sunset.</li>
        <li>The smell of freshly baked cookies fills the air.</li>
        <li>I enjoy spending time with my friends and family, creating lasting memories.</li>
      </ol>
      <p>As a system administration assistant, I am responsible for managing and maintaining the operating systems and software that power the computers and networks. This includes tasks such as installing and configuring software, monitoring system performance, and troubleshooting any issues that may arise. I am well-versed in the intricacies of Darwin/MacOS, and I have a solid understanding of the underlying technologies that make it run smoothly. Whether it's setting up a new user account, securing the system against potential threats, or optimizing system resources, I am here to ensure that everything runs smoothly.</p>
      <blockquote>Success is not the key to happiness. Happiness is the key to success. If you love what you are doing, you will be successful.</blockquote>
      <p>Collaboration and communication are also important aspects of my role. I work closely with other members of the IT team, as well as with end-users, to understand their needs and provide effective solutions. I am skilled at translating technical jargon into plain language, making it easier for non-technical individuals to understand and make informed decisions. I also enjoy sharing my knowledge and expertise through documentation and training sessions, empowering others to become more proficient in technology. Overall, as a programming and system administration assistant, I am dedicated to providing reliable and efficient support to help individuals and organizations thrive in the digital age.</p>
      <Content.Alert>Fire is a crucial element in various aspects of life, from cooking and heating to industrial processes and forest management.</Content.Alert>
      <p>The Darwin/MacOS 13.3.1 operating system, built on a Unix-based foundation, offers a robust and reliable environment for both personal computing and professional production.</p>
      <pre><code dangerouslySetInnerHTML={{ __html: code }}></code></pre>
      <p>Darwin/MacOS 13.3.1 is the latest version of the operating system developed by Apple Inc. It is known for its sleek and user-friendly interface, making it a popular choice among both casual users and professionals. With its robust security features, Darwin/MacOS 13.3.1 ensures that your data and privacy are protected. The operating system also offers a wide range of built-in applications andtools, such as Safari for web browsing, Mail for email management, and Pages for document creation. Additionally, Darwin/MacOS 13.3.1 supports a variety of software and hardware, making it compatible witha wide range of devices and applications.</p>
      <table>
        <thead>
          <tr>
            <th>Name</th>
            <th>Description</th>
            <th>Type</th>
            <th>Example</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>provider</td>
            <td>Defines the provider id used to refer to the desktop app in the JavaScript commands.</td>
            <td>string</td>
            <td>"onlyoffice"</td>
          </tr>
          <tr>
            <td>name</td>
            <td>Defines the name displayed in the provider choice section when adding a cloud.</td>
            <td>string</td>
            <td>"ONLYOFFICE"</td>
          </tr>
        </tbody>
      </table>
      <p>The evolution of technology has revolutionized the way we live and work. From the invention of the internet to the development of smartphones, our lives have become more connected and convenient. With the rise of artificial intelligence and machine learning, we are witnessing a new era of automation and efficiency. However, along with these advancements come challenges and concerns. Privacy and security have become major issues in the digital age, and we must find ways to protect ourselves and our data. As technology continues to evolve, it is crucial that we adapt and embrace these changes while also being mindful of the potential risks and ethical implications.</p>
      <dl>
        <dt>Operating System</dt>
        <dd>An operating system (OS) is a software that manages computer hardware and software resources and provides common services for computer programs. It acts as an intermediary between the user and the computer hardware, allowing users to interact with the computer and run applications.</dd>
        <dt>Programming</dt>
        <dd>Programming is the process of creating instructions for a computer to perform specific tasks. It involves writing, testing, and maintaining the source code of computer programs using programming languages. Programming allows developers to automate tasks, solve problems, and build software applications.</dd>
        <dt>System Administration</dt>
        <dd>System administration involves managing and maintaining computer systems, networks, and servers. System administrators are responsible for tasks such as installing and configuring software, managing user accounts, monitoring system performance, and ensuring the security and stability of the system.</dd>
      </dl>
      <p>The sun slowly dipped below the horizon, casting a warm golden glow across the tranquil ocean. The gentle waves lapped against the sandy shore, creating a soothing melody that echoed through the air. Seagulls soared gracefully in the sky, their calls blending harmoniously with the distant sound of laughter from beachgoers. As the day drew to a close, the sky transformed into a canvas of vibrant hues, with shades of pink, orange, and purple painting the heavens. It was a moment of pure serenity, a fleeting glimpse of nature's beauty that reminded us of the simple joys in life.</p>
    </Content>
  )
}

export function Decomposition(): JSX.Element {
  return (
    <Content>
      <h1>Heading Level 1</h1>
      <h2>Heading Level 2</h2>
      <h3>Heading Level 3</h3>
      <hr />
      <p>Paragraph, first line.<br />Same paragraph, second line.</p>
      <p><b>Bold</b>, <i>Italic</i>, <code>Code</code>, <a href="/">Link</a>.</p>
      <pre><code dangerouslySetInnerHTML={{ __html: "Code Listing" }}></code></pre>
      <blockquote>Quote</blockquote>
      <Content.Alert>Default Alert</Content.Alert>
      <Content.Alert variant="note">Note Alert</Content.Alert>
      <figure>
        <img src="https://pepelsbey.dev/articles/road-to-htmhell/images/semantics.svg" />
      </figure>
      <ul>
        <li>First list item.</li>
        <li>Second list item.</li>
      </ul>
      <ol>
        <li>First list item.</li>
        <li>Second list item.</li>
      </ol>
      <dl>
        <dt>First term</dt>
        <dd>Description for the first term.</dd>
        <dt>Second term</dt>
        <dd>Description for the second term.</dd>
      </dl>
      <table>
        <thead>
          <tr>
            <th>First Table Head</th>
            <th>Second Table Head</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>First table data</td>
            <td>Second table data</td>
          </tr>
          <tr>
            <td>First table data</td>
            <td>Second table data</td>
          </tr>
        </tbody>
      </table>
    </Content>
  )
}

const colors: string[] = [
  "content-background-color",
  "content-foreground-color",
  "content-heading-foreground-color",
  "content-link-foreground-color",
  "content-separator-color",
  "content-blockquote-border-color",
  "content-code-background-color",
  "content-code-border-color",
  "content-table-separator-color",
  "content-section-heading-background-color",
  "content-section-heading-foreground-color"
]

export function Theme(): JSX.Element {
  return (
    <StorybookTheme>
      <StorybookTheme.Color>
        {colors.map((c) => (
          <StorybookTheme.Scale key={c} scale={c} />
        ))}
      </StorybookTheme.Color>
    </StorybookTheme>
  )
}
