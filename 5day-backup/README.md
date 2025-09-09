# 🔐 5-Day Backup Rotation Script

This repository contains a **shell script** that creates backups every time you run it, keeps them for **5 days**, and automatically removes older backups.  

It is designed for **real-world usage** by DevOps engineers, system administrators, and developers.  

---

## 📂 Files

- `backup_5days.sh` → The backup script  
- `README.md` → Documentation and usage instructions  

---

## ⚙️ Features

- ✅ Creates a compressed `.tar.gz` backup  
- ✅ Retains backups for only **5 days**  
- ✅ Automatically deletes older backups  
- ✅ Step-by-step log messages while running  
- ✅ Can be fully automated with cron jobs  
- ✅ Easy to customize for different projects  

---

## 🚀 Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/<your-username>/<your-repo-name>.git
cd <your-repo-name>
```

### 2. Make the Script Executable
```bash
chmod +x backup_5days.sh
```

### 3. Run the Script Manually
```bash
./backup_5days.sh
```

By default, backups will be created in `/mnt/backup/` and named like:  
```
backup_2025-09-09.tar.gz
```

---

## 🕒 Automation with Cron

To run the script automatically **every 5 days at 2 AM**, add a cron job:  

```bash
crontab -e
```

Add this line:  
```bash
0 2 */5 * * /path/to/backup_5days.sh >> /var/log/backup.log 2>&1
```

Explanation:  
- `0 2 */5 * *` → Run every 5 days at 2:00 AM  
- `>> /var/log/backup.log 2>&1` → Save logs and errors into `/var/log/backup.log`  

---

## 🔧 Customization

- **SOURCE** → Change the directory to back up (default: `/home`)  
- **DEST** → Change the backup destination (default: `/mnt/backup`)  
- **Retention Days** → Adjust `-mtime +5` in the script to keep backups for more or fewer days  

---

## 🧪 Example Output

When you run the script, the output will look like this:  

```
[INFO] Creating destination directory: /mnt/backup
[INFO] Creating backup from /home to /mnt/backup/backup_2025-09-09.tar.gz
[SUCCESS] Backup created successfully → /mnt/backup/backup_2025-09-09.tar.gz
[INFO] Removing backups older than 5 days...
[SUCCESS] Old backups cleanup completed
[INFO] Current backups in /mnt/backup:
-rw-r--r-- 1 root root 24M Sep  5 02:00 backup_2025-09-05.tar.gz
-rw-r--r-- 1 root root 24M Sep  9 02:00 backup_2025-09-09.tar.gz
```

---

## 📘 Real-World Use Cases

- Backup application logs  
- Backup database dumps  
- Backup user data or configs  
- Rotate backups on a lightweight server  

In production, you can point the destination (`DEST`) to:  
- An NFS mount  
- AWS EBS volume  
- AWS S3 bucket (with `aws s3 cp`)  

---

## 🤝 Contribution

1. Fork this repository  
2. Create a feature branch  
3. Commit your changes  
4. Push to your branch  
5. Open a Pull Request  

---

## 📝 License

MIT License
