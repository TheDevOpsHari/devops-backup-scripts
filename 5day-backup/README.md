# 🔐 5-Day Backup Rotation Script

This is my personal **shell script** for backup automation.  
The script creates a backup whenever it is run, keeps backups for **5 days**, and automatically removes older backups.  

I built this for **real-world use cases** where DevOps engineers, sysadmins, or even developers need a simple and reliable backup rotation system.  

---

## 📂 Files in this Project

- `backup_5days.sh` → Main backup script  
- `README.md` → Documentation and usage guide  

---

## ⚙️ Features

- ✅ Creates compressed `.tar.gz` backups  
- ✅ Keeps backups only for the last **5 days**  
- ✅ Automatically deletes older backups  
- ✅ Shows step-by-step log messages while running  
- ✅ Can be automated with cron jobs  
- ✅ Simple to customize for any project  

---

## 🚀 How to Use

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

By default, backups will be stored in `/mnt/backup/` with names like:  
```
backup_2025-09-09.tar.gz
```

---

## 🕒 Automating with Cron

To run the script automatically **every 5 days at 2 AM**, set up a cron job:  

```bash
crontab -e
```

Add this line:  
```bash
0 2 */5 * * /path/to/backup_5days.sh >> /var/log/backup.log 2>&1
```

Explanation:  
- `0 2 */5 * *` → Runs every 5 days at 2:00 AM  
- `>> /var/log/backup.log 2>&1` → Saves logs and errors into `/var/log/backup.log`  

---

## 🔧 Customization Options

- **SOURCE** → Change the directory to back up (default: `/home`)  
- **DEST** → Change the destination folder for backups (default: `/mnt/backup`)  
- **Retention Days** → Edit `-mtime +5` to keep backups for more or fewer days  

---

## 🧪 Example Run

When the script runs, the output looks like this:  

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

## 📘 Where This Script is Useful

- Backing up application logs  
- Backing up database dumps  
- Backing up user data/configs  
- Lightweight servers where complex backup tools aren’t needed  

In production environments, the backup destination (`DEST`) can be:  
- An NFS mount  
- AWS EBS volume  
- AWS S3 bucket (with `aws s3 cp`)  

---

## 🤝 Contributing

If you’d like to improve this project:  
1. Fork the repo  
2. Create a feature branch  
3. Commit your changes  
4. Push to your branch  
5. Open a Pull Request  

---

## 📝 License

MIT License
