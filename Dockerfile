FROM node:20-alpine

WORKDIR /app
COPY . .

RUN cd server \
  && \
  npm i \
  && \
  cd ../client && npm i \
  && \
  cd .. \
  && \
  apk add --update ffmpeg

RUN sed -i 's/\r$//' start.sh  && \  
        chmod +x start.sh

EXPOSE 3000

CMD ["/bin/sh", "start.sh"]
