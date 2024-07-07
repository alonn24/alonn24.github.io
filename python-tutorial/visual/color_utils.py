import colour
import numpy as np
import skimage

RGB = tuple[int, int, int]


def rgb_to_hsl(color: RGB) -> list[float]:
    """Convert an RGB tuple to an HSL tuple"""
    return colour.RGB_to_HSL([color[0] / 255.0, color[1] / 255.0, color[2] / 255.0]).tolist()

def hex_to_rgb(hex: str) -> RGB:
		"""Convert a hex string to an RGB tuple"""
		return tuple(int(hex.lstrip('#')[i:i+2], 16) for i in (0, 2, 4))

def rgb_to_hsv(color: RGB) -> list[float]:
    """Convert an RGB tuple to an HSV tuple"""
    result = colour.RGB_to_HSV([color[0] / 255.0, color[1] / 255.0, color[2] / 255.0]).tolist()
    return [x * 255 for x in result]

def rgb_to_lab(color: RGB) -> list[float]:
    """Convert an RGB tuple to an LAB tuple"""
    return skimage.color.rgb2lab(np.array(color).reshape(1, 1, 3) / 255).reshape(3).tolist()

def is_color_too_close_to_gray(color_rgb: RGB) -> bool:
    return np.std(color_rgb) < 5
