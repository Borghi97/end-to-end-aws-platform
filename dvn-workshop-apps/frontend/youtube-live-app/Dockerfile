
FROM node:21-alpine3.18 AS builder


WORKDIR /app
COPY . .


WORKDIR /app/dvn-workshop-apps/frontend/youtube-live-app

RUN npm install --silent
RUN npm run build


FROM node:21-alpine3.18 AS runner
WORKDIR /youtube-live-app

ENV NODE_ENV=production

COPY --from=builder /app/dvn-workshop-apps/frontend/youtube-live-app/.next ./.next
COPY --from=builder /app/dvn-workshop-apps/frontend/youtube-live-app/public ./public
COPY --from=builder /app/dvn-workshop-apps/frontend/youtube-live-app/package.json ./
COPY --from=builder /app/dvn-workshop-apps/frontend/youtube-live-app/node_modules ./node_modules

EXPOSE 3000
CMD ["npm", "run", "start"]