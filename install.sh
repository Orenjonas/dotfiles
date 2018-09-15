## Run with:
## >bash install.sh

cd ~/dotfiles

while read p; do
  mv $p ~/
  echo "$p moved to ~/"
done <~/dotfiles/files_to_backup.txt

echo "moving init.vim to ~/.config/nvim/"
mkdir ~/.config/nvim/
mv ~/init.vim ~/.config/nvim/

cd -
