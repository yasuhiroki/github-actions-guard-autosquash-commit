# GitHub Actions Guard Autosquash Commit

This is a GitHub actions to prevent merging with `fixup!` or `sequash!` commit.

## Usage

```
workflow "Your workflow" {
  resolves = [
    "yasuhiroki/github-actions-guard-autosquash-commit",
  ]
  on = "pull_request"
}

action "yasuhiroki/github-actions-guard-autosquash-commit" {
  uses = "yasuhiroki/github-actions-guard-autosquash-commit@master"
}
```
