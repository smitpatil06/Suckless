/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1; /* -b  option; if 0, dmenu appears at bottom     */
static const unsigned int alpha = 0xC0;     /* Amount of opacity. 0xff is opaque             */
static int centered = 1;                    /* -c option; centers dmenu on screen */
static int min_width = 500;                    /* minimum width when centered */
static const float menu_height_ratio = 4.0f;  /* This is the ratio used in the original calculation */

/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"monospace:size=10"
};
static const char *prompt      ="Dmenu: ";      /* -p  option; prompt to the left of input field */
/*static const char *colors[SchemeLast][2] = {
             fg         bg       
	[SchemeNorm] = { "#bbbbbb", "#222222" },
	[SchemeSel] = { "#eeeeee", "#005577" },
	[SchemeSelHighlight] = { "#ffc978", "#005577" },
	[SchemeNormHighlight] = { "#ffc978", "#222222" },
	[SchemeOut] = { "#000000", "#00ffff" },
	[SchemeOutHighlight] = { "#ffc978", "#00ffff" },
};*/
static const char *colors[SchemeLast][2] = {
	/* fg         bg       */
	[SchemeNorm] =          { "#bbbbbb", "#1e002e" }, /* Grey text, dark hazy purple background */
	[SchemeSel] =           { "#ffffff", "#b91c1c" }, /* White text, Crimson red bar */
	[SchemeSelHighlight] =  { "#000000", "#fbbf24" }, /* Black text, Yellow block (inside red bar) */
	[SchemeNormHighlight] = { "#000000", "#fbbf24" }, /* Black text, Yellow block (in normal list) */
	[SchemeOut] =           { "#bbbbbb", "#1e002e" },
	[SchemeOutHighlight] =  { "#000000", "#fbbf24" },
};

static const unsigned int alphas[SchemeLast][2] = {
	[SchemeNorm] = { OPAQUE, alpha },
	[SchemeSel] = { OPAQUE, 0xA0 },
	[SchemeSelHighlight] = { OPAQUE, 0xA0 },
	[SchemeNormHighlight] = { OPAQUE, alpha },
	[SchemeOut] = { OPAQUE, alpha },
	[SchemeOutHighlight] = { OPAQUE, alpha },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 20;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static unsigned int border_width = 5;
