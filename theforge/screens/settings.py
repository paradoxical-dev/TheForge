from textual.app import ComposeResult
from textual.screen import Screen
from textual.widgets import Footer, Static, TabbedContent, TabPane


class SecondScreen(Screen):
    BINDINGS = [("h", "go_home", "Home")]

    def compose(self) -> ComposeResult:
        yield Footer()
        # yield Tabs("First tab", "Second tab", "[u]Third[/u] tab")
        with TabbedContent(initial="test1"):
            with TabPane("test1", id="test1"):
                yield Static("Hello")
            with TabPane("test2"):
                yield Static("Bye")

    def action_go_home(self):
        self.app.action_go_home()
