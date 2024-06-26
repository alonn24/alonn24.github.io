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
encodings: dict[Any, list[Any]] = {}


def process_image(file) -> list[tuple[str, Encoding]]:
    image = face_recognition.load_image_file(file)
    encodings = face_recognition.face_encodings(image)
    return encodings


def main(source, files):
    print(f"Source: {source}")
    base_encodings = process_image(source)
    # encodings: list[Encoding] = []
    for i, file in enumerate(files):
        print(f"Processing {i}/{len(files)}")
        encodings = process_image(file)
        fit_encodings = [x for x in encodings if face_recognition.compare_faces(base_encodings, x, tolerance=0.5)[0]]
        if (len(fit_encodings) > 0):
            print(file, "Found fit encoding")
            copyfile(file, f"./output/{file.split('/')[-1]}")


# Run with arg to the source pictures directory
if __name__ == "__main__":
    answers = inquirer.prompt(questions)
    source = answers['source']
    path = answers['path']
    files = [join(path, f) for f in listdir(path) if isfile(join(path, f)) and f.endswith(('.jpg', '.jpeg', '.webp'))]
    main(source, files)
