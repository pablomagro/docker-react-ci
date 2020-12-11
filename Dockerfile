FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# Needed by the elastic container to listen at runtime.
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html