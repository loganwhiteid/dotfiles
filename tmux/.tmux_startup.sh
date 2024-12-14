#!/bin/bash

############### Dash env
session="dash"

tmux has-session -t $session 2>/dev/null
if [ $? != 0 ]; then
	tmux new-session -d -s $session
	window=1
	tmux rename-window -t $session:$window 'nvim'
	tmux send-keys -t $session:$window 'nvim ~/repos/dash/' Enter

	window=2
	tmux new-window -t $session:$window -n 'run'
	tmux send-keys -t $session:$window 'repos dash' Enter

	tmux select-window -t $session:1
fi

############ dotfiles
session="dotfiles"

tmux has-session -t $session 2>/dev/null
if [ $? != 0 ]; then
	tmux new-session -d -s $session
	window=1
	tmux rename-window -t $session:$window 'nvim'
	tmux send-keys -t $session:$window 'nvim ~/repos/dotfiles/' Enter
fi

############### Advent env
session="advent"

tmux has-session -t $session 2>/dev/null
if [ $? != 0 ]; then
	tmux new-session -d -s $session
	window=1
	tmux rename-window -t $session:$window 'nvim'
	tmux send-keys -t $session:$window 'nvim ~/repos/advent/' Enter

	window=2
	tmux new-window -t $session:$window -n 'run'
	tmux send-keys -t $session:$window 'repos advent' Enter
	tmux select-window -t $session:1
fi
