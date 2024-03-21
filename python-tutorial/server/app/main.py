from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional
from routes.health_check import health_check_router

app = FastAPI()
app.include_router(health_check_router)
