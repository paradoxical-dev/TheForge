from textual.app import ComposeResult
from textual.screen import Screen
from textual.widgets import Footer, Static


class SecondScreen(Screen):
    BINDINGS = [("h", "go_home", "Home")]

    def compose(self) -> ComposeResult:
        yield Footer()
        yield Static("Second Page")

    def action_go_home(self):
        self.app.action_go_home()
