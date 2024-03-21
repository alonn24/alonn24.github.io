# Basic server with fastapi

## Installation

```bash
> pip install -r requirements.txt
```

## Run the server

```bash
> uvicorn app.main:app --reload --port 8080
```

## Development

```bash
> flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics
```