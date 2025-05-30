import subprocess
import json
from textual.app import App, ComposeResult
from textual.widgets import Footer, Static
from textual.containers import Center

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


class UserStats(Static):
    def on_mount(self) -> None:
        self.get_stats()

    def pkg_count(self):
        try:
            result = subprocess.run(
                ["wc", "-l", "/var/lib/portage/world"],
                stdout=subprocess.PIPE,
                text=True,
                check=True,
            )
            count = int(result.stdout.strip().split()[0])
            return count
        except Exception:
            return "Package count unavailable"

    def selected_profile(self):
        with open("./test.json", "r") as f:
            config = json.load(f)
        return config["profile"]

    def get_stats(self):
        package_count = self.pkg_count()
        profile = self.selected_profile()
        self.update(
            f"Package count: {package_count}\n\n\n\nSelected profile: {profile}"
        )


class TestApp(App):
    CSS_PATH = "styles/main.tcss"

    def compose(self) -> ComposeResult:
        yield Greeter()
        yield UserStats()
        yield Footer()


def main():
    app = TestApp()
    app.run()
