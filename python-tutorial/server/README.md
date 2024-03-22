# Basic server with fastapi

## Development

Run the following command to start the server:

```bash
> pip install -r requirements.txt
> uvicorn app.main:app --reload --port 8080
```

You can access the API (documentation)[http://localhost:8080/docs]

Create a `.env` file with the following content:

```
ATLAS_URI=mongodb://mongo-service/?retryWrites=true&w=majority
DB_NAME=pymongo_tutorial
```

## Linting

```bash
> flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics
```
