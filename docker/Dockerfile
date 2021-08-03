FROM    python:3.8-alpine
RUN     pip3 install flask
COPY    app.py /app/app.py
WORKDIR /app
EXPOSE  5000
ENTRYPOINT [ "python" ]
CMD     [ "app.py" ]

