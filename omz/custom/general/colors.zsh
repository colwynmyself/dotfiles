# Use these to add color to text. Remember to put NC at the end!
# Ex: echo -e "${YELLOW}I am yellow${NC}"

# Structure is \033[R;Cm
#   e - literal character e
#   R - The Rendition parameters (https://en.wikipedia.org/wiki/ANSI_escape_code#Select_Graphic_Rendition_parameters)
#   C - Color (https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bit)

export NC='\033[0m'

# Regular
export BLACK='\033[0;30m'
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;93m' # Bright
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export WHITE='\033[0;37m'

# Bold
export BOLDBLACK='\033[1;30m'
export BOLDRED='\033[1;31m'
export BOLDGREEN='\033[1;32m'
export BOLDYELLOW='\033[1;93m' # Bright
export BOLDBLUE='\033[1;34m'
export BOLDPURPLE='\033[1;35m'
export BOLDCYAN='\033[1;36m'
export BOLDWHITE='\033[1;37m'
