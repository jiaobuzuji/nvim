-- This file should be edited by the user. Read the instructions of each section and then edit them as desired.

--[[ Highlite, a Neovim colorscheme template.
  * Author:     Iron-E (https://github.com/Iron-E)
  * Repository: https://github.com/nvim-highlite

  Initially forked from vim-rnb, a Vim colorsheme template:
  * Author:        Romain Lafourcade (https://github.com/romainl)
  * Canonical URL: https://github.com/romainl/vim-rnb
]]

--[[ Introduction
  This template is designed to help Neovim users create their own colorschemes without much effort.

  You will not need any additional tooling to run this file. Just open it in Neovim and follow the instructions.

  The process is divided in five steps:
  1. Rename the template,
  2. Edit your colorscheme's information,
  3. Define your colors,
  4. Define your highlight groups and links, and
  5. Sourcing your colorscheme.
]]

--[[ Step 1: Renaming
  * If this file is distributed with a colorscheme it's probably already named correctly
    and you can skip this step.
  * If you forked/cloned/copied this repository to create your own colorscheme, you will have to
    rename this template to match the name of your colorscheme.

  NOTE: Neovim doesn't really care about whitespace in the name of the colorscheme but it does for
  filenames so make sure your filename doesn't have any whitespace character.

  | colorscheme name  | module name | template filename |
  |:-----------------:|:-----------:|:-----------------:|
  | foobar            | foobar      | foobar.lua        |
  | foo-bar           | foo_bar     | foo_bar.lua       |
  | foo bar           | foo_bar     | foo_bar.lua       |
  | foo_bar           | foo_bar     | foo_bar.lua       |

  Rename the following files:
  * `colors/highlite.vim`
  * `lua/highlite.lua`

  Where 'highlite' is the name of your colorscheme.

  TIP: If you are on a Unix-based system (or have WSL on Windows) you can use the setup script at the root of this repo.
       See the README for more details.
]]


--[[ Step 2: Information
  In this step you will define information that helps Neovim process:

  1. How users access your colorscheme;
  2. How your colorscheme should be rendered.
]]

-- This is the name of your colorscheme which will be used as per |g:colors_name|.
vim.g.colors_name = 'highlite'

--[[ Step 3: Colors
  Next you will define all of the colors that you will use for the color scheme.

  Each one should be made up of three parts:

```lua
  <color name> = { -- Give each color a distinctive name.
    '#<hex color code>', -- Hexadecimal color used in GVim/MacVim or 'NONE'.
    <16-bit color code>, -- Integer 0–255 used by terminals supporting 256 colors or 'NONE'.
    '<ANSI color name>'  -- color name used by less capable color terminals, can be 'darkred',
                           'red', 'darkgreen', 'green', 'darkyellow', 'yellow', 'darkblue',
                           'blue', 'darkmagenta', 'magenta', 'black', 'darkgrey', 'grey',
                           'white', or 'NONE'
  }
```

  NOTE: See https://gist.github.com/gagbo/7943c9a71cab22b641d2904a6d59ec3a
        for a program that can generate 16-bit colors from a Hex code.

  If your colors are defined correctly, the resulting colorscheme is guaranteed
  to work in GVim (Windows/Linux), MacVim (MacOS), and any properly set up terminal
  emulator.

'#000000',00   '#800000',01   '#008000',02   '#808000',03
'#000080',04   '#800080',05   '#008080',06   '#c0c0c0',07
'#808080',08   '#ff0000',09   '#00ff00',10   '#ffff00',11
'#0000ff',12   '#ff00ff',13   '#00ffff',14   '#ffffff',15
'#000000',16   '#00005f',17   '#000087',18   '#0000af',19
'#0000d7',20   '#0000ff',21   '#005f00',22   '#005f5f',23
'#005f87',24   '#005faf',25   '#005fd7',26   '#005fff',27
'#008700',28   '#00875f',29   '#008787',30   '#0087af',31
'#0087d7',32   '#0087ff',33   '#00af00',34   '#00af5f',35
'#00af87',36   '#00afaf',37   '#00afd7',38   '#00afff',39
'#00d700',40   '#00d75f',41   '#00d787',42   '#00d7af',43
'#00d7d7',44   '#00d7ff',45   '#00ff00',46   '#00ff5f',47
'#00ff87',48   '#00ffaf',49   '#00ffd7',50   '#00ffff',51
'#5f0000',52   '#5f005f',53   '#5f0087',54   '#5f00af',55
'#5f00d7',56   '#5f00ff',57   '#5f5f00',58   '#5f5f5f',59
'#5f5f87',60   '#5f5faf',61   '#5f5fd7',62   '#5f5fff',63
'#5f8700',64   '#5f875f',65   '#5f8787',66   '#5f87af',67
'#5f87d7',68   '#5f87ff',69   '#5faf00',70   '#5faf5f',71
'#5faf87',72   '#5fafaf',73   '#5fafd7',74   '#5fafff',75
'#5fd700',76   '#5fd75f',77   '#5fd787',78   '#5fd7af',79
'#5fd7d7',80   '#5fd7ff',81   '#5fff00',82   '#5fff5f',83
'#5fff87',84   '#5fffaf',85   '#5fffd7',86   '#5fffff',87
'#870000',88   '#87005f',89   '#870087',90   '#8700af',91
'#8700d7',92   '#8700ff',93   '#875f00',94   '#875f5f',95
'#875f87',96   '#875faf',97   '#875fd7',98   '#875fff',99
'#878700',100  '#87875f',101  '#878787',102  '#8787af',103
'#8787d7',104  '#8787ff',105  '#87af00',106  '#87af5f',107
'#87af87',108  '#87afaf',109  '#87afd7',110  '#87afff',111
'#87d700',112  '#87d75f',113  '#87d787',114  '#87d7af',115
'#87d7d7',116  '#87d7ff',117  '#87ff00',118  '#87ff5f',119
'#87ff87',120  '#87ffaf',121  '#87ffd7',122  '#87ffff',123
'#af0000',124  '#af005f',125  '#af0087',126  '#af00af',127
'#af00d7',128  '#af00ff',129  '#af5f00',130  '#af5f5f',131
'#af5f87',132  '#af5faf',133  '#af5fd7',134  '#af5fff',135
'#af8700',136  '#af875f',137  '#af8787',138  '#af87af',139
'#af87d7',140  '#af87ff',141  '#afaf00',142  '#afaf5f',143
'#afaf87',144  '#afafaf',145  '#afafd7',146  '#afafff',147
'#afd700',148  '#afd75f',149  '#afd787',150  '#afd7af',151
'#afd7d7',152  '#afd7ff',153  '#afff00',154  '#afff5f',155
'#afff87',156  '#afffaf',157  '#afffd7',158  '#afffff',159
'#d70000',160  '#d7005f',161  '#d70087',162  '#d700af',163
'#d700d7',164  '#d700ff',165  '#d75f00',166  '#d75f5f',167
'#d75f87',168  '#d75faf',169  '#d75fd7',170  '#d75fff',171
'#d78700',172  '#d7875f',173  '#d78787',174  '#d787af',175
'#d787d7',176  '#d787ff',177  '#d7af00',178  '#d7af5f',179
'#d7af87',180  '#d7afaf',181  '#d7afd7',182  '#d7afff',183
'#d7d700',184  '#d7d75f',185  '#d7d787',186  '#d7d7af',187
'#d7d7d7',188  '#d7d7ff',189  '#d7ff00',190  '#d7ff5f',191
'#d7ff87',192  '#d7ffaf',193  '#d7ffd7',194  '#d7ffff',195
'#ff0000',196  '#ff005f',197  '#ff0087',198  '#ff00af',199
'#ff00d7',200  '#ff00ff',201  '#ff5f00',202  '#ff5f5f',203
'#ff5f87',204  '#ff5faf',205  '#ff5fd7',206  '#ff5fff',207
'#ff8700',208  '#ff875f',209  '#ff8787',210  '#ff87af',211
'#ff87d7',212  '#ff87ff',213  '#ffaf00',214  '#ffaf5f',215
'#ffaf87',216  '#ffafaf',217  '#ffafd7',218  '#ffafff',219
'#ffd700',220  '#ffd75f',221  '#ffd787',222  '#ffd7af',223
'#ffd7d7',224  '#ffd7ff',225  '#ffff00',226  '#ffff5f',227
'#ffff87',228  '#ffffaf',229  '#ffffd7',230  '#ffffff',231
'#080808',232  '#121212',233  '#1c1c1c',234  '#262626',235
'#303030',236  '#3a3a3a',237  '#444444',238  '#4e4e4e',239
'#585858',240  '#626262',241  '#6c6c6c',242  '#767676',243
'#808080',244  '#8a8a8a',245  '#949494',246  '#9e9e9e',247
'#a8a8a8',248  '#b2b2b2',249  '#bcbcbc',250  '#c6c6c6',251
'#d0d0d0',252  '#dadada',253  '#e4e4e4',254  '#eeeeee',255

  NOTE: |Replace-mode| will probably be useful here.
]]

-- ANSI color, 16 colors
local black       = {'#000000',  0,'black'      } -- '#000000'
local darkred     = {'#800000',  1,'darkred'    } -- '#FF5555'
local darkgreen   = {'#008000',  2,'darkgreen'  } -- '#50FA7B'
local darkyellow  = {'#808000',  3,'darkyellow' } -- '#F1FA8C'
local darkblue    = {'#000080',  4,'darkblue'   } -- '#BD93F9'
local darkmagenta = {'#800080',  5,'darkmagenta'} -- '#FF79C6'
local darkcyan    = {'#008080',  6,'darkcyan'   } -- '#8BE9FD'
local gray        = {'#c0c0c0',  7,'gray'       } -- '#BFBFBF'
local darkgray    = {'#808080',  8,'darkgray'   } -- '#4D4D4D'
local red         = {'#ff0000',  9,'red'        } -- '#FF6E67'
local green       = {'#00ff00', 10,'green'      } -- '#5AF78E'
local yellow      = {'#ffff00', 11,'yellow'     } -- '#F4F99D'
local blue        = {'#0000ff', 12,'blue'       } -- '#CAA9FA'
local magenta     = {'#ff00ff', 13,'magenta'    } -- '#FF92D0'
local cyan        = {'#00ffff', 14,'cyan'       } -- '#9AEDFE'
local white       = {'#ffffff', 15,'white'      } -- '#ffffff'

-- Customize Palette
-- Aqua Olive Navy Tan Orange Pink Teal Purple Turquoise
local black0      = {'#080808',232,'black'      }
local black1      = {'#121212',233,'black'      }
local black2      = {'#1c1c1c',234,'black'      }
local black3      = {'#262626',235,'black'      }
local gray5       = {'#303030',236,'darkgray'   }
local gray4       = {'#3a3a3a',237,'darkgray'   }
local gray3       = {'#4e4e4e',239,'darkgray'   }
local gray2       = {'#585858',240,'darkgray'   }
local gray1       = {'#808080',244,'darkgray'   }
local gray0       = {'#bcbcbc',250,'gray'       }
local white1      = {'#c6c6c6',251,'white'      }
local white0      = {'#d0d0d0',252,'white'      }

local red0        = {'#5f0000', 52,'darkred'    }
local red1        = {'#5f005f', 53,'darkred'    }
local red2        = {'#af005f',125,'red'        }
local magenta0    = {'#ff5faf',205,'magenta'    }
local magenta1    = {'#d787ff',177,'darkmagenta'}
local magenta2    = {'#af87d7',140,'darkmagenta'}
local magenta3    = {'#8787af',103,'darkmagenta'}
local orange2     = {'#d7875f',173,'darkyellow' }
local orange0     = {'#ff8700',208,'darkyellow' }
local orange1     = {'#ffaf00',214,'darkyellow' }
local yellow0     = {'#d7af5f',179,'darkyellow' }
local yellow1     = {'#d7af00',178,'darkyellow' }
local olive0      = {'#afd700',148,'darkgreen'  }
local olive1      = {'#87d700',112,'darkgreen'  }
local green0      = {'#005f00', 22,'green'      }
local green1      = {'#5faf00', 70,'darkgreen'  }
local green2      = {'#5faf5f', 71,'darkgreen'  }
local blue0       = {'#00005f', 17,'darkblue'   }
local cyan0       = {'#005f5f', 23,'darkblue'   }
local cyan1       = {'#00875f', 29,'darkgreen'  }
local cyan2       = {'#008787', 30,'darkcyan'   }
local cyan3       = {'#00afaf', 37,'darkcyan'   }
local cyan4       = {'#5fffff', 87,'cyan'       }
local cyan5       = {'#5fafd7', 74,'darkcyan'   }
local cyan6       = {'#5f8787', 66,'darkcyan'   }

--[[ Step 4: highlights
  You can define highlight groups like this:

```lua
  <highlight group name> = {
    -- The color for the background, `NONE`, `FG` or `BG`
    bg = <color>,

    -- The color for the foreground, `NONE`, `FG` or `BG`
    fg = <color>

    -- The |highlight-blend| value, if one is desired.
    [, blend = <integer>]

    -- Style can be 'bold', 'italic', and more. See |attr-list| for more information.
    -- It can also have a color, and/or multiple <cterm>s.
    [, style = <cterm>|{<cterm> (, <cterm>) [color=<color>]} ]
  }
```

  You can also link one highlight group to another:

```lua
  <highlight group name> = '<highlight group name>'
```
  ____________________________________________________________________________

  Here is an example to define `SpellBad` and then link some new group
  `SpellWorse` to it:

```lua
  SpellBad = { -- ← name of the highlight group
    bg=NONE, -- background color
    fg=red, -- foureground color
    style={ -- the style
      'undercurl', -- undercurl (squiggly line)
      color=red -- the color of the undercurl
    }
  },
  SpellWorse = 'SpellBad'
```

  If you weren't satisfied with undercurl, and also wanted another effect, you can
  add another one below 'undercurl' and it will be applied as well:

```lua
  SpellBad = { -- ← name of the highlight group
    bg=NONE, -- background color
    fg=red, -- foureground color
    style={ -- the style
      'undercurl', -- undercurl (squiggly line)
      'standout'
      color=red -- the color of the undercurl
    }
  }
```
  ____________________________________________________________________________

  If you want to create a colorscheme that is responsive to the user's
  'background' setting, you can specify special `light` and `dark` keys to
  define how each group should be highlighted in each case.

```lua
  SpellBad = {
    bg=NONE,
    dark={fg=white},
    light={fg=black},
    style={'undercurl', color=red}
  }
```

  Whenever the user changes their 'background' setting, the settings inside of
  whichever key is relevant will be loaded.
  ____________________________________________________________________________

  You can add any custom highlight group to the standard list below but you
  shouldn't remove any if you want a working colorscheme. Most of them are
  described under |highlight-default|, some from |group-name|, and others from
  common syntax groups.  Both help sections are good reads.
  ____________________________________________________________________________

  If you want to inherit a specific attribute of another highlight group, you
  can do the following:

```lua
  SpellBad = function(self)
    local inherited_style = self.SpellRare.style
    inherited_style.color = red

    return {
      bg=NONE,
      fg=NONE,
      style=inherited_style
    }
  end
```

  The function will be executed by |highlite| and transformed into the
  expected result.
  ____________________________________________________________________________

  NOTE: |Replace-mode| will probably be useful here.

  NOTE: /As long as you do not remove any highlight groups or colors/, you can
        safely ignore any highlight groups that are `link`ed to others.

        For example, programming languages almost exclusively link to the 1st
        and 2nd sections, so as long as you define everything there you will
        automatically be defining the rest of the highlights, which is one of
        the benefits of using this template.
]]

--[[ DO NOT EDIT `BG` NOR `FG`. ]]
local BG = 'bg'
local FG = 'fg'
local NONE = {}

--[[ These are the ones you should edit. ]]
-- This is the only highlight that must be defined separately.
local highlight_group_normal = {fg=white0, bg=black0}

-- This is where the rest of your highlights should go.
local highlight_groups = {
  --[[ 4.1. Text Analysis ]]
  Comment = {fg=gray1},
  NonText = {fg=black0},
  EndOfBuffer = {fg=black3},
  Whitespace  = {fg=gray5},

  --[[ 4.1.1. Literals]]
  Constant = {fg=magenta0},
  String = {fg=yellow0},
  Character = 'String',
  Number  = {fg=magenta0},
  Boolean = {fg=yellow1, style='bold'},
  Float   = 'Number',

  --[[ 4.1.2. Identifiers]]
  Identifier = {fg=orange2},
  Function = {fg=magenta1, style=bold},

  --[[ 4.1.3. Syntax]]
  Statement   = {fg=olive0,style='none'},
  Conditional = {fg=magenta2,style='bold'},
  Repeat   = {fg=magenta2,style='bold'},
  Label    = {fg=cyan3},
  Operator = {fg=cyan5, style='none'},
  Keyword  = {fg=cyan3},
  Exception = {fg=green2},
  Noise = 'Delimiter',

  --[[ 4.1.4. Metatextual Information]]
  PreProc = {fg=cyan3},
  Include = {fg=green2},
  Define = {fg=cyan3},
  Macro  = {fg=cyan3},
  PreCondit = {fg=cyan5},

  --[[ 4.1.5. Semantics]]
  Type         = {fg=olive0, style='bold'},
  StorageClass = {fg=orange2, style='bold'},
  Structure = {fg=cyan3, style='bold'},
  Typedef = {fg=olive0, style='bold'},

  --[[ 4.1.6. Edge Cases]]
  Special = {fg=magenta0, style='bold'},
  SpecialChar = {fg=magenta0, style='italic'},
  SpecialKey = 'Character',
  Tag = {fg=yellow1},
  Delimiter = {fg=cyan5},
  SpecialComment = {fg=gray1, style={'bold', 'nocombine'}},
  Debug = 'WarningMsg',

  --[[ 4.1.7. Help Syntax]]
  Underlined = {fg=cyan4, style='underline'},
  Ignore = {fg=gray0},
  Error = {fg=white0, bg=red0},
  Todo = {fg=orange0, bg=black2, style='bold'},
  Hint = {fg=black, bg=magenta, style='bold'},
  Info = function(self) return {fg=self.Hint.fg, bg=red2, style=self.Hint.style} end,
  Warning = function(self) return {fg=self.Hint.fg, bg=orange0, style=self.Hint.style} end,

  --[[ 4.2... Editor UI  ]]
  --[[ 4.2.1. Status Line]]
  StatusLine = {fg=white0, bg=gray5},
  StatusLineNC = {fg=gray4, bg=black2},
  StatusLineTerm = 'StatusLine',
  StatusLineTermNC = 'StatusLineNC',

  --[[ 4.2.2. Separators]]
  FloatBorder = {fg=gray0},
  TabLine = {fg=gray0, bg=gray2,style='none'},
  TabLineFill = {fg=black3, bg=black3,style='none'},
  TabLineSel = {fg=black1, bg=cyan3,style='none'},
  Title = {fg=gray1,style='bold'},
  VertSplit = {fg=gray5,style='none'},

  --[[ 4.2.3. Conditional Line Highlighting]]
  Conceal = 'NonText',
  CursorLine   = {bg=black2,style='none'},
  CursorLineNr = {fg=yellow, bg=black2,style='none'},
  debugBreakpoint = 'ErrorMsg',
  debugPC = 'ColorColumn',
  LineNr  = {fg=gray2},
  QuickFixLine = {bg=gray0},
  Visual    = {fg=black,bg=magenta3},
  VisualNOS = {bg=gray0},

  --[[ 4.2.4. Popup Menu]]
  Pmenu = {fg=white1, bg=gray5,style='none'},
  PmenuSbar = {bg=gray0},
  PmenuSel  = {style='inverse'},
  PmenuThumb = {bg=black1},
  WildMenu = 'PmenuSel',

  --[[ 4.2.5. Folds]]
  FoldColumn = {fg=magenta1,bg=BG, style='none'},
  Folded = {fg=magenta1,bg=red1},

  --[[ 4.2.6. Diffs]]
  DiffAdd    = {fg=green,style='none'},
  DiffChange = {fg=orange0,style='none'},
  DiffDelete = {fg=red2,style='none'}, -- function(self) return {fg=self.DiffAdd.fg, bg=red} end,
  DiffText   = {fg=white,style='none'}, -- function(self) return {fg=self.DiffAdd.fg, bg=yellow} end,

  --[[ 4.2.7. Searching]]
  IncSearch  = {style='inverse'},
  MatchParen = {fg=white0,bg=gray5},
  Search = {fg=black,bg=cyan1},

  --[[ 4.2.8. Spelling]]
  SpellBad   = {style={'undercurl', color=red}},
  SpellCap   = {style={'undercurl', color=yellow}},
  SpellLocal = {style={'undercurl', color=green}},
  SpellRare  = {style={'undercurl', color=orange0}},

  --[[ 4.2.9. Conditional Column Highlighting]]
  ColorColumn = {bg=gray5,style='none'},
  SignColumn  = {fg=yellow1,bg=BG,style='none'},

  --[[ 4.2.10. Messages]]
  ErrorMsg = {fg=red, style='bold'},
  HintMsg  = {fg=magenta},
  InfoMsg  = {fg=magenta1},
  ModeMsg  = {fg=yellow0},
  WarningMsg = {fg=olive0},
  Question   = {fg=yellow0},

  --[[ 4.2.11. LSP / Diagnostics ]]
  DiagnosticError = 'Error',
  DiagnosticFloatingError = 'ErrorMsg',
  DiagnosticSignError = 'DiagnosticFloatingError',

  DiagnosticWarn = 'Warning',
  DiagnosticFloatingWarn = 'WarningMsg',
  DiagnosticSignWarn = 'DiagnosticFloatingWarn',

  DiagnosticHint = 'Hint',
  DiagnosticFloatingHint = 'HintMsg',
  DiagnosticSignHint = 'DiagnosticFloatingHint',

  DiagnosticInfo = 'Info',
  DiagnosticFloatingInfo = 'InfoMsg',
  DiagnosticSignInfo = 'DiagnosticFloatingInfo',

  DiagnosticUnderlineError = {style={'undercurl', color=red}},
  DiagnosticUnderlineHint  = {style={'undercurl', color=magenta}},
  DiagnosticUnderlineInfo  = {style={'undercurl', color=magenta1}},
  DiagnosticUnderlineWarn = {style={'undercurl', color=orange0}},

  LspDiagnosticsDefaultError = 'DiagnosticError',
  LspDiagnosticsFloatingError = 'DiagnosticFloatingError',
  LspDiagnosticsSignError = 'DiagnosticSignError',

  LspDiagnosticsDefaultWarning = 'DiagnosticWarn',
  LspDiagnosticsFloatingWarning = 'DiagnosticFloatingWarn',
  LspDiagnosticsSignWarning = 'DiagnosticSignWarn',

  LspDiagnosticsDefaultHint = 'DiagnosticHint',
  LspDiagnosticsFloatingHint = 'DiagnosticFloatingHint',
  LspDiagnosticsSignHint = 'DiagnosticSignHint',

  LspDiagnosticsDefaultInformation = 'DiagnosticInfo',
  LspDiagnosticsFloatingInformation = 'DiagnosticFloatingInfo',
  LspDiagnosticsSignInformation = 'DiagnosticSignInfo',

  LspDiagnosticsUnderlineError = 'DiagnosticUnderlineError',
  LspDiagnosticsUnderlineHint  = 'DiagnosticUnderlineHint',
  LspDiagnosticsUnderlineInfo  = 'DiagnosticUnderlineInfo',
  LspDiagnosticsUnderlineWarning = 'DiagnosticUnderlineWarn',

  --[[ 4.2.12. Cursor ]]
  Cursor   = {fg=black2,bg=white1,style='none'},
  CursorIM = 'Cursor',
  CursorColumn = 'CursorLine',

  --[[ 4.2.13. Misc ]]
  Directory = {fg=cyan3, style='bold'},

  --[[ 4.3. Programming Languages
    Everything in this section is OPTIONAL. Feel free to remove everything
    here if you don't want to define it, or add more if there's something
    missing.
  ]]
  --[[ 4.3.1. C ]]
  cConstant    = 'Constant',
  cCustomClass = 'Type',

  --[[ 4.3.2. C++ ]]
  cppSTLexception = 'Exception',
  cppSTLnamespace = 'String',

  --[[ 4.3.3 C# ]]
  csBraces = 'Delimiter',
  csClass  = 'Structure',
  csClassType = 'Type',
  csContextualStatement = 'Conditional',
  csEndColon = 'Delimiter',
  csGeneric  = 'Typedef',
  csInterpolation = 'Include',
  csInterpolationDelimiter = 'SpecialChar',
  csLogicSymbols  = 'Operator',
  csModifier = 'Keyword',
  csNew = 'Operator',
  csNewType = 'Type',
  csParens  = 'Delimiter',
  csPreCondit  = 'PreProc',
  csQuote = 'Delimiter',
  csRepeat  = 'Repeat',
  csStorage = 'StorageClass',
  csUnspecifiedStatement = 'Statement',
  csXmlTag = 'Define',
  csXmlTagName = 'Define',
  razorCode = 'PreProc',
  razorcsLHSMemberAccessOperator = 'Noise',
  razorcsRHSMemberAccessOperator = 'razorcsLHSMemberAccessOperator',
  razorcsStringDelimiter = 'razorhtmlValueDelimiter',
  razorcsTypeNullable = 'Special',
  razorcsUnaryOperatorKeyword = 'Operator',
  razorDelimiter = 'Delimiter',
  razorEventAttribute = 'PreCondit',
  razorFor  = 'razorIf',
  razorhtmlAttribute = 'htmlArg',
  razorhtmlAttributeOperator = 'Operator',
  razorhtmlTag = 'htmlTag',
  razorhtmlValueDelimiter = 'Delimiter',
  razorIf  = 'PreCondit',
  razorImplicitExpression = 'PreProc',
  razorLine = 'Constant',
  razorUsing = 'Include',

  --[[ 4.3.4. CSS ]]
  cssAtRule          = 'PreCondit',
  cssAttr            = 'Keyword',
  cssAttrComma       = 'Noise',
  cssAttrRegion      = 'Keyword',
  cssBraces          = 'Delimiter',
  cssClassName       = 'Identifier',
  cssClassNameDot    = 'Noise',
  cssFlexibleBoxAttr = 'cssAttr',
  cssFunctionComma   = 'Noise',
  cssImportant       = 'Exception',
  cssNoise           = 'Noise',
  cssProp            = 'Label',
  cssPseudoClass     = 'Special',
  cssPseudoClassId   = 'cssSelectorOp',
  cssSelectorOp      = 'Operator',
  cssTagName         = 'Structure',
  cssUnitDecorators  = 'Type',
  scssAmpersand      = 'Special',
  scssAttribute      = 'Noise',
  scssBoolean        = 'Boolean',
  scssDefault        = 'Keyword',
  scssElse           = 'scssIf',
  scssMixinName      = function(self)
    local super = self.cssClassName
    return {bg=super.bg, fg=super.fg}
  end,
  scssIf             = 'PreCondit',
  scssInclude        = 'Include',
  scssSelectorChar   = 'Delimiter',
  scssDefinition     = 'PreProc',
  scssSelectorName   = 'Identifier',
  scssVariable       = 'Define',
  scssVariableAssignment = 'Operator',

  --[[ 4.3.5. Dart ]]
  dartLibrary = 'Statement',

  --[[ 4.3.6. dot ]]
  dotKeyChar = 'Character',
  dotType    = 'Type',

  --[[ 4.3.7. Go ]]
  goBlock    = 'Delimiter',
  goBoolean  = 'Boolean',
  goBuiltins = 'Operator',
  goField    = 'Identifier',
  goFloat    = 'Float',
  goFormatSpecifier = 'Character',
  goFunction = 'Function',
  goFunctionCall   = 'goFunction',
  goFunctionReturn = NONE,
  goMethodCall = 'goFunctionCall',
  goParamType  = 'goReceiverType',
  goPointerOperator = 'SpecialChar',
  goPredefinedIdentifiers = 'Constant',
  goReceiver     = 'goBlock',
  goReceiverType = 'goTypeName',
  goSimpleParams = 'goBlock',
  goType = 'Type',
  goTypeConstructor = 'goFunction',
  goTypeName  = 'Type',
  goVarAssign = 'Identifier',
  goVarDefs   = 'goVarAssign',

  --[[ 4.3.8. HTML ]]
  htmlArg    = 'Label',
  htmlBold   = {fg=gray, style='bold'},
  htmlTitle  = 'htmlBold',
  htmlEndTag = 'htmlTag',
  htmlH1 = 'markdownH1',
  htmlH2 = 'markdownH2',
  htmlH3 = 'markdownH3',
  htmlH4 = 'markdownH4',
  htmlH5 = 'markdownH5',
  htmlH6 = 'markdownH6',
  htmlItalic  = {style='italic'},
  htmlSpecialTagName = 'Keyword',
  htmlTag  = 'Special',
  htmlTagN = 'Typedef',
  htmlTagName = 'Type',

  --[[ 4.3.9. Java ]]
  javaClassDecl = 'Structure',

  --[[ 4.3.10. JavaScript ]]
  jsFuncBlock   = 'Function',
  jsObjectKey   = 'Type',
  jsReturn      = 'Keyword',
  jsVariableDef = 'Identifier',

  --[[ 4.3.11. JSON ]]
  jsonBraces = 'luaBraces',
  jsonEscape = 'SpecialChar',
  jsonKeywordMatch = 'Operator',
  jsonNull   = 'Constant',
  jsonQuote  = 'Delimiter',
  jsonString = 'String',
  jsonStringSQError = 'Exception',

  --[[ 4.3.12. Lua ]]
  luaBraces   = 'Structure',
  luaBrackets = 'Delimiter',
  luaBuiltin  = 'Keyword',
  luaComma    = 'Delimiter',
  luaFuncArgName = 'Identifier',
  luaFuncCall = 'Function',
  luaFuncId   = 'luaNoise',
  luaFuncKeyword = 'Type',
  luaFuncName   = 'Function',
  luaFuncParens = 'Delimiter',
  luaFuncTable  = 'Structure',
  luaIn     = 'luaRepeat',
  luaLocal  = 'Type',
  luaNoise  = 'Delimiter',
  luaParens = 'Delimiter',
  luaSpecialTable = 'Structure',
  luaSpecialValue = 'Function',
  luaStringLongTag = function(self)
    local delimiter = self.Delimiter
    return {bg=delimiter.bg, fg=delimiter.fg}
  end,

  --[[ 4.3.12. Make ]]
  makeCommands   = 'Statment',
  makeSpecTarget = 'Type',

  --[[ 4.3.13. Markdown ]]
  markdownCode = 'mkdCode',
  markdownCodeDelimiter = 'mkdCodeDelimiter',
  markdownH1 = {fg=magenta0, style='bold'},
  markdownH2 = {fg=orange0, style='bold'},
  markdownH3 = {fg=yellow, style='bold'},
  markdownH4 = {fg=darkgreen, style='bold'},
  markdownH5 = {fg=cyan, style='bold'},
  markdownH6 = {fg=red1, style='bold'},
  markdownLinkDelimiter = {fg=magenta0},
  markdownLinkTextDelimiter = 'markdownLinkDelimiter',
  markdownLinkText = {fg=orange1},
  markdownUrl = {fg=cyan},
  mkdBold = 'Ignore',
  mkdBoldItalic = 'mkdBold',
  mkdCode = 'String',
  mkdCodeDelimiter ={fg=cyan4}, 
  mkdCodeEnd = 'mkdCodeStart',
  mkdCodeStart = 'mkdCodeDelimiter',
  mkdHeading = 'Delimiter',
  mkdItalic  = 'mkdBold',
  mkdLineBreak = 'NonText',
  mkdListItem  = 'Special',
  mkdRule = function(self) return {fg=self.Ignore.fg, style={'underline', color=self.Delimiter.fg}} end,

  --[[ 4.3.20. Python ]]
  pythonBrackets    = 'Delimiter',
  pythonBuiltinFunc = 'Operator',
  pythonBuiltinObj  = 'Type',
  pythonBuiltinType = 'Type',
  pythonClass       = 'Structure',
  pythonClassParameters = 'pythonParameters',
  pythonDecorator  = 'PreProc',
  pythonDottedName = 'Identifier',
  pythonError     = 'Error',
  pythonException = 'Exception',
  pythonInclude   = 'Include',
  pythonIndentError = 'pythonError',
  pythonLambdaExpr  = 'pythonOperator',
  pythonOperator = 'Operator',
  pythonParam    = 'Identifier',
  pythonParameters = 'Delimiter',
  pythonSelf = 'Statement',
  pythonSpaceError = 'pythonError',
  pythonStatement  = 'Statement',

  --[[ 4.3.21. Ruby ]]
  rubyClass  = 'Structure',
  rubyDefine = 'Define',
  rubyInterpolationDelimiter = 'Delimiter',

  --[[ 4.3.23. Scala ]]
  scalaKeyword = 'Keyword',
  scalaNameDefinition = 'Identifier',

  --[[ 4.3.24. shell ]]
  shDerefSimple = 'SpecialChar',
  shFunctionKey = {fg=olive0},
  shLoop  = 'Repeat',
  shParen = 'Delimiter',
  shQuote = 'Delimiter',
  shSet   = 'Statement',
  shTestOpr = 'Debug',

  --[[ 4.3.25. Solidity ]]
  solBuiltinType  = 'Type',
  solContract     = 'Typedef',
  solContractName = 'Function',

  --[[ 4.3.26. TOML ]]
  tomlComment = 'Comment',
  tomlDate  = 'Special',
  tomlFloat = 'Float',
  tomlKey   = 'Label',
  tomlTable = 'Structure',

  --[[ 4.3.27. VimScript ]]
  vimCmdSep   = 'Delimiter',
  vimFunction = 'Function',
  vimFuncName = 'Function',
  vimFuncVar = {fg=cyan5},
  vimNotFunc = {fg=olive1},
  -- vimCommand = {fg=green},
  vimFgBgAttrib = 'Constant',
  vimHiCterm = 'Label',
  vimHiCtermFgBg = 'vimHiCterm',
  vimHiGroup = 'Typedef',
  vimHiGui   = 'vimHiCterm',
  vimHiGuiFgBg = 'vimHiGui',
  vimHiKeyList = 'Operator',
  vimIsCommand = 'Identifier',
  vimOption = 'Keyword',
  vimScriptDelim = 'Ignore',
  vimMap = {fg=green2},
  vimMapModKey = {fg=cyan5},
  vimNotation = {fg=cyan5},
  vimLet = {fg=green2},
  vimSet = {fg=green2},
  vimSetEqual = 'Operator',
  vimSetSep   = 'Delimiter',
  vimUserFunc = 'vimFunction',
  vimContinue = {fg=cyan5},
  vimAutoEvent = {fg=cyan5, style='bold'},
  vimSynType = {fg=magenta1},
  vimSynReg = {fg=green, style='none'},
  vimSynRegion = {fg=gray},
  vimSynMtchGrp = {fg=green},
  vimSynNextgroup = {fg=green},
  vimSynKeyRegion = {fg=yellow1},
  vimSynRegOpt = {fg=cyan},
  vimSynMtchOpt = {fg=cyan},
  vimSynContains = {fg=green},

  --[[ 4.3.28. XML ]]
  xmlAttrib = 'htmlArg',
  xmlEndTag = 'xmlTag',
  xmlEqual  = 'Operator',
  xmlTag    = 'htmlTag',
  xmlTagName = 'htmlTagName',

  --[[ 4.3.29. SQL ]]
  sqlKeyword = 'Keyword',
  sqlParen   = 'Delimiter',
  sqlSpecial = 'Constant',
  sqlStatement = 'Statement',
  sqlParenFunc = 'Function',

  --[[ 4.3.30. dos INI ]]
  dosiniHeader = 'Title',
  dosiniLabel  = 'Label',

  --[[ 4.3.31. Crontab ]]
  crontabDay  = 'StorageClass',
  crontabDow  = 'String',
  crontabHr   = 'Number',
  crontabMin  = 'Float',
  crontabMnth = 'Structure',

  --[[ 4.3.32. PlantUML ]]
  plantumlArrowLR   = 'Statement',
  plantumlColonLine = NONE,
  plantumlMindmap   = 'Label',
  plantumlMindmap2  = 'Label',

  --[[ 4.3.33. YAML ]]
  yamlKey = 'Label',

  --[[ 4.3.34. Git ]]
  diffAdded = 'DiffAdd',
  diffRemoved = 'DiffDelete',
  gitcommitHeader = 'SpecialComment',
  gitcommitDiscardedFile = 'gitcommitSelectedFile',
  gitcommitOverFlow = 'Error',
  gitcommitSelectedFile = 'Directory',
  gitcommitSummary  = 'Title',
  gitcommitUntrackedFile = 'gitcommitSelectedFile',
  gitconfigAssignment = 'String',
  gitconfigEscape = 'SpecialChar',
  gitconfigNone  = 'Operator',
  gitconfigSection = 'Structure',
  gitconfigVariable = 'Label',
  gitrebaseBreak = 'Keyword',
  gitrebaseCommit = 'Tag',
  gitrebaseDrop = 'Exception',
  gitrebaseEdit = 'Define',
  gitrebaseExec = 'PreProc',
  gitrebaseFixup = 'gitrebaseSquash',
  gitrebaseMerge = 'PreProc',
  gitrebasePick  = 'Include',
  gitrebaseReset = 'gitrebaseLabel',
  gitrebaseReword  = 'gitrebasePick',
  gitrebaseSquash  = 'Macro',
  gitrebaseSummary = 'Title',

  --[[ 4.3.35. Vimtex ]]
  texMathRegion = 'Number',
  texMathSub   = 'Number',
  texMathSuper = 'Number',
  texMathRegionX  = 'Number',
  texMathRegionXX = 'Number',

  --[[ 4.3.36. Coq ]]
  coqConstructor   = 'Constant',
  coqDefBinderType = 'coqDefType',
  coqDefContents1  = 'coqConstructor',
  coqDefType  = 'Typedef',
  coqIndBinderTerm  = 'coqDefBinderType',
  coqIndConstructor = 'Delimiter',
  coqIndTerm = 'Type',
  coqKwd = 'Keyword',
  coqKwdParen   = 'Function',
  coqProofDelim = 'coqVernacCmd',
  coqProofDot   = 'coqTermPunctuation',
  coqProofPunctuation = 'coqTermPunctuation',
  coqRequire = 'Include',
  coqTactic  = 'Operator',
  coqTermPunctuation = 'Delimiter',
  coqVernacCmd = 'Statement',
  coqVernacPunctuation = 'coqTermPunctuation',

  --[[ 4.3.37 Help ]]
  helpHeader = 'Label',
  helpOption = 'Keyword',
  helpHeadline = 'Title',
  helpSectionDelim = 'Delimiter',
  helpHyperTextJump = {fg=cyan4},

  --[[ 4.3.38 Man ]]
  -- manBold = function(self) return vim.tbl_extend('force', self.mkdCode, {style='nocombine'}) end,
  manOptionDesc = 'Special',
  manReference = 'Tag',
  manUnderline = 'Label',

  --[[ 4.3.39 Rust ]]
  rustIdentifier = 'Identifier',

  --[[ 4.3.40 XXD ]]
  xxdAddress = 'Label',
  xxdAscii = 'Character',
  xxdDot = 'Ignore',
  xxdSep = 'Delimiter',

  --[[ 4.3.41 verilog ]]
  verilogOperator = {fg=cyan5},
  verilogType = {fg=cyan5},
  systemverilogType = {fg=cyan5},

  --[[ 4.4. Plugins
    Everything in this section is OPTIONAL. Feel free to remove everything
    here if you don't want to define it, or add more if there's something
    missing.
  ]]
  -- [> 4.4.1. ALE <]
  -- ALEErrorSign   = 'DiagnosticSignError',
  -- ALEWarningSign = 'DiagnosticSignWarn',

  --[[ 4.4.2. coc.nvim ]]
  CocErrorHighlight = 'DiagnosticUnderlineError',
  CocErrorSign = 'DiagnosticSignError',
  CocHintHighlight  = 'DiagnosticUnderlineHint  ',
  CocHintSign  = 'DiagnosticSignHint',
  CocInfoHighlight  = 'DiagnosticUnderlineInfo',
  CocInfoSign  = 'DiagnosticSignInfo',
  CocWarningHighlight = 'DiagnosticUnderlineWarn',
  CocWarningSign = 'DiagnosticSignWarn',

  --[[ 4.4.2. vim-jumpmotion / vim-easymotion ]]
  EasyMotion = 'IncSearch',
  JumpMotion = 'EasyMotion',

  --[[ 4.4.4. vim-gitgutter / vim-signify / gitsigns.nvim ]]
  GitGutterAdd    = {fg = green},
  GitGutterChange = {fg = yellow},
  GitGutterDelete = {fg = red},
  GitGutterChangeDelete = {fg=orange0},

  SignifySignAdd    = 'GitGutterAdd',
  SignifySignChange = 'GitGutterChange',
  SignifySignDelete = 'GitGutterDelete',
  SignifySignChangeDelete = 'GitGutterChangeDelete',

  GitSignsAdd = 'GitGutterAdd',
  GitSignsChange = 'GitGutterChange',
  GitSignsDelete = 'GitGutterDelete',

  -- [> 4.4.5. vim-indent-guides <]
  -- IndentGuidesOdd  = {bg=gray0},
  -- IndentGuidesEven = {bg=gray},

  -- [> 4.4.7. NERDTree <]
  -- NERDTreeCWD = 'Label',
  -- NERDTreeUp  = 'Operator',
  -- NERDTreeDir = 'Directory',
  -- NERDTreeDirSlash = 'Delimiter',
  -- NERDTreeOpenable = 'NERDTreeDir',
  -- NERDTreeClosable = 'NERDTreeOpenable',
  -- NERDTreeExecFile = 'Function',
  -- NERDTreeLinkTarget = 'Tag',

  --[[ 4.4.8. nvim-treesitter ]]
  TSConstBuiltin = 'Constant',
  TSConstructor  = 'Typedef',
  TSFuncBuiltin  = 'Function',
  TSStringEscape = 'Character',
  TSStringRegex  = 'SpecialChar',
  TSURI = 'Tag',
  TSVariableBuiltin = 'Identifier',

  --[[ 4.4.9. barbar.nvim ]]
  BufferCurrent       = 'TabLineSel',
  BufferCurrentIndex  = function(self) return {fg=self.InfoMsg.fg, bg=self.BufferCurrent.bg} end,
  BufferCurrentMod    = {fg=yellow0, bg=black, style='bold'},
  BufferCurrentSign   = 'HintMsg',
  BufferCurrentTarget = 'BufferCurrentSign',

  BufferInactive       = 'BufferVisible',
  BufferInactiveIndex  = function(self) return {fg=self.InfoMsg.fg, bg=self.BufferInactive.bg} end,
  BufferInactiveMod    = 'BufferVisibleMod',
  BufferInactiveSign   = 'BufferVisibleSign',
  BufferInactiveTarget = 'BufferVisibleTarget',

  BufferTabpages    = {fg=highlight_group_normal.bg, bg=FG, style='bold'},
  BufferTabpageFill = 'TabLineFill',

  BufferVisible       = 'TabLine',
  BufferVisibleIndex  = function(self) return {fg=self.InfoMsg.fg, bg=self.BufferVisible.bg} end,
  BufferVisibleMod    = {fg=white, bg=gray0},
  BufferVisibleSign   = 'BufferVisible',
  BufferVisibleTarget = function(self)
    local super = self.BufferVisibleMod
    return {fg=super.fg, bg=super.bg, style='bold'}
  end,

  --[[ 4.4.10. vim-sandwhich ]]
  OperatorSandwichChange = 'DiffText',

  --[[ 4.4.11. Fern ]]
  FernBranchText = 'Directory',

  --[[ 4.4.12. LSPSaga ]]
  DefinitionCount = 'Number',
  DefinitionIcon  = 'Special',
  ReferencesCount = 'Number',
  ReferencesIcon  = 'DefinitionIcon',
  TargetFileName  = 'Directory',
  TargetWord = 'Title',

  --[[ 4.4.13. indent-blankline.nvim ]]
  IndentBlanklineChar = function(self) return vim.tbl_extend('force', self.Whitespace, {style='nocombine'}) end,
  IndentBlanklineSpaceChar = 'IndentBlanklineChar',

  --[[ 4.4.14. trouble.nvim ]]
  TroubleCount = function(self) return vim.tbl_extend('force', self.Number, {style='underline'}) end,

  --[[ 4.4.15. todo-comments.nvim ]]
  TodoFgFIX = function(self) return {fg=self.ErrorMsg.fg} end,
  TodoFgHACK = function(self) return {fg=self.Todo.fg} end,
  TodoFgNOTE = 'HintMsg',
  TodoFgPERF = 'InfoMsg',
  TodoFgTODO = {fg=cyan},
  TodoFgWARN = function(self) return {fg=self.WarningMsg.fg} end,

  TodoBgFIX = function(self) return {fg=black, bg=self.ErrorMsg.fg, style={'bold', 'italic', 'nocombine'}} end,
  TodoBgHACK = function(self) return {fg=black, bg=self.Todo.fg, style={'bold', 'italic', 'nocombine'}} end,
  TodoBgNOTE = function(self) return {fg=black, bg=self.Hint.bg, style={'bold', 'italic', 'nocombine'}} end,
  TodoBgPERF = function(self) return {fg=black, bg=self.Info.bg, style={'bold', 'italic', 'nocombine'}} end,
  TodoBgTODO = {fg=black, bg=cyan, style={'bold', 'italic', 'nocombine'}},
  TodoBgWARN = function(self) return {fg=black, bg=self.Warning.bg, style={'bold', 'italic', 'nocombine'}} end,

  TodoSignFIX  = 'TodoFgFIX',
  TodoSignHACK = 'TodoFgHACK',
  TodoSignNOTE = 'TodoFgNOTE',
  TodoSignPERF = 'TodoFgPERF',
  TodoSignTODO = 'TodoFgTODO',
  TodoSignWARN = 'TodoFgWARN',

  --[[ 4.4.16. nvim-cmp ]]
  CmpDocumentationBorder = 'FloatBorder',
  CmpItemAbbrDefault = {fg=FG},
  CmpItemAbbrMatchDefault = {fg=cyan4},
  CmpItemAbbrMatchFuzzyDefault = {style={'nocombine'}},
  CmpItemKindDefault = 'Type',
  CmpItemKindClassDefault = 'CmpItemKindStructDefault',
  CmpItemKindColorDefault = 'Label',
  CmpItemKindConstantDefault = 'Constant',
  CmpItemKindConstructorDefault = 'CmpItemKindMethodDefault',
  CmpItemKindEnumDefault = 'CmpItemKindStructDefault',
  CmpItemKindEnumMemberDefault = 'CmpItemKindConstantDefault',
  CmpItemKindEventDefault = 'Repeat',
  CmpItemKindFieldDefault = 'Identifier',
  CmpItemKindFileDefault = 'Directory',
  CmpItemKindFolderDefault = 'CmpItemKindFileDefault',
  CmpItemKindFunctionDefault = 'Function',
  CmpItemKindInterfaceDefault = 'Type',
  CmpItemKindKeywordDefault = 'Keyword',
  CmpItemKindMethodDefault = 'CmpItemKindFunctionDefault',
  CmpItemKindModuleDefault = 'Include',
  CmpItemKindOperatorDefault = 'Operator',
  CmpItemKindPropertyDefault = 'CmpItemKindFieldDefault',
  CmpItemKindReferenceDefault = 'StorageClass',
  CmpItemKindSnippetDefault = 'Special',
  CmpItemKindStructDefault = 'Structure',
  CmpItemKindTextDefault = 'String',
  CmpItemKindTypeParameterDefault = 'Typedef',
  CmpItemKindUnitDefault = 'CmpItemKindStructDefault',
  CmpItemKindValueDefault = 'CmpItemKindConstantDefault',
  CmpItemKindVariableDefault = 'Identifier',
  CmpItemMenuDefault = 'NormalFloat',
  CmpItemMenuThumb = {fg=white, style='bold'},

  --[[ 4.4.17. packer.nvim ]]
  packerFail = 'ErrorMsg',
  packerHash = 'Number',
  packerPackageNotLoaded = 'Ignore',
  packerStatusFail = 'Statement',
  packerStatusSuccess = 'packerStatusFail',
  packerSuccess = function(self) return {fg=green, style=self.packerFail.style} end,

  --[[ 4.4.18. nvim-tree ]]
  NvimTreeGitDeleted = function(self) return {fg=self.DiffDelete.bg, bg=NONE} end,
  NvimTreeGitDirty = {fg=orange0, bg=NONE},
  NvimTreeGitIgnored = 'Ignore',
  NvimTreeGitMerge = 'NvimTreeGitRenamed',
  NvimTreeGitNew = function(self) return {fg=self.DiffAdd.bg, bg=NONE} end,
  NvimTreeGitRenamed = function(self) return {fg=self.DiffChange.bg, bg=NONE} end,
  NvimTreeGitStaged = {fg=cyan, bg=NONE},

  --[[ 4.4.19. ctrlsf ]]
  ctrlsfMatch = {fg=black,bg=orange1},

  --[[ 4.4.20. nvim-telescope ]]
  TelescopeSelection = 'CursorLine',
  -- TelescopeMatching = 

}

--[[ Step 5: Terminal Colors
  Define the color palette used by :terminal when in GUI Vim
  or in TUI Vim when 'termguicolors' is enabled. If this list
  is empty or if it doesn't contain exactly 16 items, the corresponding
  Vim variable won't be set.

  The expected values are colors defined in step 3.

  Terminal emulators use a basic palette of 16 colors that can be
  addressed by CLI and TUI tools via their name or their index, from
  0 to 15. The list is not really standardized but it is generally
  assumed to look like this:

   | Index  | Name          |
   |:------:|:-------------:|
   | 1      | black         |
   | 2      | darkred       |
   | 3      | darkgreen     |
   | 4      | darkyellow    |
   | 5      | darkblue      |
   | 6      | darkmagenta   |
   | 7      | darkcyan      |
   | 8      | gray          |
   | 9      | darkgray      |
   | 10     | red           |
   | 11     | green         |
   | 12     | yellow        |
   | 13     | blue          |
   | 14     | magenta       |
   | 15     | cyan          |
   | 16     | white         |

  While you are certainly free to make colors 0 to 7 shades of blue,
  this will inevitably cause usability issues so… be careful.
]]
local terminal_colors = {
  [1]  = {'#000000',  0,'black'      },
  [2]  = {'#FF5555',  1,'darkred'    },
  [3]  = {'#50FA7B',  2,'darkgreen'  },
  [4]  = {'#F1FA8C',  3,'darkyellow' },
  [5]  = {'#BD93F9',  4,'darkblue'   },
  [6]  = {'#FF79C6',  5,'darkmagenta'},
  [7]  = {'#8BE9FD',  6,'darkcyan'   },
  [8]  = {'#BFBFBF',  7,'gray'       },
  [9]  = {'#4D4D4D',  8,'darkgray'   },
  [10] = {'#FF6E67',  9,'red'        },
  [11] = {'#5AF78E', 10,'green'      },
  [12] = {'#F4F99D', 11,'yellow'     },
  [13] = {'#CAA9FA', 12,'blue'       },
  [14] = {'#FF92D0', 13,'magenta'    },
  [15] = {'#9AEDFE', 14,'cyan'       },
  [16] = {'#ffffff', 15,'white'      },
}

--[[ Step 5: Sourcing
  When you wish to load your colorscheme, simply add this folder with a plugin manager
  and then use `colorscheme <your colorscheme name>`. For example, in my configuration,
  I source highlite by using `colorscheme highlite`.

  These online resources can help you design your colorscheme:

  1. the xterm palette.
    * http://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
  2. play with hexadecimal colors right in the address bar (currently down).
    * http://whatcolor.herokuapp.com/
  3. similar concept, fuzzier implementation.
    * http://color.hailpixel.com/
  4. similar concept, fancier implementation.
    * http://colourco.de/
  5. extract a palette from an image.
    * http://www.colr.org/
  6. search for 'word', get images and color palettes.
    * http://colores.manugarri.com/
  7. user-created palettes.
    * http://www.colourlovers.com/palettes
  8. a no-nonsense colorscheme generator.
    * http://www.pluaang.dk/color+scheme/
  9. Adobe's fancy colorscheme generator.
    * https://color.adobe.com/
  10. The classic 'Color Scheme Designer', rebranded.
    * http://paletton.com/
  11. A very smart palette generator.
    * http://vrl.cs.brown.edu/color
  12. 'I Made My Own Colour Scheme and You Can Too!'.
    * https://cmcenroe.me/2018/04/03/colour-scheme.html

  A few things to note:

  * The Windows console (`cmd`) is limited to the 16 so-called 'ANSI' colors but it used to
      have a few of them interverted which makes numbers impractical. Use color names
      instead of numbers: :help cterm-colors
    * The Windows console doesn't do italics, underlines or bolded text;
      it is limited to normal and reverse. Keep that in mind if you want
      your colorscheme to be usable in as many environments as possible by as many
      people as possible.
    * The Windows TERMINAL, however, is capable of more.
  * All of the terminal emulators in use these days allow their users to
    change the 16 so-called 'ANSI' colors. It is also possible on some platforms
    to change some or all of the 256 colors in the xterm palette. Don't take
    anything for granted.
  * When used against a light background, strong colors work better than muted
    ones. Light or dark doesn't really matters. Also, it is harder to discriminate
    between two similar colors on a light background.
  * Both strong and muted colors work well against a dark background. It is also
    easier to work with similar colors, but dark colors don't work at all.
  * Use as many text samples as possible. String-heavy languages may look completely
    different than keyword-heavy ones. This can have an impact on the usability
    of your colorscheme.
  * Most terminal emulators and terminal multiplexers currently in use on unix-like
    systems support 256 colors but they almost always default to a '$TERM' that tells
    Vim otherwise. Your users will need to make sure their terminal emulator/multiplexer
    is correctly set up if they want to enjoy the best possible experience.
]]

require(vim.g.colors_name)(
  highlight_group_normal,
  highlight_groups,
  terminal_colors
)

-- Thanks to Romain Lafourcade (https://github.com/romainl) for the original template (romainl/vim-rnb).
