import npyscreen


'''
This is the base class for all forms in the app.
It defines a base footer and keybindings which can be altered from
within the respective subclasses
'''
class BaseForm(npyscreen.Form):
    def create(self):
        super().create()

        self.add_handlers({
            "q": lambda x: self.parentApp.switchFormPrevious()
        })

    def beforeEditing(self):
        if hasattr(self, 'footer'):
            self._widgets__.remove(self.footer)

        self.footer = self.add(
            npyscreen.FixedText,
            value=self.footer_text(),
            rely=self.useable_space()[0] - 3,
            relx=round(self.useable_space()[1] / 2) - round(len(self.footer_text()) / 2) ,
            editable=False,
            color='LABEL'
        )

    def footer_text(self):
        return "q: Prev/Quit  |  <Up><Down>: Move  |  Enter: Select"


class ConfirmExit(npyscreen.ActionPopup):
    def on_ok(self):
        self.parentApp.switchForm(None)

    def on_cancel(self):
        self.parentApp.switchForm("MAIN")


# TODO: add a keybinds page
