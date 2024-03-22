from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional
from routes.health_check import health_check_router

from dotenv import dotenv_values
from pymongo import MongoClient

config = dotenv_values(".env")
print(f"Config:", config)

app = FastAPI()
app.include_router(health_check_router)

@app.on_event("startup")
def startup_db_client():
    app.mongodb_client = MongoClient(config["ATLAS_URI"])
    app.database = app.mongodb_client[config["DB_NAME"]]
    print("Connected to the MongoDB database!")

@app.on_event("shutdown")
def shutdown_db_client():
    app.mongodb_client.close()