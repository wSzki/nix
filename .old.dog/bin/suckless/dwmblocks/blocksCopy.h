//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
    {"", "uptime | sed 's/.*up \\([^,]*\\), .*/\\1/'",      60, 0},
	{"🔊 ", "amixer get Master | grep Left | grep -o \"\\(\\[\\of]\\|[0-9]*%\\)\" ", 1, 0},
    {"☀ ", "xbacklight | sed 's/\\..*//'",                   1,      0},
	{"⧈ ", "sed \"s/$/%/\" /sys/class/power_supply/BAT0/capacity ", 60, 12},
	{"⧉ ", "sed \"s/$/%/\" /sys/class/power_supply/BAT1/capacity ", 60, 12},
//    {"🖸  ", "pydf | awk '/dev/sdb2{print $8}' | sed -n 2p ", 6, 1},
    {"𝌁 ", "free -h | awk '/^Mem/ { print $3 }'",   10,     0},
    {"🌡 ", "sensors | awk '/^temp1:/{print $2}' | head -n 1",               5,      0},
    {"🗘 ", "sensors | awk '/^fan1:/{print $2 $3}'",               10,      0},
	{"🕗 ", "date '+%b %d (%a) %I:%M%p'",	60,	0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = ' ';


//    {"⏳ ", "uptime | sed 's/.*up \\([^,]*\\), .*/\\1/'",      60, 0},
