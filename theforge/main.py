from textual.app import App
from theforge.screens.home import HomeScreen
from theforge.screens.settings import SecondScreen


class TestApp(App):
    CSS_PATH = "styles/main.tcss"

    def on_mount(self):
        self.push_screen(HomeScreen())

    def action_second_screen(self):
        self.push_screen(SecondScreen())

    def action_go_home(self):
        self.push_screen(HomeScreen())


def main():
    app = TestApp()
    app.run()
