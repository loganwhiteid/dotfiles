## Powershell Profile


# list directory after CD'ing to it
function cl {cd $args[0]; ls}

function tail ($file) {
Get-Content $file -Wait
}

function vim {nvim $args}

function neovim {nvim $args}