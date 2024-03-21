from fastapi import APIRouter
from healthcheck import HealthCheck

health_check_router = APIRouter()
health = HealthCheck()


@health_check_router.get("/health-check")
async def health_check():
    return health.run()