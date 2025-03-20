import os
import re
import subprocess
from datetime import date

header_file = "tools/res/header.txt"

target_directory = os.getcwd()
prefix = "/** -- Created on "
author = subprocess.run(["git", "config", "--get", "user.name"], stdout=subprocess.PIPE).stdout.decode("utf-8").strip()

# Iterate over each file
for path, subdirs, files in os.walk(target_directory):
    if any(segment in [".vscode", "build", ".git", "shared", "docs", "tools", "Core", "Drivers", "cmake"] for segment in path.split(os.sep)):
        continue
    for file_name in files:
        # Check if the file has a .c/cpp or .h/hpp extension
        if file_name.endswith((".c", ".h", ".cpp", ".hpp")):
            # Read the contents of the file
            with open(os.path.join(path, file_name), "r") as file:
                file_contents = file.read()

            # Check if the header is already present in the file
            if not file_contents.startswith(prefix):
                # remove all lines starting with " *" or " **/" or "/*"
                file_contents = re.sub(r"^\s*(\*|/\*).*\n", "", file_contents, flags=re.MULTILINE)
                # Read the contents of the header file
                with open(header_file, "r") as header:
                    header_contents = header.read()
                    header_contents = header_contents.replace("YEAR", date.today().strftime('%Y'))
                    header_contents = header_contents.replace("FILENAME", file_name)
                    header_contents = header_contents.replace("DATE", date.today().strftime('%Y-%m-%d'))
                    header_contents = header_contents.replace("AUTHOR", author)

                # Prepend the header to the file contents
                new_contents = header_contents + "\n" + file_contents

                print(os.path.join(path, file_name) + "\n")

                # Write the updated contents back to the file
                with open(os.path.join(path, file_name), "w") as file:
                    file.write(new_contents)

            else:
                # Check if the file is modified (not committed)
                result = subprocess.run(["git", "status", "--porcelain", os.path.join(path, file_name)], stdout=subprocess.PIPE)
                if result.stdout:
                    # Update the modified date in the header
                    file_contents = re.sub(r"(\* Updated by ).*( on .* )", r"\1" + author + r"\2" + date.today().strftime('%Y-%m-%d'), file_contents)
                    # Write the updated contents back to the file
                    with open(os.path.join(path, file_name), "w") as file:
                        file.write(file_contents)
