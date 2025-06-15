FROM ubuntu:24.04

# התקנת bash (במקרה שאין)
RUN apt-get update && apt-get install -y bash

# העתקת הסקריפט לתוך התמונה
COPY print_time.sh /usr/local/bin/print_time.sh

# מתן הרשאות ריצה לסקריפט
RUN chmod +x /usr/local/bin/print_time.sh

# ברירת מחדל: לא להפעיל כלום, הפעלת הסקריפט נעשית בקובץ ה-K8s
CMD ["/user/local/bin/print_time.sh"]
