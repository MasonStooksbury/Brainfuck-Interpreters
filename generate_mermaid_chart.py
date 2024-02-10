import os

def scan_directories(exclude_dirs=None):
    if exclude_dirs is None:
        exclude_dirs = ["in-progress", ".git", "node_modules"]
    dirs = [d for d in os.listdir('.') if os.path.isdir(d) and d not in exclude_dirs]
    return dirs

def generate_mermaid_chart(directories):
    mermaid_code = "```mermaid\ngraph LR\n"
    for directory in directories:
        mermaid_code += f"    {directory} --> {directory}_content[\"{directory}\"]\n"
    mermaid_code += "```\n"
    return mermaid_code

def update_readme(mermaid_code, readme_file="README.md", start_marker="<!-- mermaid-chart-start -->", end_marker="<!-- mermaid-chart-end -->"):
    with open(readme_file, "r", encoding="utf-8") as file:
        lines = file.readlines()
    
    start_index = end_index = None
    for i, line in enumerate(lines):
        if start_marker in line:
            start_index = i
        elif end_marker in line:
            end_index = i
            break
    
    if start_index is not None and end_index is not None:
        updated_content = lines[:start_index+1] + [mermaid_code] + lines[end_index:]
        with open(readme_file, "w", encoding="utf-8") as file:
            file.writelines(updated_content)

directories = scan_directories()
mermaid_chart = generate_mermaid_chart(directories)
update_readme(mermaid_chart)
