import os
import matplotlib.pyplot as plt


def generate_pie_chart(directories, output_path="./info/language_pie_chart.png"):
    sizes = [1 for _ in directories]  # Equal size for each directory, adjust as needed
    plt.figure(figsize=(10, 6))
    plt.pie(sizes, labels=directories, autopct='%1.1f%%', startangle=140)
    plt.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.
    plt.savefig(output_path)
    plt.close()

generate_pie_chart(os.listdir('./languages'))