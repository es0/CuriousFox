#!/bin/bash
#
#
scriptStart=`date +%s`
#
# Network scanner version 0.1
# by. es07er1k
#

echo -e "\e[1mWELCOME"
echo ""

#Make the directories
mkdir -p ~/.curious_fox/scan/services/
mkdir -p ~/.curious_fox/scan/windows/
mkdir -p ~/.curious_fox/scan/windows/smb_enum
mkdir -p ~/.curious_fox/scan/windows/smb_vuln
mkdir -p ~/.curious_fox/scan/sunrpc/
mkdir -p ~/.curious_fox/scan/telnet/
mkdir -p ~/.curious_fox/scan/ftp/
mkdir -p ~/.curious_fox/scan/ftp/ftp-anon/
mkdir -p ~/.curious_fox/scan/printers/
mkdir -p ~/.curious_fox/scan/mssql_databases/
mkdir -p ~/.curious_fox/scan/oracle_databases/
mkdir -p ~/.curious_fox/scan/mysql_databases/
mkdir -p ~/.curious_fox/scan/http-https/
mkdir -p ~/.curious_fox/scan/http-https/enum/
mkdir -p ~/.curious_fox/scan/http-https/enum/nikto
mkdir -p ~/.curious_fox/scan/http-https/enum/burp
mkdir -p ~/.curious_fox/scan/http-https/enum/zap/
mkdir -p ~/.curious_fox/scan/http-https/enum/uniscan/
mkdir -p ~/.curious_fox/scan/http-https/enum/nse/
mkdir -p ~/.curious_fox/scan/http-https/enum/sql-injection/
mkdir -p ~/.curious_fox/scan/http-https/enum/XSS/
mkdir -p ~/.curious_fox/scan/http-https/enum/XXE/
mkdir -p ~/.curious_fox/scan/http-https/enum/SHELLSHOCK/
mkdir -p ~/.curious_fox/scan/snmp/enum/




echo ""
echo -e "Starting basic services scanning...."
echo ""
##########################################
#     SCAN FOR WINDOWS HOSTS
#
##########################################
echo -e "\e[33m[+] SCANNING for Windows hosts "
nmap 10.11.1.1/24 -p445,139 -T4 --min-hostgroup 200 -sS -sU -O -oG - | grep "open" | cut -d" " -f 2 >> ~/.curious_fox/scan/services/windows_hosts
echo -e "\e[32m[+] DONE!"

##########################################
#     SCAN FOR SSH HOSTS
#
##########################################
echo -e "\e[33m[+] SCANNING for SSH hosts "
nmap 10.11.1.1/24 -p22 -T4 --min-hostgroup 200 -sS -sU -O -oG - | grep "open" | cut -d" " -f 2 >> ~/.curious_fox/scan/services/ssh_hosts
echo -e "\e[32m[+] DONE!"


##########################################
#     SCAN FOR FTP HOSTS
#
##########################################
echo -e "\e[33m[+] SCANNING for FTP hosts "
nmap 10.11.1.1/24 -p21 -T4 --min-hostgroup 200 -sS -sU -O -oG - | grep "open" | cut -d" " -f 2 >> ~/.curious_fox/scan/services/ftp_hosts
echo -e "\e[32m[+] DONE!"

##########################################
#     SCAN FOR TELNET HOSTS
#
##########################################
echo -e "\e[33m[+] SCANNING for telnet hosts "
nmap 10.11.1.1/24 -p23 -T4 --min-hostgroup 200 -sS -sU -O -oG - | grep "open" | cut -d" " -f 2 >> ~/.curious_fox/scan/services/telnet_hosts
echo -e "\e[32m[+] DONE!"

##########################################
#     SCAN FOR SunRPC HOSTS
#
##########################################
echo -e "\e[33m[+] SCANNING for SunRPC hosts "
nmap 10.11.1.1/24 -p111 -T4 --min-hostgroup 200 -sS -sU -O -oG - | grep "open" | cut -d" " -f 2 >> ~/.curious_fox/scan/services/rpc_hosts
echo -e "\e[32m[+] DONE!"

##########################################
#     SCAN FOR PRINTERS
#
##########################################
echo -e "\e[33m[+] SCANNING for printers "
nmap 10.11.1.1/24 -p631,9100 -T4 --min-hostgroup 200 -sS -sU -O -oG - | grep "open" | cut -d" " -f 2 >> ~/.curious_fox/scan/services/printers
echo -e "\e[32m[+] DONE!"

