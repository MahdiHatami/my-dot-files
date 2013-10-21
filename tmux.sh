#!/bin/sh

cd /Users/mahami/Sites/imlec

tmux start-server
tmux new-session -d -s imlec

tmux new-window -timlec:0 -n 'vim' 'vim .'
tmux new-window -timlec:1 -n 'laravel-server' 'php artisan serve'

tmux select-window -timlec:0

#another session
cd /Users/mahami/Sites/slides

tmux new-session -d -s slides-backbone

tmux new-window -tslides-backbone:0 -n 'vim' 'vim .'
tmux new-window -tslides-backbone:1 -n 'grunt-server'


tmux attach-session -d -timlec
