#!/bin/sh

   git filter-branch --env-filter '
   OLD_EMAIL="old.email@example.com"
   CORRECT_NAME="Your New Name"
   CORRECT_EMAIL="your.new.email@example.com"

   if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
   then
       export GIT_COMMITTER_NAME="$CORRECT_NAME"
       export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
   fi
   if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
   then
       export GIT_AUTHOR_NAME="$CORRECT_NAME"
       export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
   fi
