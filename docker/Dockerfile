FROM    alpine
RUN     apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python &&\
        python3 -m ensurepip                                                  &&\
        pip3 install --no-cache --upgrade pip setuptools                      &&\
        pip3 install flask
COPY    app.py /app/app.py
WORKDIR /app
EXPOSE  5000
ENTRYPOINT [ "python" ]
CMD     [ "app.py" ]

