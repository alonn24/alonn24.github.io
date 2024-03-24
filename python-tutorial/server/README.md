# Basic server with fastapi

## Configuration

We are using `sops` to manage the secrets. Please install `sops` by following the instructions [here](https://github.com/getsops/sops)
create the configuration file using the following command:

```bash
> sops -d app/config.sops.yaml > app/config.yaml
```

Make sure you are having a valid `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` in your environment variables or in the `~/.aws/credentials` file in order to work with the `sops` command.

## Development

TO run the poject, you need to have docker installed on your machine. You can install docker by following the instructions [here](https://docs.docker.com/get-docker/)

We are using 'tilt' to manage the kubernetes cluster locally. Please install `tilt` by following the instructions [here](https://docs.tilt.dev/install.html)
Run the following command to start the server:

```bash
> pip install -r requirements.txt
> uvicorn app.main:app --reload --port 8080
```

You can access the API [documentation](http://localhost:8000/docs) and [redoc](http://localhost:8000/redoc) by visiting the respective links.

Create a `.env` file with the following content:

```
DATABASE_URI=mongodb://mongo-service/?retryWrites=true&w=majority
DATABASE_NAME=pymongo_tutorial
```

## Linting

```bash
> flake8 . --count --exit-zero --statistics
```
