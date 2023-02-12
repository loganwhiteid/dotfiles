## Powershell Profile


# list directory after CD'ing to it
function cl {cd $args[0]; ls}

function tail ($file) {
Get-Content $file -Wait
}

function vim {nvim $args}

function neovim {nvim $args}

function repos {
    $loc = "D:\repos\"
    if ($args.Count -gt 0){
        $loc = Join-Path -Path $loc -ChildPath $args[0]
    }
    cl $loc
}