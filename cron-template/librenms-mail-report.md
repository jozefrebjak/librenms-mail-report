* Open and add cron as you need it

```
nano /etc/crontab
```

* Send Email about open alerts every minute and save output to log with timestamp

```
* *     * * *   root    /opt/librenms-mail-report/send-mail-report.sh  > /opt/librenms-mail-report/log/`date +\%Y\%m\%d`-cron.log 2>&1
```

* Send Email about open alerts every day at 8:00 am and save output to log

```
0 8     * * *   root   /opt/librenms-mail-report/send-mail-report.sh  > /opt/librenms-mail-report/log/`dat+\%Y-\%d\-%m\-%H\:%M`-cron.log 2>&1
```

* After added cron please restart the cron

```
systemctl restart cron
```