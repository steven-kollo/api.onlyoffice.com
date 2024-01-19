// function parseObjectString(str) {
//   const stack = [];
//   let currentObject = null;

//   for (let i = 0; i < str.length; i++) {
//       if (str[i] === '<') {
//           const newObject = { type: '', children: [] };
//           if (currentObject) {
//               currentObject.children.push(newObject);
//               stack.push(currentObject);
//           }
//           currentObject = newObject;
//       } else if (str[i] === '>') {
//           const finishedObject = currentObject;
//           currentObject = stack.pop();
//           if (!currentObject) {
//               return finishedObject;
//           }
//       } else if (str[i] !== ',' && str[i] !== ' ') {
//           currentObject.type += str[i];
//       }
//   }

//   return currentObject;
// }

// const str = 'Object.<string, Object.<string, MyType>>';
// console.log(JSON.stringify(parseObjectString(str), null, 2));

// /**
//  * @param {string} s
//  * @returns {any}
//  */
// function parseGeneric(s) {
//   const t = []
//   let c = {
//     type: "",
//     children: []
//   }
//   for (let i = 0; i < s.length; i += 1) {
//     switch (s[i]) {
//       case ".":
//         i += 1
//         const n = {
//           type: "",
//           children: []
//         }
//         c.children.push(n)
//         t.push(c)
//         c = n
//         break
//       case ",":
//         i += 1
//         const n0 = {
//           type: "",
//           children: []
//         }
//         const p = t.pop()
//         p.children.push(n0)
//         t.push(p)
//         c = n0
//         break
//       case ">":
//         c = t.pop()
//         break
//       default:
//         c.type += s[i]
//         break
//     }
//   }
//   return c
// }

import { parseType } from "./makefile.js"

function log(o) {
  console.log(JSON.stringify(o, undefined, 2))
}

const s = "Object.<string, Object.<Object.<string, Object>, MyType>>"
// const s = "Object.<string, number>"
const r = parseType(s)
log(r)
