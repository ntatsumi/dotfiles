SUBLIME='/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl'
if [ -f "$SUBLIME" ]; then
  export EDITOR='subl -w'
fi

export HOMEBREW_GITHUB_API_TOKEN=xxx
