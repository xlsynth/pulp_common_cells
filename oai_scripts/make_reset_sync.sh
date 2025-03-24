#!/bin/sh
sed -i 's/^\(.*\)\(always_\?f\{0,2\}\s*@\s*(\)[^()]*\(pos\|neg\)\(edge [a-zA-Z0-9_]*cl[oc]\{0,2\}k[^ ,)]*\)[^()]*\().*\)$/\1\2\3\4\5/g' src/*.sv src/deprecated/*.sv
sed -i 's/`\(FFL\?\)A\(RN\?\s*(\)/`\1S\2/g' src/*.sv src/deprecated/*.sv
sed -i 's/`FFLARNC\s*(\s*\([^,]*\),\s*\([^,]*\),\s*\([^,]*\),\s*\([^,]*\),\s*\([^,]*\),\s*\([^,]*\),\s*\([^,]*\))/`FFLSR(\1, \2, \3, \5, \6, (\4 || ~\7))/g' src/*.sv src/deprecated/*.sv
sed -i 's/`FFARNC\s*(\s*\([^,]*\),\s*\([^,]*\),\s*\([^,]*\),\s*\([^,]*\),\s*\([^,]*\),\s*\([^,]*\))/`FFSR(\1, \2, \4, \5, (\3 || ~\6))/g' src/*.sv src/deprecated/*.sv
