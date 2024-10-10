#!/bin/sh

   git filter-branch --env-filter '
   OLD_EMAIL="old.email@example.com"
   CORRECT_NAME="Your New Name"
   CORRECT_EMAIL="your.new.email@example.com"

   if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
   then
       echo "Changing committer email for commit $GIT_COMMIT"
       export GIT_COMMITTER_NAME="$CORRECT_NAME"
       export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
   fi
   if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
   then
       echo "Changing author email for commit $GIT_COMMIT"
       export GIT_AUTHOR_NAME="$CORRECT_NAME"
       export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
   fi
   ' --tag-name-filter cat -- --branches --tags
