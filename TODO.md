# Todo


prefix all functions and variables with with mpages
 and get rid of the mode stuff
change name

create readme to explain what it is

blog post on the process



# Future
zoom font default +1
 could make it a setting
 and wordwrap a setting

could check for ido and do ido read-directory-name

some testing just to figure out how to do it with emacs

create a cask package

disappearing text (make it feel fading away)

could make time only count while in the buffer, currently
it just records start time, so if I step away to another
buffer it will keep the timer going. But really it should only
count while in that buffer. Timer tick should just add a second
and that count should get converted into a time and formatted


could check to see if running timer is the same as the buffer local
version. Not sure if that is possible with the timer method call
but that way it could restrict to the exact buffer that started the mode
and not if multiples are defined (would go well with counter above)