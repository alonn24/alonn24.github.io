from image_utils import load_image, extract_image_colors
from color_replacement import replace_by_lab, replace_by_hue
from color_utils import RGB, hex_to_rgb
from PIL import Image
import numpy as np

my_brand_colors = [hex_to_rgb(x) for x in ['#780000', '#c1121f', '#fdf0d5', '#003049', '#669bbc']]


def main():
    img = load_image("https://cdn.pixabay.com/photo/2019/12/05/19/28/clip-art-4675943_1280.png")
    img_colors = extract_image_colors(img)
    replacements = dict(zip(img_colors, my_brand_colors))

    replace_palette = get_replacement_palette(replacements, img.height)

    Image.fromarray(np.hstack((
        # replace palette
        np.pad(
            replace_palette, ((0, img.height - replace_palette.shape[0]), (0, 0), (0, 1)), mode='constant', constant_values=255),
        np.array(img),
        # Results
        np.array(replace_by_lab(img, replacements)),
        np.array(replace_by_hue(img, replacements))
    ))).show(title="Original vs LAB vs HSV")


def get_replacement_palette(replacements: dict[RGB, RGB], height):
    size = int(height / len(replacements))
    parts = [np.hstack((
        np.full((size, 100, 3), color, dtype=np.uint8),
        np.full((size, 100, 3), replace, dtype=np.uint8)
    )) for color, replace in replacements.items()]
    return np.vstack(parts)


if __name__ == "__main__":
    main()
