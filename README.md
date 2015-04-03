# equate
Simple wrapper rsync to ease two-way syncing (and get notified via Notification Center!).

## Installation

```Bash
# Install required gem
gem install thor
# Clone repository
git clone https://github.com/vikjam/equate.git
# Change directory to repository
cd equate
# Use thor to install for system use
thor install equate.thor
```

## Usage
```Bash
# Push files to remote server
thor equate push "Scripts"
# Grab files from remote server
thor equate pull "Tables"
```

## Update
```Bash
# Change directory to git repository
cd equate
# Pull updates
git pull
# Reinstall equate for command line use
thor install equate
```

## Shortcut
Add ``alias te='thor equate'`` to your ``.bash_profile`` or ``.bashrc`` file to save some keystrokes.
