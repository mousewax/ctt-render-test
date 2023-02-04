FROM node

ARG mainurl=https://github.com/ArnoldSmith86/virtualtabletop/archive/refs/heads/main.tar.gz

RUN curl -Ls ${mainurl} | tar xzf -

#RUN cd virtualtabletop-main && npm install --prod
RUN cd virtualtabletop-main && npm install

COPY config /virtualtabletop-main/

RUN /virtualtabletop-main/editroom.sh

#RUN npm install -g nodemon

EXPOSE 8272
VOLUME /virtualtabletop-main/save
WORKDIR /virtualtabletop-main
CMD ["npm", "run", "debug"]
#CMD ["npm", "start"]