# homebrew-cli
A command-line interface for Homebrew, the macOS package manager.

## Installation
To install the Homebrew CLI, you need to have Homebrew installed on your macOS system. If you don't have Homebrew installed, you can do so by running the following command in your terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Once Homebrew is installed, you can install the Homebrew CLI by running:

```bash
brew tap tapsilat/tap
brew install tapsilat
```

or 

```bash
brew install tapsilat/tap/tapsilat
```

## Usage
After installation, you can use the Homebrew CLI by typing `tapsilat` in your terminal. 


## Shell Completion

The CLI supports shell completion for Bash, Zsh, Fish, and PowerShell. Shell completion provides auto-completion for commands, subcommands, and flags.

### Bash

To load completions in your current shell session:

```bash
source <(tapsilat completion bash)
```

To load completions for every new session, execute once:

**Linux:**

```bash
tapsilat completion bash > /etc/bash_completion.d/tapsilat
```

**macOS:**

```bash
tapsilat completion bash > $(brew --prefix)/etc/bash_completion.d/tapsilat
```

> **Note:** You may need to install the `bash-completion` package first. On macOS: `brew install bash-completion`. On Linux: use your package manager (e.g., `apt install bash-completion`).

### Zsh

To load completions in your current shell session:

```bash
source <(tapsilat completion zsh)
```

To load completions for every new session, add the following to your `~/.zshrc`:

```bash
# If shell completion is not already enabled in your environment, enable it by adding:
autoload -Uz compinit
compinit

source <(tapsilat completion zsh)
```

Alternatively, generate the completion script to a file in your `fpath`:

```bash
tapsilat completion zsh > "${fpath[1]}/_tapsilat"
```

### Fish

To load completions in your current shell session:

```bash
tapsilat completion fish | source
```

To load completions for every new session:

```bash
tapsilat completion fish > ~/.config/fish/completions/tapsilat.fish
```

### PowerShell

To load completions in your current shell session:

```powershell
tapsilat completion powershell | Out-String | Invoke-Expression
```

To load completions for every new session, add the output to your PowerShell profile. You can check the location of your profile with `$PROFILE`.
