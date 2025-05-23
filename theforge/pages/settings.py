import npyscreen
from .base import BaseForm


'''
Submenu of the settings page. Allows the user to override default paths
for editing config files, etc.
'''
class PathOverrides(BaseForm):
    # -------- define/display paths
    def create(self):
        super().create()

        self.make_conf = self.add(
            npyscreen.TitleFilename,
            name="make.conf",
            value=self.parentApp.paths["make.conf"]
        )

    # -------- save logic
    def afterEditing(self):
        self.parentApp.paths["make.conf"] = self.make_conf.value
        self.parentApp.save_config()
        self.parentApp.setNextForm("SETTINGS")
