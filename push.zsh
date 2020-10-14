#!/bin/zsh
git add -A
git diff --cached --exit-code >/dev/null
if [[ $? -eq 0 ]]; then
	echo "No changes to be commited"
	exit
fi
git status -s
if [[ $1 == "-fast" ]]; then
	git commit -m "Default fast commit message"
	git push $2 $3
	exit
fi
while true; do
	echo -n "Do you wish to push? [y/n]: "
	read yn
	case $yn in
		Y | y )
			echo -n "Please enter a commit message: "
			read message
			git commit -m "$message"
			git push $1 $2
			if [[ $? -ne 0 ]]; then
				while true; do
					echo -n "Please enter a correct repository and branch: "
					read repo
					git push ${=repo}
					exit
				done
			fi
			exit;;
		N | n )
			exit;;
	esac
done
