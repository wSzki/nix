//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
    /*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/

    {"", "~/Desktop/Suckless/installScript/LowBatScriptBlock", 90, 0 },
    {"", "uptime | sed 's/.*up \\([^,]*\\), .*/\\1/'",      60, 0},

//    {"", "ping -c 1 google.fr | grep time= | awk '{print $8}' > ~/.ping",   5,0},
    {"🌔 ", "cat ~/.ping", 10, 0},

    //    {"", "ping -c 1 google.fr > ~/.ping" ,      5, 0},
    //    {"- ", "cat ~/.ping | grep -o 'time[0-9]].[0-9][0-9]'",      10, 0},
    //    {"- ", "cat ~/.ping | grep 'time=' | awk '{print $8}'",      10, 0},


    {"ߒ ", "lscpu | grep 'CPU MHz' | awk '{print $3}'",      5, 0},
    {"இ ", "amixer get Master | grep Left | grep -o \"\\(\\[\\of]\\|[0-9]*%\\)\" ", 5, 0},
    {"☀ ", "xbacklight | sed 's/\\..*//'",                   5,      0},
    {"߸ ", "sed \"s/$/%/\" /sys/class/power_supply/BAT0/capacity ", 60, 12},
    {"߹ ", "sed \"s/$/%/\" /sys/class/power_supply/BAT1/capacity ", 60, 12},
    //    {"  ", "pydf | awk '/dev/sdb2{print $8}' | sed -n 2p ", 6, 1},
    {"𝌁 ", "free -h | awk '/^Mem/ { print $3 }'",   10,     0},
    {"𝌗 ", "sensors | grep C | awk '/^temp1:/{print $2}' | sed -n 2p",               5,      0},
    {"ฟ ", "sensors | awk '/^fan1:/{print $2 $3}'",               10,      0},
    {"⥁ ", "date '+%b %d (%a) %I:%M%p'",	60,	0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = ' ';


//    {"⏳ ", "uptime | sed 's/.*up \\([^,]*\\), .*/\\1/'",      60, 0},



//     △ ~ ping -c 1 google.fr | grep time= | awk '{print $8}' > ~/.ping

