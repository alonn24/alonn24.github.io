from PIL import Image
import numpy as np
from color_utils import RGB, is_color_too_close_to_gray
import requests
import extcolors


def load_image(url: str) -> Image:
    img_stream = requests.get(url, stream=True)
    return Image.open(img_stream.raw)


def extract_image_colors(img: Image) -> list[RGB]:
    freq, _ = extcolors.extract_from_image(img)
    freq = [
        (color, pixels)
        for color, pixels in freq
        if not is_color_too_close_to_gray(color)
    ]
    total_relevant_pixels = sum([pixels for _, pixels in freq])
    return {color: round(pixels / total_relevant_pixels, 2) for color, pixels in freq}

