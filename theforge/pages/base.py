import npyscreen
import subprocess
from .misc import BaseForm

greeter = r"""
___________.__          ___________                         
\__    ___/|  |__   ____\_   _____/__________  ____   ____  
  |    |   |  |  \_/ __ \|    __)/  _ \_  __ \/ ___\_/ __ \ 
  |    |   |   Y  \  ___/|     \(  <_> )  | \/ /_/  >  ___/ 
  |____|   |___|  /\___  >___  / \____/|__|  \___  / \___  >
                \/     \/    \/             /_____/      \/
"""

greeter = greeter.split("\n")


class MainMenu(BaseForm):
    def create(self):
        super().create()

        self.add_handlers({
            "q": lambda x: self.parentApp.switchForm("CONFIRM_EXIT"),
            "e": lambda x: self.open_editor(),
            "c": lambda x: self.open_settings()
        })

        for line in greeter:
            self.add(
                npyscreen.FixedText,
                value=line,
                relx=round(self.useable_space()[1] / 2) - round(len(line) / 2),
            )

        self.nextrely += 7

        self.add(
            npyscreen.ButtonPress,
            name="(e)   Edit File ->",
            when_pressed_function=self.open_editor,
            relx=round(self.useable_space()[1] / 2) - round(len("(e)   Edit File ->") / 2),
        )

        self.nextrely += 2

        self.add(
            npyscreen.ButtonPress,
            name="(c)   Settings ->",
            when_pressed_function=self.open_settings,
            relx=round(self.useable_space()[1] / 2) - round(len("(e)   Edit File ->") / 2),
        )

    def open_editor(self):
        self.parentApp.switchForm("EDITOR")

    def open_settings(self):
        self.parentApp.switchForm("SETTINGS")


class FileEditor(BaseForm):
    def create(self):
        super().create()

        self.filename = "./test.txt"

        self.add(
            npyscreen.FixedText,
            value=f"Editing file: {self.filename}"
        )

        self.add(
            npyscreen.ButtonPress,
            name="Open in editor",
            when_pressed_function=self.open_in_editor
        )

    def open_in_editor(self):
        self.parentApp.switchForm(None)
        npyscreen.wrapper_basic(lambda x: None)

        subprocess.run([self.parentApp.editor, self.filename])
        self.parentApp.setNextForm("EDITOR")

    def afterEditing(self):
        self.parentApp.setNextForm("MAIN")


class Settings(BaseForm):
    #=== OPTION INITIALIZATION ===#

    def create(self):
        # -------- define options
        self.options = {
            'editors': ["nvim", "vim", "nano"]
        }

        self.add(
            npyscreen.FixedText,
            value="--- UI / INTERACTIONS ---",
            max_height=2,
        )
        super().create()

        # -------- change editor
        self.selected_editor = self.add(
            npyscreen.TitleSelectOne,
            name="Editor:",
            scroll_exit=True,
            max_height=3,
            values=self.options['editors']
        )

        # -------- path overrides menu
        self.add(
            npyscreen.ButtonPress,
            name="Path Overrides ->",
            when_pressed_function=self.open_path_overrides,
        )

        # -------- save settings
        self.add(
            npyscreen.ButtonPress,
            name="Save",
            when_pressed_function=self.save_settings
        )

    #=== HELPERS ===#

    # -------- open paths tab
    def open_path_overrides(self):
        self.parentApp.switchForm("SETTINGS_PATH_OVERRIDES")

    # -------- save logic
    def save_settings(self):
        # -------- editor
        selected_editor = self.selected_editor.get_selected_objects()
        if not selected_editor:
            selected_editor = self.parentApp.editor
        else:
            selected_editor = selected_editor[0]

        if subprocess.call(
                ['which', selected_editor],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL
                ) == 0:
            self.parentApp.editor = selected_editor
            self.parentApp.save_config()
        else:
            npyscreen.notify_wait(f"Editor not found on system: {selected_editor}")
            return self.parentApp.setNextForm("SETTINGS")

        # -------- reset to main page
        self.parentApp.switchForm("MAIN")
