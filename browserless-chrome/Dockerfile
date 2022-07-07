FROM browserless/chrome
RUN sed -i \
    's/<ol id="editor-tabs">/<ol id="editor-tabs" style="overflow:hidden;">/' \
    /usr/src/app/node_modules/browserless-debugger/static/index.html
