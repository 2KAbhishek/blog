+++
title = "Fix MySQL Daemon startup #Fixit 01 🛠️🕵️"
date = 2020-08-28T11:54:00+05:30
tags = ["webdev","database","linux","tutorial"]
+++

## Problem

Brief: MySQL daemon fails to start

Details: So, I recently installed MariaDB (Community fork of MySQL) on my Manjaro system and when I started the system with: sudo systemctl start mysqld

This is the error I get:

`Job for mariadb.service failed because the control process exited with error code.`

Let's look at `journalctl -xe`:

`A start job for unit mariadb.service has finished with a failure.`

Not very helpful, let's look at mysqld's status with: `systemctl status mysqld`

`InnoDB: The innodb\_system data file 'ibdata1' must be writable`

Ah, there's the culprit mysql doesn't have write access to this file.

## Solution

A quick look at the man page and after some google searches the solution I came up with was simple:

`sudo chmod -R 777 /var/lib/mysql`

If you are facing any issues while running `mysql\_secure\_installation`, you can run `mysql\_upgrade -u root` to fix the permission issues.

There we go, we have solved another problem, stay tuned for more FIxits. 🧑‍💻 🕵️
