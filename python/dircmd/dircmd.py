import os
from humanfriendly import format_size, parse_size

def walk(top, maxdepth):
    dirs, nondirs = [], []
    for entry in os.scandir(top):
        (dirs if entry.is_dir() else nondirs).append(entry.path)
    yield top, dirs, nondirs
    if maxdepth > 1:
        for path in dirs:
            yield from walk(path, maxdepth-1)

def get_size(start_path = '.'):
    total_size = 0
    for dirpath, dirnames, filenames in os.walk(start_path):
        for f in dirnames:
            fp = os.path.join(dirpath, f)
            # skip if it is symbolic link
            if not os.path.islink(fp):
                total_size += os.path.getsize(fp)

    return format_size(total_size)

root = os.path.join('.')
for directory, subdir_list, file_list in walk(root, 3):
    for name in subdir_list:
        print(get_size(name), name)