# 1. استفاده از تصویر پایه رسمی Python 3.12-slim
FROM python:3.12-slim

# 2. تنظیم دایرکتوری کاری درون کانتینر
WORKDIR /app

# 3. کپی کردن فایل requirements.txt به کانتینر
COPY requirements.txt .

# 4. نصب وابستگی‌های پایتون
RUN pip install --no-cache-dir -r requirements.txt

# 5. کپی کردن فایل app.py به کانتینر
COPY app.py .

# 6. تنظیم متغیر محیطی برای فایل خروجی CSV
ENV METRICS_LOG_FILE=docker_system_inference_metrics.csv

# 7. باز کردن پورت 5000
EXPOSE 5000

# 8. اجرای برنامه هنگام راه‌اندازی کانتینر
CMD ["python", "app.py"]

