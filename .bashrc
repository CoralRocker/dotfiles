#
#~/.bashrc
#
#Start Screen
export PATH=$(echo ~/.gem/ruby/2.6.0/bin:~/bin:$PATH)
if [[ $- == *i* ]]; then
	#neofetch | lolcat
	if [[ $DISPLAY != '' ]]; then
		xrdb /home/tcr-g/.Xresources
	fi
fi
#Functions
function leakCheck()
{
	valgrind --leak-check=full $1
}

function gitcommitpush() {
	git add -A
	git commit
	git push origin $1
}

function bandit()
{
	ssh -p 2220 bandit${1}@bandit.labs.overthewire.org
}

function narnia()
{
	ssh -p 2226 narnia${1}@narnia.labs.overthewire.org
}	

function update_ps1() {
	PS1=$(powerline-shell $?)
}


function rmd()
{
	pandoc $1 | lynx -stdin
}

function writeMD()
{
	nvim $1 && pandoc $1 | lynx -stdin
}

github-create() {
 repo_name=$1

 dir_name=`basename $(pwd)`
 invalid_credentials=0

 if [ "$repo_name" = "" ]; then
 	echo "Repo name (hit enter to use '$dir_name')?"
 	read repo_name
 fi

 if [ "$repo_name" = "" ]; then
 	repo_name=$dir_name
 fi

 username=`git config github.user`
 if [ "$username" = "" ]; then
 	echo "Could not find username, run 'git config --global github.user <username>'"
 	invalid_credentials=1
 fi

 token=`git config github.token`
 if [ "$token" = "" ]; then
 	echo "Could not find token, run 'git config --global github.token <token>'"
 	invalid_credentials=1
 fi

 if [ "$invalid_credentials" == "1" ]; then
 	echo "Invalid Credentials"
	 return 1
 fi

 echo -n "Creating Github repository '$repo_name' ..."
 curl -u "$username:$token" https://api.github.com/user/repos -d '{"name":"'$repo_name'"}'
 echo " done."

 echo -n "Pushing local code to remote ..."
 git remote add origin git@github.com:$username/$repo_name.git
 git push -u origin master > /dev/null
 echo " done."
}

source ~/.fonts/*.sh

#Aliases
alias coreDump='sudo sysctl -w kernel.core_pattern=/tmp/cor-%e.%p.%h.%t'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias mkinitcpio='sudo mkinitcpio -p linux'
alias lbin='cd /usr/local/bin'
alias ls='ls -a --color=auto'
alias bashrc='nvim ~/.bashrc && source ~/.bashrc'
alias lS='ls -a --color=always -S'
alias boot-analyze='systemd-analyze blame && systemd-analyze critical-chain'
alias r_prog='sudo ps -ef | less -R'
alias fstab_mod='sudo nvim /etc/fstab'
alias g++='g++ -std=c++17'
alias vernier_spectral_analysis='wine "/home/tcr-g/.wine/drive_c/Program Files (x86)/Vernier Spectral Analysis/Vernier Spectral Analysis.exe"'
alias i3config='nvim ~/.config/i3/config'
alias i3blockconfig='nvim ~/.config/i3blocks/config'
alias SkyCMD='env WINEPREFIX=/home/tcr-g/.steam/steam/steamapps/compatdata/489830/pfx winetricks'
alias SkyWINE='env WINEPREFIX=/home/tcr-g/.steam/steam/steamapps/compatdata/489830/pfx wine'
alias mirrorRank='sudo reflector --verbose --country "US" -l 10 --sort rate --save /etc/pacman.d/mirrorlist'
alias wifibypass='sudo ifconfig wlp3s0 down && sudo wifi-menu && sudo dhcpcd'
alias bkgrd='feh --bg-scale ~/Scouts/syntharchnotext.png'
alias Genitalia='WINEPREFIX=~/.steam/steam/steamapps/compatdata/469820/pfx wine ~/.steam/steam/steamapps/common/GenitalJousting/GenitalJousting.exe'
alias pbarconf='nvim ~/.config/polybar/config'
#PS1
	if [[ ${EUID} == 0 ]] ; then
		sq_color="\[\033[0;31m\]"
	else		
		sq_color="\[\033[0;34m\]"
	fi

	if [[ $TERM != linux && ! $PROMPT_COMMAND =~ update_ps1 ]]; then
		PROMPT_COMMAND="update_ps1; $PROMPT_COMMAND"	
	fi
#	PS1="$sq_color\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[01;37m\]\342\234\227$sq_color]\342\224\200\")[\[\033[01;37m\]\t$sq_color]\342\224\200[\[\033[01;37m\]\u@\h$sq_color]\n\342\224\224\342\224\200\342\224\200> \[\033[01;37m\]\w$sq_color $ \[\033[01;37m\]>>\\[\\033[0m\\] "


	unset sq_color

# added by pipx (https://github.com/pipxproject/pipx)
export PATH="/home/tcr-g/.local/bin:$PATH"
