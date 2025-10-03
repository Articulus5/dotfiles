#!/usr/bin/bash

rm -rf /home/$USER/.cache/vim                        2>/dev/null
rm -rf /home/$USER/.ollama                           2>/dev/null
rm     /home/$USER/.local/share/recently-used.xbel   2>/dev/null
rm     /home/$USER/.local/share/okular/docdata/*.xml 2>/dev/null
rm     /home/$USER/{.bash_history,.lesshst,.viminfo,.wget-hsts,.python_history} 2>/dev/null

exit 0
