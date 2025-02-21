import os
import shutil

src_folder = "."

types = ["diapositivas", "apuntes"]

for type in types:
    dest_folder = os.path.join("..", f"{type}")
    if not os.path.exists(dest_folder):
        os.makedirs(dest_folder)
    for filename in os.listdir(src_folder):
        if filename.endswith(f"-{type}.html"):
            dest_file = os.path.join(dest_folder, filename)
            if os.path.exists(dest_file):
                os.remove(dest_file)
            shutil.move(os.path.join(src_folder, filename), dest_folder)
