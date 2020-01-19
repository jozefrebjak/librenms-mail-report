## How to get this work 

* You will be need to have installed and configured SSMTP and RaymiiOrg's python scipt.
* After that you can run BASH script to send HTML Email with informations about open alerts in LibreNMS.
* For HTML Email I am using little bit edited [Free Responsive Simple HTML Email Template] (https://github.com/leemunroe/responsive-html-email-template)

# Installation of this stack

```
cd /opt
git clone https://github.com/jozefrebjak/librenms-mail-report.git
cd librenms-mail-report
mkdir api-report && mkdir full-mail
````

* When you have installed all what is needed you can run Bash script to send Email

```
./send-mail-report.sh
```

## Dependencies 

# SSMTP

* Install SSMTP (Ubuntu 18)

```
apt install -y ssmtp
```

* Edit configuration for SSMTP

```
echo "">/etc/ssmtp/ssmtp.conf
nano /etc/ssmtp/ssmtp.conf
````

* Paste and edit configuration (Office 365 Example)

```
root=<RCPT_EMAIL>
mailhub=smtp.office365.com:587
AuthUser=<OFFICE365_EMAIL>
AuthPass=<OFFICE365_PASSWORD>
UseTLS=YES
UseSTARTTLS=YES
```

* Edit aditional configuration 

```
nano /etc/ssmtp/revaliases:
````

* Add your configuration

```
root:<OFFICE365_EMAIL>:smtp.office365.com:587
```

# RaymiiOrg's python script

This script talks to the LibreNMS API to receive a list of down devices and alerts. The LibreNMS dashboard provides widgets for alerts and host statusses, but there is no easy way to access that output via the API. Using Python I was able to get certain information and output it as HTML or text using PrettyTable. It can be included in other systems or be used in a chain of monitoring customizations.

# [More information here](https://raymii.org/s/software/Python_script_to_talk_to_LibreNMS_API_and_get_alerts_and_hosts.html)

### Installation

On Ubuntu 18.04 with default pvthon3 you need to install `prettytable`:

	sudo apt install python3-prettytable

On Ubuntu prior version if you want to install python3:

	sudo apt install python3-prettytable python3

On Ubuntu prior version if you want to install python2:

	sudo apt install python-prettytable python-requests python

### Usage

Add your API token in the script and change the API URL:

```
auth_token = "API_TOKEN"
api_url = "https://LIBRENMS_URL/api/v0/"
```

Run the script:

```
python ./open_alerts.py
```