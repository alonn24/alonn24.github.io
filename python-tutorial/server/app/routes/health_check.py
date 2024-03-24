from fastapi import APIRouter
from healthcheck import HealthCheck

health_check_router = APIRouter()
health = HealthCheck()


def check_mongo():
    return True, "mongo ok"


health.add_check(check_mongo)


@health_check_router.get("/health-check")
async def health_check():
    return health.run()
