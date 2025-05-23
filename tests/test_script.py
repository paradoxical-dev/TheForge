import curses
import npyscreen

npyscreen.TEST_SETTINGS['TEST_INPUT'] = [ch for ch in 'This is a test']
npyscreen.TEST_SETTINGS['TEST_INPUT'].append(curses.KEY_DOWN)
npyscreen.TEST_SETTINGS['CONTINUE_AFTER_TEST_INPUT'] = True

class TestForm(npyscreen.Form):
    def create(self):
        self.myTitleText = self.add(npyscreen.TitleText, name="Events (Form Controlled):", editable=True)

class TestApp(npyscreen.StandardApp):
    def onStart(self):
        self.addForm("MAIN", TestForm)

A = TestApp()
try:
    A.run(fork=False)
except Exception:
    pass

form = A.getForm("MAIN")
field = form.myTitleText

if field.value == "This is a test":
    print("PASSED")
else:
    print("FAILED", field.value)
