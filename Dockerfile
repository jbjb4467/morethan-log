FROM node:16.13.2-alpine

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn

COPY . .

ARG NOTION_PAGE_ID
ARG GOOGLE_MEASUREMENT_ID
ARG GOOGLE_SITE_VERIFICATION

RUN printf ${NOTION_PAGE_ID} >> .env.production
RUN printf ${GOOGLE_MEASUREMENT_ID} >> .env.production
RUN printf ${GOOGLE_SITE_VERIFICATION} >> .env.production
RUN ["cat", ".env.production" ]

RUN yarn build

EXPOSE 3000

CMD ["yarn", "start"]