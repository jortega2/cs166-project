Last login: Mon Mar  7 15:00:59 on ttys001
jortega@Juvenals-MBP ~ % ssh jorte057@bolt.cs.ucr.edu
jorte057@bolt.cs.ucr.edu's password: 
Last login: Mon Mar  7 15:01:08 2022 from cpe-76-95-18-206.socal.res.rr.com
~
jorte057@bolt $ ssh wch132-39
jorte057@wch132-39's password: 
Last failed login: Fri Mar  4 19:19:25 PST 2022 from bolt.cs.ucr.edu on ssh:notty
There were 2 failed login attempts since the last successful login.
Last login: Fri Mar  4 19:18:44 2022 from bolt.cs.ucr.edu

READ THIS!!!
============

* FILES ON THIS COMPUTER ARE DELETED WHEN YOU LOG OUT!

 > The "home directory" on this computer is in RAM.  It is EXTREMELY fast, but
   it is NOT your centrally stored CS home directory and it disappears when you
   log out!  Copy out any files you want to keep before you log out!!!

* HOW TO ACCESS YOUR CS HOME DIRECTORY AND FILES

 > IF you need to access your CS home directory and files (check with your TA
   for course-specific instructions), you can do so by connecting to server
   bolt.cs.ucr.edu using SSH for a command-line login session or SCP if you
   just need to copy files.

~
jorte057@wch132-39 $ git status
fatal: Not a git repository (or any parent up to mount point /home/csmajs/jorte057)
Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
~
jorte057@wch132-39 $ clear && pwd

/home/csmajs/jorte057
~
jorte057@wch132-39 $ ls
cs166-project.zip  VirtualBox VMs
~
jorte057@wch132-39 $ unzip cs166-project.zip 
Archive:  cs166-project.zip
   creating: cs166-project/
~
jorte057@wch132-39 $ unzip files.zip 
Archive:  files.zip
   creating: files/
~
jorte057@wch132-39 $ ls
cs166-project  cs166-project.zip  files  files.zip  VirtualBox VMs
~
jorte057@wch132-39 $ cd files/
~/files
jorte057@wch132-39 $ ls
~/files
jorte057@wch132-39 $ cd ..
~
jorte057@wch132-39 $ rm -rf files
~
jorte057@wch132-39 $ clear && ls

createPostgreDB.sh  cs166-project.zip  startPostgreSQL.sh  VirtualBox VMs
cs166-project       files.zip          stopPostgreDB.sh
~
jorte057@wch132-39 $ source ./startPostgreSQL.sh 
/tmp/jorte057
The files belonging to this database system will be owned by user "jorte057".
This user must also own the server process.

The database cluster will be initialized with locale "en_US.UTF-8".
The default database encoding has accordingly been set to "UTF8".
The default text search configuration will be set to "english".

fixing permissions on existing directory /tmp/jorte057/myDB/data ... ok
creating subdirectories ... ok
selecting default max_connections ... 100
selecting default shared_buffers ... 32MB
creating configuration files ... ok
creating template1 database in /tmp/jorte057/myDB/data/base/1 ... ok
initializing pg_authid ... ok
initializing dependencies ... ok
creating system views ... ok
loading system objects' descriptions ... ok
creating collations ... ok
creating conversions ... ok
creating dictionaries ... ok
setting privileges on built-in objects ... ok
creating information schema ... ok
loading PL/pgSQL server-side language ... ok
vacuuming database template1 ... ok
copying template1 to template0 ... ok
copying template1 to postgres ... ok

WARNING: enabling "trust" authentication for local connections
You can change this by editing pg_hba.conf or using the option -A, or
--auth-local and --auth-host, the next time you run initdb.

Success. You can now start the database server using:

    postgres -D /tmp/jorte057/myDB/data
or
    pg_ctl -D /tmp/jorte057/myDB/data -l logfile start

server starting
~
jorte057@wch132-39 $ source createPostgreDB.sh 
creating db named ... jorte057_DB
pg_ctl: server is running (PID: 7854)
/usr/bin/postgres "-D" "/tmp/jorte057/myDB/data" "-c" "unix_socket_directories=/tmp/jorte057/myDB/sockets" "-p" "8192"
~
jorte057@wch132-39 $ clear && ls

