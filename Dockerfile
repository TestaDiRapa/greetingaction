FROM node:18-slim

WORKDIR /config

RUN --mount=type=secret,id=mysecret cp /run/secrets/mysecret /config/mysecret.json
RUN cat /config/mysecret.json
RUN npm install --global typescript
RUN npm install --global ts-node
RUN npm install --global tslib @types/node
RUN npm install axios
RUN echo '{ "compilerOptions": { "target": "esnext", "module": "nodenext", "moduleResolution": "node", "esModuleInterop": true, "resolveJsonModule": true } }' >> tsconfig.json

CMD ["ts-node", "-e", "import * as test from './mysecret.json';\
    console.log(test);\
"]