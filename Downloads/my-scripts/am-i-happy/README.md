# 😊 Am-I-Happy?

A simple daily self-reflection script that pops up every day at 9:30 PM and asks:

> **“Are you happy?”** → Yes/No  
> **“What did you do today?”** → Notes ✍️  

Your response is automatically saved to a monthly Markdown file like:
	- am-i-happy/
	- └── 2025/
	- ├── happiness_log_aug25.md
	- └── happiness_log_sep25.md
-
	- ## 🔧 Dependencies
	  
	  Install the required packages on Arch Linux:
	  
	  ```bash
	  sudo pacman -S zenity cronie
	  ```
- | Package | Why ||
- | `zenity` | Create GUI popup windows (Yes/No + text input) |
- | `cronie` | Provides `cron` job scheduler to run the script automatically |
-
	- ## ⚙️ Automate with Cronie (cron)
	  
	  Use `cronie` to run the script every day at **9:30 PM**.
	- ### 1. Enable cronie:
	  
	  ```bash
	  sudo systemctl enable --now cronie
	  ```
	- ### 2. Open your personal cron table:
	  
	  ```bash
	  EDITOR =nano crontab -e
	  ```
	-
	- ```bash
	  # ┌──────── minute (0 - 59)
	  # │ ┌────── hour (0 - 23)
	  # │ │ ┌──── day of month (1 - 31)
	  # │ │ │ ┌── month (1 - 12)
	  # │ │ │ │ ┌─ day of week (0 - 6) (Sunday=0)
	  # │ │ │ │ │
	  # │ │ │ │ │
	  # * * * * *  command-to-run
	  
	  ```
	-
	- ### 3. Add the following line at the bottom:
	  
	  ```bash
	  30 21 * * * $HOME/Downloads/am-i-happy/happy-check.sh
	  ```
	- This tells cron: run the script at **21:30 (9:30 PM)** every day.
	- Meaning:
	- `30` → minute = 30
	- `21` → hour = 21 (9 PM)
	- `*` → any day
	- `*` → any month
	- `*` → any weekday
	-
	-
	- ### 4. Check if it’s registered
	  
	  ```bash
	  crontab -l
	  ```
	- ## ✅ That’s it!
	  
	  Now you’ll get a daily popup that helps you reflect on your mood & productivity — and slowly build a personal happiness journal 📈✨
-