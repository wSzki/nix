#!/usr/bin/env bash
set -euf -o pipefail

VIM=${VIM:-"vim"}
TMUX=${TMUX:-"tmux"}

FILE=${FILE:-"$(date +%F).tidal"}
SESSION=${SESSION:-"tidal"}

TIDAL_BOOT_PATH=${TIDAL_BOOT_PATH:-"/usr/share/haskell-tidal/BootTidal.hs"}
GHCI=${GHCI:-""}

args=${@:-$FILE}

# Check if tmux session "tidal" is running, attach only
# else, create new session, split windows and run processes



$TMUX -2 attach-session -t $SESSION || $TMUX -2 \
  new-session -s $SESSION "$VIM $args"  \; \
  split-window -h -t $SESSION   \; \
  resize-pane -x 150 \; \
  split-window -v -t $SESSION   \; \
  select-layout even-vertical \; \
  split-window -h -t $SESSION   \; \
  resize-pane -y 50 \; \
  split-window -v -t $SESSION   \; \
  resize-pane -y 10 \; \
  send-keys -t 1 "sclang ~/.dot/box/tidal/BootSuperDirt.sc & ghci -ghci-script ~/.dot/box/tidal/BootTidal.hs" C-m   \; \
  send-keys -t 2 "cava" C-m   \; \
  send-keys -t 3 "sleep 15 && ~/.dot/box/tidal/midictl/midictl ~/.dot/box/tidal/midictl/config -d 14 -c 1" C-m   \; \
  send-keys -t 4 "sleep 10 && sclang ~/.dot/box/tidal/BootMidi.sc" C-m   \; \
  select-pane -t 3 \
  move-window -t 1 \
  select-pane -t 0
