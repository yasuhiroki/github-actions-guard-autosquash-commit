#!/bin/bash

set -eu

main() {
  action=$(cat "$GITHUB_EVENT_PATH" | jq -r .action )

  if [[ "$action" != "opened" ]] \
    && [[ "$action" != "reopened" ]] \
    && [[ "$action" != "synchronize" ]]; then
    # Skip this action
    echo "action: $action -> Skip"
    exit 0
  fi

  base_br=$(cat "$GITHUB_EVENT_PATH" | jq -r '.pull_request.base.ref')

  if git log --format='%s' origin/${base_br}..HEAD | grep -sq -E '^(fixup!|sequash!)'; then
    echo ":warning: you should rebase before merge it!"
    exit 1
  fi

  exit 0
}

main
