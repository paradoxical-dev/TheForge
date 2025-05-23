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
    curses.KEY_DOWN, 10,                                          # go to 'Settings' on MainMenu 
    curses.KEY_DOWN, curses.KEY_DOWN, curses.KEY_DOWN, 10,        # down to nano 
    curses.KEY_DOWN, curses.KEY_DOWN, 10                          # Save selecion
]
npyscreen.TEST_SETTINGS['CONTINUE_AFTER_TEST_INPUT'] = False

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
