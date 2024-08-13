FROM node:18 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install -g @angular/cli@17.3.8
RUN npm install
COPY . .
RUN ng build --configuration production
FROM nginx:alpine
COPY --from=build /app/dist/ashokit_ecomm_frontend/browser /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
