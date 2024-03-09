#!/usr/bin/env bash

__git_ps1 () {
  format=$1
  inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
  if [ -z "$inside_git_repo" -o "$inside_git_repo" != true ]; then
    return 0
  fi

  remote=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)
  current=$(git branch --show-current)
  current=${current:-$(git rev-parse --short --verify HEAD 2>/dev/null)}
  current=${current:-???}
  commits=""
  if [ -n "$remote" ]; then
    diff=$(git rev-list --left-right --count ${remote}...${current})
    
    behind=$(echo $diff | cut -d ' ' -f1)
    ahead=$(echo $diff | cut -d ' ' -f2)
    
    if [ $ahead -ne 0 ]; then
      commits=↑${ahead}
    fi
    if [ $behind -ne 0 ]; then
      commits=${commits}↓${behind}
    fi
  fi
  
  untracked=$(git ls-files -o --exclude-standard | wc -l)
  unstaged=$(git diff --name-only --diff-filter=u | sort | uniq | wc -l)
  staged=$(git diff --name-only --cached --diff-filter=u | sort | uniq | wc -l)
  unmerged=$(git diff --name-only --diff-filter=U | wc -l)
  files=""
  
  if [ $untracked -ne 0 ]; then
    files=~$untracked
  fi
  
  if [ $unstaged -ne 0 ]; then
    files=${files:+"$files "}
    files="${files}*$unstaged"
  fi
  if [ $unmerged -ne 0 ]; then
    files=${files:+"$files "}
    files="${files}≠$unmerged"
  fi
  if [ $staged -ne 0 ]; then
    files=${files:+"$files "}
    files="${files}+$staged"
  fi
  
  git_ps1="$current"
  if [ -n "$files" ]; then
    git_ps1="$git_ps1 ($files)"
  fi
  if [ -n "$commits" ]; then
    git_ps1="$git_ps1 $commits"
  fi

   printf "$format" "$git_ps1"
}

