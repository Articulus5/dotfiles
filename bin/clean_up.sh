#!/usr/bin/bash

rm -rf /home/$USER/.cache/vim                                   2>/dev/null
rm     /home/$USER/.local/share/okular/docdata/*.xml            2>/dev/null
rm     /home/$USER/.local/share/recently-used.xbel              2>/dev/null
rm     /home/$USER/{.bash_history,.lesshst,.viminfo,.wget-hsts} 2>/dev/null

exit 0
