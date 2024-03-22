from fastapi import FastAPI
from routes.health_check import health_check_router
from routes.main import books_router
from config import ATLAS_URI, DB_NAME
from pymongo import MongoClient


app = FastAPI()
app.include_router(health_check_router)

# Connect to mongoDB database


@app.on_event("startup")
def startup_db_client():
    app.mongodb_client = MongoClient(ATLAS_URI)
    app.database = app.mongodb_client[DB_NAME]
    print("Connected to the MongoDB database!")


@app.on_event("shutdown")
def shutdown_db_client():
    app.mongodb_client.close()


app.include_router(books_router, tags=["books"], prefix="/book")
