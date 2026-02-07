```
       __                  ____            __
      / /___  ____  ____ _/ __/___  ____  / /______
 __  / / __ \/ __ \/ __ `/ /_/ __ \/ __ \/ __/ ___/
/ /_/ / /_/ / / / / /_/ / __/ /_/ / / / / /_(__  )
\____/\____/_/ /_/\__,_/_/  \____/_/ /_/\__/____/
```
# Jonafonts
## Jonabron Channel Fonts Bundle
The Jonafonts Bundle is an extensive Bundle of many fonts I deem necessary on any system, especially since most of these fonts are *not* available in the standard GNU Guix repositories.
# Info
## Installation
### Generic Linux
Install the "*.ttf" Font Files into `/usr/share/fonts/truetype` for system-wide installation, and into `~/.local/share/fonts` for single-user installation. Afterwards, run `fc-cache -fv`.
### GNU Guix
Add the Jonabron Channel to your Guix Channel configuration (usually in `~/.config/guix/channels.scm`), like so:
```scm
(append (list
 ; ... your other Channels ...
 (channel
  (name 'jonabron)
  (url "https://github.com/nixpup/jonabron.git"))
 ; ... your other Channels ...
))
```
After that, run `guix pull`, followed by an optional `hash guix`. Then you should be able to install the fonts-jonafonts Package by including the Jonabron Fonts module in your `config.scm` or `home.scm`, and simply installing the Package like this:
```scm
(use-modules ; ... your other Modules ...
             (jonabron packages fonts))

(define %guix-os (operating-system
  (packages (append
             (map specification->package+output
                  '(
                  ; ... other "package"(s) ...
                  "font-jonafonts"
                  ; ... other "package"(s) ...
                  ))
  ))
))

%guix-os
```
## Fonts
The Jonafonts Bundle includes the following fonts:
- Synapsian Script ("Synapsian:Regular")
- Karamarea ("Karamarea:Bold")
- All The Icons ("all-the-icons:Regular")
- Octicons ("github-octicons:Regular")
- Blex Mono ("BlexMono Nerd Font:[Regular, Medium, Bold, Italic, Light, ExtraLight, Thin, ...]")
- File Icons ("file-icons:Regular")
- Font Awesome ("FontAwesome:Regular")
- Lucida Bright ("Lucida Bright:Regular")
- Material Icons ("Material Icons:Regular")
- TempleOS ("TempleOS:Regular")
- Weather Icons ("Weather Icons:Regular")
