def --env mc [path: path]: nothing -> nothing {
  mkdir $path
  cd $path
}

def --env mcg [path: path]: nothing -> nothing {
  mkdir $path
  cd $path
  git init
}
