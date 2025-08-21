import glob
import os,pwd

icon_files = {}
home = pwd.getpwuid(os.getuid()).pw_dir
print("Searching at: {}".format(home))
with open("./broadcasters-list.csv") as icons_list:
    data = icons_list.read()
    for broadcaster in data.split("\n"):
        path = broadcaster.split(",")[-1]
        icon_files[path.split("/")[-1]] = True
for file in glob.glob(home+"/Dokument/icons/webapps/*.png"):
    file_name = file.split("/")[-1]
    if file_name in icon_files:
        del icon_files[file_name]

print("{} missing, list: {}".format(len(icon_files.keys()), icon_files.keys()))
