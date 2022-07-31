/* user and group to drop privileges to */
static const char *user  = "wsz";
static const char *group = "nobody";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#191D20",     /* after initialization */
	[INPUT] =  "#191D20",   /* during input */
	[FAILED] = "#191D20",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
