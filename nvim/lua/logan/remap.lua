vim.g.mapleader = " "


local function nmap(before, after)
    vim.keymap.set("n", before, after)
end
local function vmap(before, after)
    vim.keymap.set("v", before, after)
end
local function imap(before, after)
    vim.keymap.set("i", before, after)    
end


nmap("<leader>e", vim.cmd.Ex)
nmap("<leader>w", ":w<Enter>")
nmap("<leader>q", ":q<Enter>")

vmap("K", ":m '<-2<CR>gv=gv")
vmap("J", ":m '>+1<CR>gv=gv")

imap("<C-s>", "<C-O>:w<Enter>") --causes issues in some terminals
