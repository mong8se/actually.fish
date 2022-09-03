status is-interactive || exit

function _actually --on-event fish_postexec
  set -f last_status $status
  if test $last_status -eq 0
    return 0
  end

  set -f last_cmd (string split " " $argv[1])
  if test "cd" != "$last_cmd[1]"
    return $last_status
  end

  # using string replace to do tilde expansion manually, not sure if there is a way
  # to get it to work automatically when inside a variable from a split string
  set -f last_dir (path dirname $last_cmd[2] | string replace -r '^~' "$HOME")
  set -f last_base (path basename $last_cmd[2])
  set -l list (command find "$last_dir" -maxdepth 1 -mindepth 1 -type d -iname "$last_base"'*' | path sort)

  if test -z "$list"
    return $last_status
  end

  set_color blue
  echo um ... actually, you probably meant:
  set_color normal

  set -f destination
  if type -q fzf
    set -l preview
    if type -q lsd
      set preview 'lsd --color always --icon always {}'
    else
      set preview 'ls -F --color {}'
    end
    set destination (string join0 $list | fzf --read0 --no-info --no-sort --preview="$preview")
  else
    for i in (seq (count $list))
      echo $i $list[$i]
    end
    read -n 1 -p 'set_color green; echo -n "> " ; set_color normal' answer

    if string match -r '^\d+$' "$answer"
      and test $answer -gt 0
      set destination "$list[$answer]"
    end
  end

  if test -d "$destination"
    echo $destination
    cd $destination
  else
    echo nevermind
    return $last_status
  end
end

function _actually_uninstall --on-event actually_uninstall
  functions --erase _actually _actually_uninstall
end
