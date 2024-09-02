#!/usr/bin/bash

rm -rf /home/stse/.cache/vim                                   2>/dev/null
rm     /home/stse/.local/share/okular/docdata/*.xml            2>/dev/null
rm     /home/stse/.local/share/recently-used.xbel              2>/dev/null
rm     /home/stse/{.bash_history,.lesshst,.viminfo,.wget-hsts} 2>/dev/null
exit 0
