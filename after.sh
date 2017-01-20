if [[ $BUILD_STATUS == "success" ]]
then
  export STATUS="success"
else
  export STATUS="failure"
fi

curl "https://api.github.com/repos/justincampbell/my_repo/statuses/$GIT_COMMIT?access_token=abc123" \
  -H "Content-Type: application/json" \
  -X POST \
  -d "{\"state\": \"$STATUS\", \"description\": \"Jenkins\", \"target_url\": \"http://my.jenkins.box.com/job/dividata/$BUILD_NUMBER/console\"}"