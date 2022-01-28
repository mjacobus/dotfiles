# Tmux

## prefixed by CTRL-B
- c - New window
- n - next
- p - preview
- % - split vertically
- " - split horizontally
- <arrow key> - navigate among splits
- space - reorganize splits
- x - close window
- d - detach session
- w - show list of windows so it can be selected
- , - rename the current window
- f <name> - go to the named window

[Cheat Sheet](http://www.dayid.org/comp/tm.html)


## Reorganizing windows

```bash
swap-window -s 3 -t 1
swap-window -t 0
move-window -t 0
```