createPostgreDB.sh  cs166-project.zip  startPostgreSQL.sh  VirtualBox VMs
cs166-project       files.zip          stopPostgreDB.sh
~
jorte057@wch132-39 $ cd cs166-project/
~/cs166-project
jorte057@wch132-39 $ ls
~/cs166-project
jorte057@wch132-39 $ cd ..
~
jorte057@wch132-39 $ ls
createPostgreDB.sh  cs166-project.zip  startPostgreSQL.sh  VirtualBox VMs
cs166-project       files.zip          stopPostgreDB.sh
~
jorte057@wch132-39 $ rm -rf cs166-project.zip 
~
jorte057@wch132-39 $ rm -rf cs166-project/
~
jorte057@wch132-39 $ ls
createPostgreDB.sh  startPostgreSQL.sh  VirtualBox VMs
files.zip           stopPostgreDB.sh
~
jorte057@wch132-39 $ ls
createPostgreDB.sh  files.zip           stopPostgreDB.sh
cs166-project.zip   startPostgreSQL.sh  VirtualBox VMs
~
jorte057@wch132-39 $ unzip cs166-project.zip 
Archive:  cs166-project.zip
   creating: cs166-project/
~
jorte057@wch132-39 $ cd cs166-project/
~/cs166-project
jorte057@wch132-39 $ ls
~/cs166-project
jorte057@wch132-39 $ ls -f
.  ..
~/cs166-project
jorte057@wch132-39 $ cd ..
~
jorte057@wch132-39 $ ls
createPostgreDB.sh  cs166-project.zip  startPostgreSQL.sh  VirtualBox VMs
cs166-project       files.zip          stopPostgreDB.sh
~
jorte057@wch132-39 $ rm -rf cs166-project
~
jorte057@wch132-39 $ rm cs166-project.zip 
~
jorte057@wch132-39 $ git clone https://github.com/jortega2/cs166-project
Cloning into 'cs166-project'...
remote: Enumerating objects: 34, done.
remote: Counting objects: 100% (34/34), done.
remote: Compressing objects: 100% (24/24), done.
remote: Total 34 (delta 3), reused 33 (delta 2), pack-reused 0
Unpacking objects: 100% (34/34), done.
~
jorte057@wch132-39 $ ls
createPostgreDB.sh  files.zip           stopPostgreDB.sh
cs166-project       startPostgreSQL.sh  VirtualBox VMs
~
jorte057@wch132-39 $ clear

