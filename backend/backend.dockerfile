FROM python:3.9-buster
ENV PYTHONUNBUFFERED=1

WORKDIR /app/src

RUN pip install poetry

COPY ./src/pyproject.toml* ./src/poetry.lock* ./
RUN poetry config virtualenvs.create false
RUN if [ -f pyproject.toml ]; then poetry install; fi

ENTRYPOINT ["poetry", "run", "uvicorn", "api.main:app", "--host", "0.0.0.0", "--reload"]