##########################################
#     SCAN FOR RDP HOSTS
#
##########################################
echo -e "\e[33m[+] SCANNING for RDP hosts "
nmap 10.11.1.1/24 -p3389 -T4 --min-hostgroup 200 -sS -sU -O -oG - | grep "open" | cut -d" " -f 2 >> ~/.curious_fox/scan/services/rdp_hosts
echo -e "\e[32m[+] DONE!"

##########################################
#     SCAN FOR SMTP HOSTS
#
##########################################
echo -e "\e[33m[+] SCANNING for SMTP hosts "
nmap 10.11.1.1/24 -p25 -T4 --min-hostgroup 200 -sS -sU -O -oG - | grep "open" | cut -d" " -f 2 >> ~/.curious_fox/scan/services/smtp_hosts
echo -e "\e[32m[+] DONE!"


##########################################
#     SCAN FOR HTTP/HTTPS HOSTS
#
##########################################
echo -e "\e[33m[+] SCANNING for HTTP/HTTPS hosts "
nmap 10.11.1.1/24 -p80,443,8080,8000 -T4 --min-hostgroup 200 -sS -sU -O -oG - | grep "open" | grep "http" | cut -d" " -f 2 >> ~/.curious_fox/scan/services/http_hosts
echo -e "\e[32m[+] DONE!"

##########################################
#     SCAN FOR SNMP HOSTS
#
##########################################
echo -e "\e[33m[+] SCANNING for SNMP hosts "
nmap 10.11.1.1/24 -p161 -T4 --min-hostgroup 200 -sS -sU -O -oG - | grep "open" |cut -d" " -f 2 >> ~/.curious_fox/scan/services/snmp_hosts
echo -e "\e[32m[+] DONE!"

##########################################
#     SCAN FOR SNMP HOSTS
#
##########################################
echo -e "\e[33m[+] SCANNING for SNMP hosts "
nmap 10.11.1.1/24 -p161 -T4 --min-hostgroup 200 -sS -sU -O -oG - | grep "open" |cut -d" " -f 2 >> ~/.curious_fox/scan/services/snmp_hosts
echo -e "\e[32m[+] DONE!"




###########################################
#   FINDING DATABASES!
#
#
###########################################
echo -e "\e[34m### SCANNING DATABASES ###"

##########################################
#     SCAN FOR MSSQL HOSTS
#
##########################################
echo -e "\e[33m[+] SCANNING for MSSQL hosts "
nmap 10.11.1.1/24 -p1433 -T4 --min-hostgroup 200 -sS -sU -O -oG - | grep "open" | cut -d" " -f 2 >> ~/.curious_fox/scan/services/mssql_hosts
echo -e "\e[32m[+] DONE!"

##########################################
#     SCAN FOR ORACLE HOSTS
#
##########################################
echo -e "\e[33m[+] SCANNING for ORACLE hosts "
nmap 10.11.1.1/24 -p1521 -T4 --min-hostgroup 200 -sS -sU -O -oG - | grep "open" | cut -d" " -f 2 >> ~/.curious_fox/scan/services/oracle_hosts
echo -e "\e[32m[+] DONE!"

##########################################
#     SCAN FOR MYSQL HOSTS
#
##########################################
echo -e "\e[33m[+] SCANNING for MYSQL hosts "
nmap 10.11.1.1/24 -p3306 -T4 --min-hostgroup 200 -sS -sU -O -oG - | grep "open" | cut -d" " -f 2 >> ~/.curious_fox/scan/services/mysql_hosts
echo -e "\e[32m[+] DONE!"



#############################################
#############################################
#       NMAP NSE ENUMERATION FOR SERVICES
#
#############################################
#############################################



echo -e "\e[36m[i] LETS DIG DEEPER \n[+] Enumerate with NSE on services..."

#
# SMB
#

echo -e "\e[33m[+] Enumerating SMB for hosts. This could take a while."
# smb-enum NSE
for x in `cat ~/.curious_fox/scan/services/windows_hosts` ;do echo -e "\e[31m[i] Enumerating smb info on $x";  nmap -T4 -sU -sT -p 139,445 --script=smb-enum-* --script-args=unsafe=1 $x  > ~/.curious_fox/scan/windows/smb_enum/$x ; done
# smb-vuln NSE
for x in `cat ~/.curious_fox/scan/services/windows_hosts` ;do echo -e "\e[31m[!] Checking smb vulns on $x";  nmap -T4 -sU -sT -p 139,445 --script=smb-vuln-* --script-args=unsafe=1 $x  > ~/.curious_fox/scan/windows/smb_vuln/$x ; done
echo -e "\e[32m[+] Done enumerating SMB!"


#
# SSH
#

