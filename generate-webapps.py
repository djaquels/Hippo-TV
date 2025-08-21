#!/usr/bin/env python3
import os
import csv
from pathlib import Path

def generate_webapps(csv_path, apps_dir):
    # Create the applications directory if it doesn't exist
    os.makedirs(apps_dir, exist_ok=True)

    # Read the CSV file
    with open(csv_path, 'r') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            country = row['country']
            name = row['name']
            url = row['url']
            icon = row['icon']
            category = row.get('category', 'Other')  # Default to 'Other' if no category is specified

            # Sanitize the name for the filename
            sanitized_name = name.replace(" ", "-").lower()

            # Create the .desktop file content
            desktop_content = f"""[Desktop Entry]
Name={name}
Comment=Public broadcaster from {country}
Exec=chromium --start-fullscreen --new-window {url}
Icon={icon}
Type=Application
Categories=AudioVideo;Video;{country};
Terminal=false
StartupWMClass=chromium
"""

            # Write the .desktop file
            desktop_filename = os.path.join(apps_dir, f"{sanitized_name}.desktop")
            with open(desktop_filename, 'w') as desktop_file:
                desktop_file.write(desktop_content)

            # Make the .desktop file executable
            os.chmod(desktop_filename, 0o755)
            print(f"Created: {desktop_filename}")

def main():
    # Path to the CSV file
    home_dir = str(Path.home())
    configs = {
     "1": ["broadcasters-list.csv","publicTV"],
     "2": ["music-and-video.csv","musicAndVideo"]
    }

    user_select = input("Select webappsto generate: 1.- Public TV 2.- Music And Video\n")
    input_list = configs[user_select][0]
    output_folder = configs[user_select][1]

    csv_path = os.path.join(home_dir, "Dokument", "Hippo-TV",input_list)

    # Path to the applications directory
    apps_dir = os.path.join(home_dir, "Dokument", "Hippo-TV", "webapps", output_folder)
    print("Generating {} within {}".format(csv_path,apps_dir))

    # Generate webapps
    generate_webapps(csv_path, apps_dir)
    print("Shortcuts created successfully!")

if __name__ == "__main__":
    main()
