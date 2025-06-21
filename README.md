# ☁️ Cloud9 SDK Auto Installer for Ubuntu VPS

This is a simple shell script to automatically install the **legacy Cloud9 SDK** on an Ubuntu VPS. It sets up all required dependencies, downloads the Cloud9 source code, installs it, and starts the IDE using `screen`.

> ⚠️ Warning: This is the old self-hosted version of Cloud9 (no longer maintained). Use only for personal or private server use.

---

## 📋 Features

- Installs Cloud9 SDK automatically
- Installs all required packages (Node.js, npm, Python 2, etc.)
- Runs Cloud9 IDE on port `8080`
- Uses `screen` to keep Cloud9 running in the background
- No login required by default (you can enable it)

---

## 🚀 Installation

### 1. Download the Script

Clone or download this repo, or create a file named `install-c9.sh` with the following content:

```bash
#!/bin/bash
# Simple script to install Cloud9 on an Ubuntu Server

apt-get update && apt-get install build-essential -y
apt-get install git -y
apt-get install nodejs -y
apt-get install npm -y
apt-get install python2.7 python-pip -y

git clone https://github.com/c9/core.git c9sdk
c9sdk/scripts/install-sdk.sh

screen nodejs c9sdk/server.js -p 8080 -a :
```

### 2. Run the Script

```bash
chmod +x install-c9.sh
./install-c9.sh
```

---

## 🌐 Accessing Cloud9

After installation, open your browser and go to:

```
http://<your-vps-ip>:8080
```

The IDE is running inside a `screen` session. You can detach and reattach using:

```bash
screen -r
```
---

## 🔐 Enabling Authentication (Optional)

To require a login (replace `youruser:yourpass` with your credentials):

```bash
screen nodejs c9sdk/server.js -p 8080 -a youruser:yourpass
```

---

## 🧠 Tips

- To run Cloud9 in a specific project directory:
  ```bash
  screen nodejs c9sdk/server.js -p 8080 -a : -w /path/to/your/project
  ```

- To keep Cloud9 running after logout, just detach from the screen session:
  ```
  Ctrl+A then press D
  ```

---

## ✅ Tested On

- Ubuntu 20.04 / 22.04 (64-bit)
- 1 GB RAM VPS minimum
- Basic cloud servers (DigitalOcean, Vultr, etc.)

---

## ⚠️ Disclaimer

This version of Cloud9 is **no longer supported** by AWS or the original developers. It may not be secure for internet-facing deployment without additional security layers like NGINX, SSL, or firewall rules.

---

## 🛠 Maintainer

Donal  
Feel free to modify, improve, and share.
