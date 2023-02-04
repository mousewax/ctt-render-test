FROM node

ARG mainurl=https://github.com/ArnoldSmith86/virtualtabletop/archive/refs/heads/main.tar.gz

RUN curl -Ls ${mainurl} | tar xzf -

RUN cd virtualtabletop-main && npm install

EXPOSE 8272
VOLUME /virtualtabletop-main/save
WORKDIR /virtualtabletop-main
CMD ["npm", "run", "debug"]