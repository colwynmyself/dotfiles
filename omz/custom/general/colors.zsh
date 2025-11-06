# Use these to add color to text. Remember to put NC at the end!
# Ex: echo -e "${YELLOW}I am yellow${NC}"

# Structure is \e[R;Cm
#   e - literal character e
#   R - The Rendition parameters (https://en.wikipedia.org/wiki/ANSI_escape_code#Select_Graphic_Rendition_parameters)
#   C - Color (https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bit)

export NC='\e[0m'

# Regular
export BLACK='\e[0;30m'
export RED='\e[0;31m'
export GREEN='\e[0;32m'
export YELLOW='\e[0;93m' # Bright
export BLUE='\e[0;34m'
export PURPLE='\e[0;35m'
export CYAN='\e[0;36m'
export WHITE='\e[0;37m'

# Bold
export BOLDBLACK='\e[1;30m'
export BOLDRED='\e[1;31m'
export BOLDGREEN='\e[1;32m'
export BOLDYELLOW='\e[1;93m' # Bright
export BOLDBLUE='\e[1;34m'
export BOLDPURPLE='\e[1;35m'
export BOLDCYAN='\e[1;36m'
export BOLDWHITE='\e[1;37m'
