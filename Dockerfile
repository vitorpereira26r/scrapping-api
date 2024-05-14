FROM python:3.9

WORKDIR /app

RUN pip install --upgrade pip

RUN pip install annotated-types
RUN pip install anyio
RUN pip install certifi
RUN pip install click
RUN pip install colorama
RUN pip install dnspython
RUN pip install email_validator
RUN pip install fastapi
RUN pip install fastapi-cli
RUN pip install h11
RUN pip install httpcore
RUN pip install httptools
RUN pip install httpx
RUN pip install idna
RUN pip install Jinja2
RUN pip install markdown-it-py
RUN pip install MarkupSafe
RUN pip install mdurl
RUN pip install orjson
RUN pip install pydantic
RUN pip install pydantic_core
RUN pip install Pygments
RUN pip install python-dotenv
RUN pip install python-multipart
RUN pip install PyYAML
RUN pip install rich
RUN pip install shellingham
RUN pip install sniffio
RUN pip install starlette
RUN pip install typer
RUN pip install typing_extensions
RUN pip install ujson
RUN pip install uvicorn
RUN pip install watchfiles
RUN pip install websockets

COPY . .

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]