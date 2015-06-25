# Nori's dotfiles #

Opinionated dotfiles repository for Mac OS with zsh. Including Homebrew, Solarised and oh-my-zsh.

Based on Zach Holman's dotfiles - https://github.com/holman/dotfiles.

## Prerequisites ##

- Set `zsh` as your default shell: `chsh -s /bin/zsh`
- Optionally, use Homebew to install the latest zsh and use `/usr/local/bin/zsh`. In this case, you need to add this path to `/etc/shells` before running `chsh`
- Assumes Sublime Text editor is installed
- Use Terminal for installation. Fonts, color schemes and preferences lists are automatically installed, and iTerm2 will overwrite the new settings on exit

## Install ##

- For a quick start, clone the repository `git clone <repopath> ~/.dotfiles`
- Run the bootstrap to install the files `cd ~/.dotfiles; ./bootstrap.sh`
- Restart your terminal

Specify your HOMEBREW_GITHUB_API_TOKEN in `system/env.zsh`.

Use `~/.localrc` to configure anything that you want to keep outside of the repository or private. For more than the most basic use, you should fork the repository as a basis for your own.

## Update ##

Use `cd ~/.dotfiles; ./update.sh` to automatically update cloned git repositories.

## Features ##

The repository is ordered by topic. Refer to the readme files in the individual topic directories for details of the features they provide.

## How it works ##

Files are processed automatically by `.zshrc` or the bootstrap process depending on their extension. Scripts set the environment, manage files, perform installation or enable plugins depending on the file name or extension. Bootstrap can be safely run repeatedly, you'll be prompted for the action you want to take if a destination file or directory already exists.

### Environment ###

These files set your shell's environment:

- `path.zsh`: Loaded first, and expected to setup `$PATH`
- `*.zsh`: Get loaded into your environment
- `completion.zsh`: Loaded last, and expected to setup autocomplete

### Files ###

The following extensions will cause files to be created in your home directory:

- `*.symlink`: Automaticlly symlinked into your `$HOME` as a dot file during bootstrap. For example, `myfile.symlink` will be linked as `$HOME/.myfile`
- `*.gitrepo`: Contains a URL to a Git repository to be cloned as a dotfile. For example `myrepo.symlink` will be cloned to `$HOME/.myrepo`
- `*.gitpatch`: Name `repo-<number>.gitpatch` to apply custom patches to a `gitrepo` repository
- `*.otf`, `*.ttf`, `*.ttc`: Fonts are copied to `~/Library/Fonts` during bootstrap
- `*.plist`: Preference lists are copied to `~/Library/Preferences` during bootstrap

### Installers ###

Installation steps during bootstrap can be handled in three ways:

- `install.sh`: An installation shellscript
- `install.homebrew`: A list of Homebrew formulas to install
- `install.open`: A list of files to be handled by the default application association using the `open` command

### Plugins ###

- All topic directory names are implicitly added to the plugin list, so you get `osx` and `brew` automatically
- Plugins listed in `oh-my-zsh.plugins` files are read and added to this list
