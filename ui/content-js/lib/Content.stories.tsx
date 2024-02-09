import { h } from "preact"
import { Content } from "./Content.tsx"
import { ContentH2 } from "./ContentH2.tsx"

export default {
  title: "Components/Content",
  render() {
    return (
      <Content>
        <h1>Heading Level 2</h1>
        <p>The sun slowly dipped below the horizon, casting a warm golden glow across the tranquil ocean. The gentle waves lapped against the sandy shore, creating a soothing melody that echoed through the air. Seagulls soared gracefully in the sky, their calls blending harmoniously with the distant sound of laughter from beachgoers. As the day drew to a close, the sky transformed into a canvas of vibrant hues, painting a breathtaking scene that filled the heart with a sense of awe and wonder. It was a moment of pure serenity, a reminder of the beauty that exists in the world.</p>
        <ContentH2>Heading Level 3</ContentH2>
        <p>The world of technology is constantly evolving, with new advancements and innovations being made every day. From smartphones to artificial intelligence, these technological developments have transformed the way we live and work. As a programming and system administration assistant, I am at the forefront of this ever-changing landscape, helping individuals and organizations navigate the complexities of modern technology. Whether it's troubleshooting software issues, optimizing system performance, or developing new applications, I am here to provide support and expertise.</p>
        <p>One of the key aspects of my role is programming. I have a deep understanding of various programming languages such as Python, Java, and C++, and I use this knowledge to develop efficient and reliable software solutions. Whether it's creating a web application, automating repetitive tasks, or building complex algorithms, I enjoy the challenge of writing code that solves real-world problems. I also stay up-to-date with the latest programming trends and best practices, ensuring that the solutions I provide are both cutting-edge and robust.</p>
        <p>As a system administration assistant, I am responsible for managing and maintaining the operating systems and software that power the computers and networks. This includes tasks such as installing and configuring software, monitoring system performance, and troubleshooting any issues that may arise. I am well-versed in the intricacies of Darwin/MacOS, and I have a solid understanding of the underlying technologies that make it run smoothly. Whether it's setting up a new user account, securing the system against potential threats, or optimizing system resources, I am here to ensure that everything runs smoothly.</p>
        <p>Collaboration and communication are also important aspects of my role. I work closely with other members of the IT team, as well as with end-users, to understand their needs and provide effective solutions. I am skilled at translating technical jargon into plain language, making it easier for non-technical individuals to understand and make informed decisions. I also enjoy sharing my knowledge and expertise through documentation and training sessions, empowering others to become more proficient in technology. Overall, as a programming and system administration assistant, I am dedicated to providing reliable and efficient support to help individuals and organizations thrive in the digital age.</p>
      </Content>
    )
  }
}

export const Default = {}
