source "rbw get google/victor.franzi-mutt |"
set imap_user		 = victor.franzi@gmail.com
set imap_pass		 = $my_pass
set folder			 = imaps://victor.franzi@imap.gmail.com:993/
set spoolfile		 = +INBOX
set postponed		 = "+[Gmail]/Drafts"

set smtp_url		 = smtp://victor.franzi@gmail.com@smtp.gmail.com:587/
set smtp_pass		 = $my_pass
set from			 = victor.franzi@gmail.com
unset record
set realname		 = "Victor Franzi"
set hostname		 = gmail.com

folder-hook $folder 'source ~/.config/mutt/victor.franzi@gmail.com'
