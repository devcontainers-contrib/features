import sys
import json
_input = json.loads(sys.stdin.read())
print(json.dumps(_input[int(sys.argv[2])::int(sys.argv[1])]), flush=True)