game_over()
{
	resize -s 18 105
	clear

	printf "\033[6;30H\033[31m  ____                         ___                 \n"
	printf "\033[7;30H / ___| __ _ _ __ ___   ___   / _ \\__   _____ _ __ \n"
	printf "\033[8;30H| |  _ / _\` | \'_ \` _ \\ / _ \\ | | | \\ \\ / / _ \\ \\'__|\n"
	printf "\033[9;30H| |_| | (_| | | | | | |  __/ | |_| |\\ V /  __/ |   \\n"
	printf "\033[10;30H \\____|\\__,_|_| |_| |_|\\___|  \\___/  \\_/ \\___|_|   \033[0m\n"

	R=a

	while [[ $R != "" ]]
	do
		read -s -n 1 R
	done
}
week_end()
{
	resize -s 18 105
	clear

	printf "\033[6;30H\033[32m__        __        _      _____           _ "
	printf "\033[7;30H\\ \\      / /__  ___| | __ | ____|_ __   __| |"
	printf "\033[8;30H \\ \\ /\\ / / _ \\/ _ \\ |/ / |  _| | \'_ \\ / _\` |"
	printf "\033[9;30H  \\ V  V /  __/  __/   <  | |___| | | | (_| |"
	printf "\033[10;30H   \\_/\\_/ \\___|\\___|_|\\_\\ |_____|_| |_|\\__,_|\033[0m\n"

	R=a

	while [[ $R != "" ]]
	do
		read -s -n 1 R
	done
}


