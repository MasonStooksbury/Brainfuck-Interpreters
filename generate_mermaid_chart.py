import os

ignored_directories = ["in-progress"]
root_directories = [d for d in os.listdir('.') if os.path.isdir(d) and d not in ignored_directories and d.lower() != "readme.md"]

mermaid_code = "graph LR\n"
for directory in root_directories:
    mermaid_code += f"    {directory} --> {directory}_content[\"{directory}\"]\n"

print(mermaid_code)
