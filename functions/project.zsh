# Autocompletition for the prodject
p() { cd ~/Projects/$1;  }
_p() { _files -W ~/Projects -/;  }
compdef _p p
