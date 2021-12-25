FROM node:12-buster AS builder

WORKDIR /app

COPY package.json yarn.lock /app/
COPY packages/backend/package.json /app/packages/backend/package.json
COPY packages/frontend/package.json /app/packages/frontend/package.json

RUN yarn install

COPY packages/backend /app/packages/backend
COPY packages/frontend /app/packages/frontend

RUN cd /app/packages/frontend && yarn build
RUN cd /app/packages/backend && yarn tsc

RUN cp -r /app/packages/frontend/build /app/packages/backend/frontend-build

FROM node:12-buster

WORKDIR /app

COPY --from=builder /app/yarn.lock /app/package.json /app/
COPY --from=builder /app/packages/backend /app/packages/backend

RUN yarn install --prod

ENV REACT_BUILD_PATH="/app/packages/backend/frontend-build"
ENV NODE_ENV=production

CMD [ "node", "packages/backend/build/index.js" ]
