## Note to self

If neovim was installed as **flatpak**, run the following to fix PATH for LSP installer.
```shell
flatpak override io.neovim.nvim --env=PATH="$PATH:[default_path]"
```

`default_path` can be obtained by running
```lua
os.getenv("PATH")
```

[reference](https://docs.flatpak.org/en/latest/flatpak-command-reference.html#flatpak-override)
