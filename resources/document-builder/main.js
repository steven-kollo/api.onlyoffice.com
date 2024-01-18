// import fs from "fs/promises"
// import list from "./dist/list.json" assert { type: "json" }
// import map from "./dist/map.json" assert { type: "json" }

import { build } from "./makefile.js"

await build()

// const findDuplicates = (arr) => {
//   let ids = arr.map(obj => obj.id);
//   let uniqueIds = new Set(ids);
//   let duplicates = ids.filter(id => {
//     if (uniqueIds.has(id)) {
//       uniqueIds.delete(id);
//       return false;
//     } else {
//       return true;
//     }
//   });
//   return duplicates;
// }

// await fs.writeFile("./output.json", JSON.stringify(findDuplicates(list), undefined, 2))
