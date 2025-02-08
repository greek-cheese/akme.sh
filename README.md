# akme.sh

## Description

Akme.sh is an Acme-inspired shell "plugin" for Helix or any other modal text editor, bringing interactivity to your notes and workflows. It is heavily influenced by two projects:

- **Acme Editor** – For its command-driven, interactive execution model inside the editor.
- **Kakoune** – For its strong shell integration, demonstrating how text editors can interact seamlessly with external processes.

Helix, as a successor to Kakoune, has the potential for deep shell integration. `akme.sh` is a proof of concept that this approach is not only powerful but also strangely underutilized outside of tools like **Lazygit** and **Lazydocker**. This script showcases how lightweight and effective shell-driven execution can be in a modern text editor.

## Features

- **Acme-style execution in Helix** – Bringing interactive command execution to a modern modal editor without requiring a mouse.
- **Turns any text editor into an interactive workspace** – Not limited to Helix; works in any editor that supports piping.
- **A lightweight Jupyter alternative** – Create plain text, IPython-like files for quick and lightweight data manipulation.
- **Simple yet powerful** – Only ~30 lines of Bash, no dependencies except Bash.
- **Unix philosophy compliant** – Small, scriptable, and composable.
- **Reduces the need for a plugin system** – Enables a wide range of workflows in Helix **without requiring native plugins**.

## Installation

### Clone the Repo

```bash
git clone https://github.com/greek-cheese/akme.sh.git
cd akme.sh
chmod +x akme.sh
```

### Copy to the Plugins Folder

Move `akme.sh` to your Helix configuration or script folder:

```bash
mkdir -p ~/.config/helix/plugins
cp akme.sh ~/.config/helix/plugins/
```

### Remap Helix

#### Execute Selection & Open in Buffer

```toml
[keys.normal.space]
x = ":pipe ~/.config/helix/plugins/akme.sh"
o = "@y:o <C-r>\"<ret>" # Optional: Open files by path like in Acme
```

## Use Cases

- **Execute Bash commands inline** inside Helix.
- **Run code snippets** in Python, Node.js, Lua, or any interpreter.
- **Turn Markdown notes into interactive Jupyter-like notebooks**.
- **Quickly test shell scripts** without leaving your editor.
- **Format LaTeX formulas for better readability in plaintext & Markdown notes**:

  ````bash
  ```pandoc --from=latex --to=plain
  $y = ax^2 + bx + c$
  ```

  ```208 ms
  y = ax² + bx + c
  ```
  ````

- **Lightweight browsing & documentation fetching**:
  ```bash
  curl -sL "https://www.example.com" | pandoc -t plain
  ```
- **Search through notes with `grep` or `ripgrep`**:
  ```bash
  rg "search_term" ~/notes
  ```

## Future Features

- **Persistent session mode (`--session`)** using `tmux` to maintain REPL state across executions.

## Contribution

Contributions are welcome! Feel free to submit issues, feature requests, or pull requests.

## License

MIT License. See `LICENSE` file for details.


