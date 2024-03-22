# Basic server with fastapi

## Development
We are using 'tilt' to manage the kubernetes cluster locally. Please install `tilt` by following the instructions [here](https://docs.tilt.dev/install.html)


```bash
Run the following command to start the server:

```bash
> pip install -r requirements.txt
> uvicorn app.main:app --reload --port 8080
```

You can access the API [documentation](http://localhost:8000/docs) and [redoc](http://localhost:8000/redoc) by visiting the respective links.

Create a `.env` file with the following content:

```
ATLAS_URI=mongodb://mongo-service/?retryWrites=true&w=majority
DB_NAME=pymongo_tutorial
```

## Linting

```bash
> flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics
```
