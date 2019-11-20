# fzf-bin
A collection of scripts using the fantastic [fzf utility](https://github.com/junegunn/fzf).

| Script Name   | Language | Description                    |
|:--------------|:---------|:-------------------------------|
| `fconf`       | Shell    | Open config file in vim.       |
| `fgb`         | Shell    | Checkout in chosen git branch. |
| `fkill`       | Shell    | Kill chosen process.           |
| `fman`        | Shell    | Open chosen man page.          |
| `fv`          | Shell    | Cd into chosen directory.      |


## Install
First you have to install the [fzf utility](https://github.com/junegunn/fzf).
Either install it manually or it should be available in most repositories.

Then clone the repo and run make install (you will likely have to run make install as sudo)
```A shell
git clone https://github.com/simonhughcom/fzf-bin.git && sudo make install
```
You can also install individual scripts by running `make install` followed by the script name without the `.sh` extension. For example:
``` shell
sudo make install fgb
```

