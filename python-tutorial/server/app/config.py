from dotenv import dotenv_values


config = dotenv_values(".env")
ATLAS_URI = config["ATLAS_URI"]
DB_NAME = config["DB_NAME"]
