import pexpect
import sys

def test_editor_save():
    child = pexpect.spawn(sys.executable, ['tests/scripts/editor_save.py'], encoding='utf-8')
    child.expect("PASSED", timeout=5)
    assert "PASSED" in child.before + child.after

