import os

# Define image file extensions you want to list
image_extensions = {'.jpg', '.jpeg', '.png', '.bmp', '.gif'}

# Get all files in current directory
files = os.listdir('.')

# Filter files to only images
image_files = [f for f in files if os.path.splitext(f)[1].lower() in image_extensions]

# Print the image file names
for img in image_files:
    print(img)

