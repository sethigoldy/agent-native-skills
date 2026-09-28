#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
python3 - "$ROOT" <<'PY'
from pathlib import Path
import json, re, sys
root=Path(sys.argv[1])
names=[]
for d in sorted((root/'skills').iterdir()):
    if not d.is_dir():
        continue
    p=d/'SKILL.md'
    assert p.exists(), f'missing {p}'
    s=p.read_text()
    assert s.startswith('---\n'), f'frontmatter: {p}'
    m=re.search(r'^name:\s*(.+)$', s, re.M)
    q=re.search(r'^description:\s*(.+)$', s, re.M)
    assert m and q, f'missing metadata: {p}'
    name=m.group(1).strip()
    desc=q.group(1).strip()
    assert name==d.name, (p,name,d.name)
    assert re.fullmatch(r'[a-z0-9-]+', name), name
    assert desc
    names.append(name)
assert len(names)==len(set(names))
cfg=json.loads((root/'scripts/agents.json').read_text())
for agent, data in cfg.items():
    assert set(data)=={'project','global'}, agent
print(f'Validated {len(names)} skills and {len(cfg)} agent adapters.')
PY
bash -n "$ROOT/scripts/install.sh"
printf 'Installer syntax OK.\\n'
