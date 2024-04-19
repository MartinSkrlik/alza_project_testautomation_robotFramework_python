import subprocess
import sys
import os
from datetime import datetime

def clean_console():
    os.system('cls')

def folder_name_generator():
    now = datetime.now()
    timestamp = now.strftime("%Y-%m-%d_%H-%M-%S")
    filename_with_dot = str(sys.argv[1])
    filename_without_dot = filename_with_dot.split(".")[0]
    file_path ="src/features/" + filename_without_dot + ".robot"
    folder_name = "reports/" + timestamp + "_report_" + filename_without_dot
    return folder_name , file_path

folder_name , file_path = folder_name_generator()

clean_console()

if len(sys.argv) == 3:
    result = subprocess.run(["robot","--flattenkeywords","name:*.custom*","-i",sys.argv[2],"--outputdir",folder_name,file_path])
else :
    result = subprocess.run(["robot","--flattenkeywords","name:*.custom*","--outputdir",folder_name,file_path])