
web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
worker:  bundle exec rake jobs:work

export PATH=$PATH:$HOME/vendor/bin
export LANG=${LANG:-en_US.UTF-8}
