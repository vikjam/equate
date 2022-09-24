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
thor equate --remote "remote-name" --path "/prefix/path" pull "Tables"
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

## Shortcuts
Add ``alias te='thor equate'`` to your ``.bash_profile`` or ``.bashrc`` file to save some keystrokes.

You can create SSH keys to avoid entering your password each time. The folks over at Digital Ocean have a [good tutorial](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2). Just make sure you have your [permissions set correctly](http://unix.stackexchange.com/questions/36540/why-am-i-still-getting-a-password-prompt-with-ssh-with-public-key-authentication).

Finally, you can create a SSH config file to make it easier to SSH into your remote machine. Nerderati (and probably many others) have a [quick tutorial](http://nerderati.com/2011/03/17/simplify-your-life-with-an-ssh-config-file/) on this.

