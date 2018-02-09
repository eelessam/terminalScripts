git branch -r | grep origin/ | grep -v 'master$' | grep -v HEAD| cut -d/ -f2 | while read line; do git push REMOTE_NAME :$line; done;
git branch | grep -v "master" | xargs git branch -D