echo -e "\e[33m[+] Enumerating SSH on hosts."
#for x in `cat ~/.curious_fox/scan/services/ssh_hosts` ;do echo -e "\e[31m[i] Enumerating SSH info on $x";  nmap -T4 -sU -sT -p 22 --script=ssh* --script-args=unsafe=1 $x  > ~/.curious_fox/scan/ssh/$x ; done

echo -e "\e[32m[+] Done enumerating SSH!"



#
# FTP
#

echo -e "\e[33m[+] Enumerating FTP services and info."
echo -e "\e[33m[+] Enumerating ftp anonymous logins."
for x in `cat ~/.curious_fox/scan/services/ftp_hosts` ;do echo -e "\e[31m[i] Enumerating FTP anon login on $x";  nmap -T4 -sU -sT --script=ftp-anon $x > ~/.curious_fox/scan/ftp/ftp-anon/$x ; done

echo -e "\e[32m[+] Done enumerating FTP!"



#
# SMTP
#

echo -e "\e[33m[+] Enumerating SMTP on hosts."
for x in `cat ~/.curious_fox/scan/services/smtp_hosts` ;do echo -e "\e[31m[i] Enumerating SMTP info on $x";  nmap -T4 -sU -sT --script=smtp-vuln-*,smtp-commands,dmtp-enum-users $x > ~/.curious_fox/scan/telnet/$x ; done

echo -e "\e[32m[+] Done enumerating SMTP!"


#
# SSH
#

echo -e "\e[33m[+] Enumerating ssh on hosts."
#for x in `cat ~/.curious_fox/scan/services/telnet_hosts` ;do echo -e "\e[31m[i] Enumerating SSH #info on $x";  nmap -sV -T4 -sU -sT --script=telnet-* $x > ~/.curious_fox/

echo -e "\e[32m[+] Done enumerating ssh!"


#
# RDP
#

echo -e "\e[33m[+] Enumerating Remote Desktop."

echo "TO DO!!"

echo -e "\e[32m[+] Done enumerating RDP hosts"



#
# HTTP (web)
#

echo -e "\e[33m[+] Enumerating HTTP/HTTPS on hosts."
#for x in `cat ~/.curious_fox/scan/services/http_hosts` ;do echo -e "\e[31m[i] Enumerating HTTP info on $x";  nmap -T4 -sU -sT --script=http-enum,http-shellshock,http-rfi-spider,http-php-version,http-methods,http-sql-injection,http-vuln*,http-wordpress-enum,http-webdav-scan,http-drupal-enum,http-dombased-xss $x > ~/.curious_fox/scan/http-https/enum/$x ; done

echo -e "\e[32m[+] Done enumerating HTTP/HTTPS!"


#
# SNMP
#

echo -e "\e[33m[+] Enumerating SNMP on hosts."
#for x in `cat ~/.curious_fox/scan/services/snmp_hosts` ;do echo -e "\e[31m[i] Enumerating SNMP info on $x";  nmap -F -T4 -sU -sT --script=snmp-info,snmp-interfaces,snmp-netstat,snmp-processes,snmp-sysdescr,snmp-win32-services,snmp-win32-shares,snmp-win32-software,snmp-win32-users $x > ~/.curious_fox/scan/snmp/enum/$x ; done

echo -e "\e[32m[+] Done enumerating SNMP!"


echo -e "\e[32m######## DONE RUNNING NSE ENUMERATION ########"


#############################################
#
#    SCAN WEB SERVERS HTTP for VULNS and INFO
#
#		WEB SCAN OWASP TOP 10
#
##############################################
echo -e "\e[36m[i] LETS DIG DEEPER \n[+] Enumerate HTTP/HTTPS With various scanners..."

#
# HTTP NIKTO
#

for x in `cat ~/.curious_fox/scan/services/http_hosts` ;do echo -e "\e[31m[i] Enumerating http info on $x with nikto";nikto -host $x --output ~/.curious_fox/scan/http-https/enum/nikto/$x -Format html; done


#
# HTTP Burp or zap
#


#
# SQL Injection Scan using sqlmap
#

#
# Run UNISCAN (Check LFI,RFI,and RCE)
#
#for x in `cat ~/.curious_fox/scan/services/http_hosts` ;do echo -e "\e[31m[i] Enumerating http info #on $x with uniscan";  uniscan -u $x -qwedsgj > ~/.curious_fox/scan/http-https/enum/uniscan/$x


#
# XSS
#

echo " "
echo " "
scriptEnd=`date +%s`
scriptRuntime=$(((scriptEnd - scriptStart) / 60))
echo -e "\e[32m[!] Finished running in $scriptRuntime minutes"
echo "Done, now check your results."
