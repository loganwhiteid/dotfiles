## Powershell Profile

function cl {cd $args[0]; ls}

function touch {"" | Out-File $args[0]}

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
function scripts {cl "D:\Scripts"}

function downloads {cl "~\Downloads"}

function ifconfig {ipconfig $args}

# GIT things
function ga {git add $args}
function gaa {git add --all}
function gs {git status}
