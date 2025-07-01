from textual.app import App
from theforge.screens.home import HomeScreen
from theforge.screens.settings import SecondScreen
from theforge.screens.misc import QuitScreen


class TheForge(App):
    CSS_PATH = "styles/main.tcss"

    BINDINGS = [("q", "req_quit", "Quit")]

    def on_mount(self):
        self.push_screen(HomeScreen())

    def action_req_quit(self):
        self.push_screen(QuitScreen())

    def action_second_screen(self):
        self.push_screen(SecondScreen())

    def action_go_home(self):
        self.push_screen(HomeScreen())


def main():
    app = TheForge()
    app.run()
