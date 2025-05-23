from widgets.base import JumpPad, FileEditor, Settings
from widgets.settings import PathOverrides
import npyscreen
import os
import json

CONFIG_PATH = "./settings.json"

class MyApplication(npyscreen.NPSAppManaged):
    #=== INITIALIZATION ===#
    def onStart(self):

        npyscreen.setTheme(npyscreen.Themes.TransparentThemeDarkText)

        #-------- load config into mem
        self.load_config()

        #-------- initialize menus
        self.addForm("MAIN", JumpPad, name="Jump Pad")
        self.addForm('EDITOR', FileEditor, name='Editor')
        self.addForm('SETTINGS', Settings, name='Settings')
        self.addForm('SETTINGS_PATH_OVERRIDES', PathOverrides, name='Path Overrides')


    #=== HELPERS ===#

    def load_config(self):
        with open(CONFIG_PATH, 'r') as f:
            config = json.load(f)

        # load settings with default if not present
        self.editor = config.get("editor", os.environ.get("EDITOR", "nano"))
        self.paths = config.get("paths", {
            "make.conf": "/etc/portage/make.conf"
        })

    def save_config(self):
        config = {
            "editor": self.editor,
            "paths": self.paths
        }

        with open(CONFIG_PATH, 'w') as f:
            json.dump(config, f, indent=4)


if __name__ == '__main__':
    TestApp = MyApplication().run()
