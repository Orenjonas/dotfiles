alias 4051='cd /home/jonas/Dropbox/UiO/stk4051-Computational_Statistics/oblig1 && nvim oppgavetext.tex'
alias vimlast='nvim -S ~/.vimsessions/session.vim'
alias backup_linux='bash ~/scripts/bash/backup.sh'
alias addtobackup='history | tail -2 | python3 ~/scripts/bash/put_history_input_in_backupscript.py'
alias bat='upower -i /org/freedesktop/UPower/devices/DisplayDevice | grep -E "percentage|time\ to|state"'
alias retting='python3 ~/scripts/python/retting.py'
alias punchin='python3 ~/scripts/python/punchclock.py start'
alias punchut='python3 ~/scripts/python/punchclock.py slutt'
alias punchout='punchut'
alias scph='echo "scp [lokal dir] jonasore@login.ifi.uio.no:~/MineFiler/<dir>"'
alias timeliste='firefox https://docs.google.com/spreadsheets/d/1VTefFrHpErJc6yqtdLGc1a_-gHTmtlGQHT-ogXUOl-0/edit#gid=977181351 &'
alias sshuio='ssh -YC jonasore@login.ifi.uio.no'
alias nvimrc='nvim ~/.config/nvim/init.vim'
alias javatut='firefox ~/Documents/www.tutorialspoint.com/java/index.html &'
alias in1010='firefox http://www.uio.no/studier/emner/matnat/ifi/IN1010/v18/ &'
alias wgeth='echo "                            
$ wget \                                       
     --recursive \                             
     --no-clobber \                            
     --page-requisites \                       
     --html-extension \                        
     --convert-links \                         
     --restrict-file-names=windows \           
     --domains example.com \                   
     --no-parent \                             
         http://www.example.com/folder1/folder/

    --recursive - recurively download all files that are linked from main file,
    --no-clobber - do not overwrite files that already exist locally (useful when previous run failed for any reason),
    --page-requisites - download all page elements (JS, CSS, ..),
    --html-extension - add .html extension to files (if not already there),
    --convert-links - fix links in html files to work offline,
    --restrict-file-names=windows - rename files to work also in Windows,
    --domains example.com - limit downloads to listed domains (links that point to other domains will not be followed),
    --no-parent - do not download files form folders below given root folder (folder1/folder/ in our example; files from /folder1 are not going to be transferred).
"'
