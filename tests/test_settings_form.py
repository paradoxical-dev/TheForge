import pexpect
import sys

def test_npyscreen_script_runs():
    child = pexpect.spawn(sys.executable, ['tests/test_script.py'], encoding='utf-8')
    child.expect("PASSED", timeout=5)
    assert "PASSED" in child.before + child.after
