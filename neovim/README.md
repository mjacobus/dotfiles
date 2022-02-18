My neovim config
---------------------

## LSP

To fix error:

```
Spawning language server with cmd: `$HOME/.local/share/nvim/lspinstall/go/gopls`failed. The language server is either not installed, or, missing from PATH, or not executable
```

```
:LspInstall
```
Then

```
ln -s ~/.local/share/nvim/{lsp_servers,lspinstall}
```


## Installing neovim HEAD with brew

```
brew install --HEAD neovim
pip install neovim # install neovim provider for UltiSnipets
```
