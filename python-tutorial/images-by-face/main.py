from concurrent.futures import ProcessPoolExecutor

import face_recognition
from shutil import copyfile
from os import listdir
from os.path import isfile, join
from typing import Any
import inquirer
questions = [
    inquirer.Text('source', message="Source image"),
    inquirer.Text('path', message="Images directory"),
]

Encoding = list[float]


def process_image(file) -> list[tuple[str, Encoding]]:
    image = face_recognition.load_image_file(file)
    encodings = face_recognition.face_encodings(image)
    return file, encodings


def compare_encodings(base_encodings, encodings):
    for x in encodings:
        compares = face_recognition.compare_faces(base_encodings, x, tolerance=0.5)
        for compare in compares:
            if compare:
                return True
    return False


def main(source, files):
    with ProcessPoolExecutor(max_workers=50) as executor:
        print("Processing source image")
        _, base_encodings = process_image(source)

        print("Processing images")
        results = executor.map(process_image, files)
        for file, encodings in results:
            is_same = compare_encodings(base_encodings, encodings)
            if is_same:
                print(f"Copying {file}")
                copyfile(file, f"./output/{file.split('/')[-1]}")
    print("Done")


# Run with arg to the source pictures directory
if __name__ == "__main__":
    answers = inquirer.prompt(questions)
    source = answers['source']
    path = answers['path']
    files = [join(path, f) for f in listdir(path) if isfile(join(path, f)) and f.endswith(('.jpg', '.jpeg', '.webp'))]
    main(source, files)
