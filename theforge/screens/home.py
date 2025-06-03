import subprocess
import json
from textual.screen import Screen
from textual.widgets import Footer, Label, Static
from textual.containers import Center
from textual.app import ComposeResult


logo = r"""
___________.__          ___________                         
\__    ___/|  |__   ____\_   _____/__________  ____   ____  
  |    |   |  |  \_/ __ \|    __)/  _ \_  __ \/ ___\_/ __ \ 
  |    |   |   Y  \  ___/|     \(  <_> )  | \/ /_/  >  ___/ 
  |____|   |___|  /\___  >___  / \____/|__|  \___  / \___  >
                \/     \/    \/             /_____/      \/
"""

author = "By paradoxical-dev"


class Greeter(Static):
    def on_mount(self) -> None:
        self.update(f"{logo}\n{author}")


class UserStats(Center):
    def compose(self) -> ComposeResult:
        pkg_count = self.pkg_count()
        profile = self.selected_profile()
        yield Label(f"Package count: {pkg_count}", classes="pkg-count")
        yield Label(f"Profile: {profile}", classes="profile")

    def pkg_count(self):
        try:
            result = subprocess.run(
                ["wc", "-l", "/var/lib/portage/world"],
                stdout=subprocess.PIPE,
                stderr=subprocess.DEVNULL,
                text=True,
                check=True,
            )
            count = int(result.stdout.strip().split()[0])
            return count
        except Exception:
            return "unavailable"

    def selected_profile(self):
        with open("./test.json", "r") as f:
            config = json.load(f)
        return config["profile"]


class HomeScreen(Screen):
    BINDINGS = [("s", "second_screen", "Second")]

    def action_second_screen(self):
        self.app.action_second_screen()

    def compose(self) -> ComposeResult:
        yield Greeter()
        yield UserStats(id="stats")
        yield Footer()
