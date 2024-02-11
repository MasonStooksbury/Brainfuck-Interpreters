import os
import matplotlib.pyplot as plt


def generate_pie_chart(directories, output_path="./info/language_pie_chart.png"):
    sizes = [1 for _ in directories]  # Equal size for each directory, adjust as needed
    plt.figure(figsize=(10, 6))
    plt.pie(sizes, labels=directories, autopct='%1.1f%%', startangle=140)
    plt.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.
    plt.savefig(output_path)
    plt.close()

def update_readme_with_image(image_path, readme_file="README.md", start_marker="<!-- pie-chart-start -->", end_marker="<!-- pie-chart-end -->"):
    image_markdown = f"![Language Pie Chart]({image_path})\n"
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
        updated_content = lines[:start_index+1] + [image_markdown] + lines[end_index:]
        with open(readme_file, "w", encoding="utf-8") as file:
            file.writelines(updated_content)


generate_pie_chart(os.listdir('./languages'))
update_readme_with_image("./info/language_pie_chart.png")