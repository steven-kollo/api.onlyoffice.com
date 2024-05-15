This directory should contains everything needed to move it to a separate repository.

Before publishing this library:

1. Add unit tests
2. Add e2e tests
3. Add documentation
4. Resolve todos
5. Revise events
6. Hardcode event names into their respective classes?
7. Add types for JSX
8. Add .gitignore
9. Add .mise.toml
10. Change ts in package.json to js
11. Add "types": "dist/main.d.ts",
12. Add build steps

```json
"build:element": "esbuild --bundle ./lib/main.ts --format=esm --keep-names --outfile=./dist/main.js",
"build:types": "tsc",
"build": "pnpm run build:element & pnpm run build:types",
"clean": "rm -r ./dist",
```

https://github.com/web-padawan/awesome-web-components
https://w3ctag.github.io/webcomponents-design-guidelines/
https://open-wc.org/guides/developing-components/publishing/
https://w3ctag.github.io/design-principles/#always-add-event-handlers
https://github.com/WebComponentsGuide/webcomponents.guide
https://shoelace.style/getting-started/usage#events
https://ionicframework.com/docs/api/alert#events
https://lit.dev/docs/v1/components/events/#add-event-listeners-in-connectedcallback
https://opensource.adobe.com/spectrum-web-components/components/picker/api/#events
https://web.dev/articles/custom-elements-best-practices#events
