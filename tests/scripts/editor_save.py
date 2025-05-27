from pathlib import Path
import curses
import json
import npyscreen
from theforge.main import MyApplication

#-------- overwrite settings file for test
BASE_DIR = Path(__file__).resolve().parent
test_config_path = (BASE_DIR / "../../settings.json").resolve()
with open(test_config_path, 'w') as f:
    f.write(json.dumps({
        "editor": "vim",
        "paths": {"make.conf": "/etc/portage/make.conf"}
    }))

npyscreen.TEST_SETTINGS['TEST_INPUT'] = [
    "c", curses.KEY_DOWN,                    # open settings / move to editor
    curses.KEY_DOWN, curses.KEY_DOWN, 10,    # select nano
    curses.KEY_DOWN, curses.KEY_DOWN, 10,    # save
    "q", curses.KEY_RIGHT, 10                # quit
]
npyscreen.TEST_SETTINGS['CONTINUE_AFTER_TEST_INPUT'] = True

A = MyApplication()
try:
    A.run(fork=False)
except Exception:
    pass

with open(test_config_path, 'r') as f:
    config = json.load(f)

editor = config['editor']

if editor == "nano":
    print("PASSED")
else:
    print("FAILED", editor)
