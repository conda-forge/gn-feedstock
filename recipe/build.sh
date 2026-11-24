#!/bin/bash

set -euo pipefail

# gen.py uses $LD as the link driver; conda sets it to the bare linker.
export LD="${CXX}"
python build/gen.py --allow-warnings
# Only build gn itself: the default target now also runs a formatter check that needs cipd.
ninja -C out gn
mkdir -p $PREFIX/bin
cp out/gn $PREFIX/bin/gn
