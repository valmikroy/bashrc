



function _tls {
        tmux ls
}

function _tnew {
        tmux new -s $1
}

function _tattach {
        tmux attach -d -t $1
}

function assh {

        if [ -z $TMUX ]
        then
                command ssh -A "$@"
        else
                tmux rename-window "$(echo $* | cut -d . -f 1)"
                command ssh -o ForwardAgent=yes  -o StrictHostKeyChecking=no -o BatchMode=yes  "$@"
                tmux set-window-option automatic-rename "on" 1>/dev/null
        fi

}

function _tmux_config {

cat > ~/.tmux.conf <<- "CONFIG"
# scollback buffer
set-option -g history-limit 999999

# unbind
unbind C-b
set-option -g prefix C-z
bind-key C-z send-prefix

# splits
bind | split-window -h
bind - split-window -v
unbind '"'
unbind %

# borders
set -g pane-border-fg green
set -g pane-active-border-fg brightred

# reload
bind r source-file ~/.tmux.conf

# vi movement
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# resize with vim movement
bind H resize-pane -L 10 
bind J resize-pane -D 10
bind K resize-pane -U 10
bind L resize-pane -R 10 

# bell 
set-option -g bell-action any
set-option -g visual-bell on

# maximization of pane is C-z z , readily solved in new version of tmux
# assh setup

# Copy paste with vim movement

setw -g mode-keys vi
bind [ copy-mode
bind -t vi-copy v begin-selection
bind -t vi-copy y copy-selection
bind -t vi-copy V rectangle-toggle
#bind ] paste-buffer
bind p paste-buffer

# buffer
bind Space choose-buffer

# zoom in/out
bind Up resize-pane -Z
bind Down resize-pane -Z

# display pane color
set-option -g display-panes-active-colour blue
set-option -g display-panes-colour brightred
CONFIG

}


