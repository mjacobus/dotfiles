# Autocompletition for the prodject
p() { cd ~/Projects/$1;  }
_p() { _files -W ~/Projects -/;  }
compdef _p p

# Allows commit message without typing quotes (can't have quotes in the commit msg though).
function gc {
  git commit -m "$*"
}

function gca {
  git commit -am "$*"
}
