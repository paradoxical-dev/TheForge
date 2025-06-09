from textual.app import ComposeResult
from textual.screen import Screen
from textual.containers import Horizontal
from textual.widgets import Footer, Static, TabbedContent, TabPane, SelectionList, Pretty
from textual.widgets.selection_list import Selection
from textual.widget import Widget


class SelectProfile():
    def compose(self) -> ComposeResult:
        yield SelectionList[str](
            Selection("test1", "test_1"),
            Selection("test2", "test_2")
        )


class SecondScreen(Screen):
    BINDINGS = [("h", "go_home", "Home")]

    def compose(self) -> ComposeResult:
        yield Footer()
        with TabbedContent(initial="general"):
            with TabPane("General", id="general"):
                            yield SelectionList[str](  
                                Selection("Falken's Maze", "secret_back_door", True),
                                Selection("Black Jack", "black_jack"),
                                Selection("Gin Rummy", "gin_rummy"),
                                Selection("Hearts", "hearts"),
                                Selection("Bridge", "bridge"),
                                Selection("Checkers", "checkers"),
                                Selection("Chess", "a_nice_game_of_chess", True),
                                Selection("Poker", "poker"),
                                Selection("Fighter Combat", "fighter_combat", True),
                            )
            with TabPane("Files"):
                yield Static("Bye")

    def action_go_home(self):
        self.app.action_go_home()