~
jorte057@wch132-39 $ cd cs166-project/
~/cs166-project
jorte057@wch132-39 $ ls
data  java  README.md  sql  todo
~/cs166-project
jorte057@wch132-39 $ cd ..
~
jorte057@wch132-39 $ cp cs166-project/data/*.csv /tmp/jorte057/myDB/data/
~
jorte057@wch132-39 $ psql -h localhost -p 8192 jorte057_DB < cs166-project/sql/src/
create_index.sql   create_tables.sql  load_data.sql      
~
jorte057@wch132-39 $ psql -h localhost -p 8192 jorte057_DB < cs166-project/sql/src/create_tables.sql 
ERROR:  table "work_expr" does not exist
ERROR:  table "educational_details" does not exist
ERROR:  table "message" does not exist
ERROR:  table "connection_usr" does not exist
ERROR:  table "usr" does not exist
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "usr_pkey" for table "usr"
CREATE TABLE
ERROR:  syntax error at or near ","
LINE 8:  PRIMARY KEY(userId,company,role,startDate)),
                                                    ^
ERROR:  syntax error at or near ","
LINE 8:  PRIMARY KEY(userId,major,degree)),
                                          ^
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "message_pkey" for table "message"
CREATE TABLE
ERROR:  syntax error at or near "FOREIGN"
LINE 1: FOREIGN KEY (senderId) REFERENCES USR(userId),
        ^
ERROR:  syntax error at or near ";"
LINE 6:  FOREIGN KEY (userId) REFERENCES USR;
                                            ^
~
jorte057@wch132-39 $ git pull
fatal: Not a git repository (or any parent up to mount point /home/csmajs/jorte057)
Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
~
jorte057@wch132-39 $ ls
createPostgreDB.sh  files.zip           stopPostgreDB.sh
cs166-project       startPostgreSQL.sh  VirtualBox VMs
~
jorte057@wch132-39 $ cd cs166-project/
~/cs166-project
jorte057@wch132-39 $ git pull
remote: Enumerating objects: 9, done.
remote: Counting objects: 100% (9/9), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 5 (delta 2), reused 5 (delta 2), pack-reused 0
Unpacking objects: 100% (5/5), done.
From https://github.com/jortega2/cs166-project
   65fc455..83351e5  main       -> origin/main
Updating 65fc455..83351e5
Fast-forward
 sql/src/create_tables.sql | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
~/cs166-project
jorte057@wch132-39 $ cd //
//
jorte057@wch132-39 $ cd ..
//
jorte057@wch132-39 $ ls
bin   class  etc    home  lib64       media  opt   root  sbin  sys  usr
boot  dev    extra  lib   lost+found  mnt    proc  run   srv   tmp  var
//
jorte057@wch132-39 $ cd ~
~
jorte057@wch132-39 $ ls
createPostgreDB.sh  files.zip           stopPostgreDB.sh
cs166-project       startPostgreSQL.sh  VirtualBox VMs
~
jorte057@wch132-39 $ cear 
-bash: cear: command not found
~
jorte057@wch132-39 $ clear

~
jorte057@wch132-39 $ psql -h localhost -p 8192 jorte057_DB < cs166-project/sql/src/create_tables.sql 
ERROR:  table "work_expr" does not exist
ERROR:  table "educational_details" does not exist
DROP TABLE
ERROR:  table "connection_usr" does not exist
DROP TABLE
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "usr_pkey" for table "usr"
CREATE TABLE
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "work_expr_pkey" for table "work_expr"
CREATE TABLE
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "educational_details_pkey" for table "educational_details"
CREATE TABLE
ERROR:  syntax error at or near ";"
LINE 9:  PRIMARY KEY(msgId);
                           ^
ERROR:  syntax error at or near ";"
LINE 6:  FOREIGN KEY (userId) REFERENCES USR;
                                            ^
~
jorte057@wch132-39 $ clear







































~
jorte057@wch132-39 $ ls
createPostgreDB.sh  files.zip           stopPostgreDB.sh
cs166-project       startPostgreSQL.sh  VirtualBox VMs
~
jorte057@wch132-39 $ ls
createPostgreDB.sh  files.zip           stopPostgreDB.sh
cs166-project       startPostgreSQL.sh  VirtualBox VMs
~
jorte057@wch132-39 $ cd cs166-project/
~/cs166-project
jorte057@wch132-39 $ git pull
remote: Enumerating objects: 9, done.
remote: Counting objects: 100% (9/9), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 5 (delta 2), reused 5 (delta 2), pack-reused 0
Unpacking objects: 100% (5/5), done.
From https://github.com/jortega2/cs166-project
   83351e5..a9d796e  main       -> origin/main
Updating 83351e5..a9d796e
Fast-forward
 sql/src/create_tables.sql | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
~/cs166-project
jorte057@wch132-39 $ cd ..
~
jorte057@wch132-39 $ psql -h localhost -p 8192 jorte057_DB < cs166-project/sql/src/create_tables.sql 
DROP TABLE
DROP TABLE
ERROR:  table "message" does not exist
ERROR:  table "connection_usr" does not exist
DROP TABLE
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "usr_pkey" for table "usr"
CREATE TABLE
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "work_expr_pkey" for table "work_expr"
CREATE TABLE
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "educational_details_pkey" for table "educational_details"
CREATE TABLE
ERROR:  syntax error at or near "FOREIGN"
LINE 10:  FOREIGN KEY (senderId) REFERENCES USR(userId),
          ^
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "connection_usr_pkey" for table "connection_usr"
CREATE TABLE
~
jorte057@wch132-39 $ clear














~
jorte057@wch132-39 $ ls
createPostgreDB.sh  files.zip           stopPostgreDB.sh
cs166-project       startPostgreSQL.sh  VirtualBox VMs
~
jorte057@wch132-39 $ cd cs166-project/
~/cs166-project
jorte057@wch132-39 $ git pull
Already up-to-date.
~/cs166-project
jorte057@wch132-39 $ cd ..
~
jorte057@wch132-39 $ psql -h localhost -p 8192 jorte057_DB < cs166-project/sql/src/create_tables.sql 
DROP TABLE
DROP TABLE
ERROR:  table "message" does not exist
DROP TABLE
DROP TABLE
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "usr_pkey" for table "usr"
CREATE TABLE
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "work_expr_pkey" for table "work_expr"
CREATE TABLE
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "educational_details_pkey" for table "educational_details"
CREATE TABLE
ERROR:  syntax error at or near "FOREIGN"
LINE 10:  FOREIGN KEY (senderId) REFERENCES USR(userId),
          ^
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "connection_usr_pkey" for table "connection_usr"
CREATE TABLE
~
jorte057@wch132-39 $ git pull
fatal: Not a git repository (or any parent up to mount point /home/csmajs/jorte057)
Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
~
jorte057@wch132-39 $ cd cs166-project/
~/cs166-project
jorte057@wch132-39 $ git pull
Already up-to-date.
~/cs166-project
jorte057@wch132-39 $ ls
data  java  README.md  sql  todo
~/cs166-project
jorte057@wch132-39 $ ls
data  java  README.md  sql  todo
~/cs166-project
jorte057@wch132-39 $ vim sql/src/
create_index.sql   create_tables.sql  load_data.sql      
~/cs166-project
jorte057@wch132-39 $ vim sql/src/create_tables.sql 
~/cs166-project
jorte057@wch132-39 $ cd ..
~
jorte057@wch132-39 $ ls
createPostgreDB.sh  files.zip           stopPostgreDB.sh
cs166-project       startPostgreSQL.sh  VirtualBox VMs
~
jorte057@wch132-39 $ psql -h localhost -p 8192 jorte057_DB < cs166-project/sql/src/create_tables.sql 
DROP TABLE
DROP TABLE
ERROR:  table "message" does not exist
DROP TABLE
DROP TABLE
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "usr_pkey" for table "usr"
CREATE TABLE
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "work_expr_pkey" for table "work_expr"
CREATE TABLE
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "educational_details_pkey" for table "educational_details"
CREATE TABLE
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "message_pkey" for table "message"
CREATE TABLE
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "connection_usr_pkey" for table "connection_usr"
CREATE TABLE
~
jorte057@wch132-39 $ psql -h localhost -p 8192 jorte057_DB < cs166-project/sql/src/load_data.sql 
ERROR:  could not open file "../../data/usr.csv" for reading: No such file or directory
ERROR:  syntax error at or near ")"
LINE 5:     )
            ^
ERROR:  could not open file "../../data/Edu_det.csv" for reading: No such file or directory
ERROR:  could not open file "../../data/Message.csv" for reading: No such file or directory
ERROR:  could not open file "../../data/work_ex.csv" for reading: No such file or directory
~
jorte057@wch132-39 $ vim cs166-project/sql/src/load_data.sql 
~
jorte057@wch132-39 $ psql -h localhost -p 8192 jorte057_DB < cs166-project/sql/src/load_data.sql 
ERROR:  could not open file "cs166-project/data/usr.csv" for reading: No such file or directory
ERROR:  syntax error at or near ")"
LINE 5:     )
            ^
ERROR:  could not open file "../../data/Edu_det.csv" for reading: No such file or directory
ERROR:  could not open file "../../data/Message.csv" for reading: No such file or directory
ERROR:  could not open file "../../data/work_ex.csv" for reading: No such file or directory
~
jorte057@wch132-39 $ ls
createPostgreDB.sh  files.zip           stopPostgreDB.sh
cs166-project       startPostgreSQL.sh  VirtualBox VMs
~
jorte057@wch132-39 $ vim cs166-project/data/
~
jorte057@wch132-39 $ vim cs166-project/sql/src/load_data.sql 
~
jorte057@wch132-39 $ psql -h localhost -p 8192 jorte057_DB < cs166-project/sql/src/load_data.sql 
ERROR:  invalid input syntax for type date: "dateofbirth"
CONTEXT:  COPY usr, line 1, column dateofbirth: "dateofbirth"
ERROR:  syntax error at or near ")"
LINE 5:     )
            ^
ERROR:  invalid input syntax for type date: "startdate"
CONTEXT:  COPY educational_details, line 1, column startdate: "startdate"
ERROR:  could not open file "data/Message.csv" for reading: No such file or directory
ERROR:  could not open file "data/work_ex.csv" for reading: No such file or directory
~
jorte057@wch132-39 $ clear

~
jorte057@wch132-39 $ psql -h localhost -p 8192 jorte057_DB < cs166-project/sql/src/load_data.sql 
ERROR:  invalid input syntax for type date: "dateofbirth"
CONTEXT:  COPY usr, line 1, column dateofbirth: "dateofbirth"
ERROR:  syntax error at or near ")"
LINE 5:     )
            ^
ERROR:  invalid input syntax for type date: "startdate"
CONTEXT:  COPY educational_details, line 1, column startdate: "startdate"
ERROR:  could not open file "data/Message.csv" for reading: No such file or directory
ERROR:  could not open file "data/work_ex.csv" for reading: No such file or directory
~
jorte057@wch132-39 $ vim cs166-project/sql/src/load_data.sql 
~
jorte057@wch132-39 $ clear
















































~
jorte057@wch132-39 $ psql -h localhost -p 8192 jorte057_DB < cs166-project/sql/src/load_data.sql 
ERROR:  invalid input syntax for type date: "dateofbirth"
CONTEXT:  COPY usr, line 1, column dateofbirth: "dateofbirth"
ERROR:  syntax error at or near ")"
LINE 5:     )
            ^
ERROR:  invalid input syntax for type date: "startdate"
CONTEXT:  COPY educational_details, line 1, column startdate: "startdate"
ERROR:  invalid input syntax for integer: "﻿messageid"
CONTEXT:  COPY message, line 1, column msgid: "﻿messageid"
ERROR:  invalid input syntax for type date: "startDate"
CONTEXT:  COPY work_expr, line 1, column startdate: "startDate"
~
jorte057@wch132-39 $ ls
createPostgreDB.sh  cs166-project  files.zip  startPostgreSQL.sh  stopPostgreDB.sh  VirtualBox VMs
~
jorte057@wch132-39 $ vim cs166-project/data/usr.csv 
~
jorte057@wch132-39 $ psql -h localhost -p 8192 jorte057_DB < cs166-project/sql/src/load_data.sql 
ERROR:  invalid input syntax for type date: "dateofbirth"
CONTEXT:  COPY usr, line 1, column dateofbirth: "dateofbirth"
ERROR:  syntax error at or near ")"
LINE 5:     )
            ^
ERROR:  invalid input syntax for type date: "startdate"
CONTEXT:  COPY educational_details, line 1, column startdate: "startdate"
ERROR:  invalid input syntax for integer: "﻿messageid"
CONTEXT:  COPY message, line 1, column msgid: "﻿messageid"
ERROR:  invalid input syntax for type date: "startDate"
CONTEXT:  COPY work_expr, line 1, column startdate: "startDate"
~
jorte057@wch132-39 $ vim cs166-project/data/usr.csv 
~
jorte057@wch132-39 $ vim cs166-project/data/usr.csv 
~
jorte057@wch132-39 $ vim cs166-project/sql/src/load_data.sql 
~
jorte057@wch132-39 $ clear
























~
jorte057@wch132-39 $ psql -h localhost -p 8192 jorte057_DB < cs166-project/sql/src/load_data.sql 
ERROR:  invalid input syntax for type date: "dateofbirth"
CONTEXT:  COPY usr, line 1, column dateofbirth: "dateofbirth"
ERROR:  value too long for type character(10)
CONTEXT:  COPY connection_usr, line 1, column connectionid: "connectionid"
ERROR:  invalid input syntax for type date: "startdate"
CONTEXT:  COPY educational_details, line 1, column startdate: "startdate"
ERROR:  invalid input syntax for integer: "﻿messageid"
CONTEXT:  COPY message, line 1, column msgid: "﻿messageid"
ERROR:  invalid input syntax for type date: "startDate"
CONTEXT:  COPY work_expr, line 1, column startdate: "startDate"
~
jorte057@wch132-39 $ vim cs166-project/sql/src/load_data.sql 
~
jorte057@wch132-39 $ git status
fatal: Not a git repository (or any parent up to mount point /home/csmajs/jorte057)
Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
~
jorte057@wch132-39 $ cd cs166-project/
~/cs166-project
jorte057@wch132-39 $ git status
# On branch main
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   data/usr.csv
#	modified:   sql/src/create_tables.sql
#	modified:   sql/src/load_data.sql
#
no changes added to commit (use "git add" and/or "git commit -a")
~/cs166-project
jorte057@wch132-39 $ git diff sql/src/create_
fatal: ambiguous argument 'sql/src/create_': unknown revision or path not in the working tree.
Use '--' to separate paths from revisions, like this:
'git <command> [<revision>...] -- [<file>...]'
~/cs166-project
jorte057@wch132-39 $ git diff sql/src/create_tables.sql
diff --git a/sql/src/create_tables.sql b/sql/src/create_tables.sql
index d068e44..22ab69c 100644
--- a/sql/src/create_tables.sql
+++ b/sql/src/create_tables.sql
@@ -41,7 +41,7 @@ CREATE TABLE MESSAGE(
        sendTime timestamp,
        deleteStatus integer,
        status char(30) NOT NULL,
-       PRIMARY KEY(msgId)
+       PRIMARY KEY(msgId),
        FOREIGN KEY (senderId) REFERENCES USR(userId),
        FOREIGN KEY (receiverId) REFERENCES USR(userId));
 
@@ -51,4 +51,4 @@ CREATE TABLE CONNECTION_USR(
        status char(30) NOT NULL,
        PRIMARY KEY(userId,connectionId),
        FOREIGN KEY (userId) REFERENCES USR
-       );
\ No newline at end of file
+       );
~/cs166-project
jorte057@wch132-39 $ clear


~/cs166-project
jorte057@wch132-39 $ git status
# On branch main
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   data/usr.csv
#	modified:   sql/src/create_tables.sql
#	modified:   sql/src/load_data.sql
#
no changes added to commit (use "git add" and/or "git commit -a")
~/cs166-project
jorte057@wch132-39 $ git add sql/src/create_tables.sql
~/cs166-project
jorte057@wch132-39 $ git add sql/src/load_data.sql
~/cs166-project
jorte057@wch132-39 $ git commit -m "progress on sql files"
[main e9b6360] progress on sql files
 Committer: Juvenal Ortega <jorte057@wch132-39.cs.ucr.edu>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly:

    git config --global user.name "Your Name"
    git config --global user.email you@example.com

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 2 files changed, 9 insertions(+), 9 deletions(-)
~/cs166-project
jorte057@wch132-39 $ git push
warning: push.default is unset; its implicit value is changing in
Git 2.0 from 'matching' to 'simple'. To squelch this message
and maintain the current behavior after the default changes, use:

  git config --global push.default matching

To squelch this message and adopt the new behavior now, use:

  git config --global push.default simple

See 'git help config' and search for 'push.default' for further information.
(the 'simple' mode was introduced in Git 1.7.11. Use the similar mode
'current' instead of 'simple' if you sometimes use older versions of Git)


(gnome-ssh-askpass:17233): Gtk-WARNING **: 16:29:19.060: cannot open display: 
error: unable to read askpass response from '/usr/libexec/openssh/gnome-ssh-askpass'
Username for 'https://github.com': jortega2

(gnome-ssh-askpass:17242): Gtk-WARNING **: 16:29:22.604: cannot open display: 
error: unable to read askpass response from '/usr/libexec/openssh/gnome-ssh-askpass'
Password for 'https://jortega2@github.com': 
remote: Support for password authentication was removed on August 13, 2021. Please use a personal access token instead.
remote: Please see https://github.blog/2020-12-15-token-authentication-requirements-for-git-operations/ for more information.
fatal: Authentication failed for 'https://github.com/jortega2/cs166-project/'
~/cs166-project
jorte057@wch132-39 $ clear

~/cs166-project
jorte057@wch132-39 $ git status
# On branch main
# Your branch is ahead of 'origin/main' by 1 commit.
#   (use "git push" to publish your local commits)
#
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   data/usr.csv
#
no changes added to commit (use "git add" and/or "git commit -a")
~/cs166-project
jorte057@wch132-39 $ git reset -soft
error: did you mean `--soft` (with two dashes ?)
~/cs166-project
jorte057@wch132-39 $ git reset --soft
~/cs166-project
jorte057@wch132-39 $ git status
# On branch main
# Your branch is ahead of 'origin/main' by 1 commit.
#   (use "git push" to publish your local commits)
#
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   data/usr.csv
#
no changes added to commit (use "git add" and/or "git commit -a")
~/cs166-project
jorte057@wch132-39 $ git reset --hard
HEAD is now at e9b6360 progress on sql files
~/cs166-project
jorte057@wch132-39 $ ls
data  java  README.md  sql  todo
~/cs166-project
jorte057@wch132-39 $ git status
# On branch main
# Your branch is ahead of 'origin/main' by 1 commit.
#   (use "git push" to publish your local commits)
#
nothing to commit, working directory clean
~/cs166-project
jorte057@wch132-39 $ clear

















~/cs166-project
jorte057@wch132-39 $ ls
data  java  README.md  sql  todo
~/cs166-project
jorte057@wch132-39 $ vim sql/src/create_tables.sql 
~/cs166-project
jorte057@wch132-39 $ vim sql/src/load_data.sql 
~/cs166-project
jorte057@wch132-39 $ vim sql/src/create_tables.sql 






















































DROP TABLE WORK_EXPR;
DROP TABLE EDUCATIONAL_DETAILS;
DROP TABLE MESSAGE;
DROP TABLE CONNECTION_USR;
DROP TABLE USR;


CREATE TABLE USR(
        userId varchar(10) UNIQUE NOT NULL,
        password varchar(10) NOT NULL,
        email text NOT NULL,
        name char(50),
        dateOfBirth date,
        Primary Key(userId));

CREATE TABLE WORK_EXPR(
        userId char(10) NOT NULL,
        company char(50) NOT NULL,
        role char(50) NOT NULL,
        location char(50),
        startDate date,
        endDate date,
        PRIMARY KEY(userId,company,role,startDate),
        FOREIGN KEY (userId) REFERENCES USR);

CREATE TABLE EDUCATIONAL_DETAILS(
        userId char(10) NOT NULL,
        instituitionName char(50) NOT NULL,
        major char(50) NOT NULL,
        degree char(50) NOT NULL,
        startdate date,
        enddate date,
        PRIMARY KEY(userId,major,degree),
        FOREIGN KEY (userId) REFERENCES USR);

CREATE TABLE MESSAGE(
        msgId integer UNIQUE NOT NULL,
        senderId char(10) NOT NULL,
        receiverId char(10) NOT NULL,
        contents char(500) NOT NULL,
        sendTime timestamp,
        deleteStatus integer,
        status char(30) NOT NULL,
        PRIMARY KEY(msgId),
        FOREIGN KEY (senderId) REFERENCES USR(userId),
        FOREIGN KEY (receiverId) REFERENCES USR(userId));

CREATE TABLE CONNECTION_USR(
        userId char(10) NOT NULL,
        connectionId char(10) NOT NULL,
        status char(30) NOT NULL,
        PRIMARY KEY(userId,connectionId),
        FOREIGN KEY (userId) REFERENCES USR
        );
~                                                                                                  
~                                                                                                  
~                                                                                                  
~                                                                                                  
~                                                                                                  
~                                                                                                  
~                                                                                                  
~                                                                                                  
-- INSERT --                                                                     44,3-10       All
