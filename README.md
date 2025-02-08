# akme.sh

> **"The real solution was always here—just 30 lines of Bash."**

## **Description**

`akme.sh` is a **lightweight execution engine for Helix**, inspired by **Acme and Kakoune**. It brings **deep shell integration** to your editor, allowing you to **execute code, scripts, and commands inline—without plugins or external dependencies.**

### **Why does this matter?**

Many believe Helix "needs" plugins, but **what if the real solution isn’t plugins at all?**

Plugins add complexity, dependencies, and bloat. But **`akme.sh` proves that the shell itself is the best plugin system**—just like Acme did decades ago. **It’s lightweight, flexible, and seamlessly integrates into your workflow.**

> **Instead of waiting for plugins, you can start using the power of the shell—right now.**

## **Features**

- **Acme-style execution inside Helix** – Interactive execution without a mouse.
- **A universal plugin system** – Works in any editor that supports piping.
- **A lightweight Jupyter alternative** – Run Python, Bash, Lua, and more inside Markdown-like notebooks.
- **Simple, powerful, and Unix-native** – Just **~30 lines of Bash**, no dependencies.
- **Follows Unix philosophy** – Small, scriptable, composable.
- **Proves Helix is already extensible** – The shell **is** your plugin system.

## **Installation**

```bash
git clone https://github.com/greek-cheese/akme.sh.git
cd akme.sh
chmod +x akme.sh
```

Move `akme.sh` to your Helix configuration folder:

```bash
mkdir -p ~/.config/helix/plugins
cp akme.sh ~/.config/helix/plugins/
```

### **Remap Helix for Execution**

```toml
[keys.normal.space]
x = ":pipe ~/.config/helix/plugins/akme.sh"
o = "@y:o <C-r>\"<ret>" # Optional: Open files by path like in Acme
```

## **Use Cases – The Shell is the Plugin System**

Execute Bash commands inline – No need to switch to a terminal.

```bash
ls ~/notes/
todo.md
journal.md
projects.md
```

**Run code snippets** in **Python, Node.js, Lua, or any interpreter**—like Jupyter, but simpler.

````python3
```python3
for i in range(3):
    print(f"Hello, world {i}")
```

```12 ms
Hello, world 0
Hello, world 1
Hello, world 2
```
````


**Turn Markdown notes into interactive, Jupyter-like notebooks**.

````bash
curl -s "https://hacker-news.firebaseio.com/v0/item/37570000.json?print=pretty" | jq '.title, .url'
"Unix Philosophy: Why Less is More"
"https://example.com/unix-philosophy"
````

**Quickly test shell scripts without leaving your editor.**

````bash
```bash
find ~/notes -type f -name "*.md" | wc -l
```

```3 ms
2
```
````

**Format LaTeX formulas for better readability in plaintext & Markdown notes.**

````bash
```pandoc --from=latex --to=plain
$y = ax^2 + bx + c$
```

```521 ms
y = ax² + bx + c
```
````

**Fetch and summarize information inline.**

```bash
curl -s ipinfo.io/8.8.8.8
{
  "ip": "8.8.8.8",
  "hostname": "dns.google",
  "city": "Mountain View",
  "region": "California",
  "country": "US",
  "loc": "37.4056,-122.0775",
  "org": "AS15169 Google LLC",
  "postal": "94043",
  "timezone": "America/Los_Angeles",
  "readme": "https://ipinfo.io/missingauth",
  "anycast": true
}
```

## **Why This Matters**

Instead of **waiting for plugins**, you can start using the power of the shell **right now.**

Just like **Lazygit** and **Lazydocker** integrate with Helix, `akme.sh` takes this **to the next level**, making **Helix a truly interactive, Unix-native environment.**

- **If you’ve ever wanted an Acme-style experience inside Helix—this is it.**  
- **If you love Unix simplicity and raw execution power—this is for you.**  
- **If you think plugins add too much bloat—`akme.sh` proves you don’t need them.**

## **Future Roadmap**

- **Persistent session mode (`--session`)** – Keep an interactive REPL open using `tmux`.
- **More quality-of-life scripts** (e.g., `morning.sh`, `evening.sh`, `fetch-notes.sh`).
- **More seamless execution patterns** – Beyond piping, exploring **deeper integration.**

## **Contributing**

**Ideas, issues, and PRs are always welcome!**  
If you believe **Unix-style execution belongs in Helix**, join the discussion!

## **License**

MIT License. See `LICENSE` file for details.
