from PIL import Image
import numpy as np
from timer import Timer
from color_utils import RGB, rgb_to_hsv, rgb_to_lab, rgb_to_hsl
import cv2


def replace_by_lab(img: Image, replacements: dict[RGB, RGB]):
    """
    Replace the colors in the image with the replacements
    Parameters:
        @img: Image to replace the colors
        @replacements: The colors to replace and their replacements
    """
    timer = Timer()

    # Use LAB for comparison
    # Get the LAB color, map by index to hsv color and replace with hsv_replacements
    lab = normalize_cv2_lab(cv2.cvtColor(np.array(img.convert('RGB')), cv2.COLOR_RGB2LAB))
    hsv_replacements = {color: rgb_to_hsv(replace) for color, replace in replacements.items()}
    colors = np.array(list(hsv_replacements.keys()))
    hsv_colors = np.array([rgb_to_hsv(x) for x in hsv_replacements.keys()])
    lab_colors = np.array([rgb_to_lab(x) for x in hsv_replacements.keys()])

    # Flatten the image and compare
    flattened = lab.reshape(-1, 3)
    # lab_colors[:, None] is of share (n, 1, 3) and flattened is of shape (m, 3)
    # The result is of shape (n, m) where the value is the distance
    #   n is the number of colors
    #   m is the number of pixels
    distances = np.linalg.norm(lab_colors[:, None] - flattened, axis=2)
    # Reshape to the original shape with
    # where values are the color index of the minimum distance
    min_indices_at = np.argmin(distances, axis=0)

    # Map color to replacement - fit by index
    hsv_colors_at = hsv_colors[min_indices_at]
    colors_at = colors[min_indices_at]
    replacement_at = np.array([hsv_replacements[tuple(color)] for color in colors_at])

    # Map on a flattened array and reshape
    hsv = np.array(img.convert('HSV').getdata())
    hsv[:, 0] = replacement_at[:, 0]
    hsv[:, 1] = (hsv[:, 1] / replacement_at[:, 1]) * hsv_colors_at[:, 1]

    # Load back the image
    hsv_image = Image.fromarray(np.zeros((img.height, img.width, 3)), mode='HSV')
    hsv_image.putdata([tuple(x) for x in hsv])

    # restore alpha channel
    result = np.array(hsv_image.convert('RGBA'))
    result[..., 3] = np.array(img.convert('RGBA'))[..., 3]
    result = Image.fromarray(result, mode='RGBA')
    print(f"Completed all in {timer.toc():.0f} seconds")
    return result

def replace_by_hue(img: Image, replacements: dict[RGB, RGB]):
    threshold = 10
    data = np.array(img.convert('HSV'))   # height x width x 4 numpy array
    for color, replace in replacements.items():
        colorHSL = [round(x*255) for x in rgb_to_hsl(color)]
        replaceHSL = [round(x*255) for x in rgb_to_hsl(replace)]
        areas = (data[..., 0] >= colorHSL[0] - threshold) & (data[..., 0] <= colorHSL[0] + threshold)
        data[..., 0][areas] = replaceHSL[0]
        data[..., 1][areas] = (data[..., 1][areas]/replaceHSL[1])*colorHSL[1]

    return Image.fromarray(data, mode='HSV').convert('RGBA')


def normalize_cv2_lab(cv_lab: np.ndarray):
    """
    OpenCV have different ranges for LAB color space
    LAB color space:
        L: 0 - 100
        A,B: -128 - 127
    OpenCV:
        L: 0 - 255
        A,B: 0 - 255 (128 is zero)
    """
    lab = cv_lab.astype(float)
    lab[..., 0] = lab[..., 0] * 100 / 255
    lab[..., 1] = lab[..., 1] - 128
    lab[..., 2] = lab[..., 2] - 128
    return lab
