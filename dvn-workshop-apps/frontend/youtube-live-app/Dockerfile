
FROM node:21-alpine3.18 AS builder
WORKDIR /app


COPY . .


WORKDIR /app/dvn-workshop-apps/frontend/youtube-live-app


RUN npm ci --silent
RUN npm run build

RUN npm prune --omit=dev


FROM node:21-alpine3.18 AS runner
WORKDIR /youtube-live-app

ENV NODE_ENV=production


COPY --from=builder /app/dvn-workshop-apps/frontend/youtube-live-app/dist ./dist || \
COPY --from=builder /app/dvn-workshop-apps/frontend/youtube-live-app/build ./build

COPY --from=builder /app/dvn-workshop-apps/frontend/youtube-live-app/node_modules ./node_modules
COPY --from=builder /app/dvn-workshop-apps/frontend/youtube-live-app/package.json ./

EXPOSE 3000

CMD ["npm", "run", "start"]