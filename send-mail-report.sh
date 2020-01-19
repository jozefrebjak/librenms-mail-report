#!/bin/bash

############################
#   Author: Jozef Rebjak   #
#   Version: 1.0           #
############################

############################
#        VARIABLES         #
############################

# Recipient e-mail address
MAIL_ADDRESS="MAIl_ADDRESS"

############################
#         COMMANDS         #
############################

# Get status of network via LibreNMS API
python /opt/librenms-mail-report/librenms-api-report.py > /opt/librenms-mail-report/api-report/api-report-table.txt && \

# This will make full e-mail , which we want to send
cat /opt/librenms-mail-report/mail-template/start.txt /opt/librenms-mail-report/api-report/api-report-table.txt /opt/librenms-mail-report/mail-template/end.txt > /opt/librenms-mail-report/full-mail/librenms-mail-report.txt && \

# This will send mail to specified e-mail address 
ssmtp "$MAIL_ADDRESS" < /opt/librenms-mail-report/full-mail/librenms-mail-report.txt