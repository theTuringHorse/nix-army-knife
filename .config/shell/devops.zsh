### AWS
_heyws_completions() {
    local profiles
    profiles=($(sed -n 's/.*\[\([^]]*\)\].*/\1/p' ~/.aws/credentials)) # Extract profiles
    _describe 'aws profiles' profiles
}

heyws() {
  echo "$1" > ~/.aws/active
  export AWS_PROFILE=$(cat ~/.aws/active)
}
[ -f ~/.aws/active ] && export AWS_PROFILE=$(cat ~/.aws/active)
compdef _heyws_completions heyws
###

easshy () {
  ssh -o "Hostname=$2" $1 
}
