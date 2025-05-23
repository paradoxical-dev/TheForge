import npyscreen
import subprocess
from .misc import BaseForm


'''
Creates the base index for the app., allowing the user to "jump" to the other
pages and edit files.
'''
class MainMenu(BaseForm):
    def create(self):
        super().create()

        self.add_handlers({
            "q": lambda x: self.exit_app()
        })

        self.add(
            npyscreen.ButtonPress,
            name="Edit File",
            when_pressed_function=self.open_editor
        )

        self.add(
            npyscreen.ButtonPress,
            name="Settings",
            when_pressed_function=self.open_settings
        )

        self.add(
            npyscreen.ButtonPress,
            name="Exit",
            when_pressed_function=self.exit_app
        )

    def open_editor(self):
        self.parentApp.switchForm("EDITOR")

    def open_settings(self):
        self.parentApp.switchForm("SETTINGS")

    def exit_app(self):
        self.parentApp.switchForm("CONFIRM_EXIT")


'''
Allows the user to edit different files from within their preferred editor
'''
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


'''
Configuration settings of the app. Provides multiple menus to change
and configure the behavior of the app.
'''
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
