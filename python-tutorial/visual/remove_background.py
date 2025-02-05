import requests
import os

response = requests.post(
    f"https://api.stability.ai/v2beta/stable-image/edit/remove-background",
    headers={
        "authorization": f"Bearer {os.environ['STABILITY_API_KEY']}",
        "accept": "image/*"
    },
    files={
        "image": open("./input.jpeg", "rb")
    },
    data={
        "output_format": "png"
    },
)

if response.status_code == 200:
    with open("./output.png", 'wb') as file:
        file.write(response.content)
else:
    raise Exception(str(response.json()))