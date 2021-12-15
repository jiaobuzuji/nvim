" Theme: PaperColor
" Author: Nikyle Nguyen <NLKNguyen@MSN.com>
" License: MIT
" Source: http://github.com/NLKNguyen/papercolor-theme

let s:version = '0.9.x'

" Note on navigating this source code:
" - Use folding feature to collapse/uncollapse blocks of marked code
"     zM to fold all markers in this file to see the structure of the source code
"     zR to unfold all recursively
"     za to toggle a fold
"     See: http://vim.wikia.com/wiki/Folding
" - The main section is at the end where the functions are called in order.

" Theme Repository: {{{

let s:themes = {}

" }}}

fun! s:register_default_theme()
  " Theme name should be lowercase
  let s:themes['default'] = {
        \   'maintainer'  : 'Nikyle Nguyen <me@Nikyle.com>',
        \   'source' : 'http://github.com/NLKNguyen/papercolor-theme',
        \   'description' : 'The original PaperColor Theme, inspired by Google Material Design',
        \   'options' : {
        \       'allow_bold': 1
        \    }
        \ }

  " Theme can have 'light' and/or 'dark' color palette.
  " Color values can be HEX and/or 256-color. Use empty string '' if not provided.
  " Only color00 -> color15 are required. The rest are optional.
  " TODO: idea for subtheme options
  " let s:themes['default'].light.subtheme = {
  "       \     'alternative' : {
  "       \         'options' : {
  "       \           'transparent_background': 1
  "       \         },
  "       \         'palette' : {
  "       \         }
  "       \     }
  "       \ }

  let s:themes['default'].dark = {
        \     'NO_CONVERSION': 1,
        \     'TEST_256_COLOR_CONSISTENCY' : 1,
        \     'palette' : {
        \       'color00' : ['#1c1c1c', '234'],
        \       'color01' : ['#af005f', '125'],
        \       'color02' : ['#5faf00', '70'],
        \       'color03' : ['#d7af5f', '179'],
        \       'color04' : ['#5fafd7', '74'],
        \       'color05' : ['#808080', '244'],
        \       'color06' : ['#d7875f', '173'],
        \       'color07' : ['#d0d0d0', '252'],
        \       'color08' : ['#585858', '240'],
        \       'color09' : ['#5faf5f', '71'],
        \       'color10' : ['#afd700', '148'],
        \       'color11' : ['#af87d7', '140'],
        \       'color12' : ['#ffaf00', '214'],
        \       'color13' : ['#ff5faf', '205'],
        \       'color14' : ['#00afaf', '37'],
        \       'color15' : ['#5f8787', '66'],
        \       'color16' : ['#5fafd7', '74'],
        \       'color17' : ['#d7af00', '178'],
        \       'cursor_fg' : ['#1c1c1c', '234'],
        \       'cursor_bg' : ['#c6c6c6', '251'],
        \       'cursorline' : ['#303030', '236'],
        \       'cursorcolumn' : ['#303030', '236'],
        \       'cursorlinenr_fg' : ['#ffff00', '226'],
        \       'cursorlinenr_bg' : ['#1c1c1c', '234'],
        \       'popupmenu_fg' : ['#c6c6c6', '251'],
        \       'popupmenu_bg' : ['#303030', '236'],
        \       'search_fg' : ['#000000', '16'],
        \       'search_bg' : ['#00875f', '29'],
        \       'linenumber_fg' : ['#585858', '240'],
        \       'linenumber_bg' : ['#1c1c1c', '234'],
        \       'vertsplit_fg' : ['#5f8787', '66'],
        \       'vertsplit_bg' : ['#1c1c1c', '234'],
        \       'statusline_active_fg' : ['#1c1c1c', '234'],
        \       'statusline_active_bg' : ['#5f8787', '66'],
        \       'statusline_inactive_fg' : ['#bcbcbc', '250'],
        \       'statusline_inactive_bg' : ['#3a3a3a', '237'],
        \       'todo_fg' : ['#ff8700', '208'],
        \       'todo_bg' : ['#1c1c1c', '234'],
        \       'error_fg' : ['#af005f', '125'],
        \       'error_bg' : ['#5f0000', '52'],
        \       'matchparen_bg' : ['#4e4e4e', '239'],
        \       'matchparen_fg' : ['#c6c6c6', '251'],
        \       'visual_fg' : ['#000000', '16'],
        \       'visual_bg' : ['#8787af', '103'],
        \       'folded_fg' : ['#d787ff', '177'],
        \       'folded_bg' : ['#5f005f', '53'],
        \       'wildmenu_fg': ['#1c1c1c', '234'],
        \       'wildmenu_bg': ['#afd700', '148'],
        \       'spellbad':   ['#5f0000', '52'],
        \       'spellcap':   ['#5f005f', '53'],
        \       'spellrare':  ['#005f00', '22'],
        \       'spelllocal': ['#00005f', '17'],
        \       'diffadd_fg':    ['#87d700', '112'],
        \       'diffadd_bg':    ['#005f00', '22'],
        \       'diffdelete_fg': ['#af005f', '125'],
        \       'diffdelete_bg': ['#5f0000', '52'],
        \       'difftext_fg':   ['#5fffff', '87'],
        \       'difftext_bg':   ['#008787', '30'],
        \       'diffchange_fg': ['#d0d0d0', '252'],
        \       'diffchange_bg': ['#005f5f', '23'],
        \       'tabline_bg':          ['#262626', '235'],
        \       'tabline_active_fg':   ['#121212', '233'],
        \       'tabline_active_bg':   ['#00afaf', '37'],
        \       'tabline_inactive_fg': ['#bcbcbc', '250'],
        \       'tabline_inactive_bg': ['#585858', '240'],
        \       'buftabline_bg':          ['#262626', '235'],
        \       'buftabline_current_fg':  ['#121212', '233'],
        \       'buftabline_current_bg':  ['#00afaf', '37'],
        \       'buftabline_active_fg':   ['#00afaf', '37'],
        \       'buftabline_active_bg':   ['#585858', '240'],
        \       'buftabline_inactive_fg': ['#bcbcbc', '250'],
        \       'buftabline_inactive_bg': ['#585858', '240']
        \     }
        \   }
endfun

" ============================ THEME REGISTER =================================

" Acquire Theme Data: {{{

" Brief:
"   Function to get theme information and store in variables for other
"   functions to use
"
" Require:
"   s:themes    <dictionary>    collection of all theme palettes
"
" Require Optionally:
"   {g:PaperColor_Theme_[s:theme_name]}   <dictionary>  user custom theme palette
"   g:PaperColor_Theme_Options            <dictionary>  user options
"
" Expose:
"   s:theme_name       <string>     the name of the selected theme
"   s:selected_theme   <dictionary> the selected theme object (contains palette, etc.)
"   s:selected_variant <string>     'light' or 'dark'
"   s:palette          <dictionary> the palette of selected theme
"   s:options          <dictionary> user options
fun! s:acquire_theme_data()

  " Get theme name: {{{
  let s:theme_name = 'default'

  if exists("g:PaperColor_Theme") " Users expressed theme preference
    let lowercase_theme_name = tolower(g:PaperColor_Theme)

    if lowercase_theme_name !=? 'default'
      let theme_identifier = 'PaperColor_' . lowercase_theme_name
      let autoload_function = theme_identifier . '#register'

      call {autoload_function}()

      let theme_variable = 'g:' . theme_identifier

      if exists(theme_variable)
        let s:theme_name = lowercase_theme_name
        let s:themes[s:theme_name] = {theme_variable}
      endif

    endif

  endif
  " }}}

  if s:theme_name ==? 'default'
    " Either no other theme is specified or they failed to load
    " Defer loading default theme until now
    call s:register_default_theme()
  endif

  let s:selected_theme = s:themes[s:theme_name]

  " Get Theme Variant: either dark or light  {{{
  let s:selected_variant = 'dark'

  let s:is_dark=(&background == 'dark')

  if s:is_dark
    if has_key(s:selected_theme, 'dark')
      let s:selected_variant = 'dark'
    else " in case the theme only provides the other variant
      let s:selected_variant = 'light'
    endif

  else " is light background
    if has_key(s:selected_theme, 'light')
      let s:selected_variant = 'light'
    else " in case the theme only provides the other variant
      let s:selected_variant = 'dark'
    endif
  endif

  let s:palette = s:selected_theme[s:selected_variant].palette

  " Systematic User-Config Options: {{{
  " Example config in .vimrc
  " let g:PaperColor_Theme_Options = {
  "       \   'theme': {
  "       \     'default': {
  "       \       'allow_bold': 1,
  "       \       'allow_italic': 0,
  "       \       'transparent_background': 1
  "       \     }
  "       \   },
  "       \   'language': {
  "       \     'python': {
  "       \       'highlight_builtins' : 1
  "       \     },
  "       \     'c': {
  "       \       'highlight_builtins' : 1
  "       \     },
  "       \     'cpp': {
  "       \       'highlight_standard_library': 1
  "       \     }
  "       \   }
  "       \ }
  "
  let s:options = {}


  if exists("g:PaperColor_Theme_Options")
    let s:options = g:PaperColor_Theme_Options
  endif
  " }}}

  " }}}
endfun


" }}}

" Identify Color Mode: {{{

fun! s:identify_color_mode()
  let s:MODE_16_COLOR = 0
  let s:MODE_256_COLOR = 1
  let s:MODE_GUI_COLOR = 2

  if has("gui_running")  || has('termguicolors') && &termguicolors || has('nvim') && $NVIM_TUI_ENABLE_TRUE_COLOR
    let s:mode = s:MODE_GUI_COLOR
  elseif (&t_Co >= 256)
    let s:mode = s:MODE_256_COLOR
  else
    let s:mode = s:MODE_16_COLOR
  endif
endfun

" }}}

" ============================ OPTION HANDLER =================================

" Generate Them Option Variables: {{{


fun! s:generate_theme_option_variables()
  " 0. All possible theme option names must be registered here
  let l:available_theme_options = [
        \ 'allow_bold',
        \ 'allow_italic',
        \ 'transparent_background',
        \ ]

  " 1. Generate variables and set to default value
  for l:option in l:available_theme_options
      let s:{'themeOpt_' . l:option} = 0
  endfor

  let s:themeOpt_override = {} " special case, this has to be a dictionary

  " 2. Reassign value to the above variables based on theme settings

  " 2.1 In case the theme has top-level options
  if has_key(s:selected_theme, 'options')
    let l:theme_options = s:selected_theme['options']
    for l:opt_name in keys(l:theme_options)
      let s:{'themeOpt_' . l:opt_name} = l:theme_options[l:opt_name]
      " echo 's:themeOpt_' . l:opt_name . ' = ' . s:{'themeOpt_' . l:opt_name}
    endfor
  endif

  " 2.2 In case the theme has specific variant options
  if has_key(s:selected_theme[s:selected_variant], 'options')
    let l:theme_options = s:selected_theme[s:selected_variant]['options']
    for l:opt_name in keys(l:theme_options)
      let s:{'themeOpt_' . l:opt_name} = l:theme_options[l:opt_name]
      " echo 's:themeOpt_' . l:opt_name . ' = ' . s:{'themeOpt_' . l:opt_name}
    endfor
  endif


  " 3. Reassign value to the above variables which the user customizes
  " Part of user-config options
  let s:theme_options = {}
  if has_key(s:options, 'theme')
    let s:theme_options = s:options['theme']
  endif

  " 3.1 In case user sets for a theme without specifying which variant
  if has_key(s:theme_options, s:theme_name)
    let l:theme_options = s:theme_options[s:theme_name]
    for l:opt_name in keys(l:theme_options)
      let s:{'themeOpt_' . l:opt_name} = l:theme_options[l:opt_name]
      " echo 's:themeOpt_' . l:opt_name . ' = ' . s:{'themeOpt_' . l:opt_name}
    endfor
  endif


  " 3.2 In case user sets for a specific variant of a theme

  " Create the string that the user might have set for this theme variant
  " for example, 'default.dark'
  let l:specific_theme_variant = s:theme_name . '.' . s:selected_variant

  if has_key(s:theme_options, l:specific_theme_variant)
    let l:theme_options = s:theme_options[l:specific_theme_variant]
    for l:opt_name in keys(l:theme_options)
      let s:{'themeOpt_' . l:opt_name} = l:theme_options[l:opt_name]
      " echo 's:themeOpt_' . l:opt_name . ' = ' . s:{'themeOpt_' . l:opt_name}
    endfor
  endif

endfun
" }}}

" Check If Theme Has Hint: {{{
"
" Brief:
"   Function to Check if the selected theme and variant has a hint
"
" Details:
"   A hint is a known key that has value 1
"   It is not part of theme design but is used for technical purposes
"
" Example:
"   If a theme has hint 'NO_CONVERSION', then we can assume that every
"   color value is a complete pair, so we don't have to check.

fun! s:theme_has_hint(hint)
  return has_key(s:selected_theme[s:selected_variant], a:hint) &&
        \ s:selected_theme[s:selected_variant][a:hint] == 1
endfun
" }}}

" Set Overriding Colors: {{{

fun! s:set_overriding_colors()

  if s:theme_has_hint('NO_CONVERSION')
    " s:convert_colors will not do anything, so we take care of conversion
    " for the overriding colors that need to be converted

    if s:mode == s:MODE_GUI_COLOR
      " if GUI color is not provided, convert from 256 color that must be available
      if !empty(s:themeOpt_override)
        call s:load_256_to_GUI_converter()
      endif

      for l:color in keys(s:themeOpt_override)
        let l:value = s:themeOpt_override[l:color]
        if l:value[0] == ''
          let l:value[0] = s:to_HEX[l:value[1]]
        endif
        let s:palette[l:color] = l:value
      endfor

    elseif s:mode == s:MODE_256_COLOR
      " if 256 color is not provided, convert from GUI color that must be available
      if !empty(s:themeOpt_override)
        call s:load_GUI_to_256_converter()
      endif

      for l:color in keys(s:themeOpt_override)
        let l:value = s:themeOpt_override[l:color]
        if l:value[1] == ''
          let l:value[1] = s:to_256(l:value[0])
        endif
        let s:palette[l:color] = l:value
      endfor
    endif

  else " simply set the colors and let s:convert_colors() take care of conversion

    for l:color in keys(s:themeOpt_override)
      let s:palette[l:color] = s:themeOpt_override[l:color]
    endfor
  endif

endfun
" }}}

" Generate Language Option Variables: {{{

" Brief:
"   Function to generate language option variables so that there is no need to
"   look up from the dictionary every time the option value is checked in the
"   function s:apply_syntax_highlightings()
"
" Require:
"   s:options <dictionary> user options
"
" Require Optionally:
"   g:PaperColor_Theme_Options  <dictionary>  user option config in .vimrc
"
" Expose:
"   s:langOpt_[LANGUAGE]__[OPTION]  <any>   variables for language options
"
" Example:
"     g:PaperColor_Theme_Options has something like this:
"       'language': {
"       \   'python': {
"       \     'highlight_builtins': 1
"       \   }
"       }
"    The following variable will be generated:
"    s:langOpt_python__highlight_builtins = 1

fun! s:generate_language_option_variables()
  " 0. All possible theme option names must be registered here
  let l:available_language_options = [
        \   'c__highlight_builtins',
        \   'cpp__highlight_standard_library',
        \   'python__highlight_builtins'
        \ ]

  " 1. Generate variables and set to default value
  for l:option in l:available_language_options
    let s:{'langOpt_' . l:option} = 0
  endfor

  " Part of user-config options
  if has_key(s:options, 'language')
    let l:language_options = s:options['language']
    " echo l:language_options
    for l:lang in keys(l:language_options)
      let l:options = l:language_options[l:lang]
      " echo l:lang
      " echo l:options
      for l:option in keys(l:options)
        let s:{'langOpt_' . l:lang . '__' . l:option} = l:options[l:option]
        " echo 's:langOpt_' . l:lang . '__' . l:option . ' = ' . l:options[l:option]
      endfor
    endfor

  endif

endfun
" }}}

" =========================== COLOR CONVERTER =================================

fun! s:load_GUI_to_256_converter()
  " GUI-color To 256-color: {{{
  " Returns an approximate grey index for the given grey level
  fun! s:grey_number(x)
    if &t_Co == 88
      if a:x < 23
        return 0
      elseif a:x < 69
        return 1
      elseif a:x < 103
        return 2
      elseif a:x < 127
        return 3
      elseif a:x < 150
        return 4
      elseif a:x < 173
        return 5
      elseif a:x < 196
        return 6
      elseif a:x < 219
        return 7
      elseif a:x < 243
        return 8
      else
        return 9
      endif
    else
      if a:x < 14
        return 0
      else
        let l:n = (a:x - 8) / 10
        let l:m = (a:x - 8) % 10
        if l:m < 5
          return l:n
        else
          return l:n + 1
        endif
      endif
    endif
  endfun

  " Returns the actual grey level represented by the grey index
  fun! s:grey_level(n)
    if &t_Co == 88
      if a:n == 0
        return 0
      elseif a:n == 1
        return 46
      elseif a:n == 2
        return 92
      elseif a:n == 3
        return 115
      elseif a:n == 4
        return 139
      elseif a:n == 5
        return 162
      elseif a:n == 6
        return 185
      elseif a:n == 7
        return 208
      elseif a:n == 8
        return 231
      else
        return 255
      endif
    else
      if a:n == 0
        return 0
      else
        return 8 + (a:n * 10)
      endif
    endif
  endfun

  " Returns the palette index for the given grey index
  fun! s:grey_colour(n)
    if &t_Co == 88
      if a:n == 0
        return 16
      elseif a:n == 9
        return 79
      else
        return 79 + a:n
      endif
    else
      if a:n == 0
        return 16
      elseif a:n == 25
        return 231
      else
        return 231 + a:n
      endif
    endif
  endfun

  " Returns an approximate colour index for the given colour level
  fun! s:rgb_number(x)
    if &t_Co == 88
      if a:x < 69
        return 0
      elseif a:x < 172
        return 1
      elseif a:x < 230
        return 2
      else
        return 3
      endif
    else
      if a:x < 75
        return 0
      else
        let l:n = (a:x - 55) / 40
        let l:m = (a:x - 55) % 40
        if l:m < 20
          return l:n
        else
          return l:n + 1
        endif
      endif
    endif
  endfun

  " Returns the actual colour level for the given colour index
  fun! s:rgb_level(n)
    if &t_Co == 88
      if a:n == 0
        return 0
      elseif a:n == 1
        return 139
      elseif a:n == 2
        return 205
      else
        return 255
      endif
    else
      if a:n == 0
        return 0
      else
        return 55 + (a:n * 40)
      endif
    endif
  endfun

  " Returns the palette index for the given R/G/B colour indices
  fun! s:rgb_colour(x, y, z)
    if &t_Co == 88
      return 16 + (a:x * 16) + (a:y * 4) + a:z
    else
      return 16 + (a:x * 36) + (a:y * 6) + a:z
    endif
  endfun

  " Returns the palette index to approximate the given R/G/B colour levels
  fun! s:colour(r, g, b)
    " Get the closest grey
    let l:gx = s:grey_number(a:r)
    let l:gy = s:grey_number(a:g)
    let l:gz = s:grey_number(a:b)

    " Get the closest colour
    let l:x = s:rgb_number(a:r)
    let l:y = s:rgb_number(a:g)
    let l:z = s:rgb_number(a:b)

    if l:gx == l:gy && l:gy == l:gz
      " There are two possibilities
      let l:dgr = s:grey_level(l:gx) - a:r
      let l:dgg = s:grey_level(l:gy) - a:g
      let l:dgb = s:grey_level(l:gz) - a:b
      let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
      let l:dr = s:rgb_level(l:gx) - a:r
      let l:dg = s:rgb_level(l:gy) - a:g
      let l:db = s:rgb_level(l:gz) - a:b
      let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
      if l:dgrey < l:drgb
        " Use the grey
        return s:grey_colour(l:gx)
      else
        " Use the colour
        return s:rgb_colour(l:x, l:y, l:z)
      endif
    else
      " Only one possibility
      return s:rgb_colour(l:x, l:y, l:z)
    endif
  endfun

  " Returns the palette index to approximate the '#rrggbb' hex string
  fun! s:to_256(rgb)
    let l:r = ("0x" . strpart(a:rgb, 1, 2)) + 0
    let l:g = ("0x" . strpart(a:rgb, 3, 2)) + 0
    let l:b = ("0x" . strpart(a:rgb, 5, 2)) + 0

    return s:colour(l:r, l:g, l:b)
  endfun



  " }}}
endfun

fun! s:load_256_to_GUI_converter()
" 256-color To GUI-color: {{{

""" Xterm 256 color dictionary
" See: http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
"
let s:to_HEX = {
      \ '00':  '#000000',  '01':  '#800000',  '02':  '#008000',  '03':  '#808000',  '04':  '#000080',
      \ '05':  '#800080',  '06':  '#008080',  '07':  '#c0c0c0',  '08':  '#808080',  '09':  '#ff0000',
      \ '10':  '#00ff00',  '11':  '#ffff00',  '12':  '#0000ff',  '13':  '#ff00ff',  '14':  '#00ffff',
      \ '15':  '#ffffff',  '16':  '#000000',  '17':  '#00005f',  '18':  '#000087',  '19':  '#0000af',
      \ '20':  '#0000d7',  '21':  '#0000ff',  '22':  '#005f00',  '23':  '#005f5f',  '24':  '#005f87',
      \ '25':  '#005faf',  '26':  '#005fd7',  '27':  '#005fff',  '28':  '#008700',  '29':  '#00875f',
      \ '30':  '#008787',  '31':  '#0087af',  '32':  '#0087d7',  '33':  '#0087ff',  '34':  '#00af00',
      \ '35':  '#00af5f',  '36':  '#00af87',  '37':  '#00afaf',  '38':  '#00afd7',  '39':  '#00afff',
      \ '40':  '#00d700',  '41':  '#00d75f',  '42':  '#00d787',  '43':  '#00d7af',  '44':  '#00d7d7',
      \ '45':  '#00d7ff',  '46':  '#00ff00',  '47':  '#00ff5f',  '48':  '#00ff87',  '49':  '#00ffaf',
      \ '50':  '#00ffd7',  '51':  '#00ffff',  '52':  '#5f0000',  '53':  '#5f005f',  '54':  '#5f0087',
      \ '55':  '#5f00af',  '56':  '#5f00d7',  '57':  '#5f00ff',  '58':  '#5f5f00',  '59':  '#5f5f5f',
      \ '60':  '#5f5f87',  '61':  '#5f5faf',  '62':  '#5f5fd7',  '63':  '#5f5fff',  '64':  '#5f8700',
      \ '65':  '#5f875f',  '66':  '#5f8787',  '67':  '#5f87af',  '68':  '#5f87d7',  '69':  '#5f87ff',
      \ '70':  '#5faf00',  '71':  '#5faf5f',  '72':  '#5faf87',  '73':  '#5fafaf',  '74':  '#5fafd7',
      \ '75':  '#5fafff',  '76':  '#5fd700',  '77':  '#5fd75f',  '78':  '#5fd787',  '79':  '#5fd7af',
      \ '80':  '#5fd7d7',  '81':  '#5fd7ff',  '82':  '#5fff00',  '83':  '#5fff5f',  '84':  '#5fff87',
      \ '85':  '#5fffaf',  '86':  '#5fffd7',  '87':  '#5fffff',  '88':  '#870000',  '89':  '#87005f',
      \ '90':  '#870087',  '91':  '#8700af',  '92':  '#8700d7',  '93':  '#8700ff',  '94':  '#875f00',
      \ '95':  '#875f5f',  '96':  '#875f87',  '97':  '#875faf',  '98':  '#875fd7',  '99':  '#875fff',
      \ '100': '#878700',  '101': '#87875f',  '102': '#878787',  '103': '#8787af',  '104': '#8787d7',
      \ '105': '#8787ff',  '106': '#87af00',  '107': '#87af5f',  '108': '#87af87',  '109': '#87afaf',
      \ '110': '#87afd7',  '111': '#87afff',  '112': '#87d700',  '113': '#87d75f',  '114': '#87d787',
      \ '115': '#87d7af',  '116': '#87d7d7',  '117': '#87d7ff',  '118': '#87ff00',  '119': '#87ff5f',
      \ '120': '#87ff87',  '121': '#87ffaf',  '122': '#87ffd7',  '123': '#87ffff',  '124': '#af0000',
      \ '125': '#af005f',  '126': '#af0087',  '127': '#af00af',  '128': '#af00d7',  '129': '#af00ff',
      \ '130': '#af5f00',  '131': '#af5f5f',  '132': '#af5f87',  '133': '#af5faf',  '134': '#af5fd7',
      \ '135': '#af5fff',  '136': '#af8700',  '137': '#af875f',  '138': '#af8787',  '139': '#af87af',
      \ '140': '#af87d7',  '141': '#af87ff',  '142': '#afaf00',  '143': '#afaf5f',  '144': '#afaf87',
      \ '145': '#afafaf',  '146': '#afafd7',  '147': '#afafff',  '148': '#afd700',  '149': '#afd75f',
      \ '150': '#afd787',  '151': '#afd7af',  '152': '#afd7d7',  '153': '#afd7ff',  '154': '#afff00',
      \ '155': '#afff5f',  '156': '#afff87',  '157': '#afffaf',  '158': '#afffd7',  '159': '#afffff',
      \ '160': '#d70000',  '161': '#d7005f',  '162': '#d70087',  '163': '#d700af',  '164': '#d700d7',
      \ '165': '#d700ff',  '166': '#d75f00',  '167': '#d75f5f',  '168': '#d75f87',  '169': '#d75faf',
      \ '170': '#d75fd7',  '171': '#d75fff',  '172': '#d78700',  '173': '#d7875f',  '174': '#d78787',
      \ '175': '#d787af',  '176': '#d787d7',  '177': '#d787ff',  '178': '#d7af00',  '179': '#d7af5f',
      \ '180': '#d7af87',  '181': '#d7afaf',  '182': '#d7afd7',  '183': '#d7afff',  '184': '#d7d700',
      \ '185': '#d7d75f',  '186': '#d7d787',  '187': '#d7d7af',  '188': '#d7d7d7',  '189': '#d7d7ff',
      \ '190': '#d7ff00',  '191': '#d7ff5f',  '192': '#d7ff87',  '193': '#d7ffaf',  '194': '#d7ffd7',
      \ '195': '#d7ffff',  '196': '#ff0000',  '197': '#ff005f',  '198': '#ff0087',  '199': '#ff00af',
      \ '200': '#ff00d7',  '201': '#ff00ff',  '202': '#ff5f00',  '203': '#ff5f5f',  '204': '#ff5f87',
      \ '205': '#ff5faf',  '206': '#ff5fd7',  '207': '#ff5fff',  '208': '#ff8700',  '209': '#ff875f',
      \ '210': '#ff8787',  '211': '#ff87af',  '212': '#ff87d7',  '213': '#ff87ff',  '214': '#ffaf00',
      \ '215': '#ffaf5f',  '216': '#ffaf87',  '217': '#ffafaf',  '218': '#ffafd7',  '219': '#ffafff',
      \ '220': '#ffd700',  '221': '#ffd75f',  '222': '#ffd787',  '223': '#ffd7af',  '224': '#ffd7d7',
      \ '225': '#ffd7ff',  '226': '#ffff00',  '227': '#ffff5f',  '228': '#ffff87',  '229': '#ffffaf',
      \ '230': '#ffffd7',  '231': '#ffffff',  '232': '#080808',  '233': '#121212',  '234': '#1c1c1c',
      \ '235': '#262626',  '236': '#303030',  '237': '#3a3a3a',  '238': '#444444',  '239': '#4e4e4e',
      \ '240': '#585858',  '241': '#626262',  '242': '#6c6c6c',  '243': '#767676',  '244': '#808080',
      \ '245': '#8a8a8a',  '246': '#949494',  '247': '#9e9e9e',  '248': '#a8a8a8',  '249': '#b2b2b2',
      \ '250': '#bcbcbc',  '251': '#c6c6c6',  '252': '#d0d0d0',  '253': '#dadada',  '254': '#e4e4e4',
      \ '255': '#eeeeee' }

" }}}
endfun

" ========================== ENVIRONMENT ADAPTER ==============================

" Set Format Attributes: {{{

fun! s:set_format_attributes()
  " These are the default
  if s:mode == s:MODE_GUI_COLOR
    let s:ft_bold    = " cterm=bold gui=bold "
    let s:ft_none    = " cterm=none gui=none "
    let s:ft_reverse = " cterm=reverse gui=reverse "
    let s:ft_italic  = " cterm=italic gui=italic "
    let s:ft_italic_bold = " cterm=italic,bold gui=italic,bold "
  elseif s:mode == s:MODE_256_COLOR
    let s:ft_bold    = " cterm=bold "
    let s:ft_none    = " cterm=none "
    let s:ft_reverse = " cterm=reverse "
    let s:ft_italic  = " cterm=italic "
    let s:ft_italic_bold = " cterm=italic,bold "
  else
    let s:ft_bold    = ""
    let s:ft_none    = " cterm=none "
    let s:ft_reverse = " cterm=reverse "
    let s:ft_italic  = ""
    let s:ft_italic_bold = ""
  endif

  " Unless instructed otherwise either by theme setting or user overriding

  if s:themeOpt_allow_bold == 0
    let s:ft_bold    = ""
  endif
  if s:themeOpt_allow_italic == 0
    let s:ft_italic = ""
    let s:ft_italic_bold = s:ft_bold
  endif

endfun

" }}}

" Convert Colors If Needed: {{{
fun! s:convert_colors()
  if s:theme_has_hint('NO_CONVERSION')
    return
  endif

  if s:mode == s:MODE_GUI_COLOR
    " if GUI color is not provided, convert from 256 color that must be available
    call s:load_256_to_GUI_converter()

    for l:color in keys(s:palette)
      let l:value = s:palette[l:color]
      if l:value[0] == ''
        let l:value[0] = s:to_HEX[l:value[1]]
      endif
      let s:palette[l:color] = l:value
    endfor

  elseif s:mode == s:MODE_256_COLOR
    " if 256 color is not provided, convert from GUI color that must be available
    call s:load_GUI_to_256_converter()

    for l:color in keys(s:palette)
      let l:value = s:palette[l:color]
      if l:value[1] == ''
        let l:value[1] = s:to_256(l:value[0])
      endif
      let s:palette[l:color] = l:value
    endfor
  endif
  " otherwise use the terminal colors and none of the theme colors are used
endfun

" }}}

" ============================ COLOR POPULARIZER ===============================

" Set Color Variables: {{{
fun! s:set_color_variables()

  " Helper: {{{
  " -------
  " Function to dynamically generate variables that store the color strings
  " for setting highlighting. Each color name will have 2 variables with prefix
  " s:fg_ and s:bg_. For example:
  " if a:color_name is 'Normal' and a:color_value is ['#000000', '0', 'Black'],
  " the following 2 variables will be created:
  "   s:fg_Normal that stores the string ' guifg=#000000 '
  "   s:bg_Normal that stores the string ' guibg=#000000 '
  " Depending on the color mode, ctermfg and ctermbg will be either 0 or Black
  "
  " Rationale:
  " The whole purpose is for speed. We generate these ahead of time so that we
  " don't have to do look up or do any if-branch when we set the highlightings.
  "
  " Furthermore, multiple function definitions for each mode actually reduces
  " the need for multiple if-branches inside a single function. This is not
  " pretty, but Vim Script is slow, so reducing if-branches in function that is
  " often called helps speeding things up quite a bit. Think of this like macro.
  "
  " If you are familiar with the old code base (v0.9 and ealier), this way of
  " generate variables dramatically reduces the loading speed.
  " None of previous optimization tricks gets anywhere near this.
  if s:mode == s:MODE_GUI_COLOR
    fun! s:create_color_variables(color_name, rich_color, term_color)
      let {'s:fg_' . a:color_name} = ' guifg=' . a:rich_color[0] . ' '
      let {'s:bg_' . a:color_name} = ' guibg=' . a:rich_color[0] . ' '
      let {'s:sp_' . a:color_name} = ' guisp=' . a:rich_color[0] . ' '
    endfun
  elseif s:mode == s:MODE_256_COLOR
    fun! s:create_color_variables(color_name, rich_color, term_color)
      let {'s:fg_' . a:color_name} = ' ctermfg=' . a:rich_color[1] . ' '
      let {'s:bg_' . a:color_name} = ' ctermbg=' . a:rich_color[1] . ' '
      let {'s:sp_' . a:color_name} = ''
    endfun
  else
    fun! s:create_color_variables(color_name, rich_color, term_color)
      let {'s:fg_' . a:color_name} = ' ctermfg=' . a:term_color . ' '
      let {'s:bg_' . a:color_name} = ' ctermbg=' . a:term_color . ' '
      let {'s:sp_' . a:color_name} = ''
    endfun
  endif
  " }}}

  " Color value format: Array [<GUI COLOR/HEX >, <256-Base>, <16-Base>]
  " 16-Base is terminal's native color palette that can be alternated through
  " the terminal settings. The 16-color names are according to `:h cterm-colors`

  " BASIC COLORS:
  " color00-15 are required by all themes.
  " These are also how the terminal color palette for the target theme should be.
  " See README for theme design guideline
  "
  " An example format of the below variable's value: ['#262626', '234', 'Black']
  " Where the 1st value is HEX color for GUI Vim, 2nd value is for 256-color terminal,
  " and the color name on the right is for 16-color terminal (the actual terminal colors
  " can be different from what the color names suggest). See :h cterm-colors
  "
  " Depending on the provided color palette and current Vim, the 1st and 2nd
  " parameter might not exist, for example, on 16-color terminal, the variables below
  " only store the color names to use the terminal color palette which is the only
  " thing available therefore no need for GUI-color or 256-color.

  let color00 = get(s:palette, 'color00')
  let color01 = get(s:palette, 'color01')
  let color02 = get(s:palette, 'color02')
  let color03 = get(s:palette, 'color03')
  let color04 = get(s:palette, 'color04')
  let color05 = get(s:palette, 'color05')
  let color06 = get(s:palette, 'color06')
  let color07 = get(s:palette, 'color07')
  let color08 = get(s:palette, 'color08')
  let color09 = get(s:palette, 'color09')
  let color10 = get(s:palette, 'color10')
  let color11 = get(s:palette, 'color11')
  let color12 = get(s:palette, 'color12')
  let color13 = get(s:palette, 'color13')
  let color14 = get(s:palette, 'color14')
  let color15 = get(s:palette, 'color15')

  call s:create_color_variables('background', color00 , 'Black')
  call s:create_color_variables('negative',   color01 , 'DarkRed')
  call s:create_color_variables('positive',   color02 , 'DarkGreen')
  call s:create_color_variables('olive',      color03 , 'DarkYellow') " string
  call s:create_color_variables('neutral',    color04 , 'DarkBlue')
  call s:create_color_variables('comment',    color05 , 'DarkMagenta')
  call s:create_color_variables('navy',       color06 , 'DarkCyan') " storageclass
  call s:create_color_variables('foreground', color07 , 'LightGray')

  call s:create_color_variables('nontext',   color08 , 'DarkGray')
  call s:create_color_variables('red',       color09 , 'LightRed') " import / try/catch
  call s:create_color_variables('pink',      color10 , 'LightGreen') " statement, type
  call s:create_color_variables('purple',    color11 , 'LightYellow') " if / conditional
  call s:create_color_variables('accent',    color12 , 'LightBlue')
  call s:create_color_variables('orange',    color13 , 'LightMagenta') " number
  call s:create_color_variables('blue',      color14 , 'LightCyan') " other keyword
  call s:create_color_variables('highlight', color15 , 'White')

  " Note: special case for FoldColumn group. I want to get rid of this case.
  call s:create_color_variables('transparent', [color00[0], 'none'], 'none')

  " EXTENDED COLORS:
  " From here on, all colors are optional and must have default values (3rd parameter of the
  " `get` command) that point to the above basic colors in case the target theme doesn't
  " provide the extended colors. The default values should be reasonably sensible.
  " The terminal color must be provided also.

  call s:create_color_variables('aqua',  get(s:palette, 'color16', color14) , 'LightCyan')
  call s:create_color_variables('green', get(s:palette, 'color17', color13) , 'LightMagenta')
  call s:create_color_variables('wine',  get(s:palette, 'color18', color11) , 'LightYellow')

  " LineNumber: when set number
  call s:create_color_variables('linenumber_fg', get(s:palette, 'linenumber_fg', color08) , 'DarkGray')
  call s:create_color_variables('linenumber_bg', get(s:palette, 'linenumber_bg', color00) , 'Black')

  " Vertical Split: when there are more than 1 window side by side, ex: <C-W><C-V>
  call s:create_color_variables('vertsplit_fg', get(s:palette, 'vertsplit_fg', color15) , 'White')
  call s:create_color_variables('vertsplit_bg', get(s:palette, 'vertsplit_bg', color00) , 'Black')

  " Statusline: when set status=2
  call s:create_color_variables('statusline_active_fg', get(s:palette, 'statusline_active_fg', color00) , 'Black')
  call s:create_color_variables('statusline_active_bg', get(s:palette, 'statusline_active_bg', color15) , 'White')
  call s:create_color_variables('statusline_inactive_fg', get(s:palette, 'statusline_inactive_fg', color07) , 'LightGray')
  call s:create_color_variables('statusline_inactive_bg', get(s:palette, 'statusline_inactive_bg', color08) , 'DarkGray')


  " Cursor: in normal mode
  call s:create_color_variables('cursor_fg', get(s:palette, 'cursor_fg', color00) , 'Black')
  call s:create_color_variables('cursor_bg', get(s:palette, 'cursor_bg', color07) , 'LightGray')

  call s:create_color_variables('cursorline', get(s:palette, 'cursorline', color00) , 'Black')

  " CursorColumn: when set cursorcolumn
  call s:create_color_variables('cursorcolumn', get(s:palette, 'cursorcolumn', color00) , 'Black')

  " CursorLine Number: when set cursorline number
  call s:create_color_variables('cursorlinenr_fg', get(s:palette, 'cursorlinenr_fg', color13) , 'LightMagenta')
  call s:create_color_variables('cursorlinenr_bg', get(s:palette, 'cursorlinenr_bg', color00) , 'Black')

  " Popup Menu: when <C-X><C-N> for autocomplete
  call s:create_color_variables('popupmenu_fg', get(s:palette, 'popupmenu_fg', color07) , 'LightGray')
  call s:create_color_variables('popupmenu_bg', get(s:palette, 'popupmenu_bg', color08) , 'DarkGray') " TODO: double check this, might resolve an issue

  " Search: ex: when * on a word
  call s:create_color_variables('search_fg', get(s:palette, 'search_fg', color00) , 'Black')
  call s:create_color_variables('search_bg', get(s:palette, 'search_bg', color15) , 'Yellow')

  " Todo: ex: TODO
  call s:create_color_variables('todo_fg', get(s:palette, 'todo_fg', color05) , 'LightYellow')
  call s:create_color_variables('todo_bg', get(s:palette, 'todo_bg', color00) , 'Black')

  " Error: ex: turn spell on and have invalid words
  call s:create_color_variables('error_fg', get(s:palette, 'error_fg', color01) , 'DarkRed')
  call s:create_color_variables('error_bg', get(s:palette, 'error_bg', color00) , 'Black')

  " Match Parenthesis: selecting an opening/closing pair and the other one will be highlighted
  call s:create_color_variables('matchparen_fg', get(s:palette, 'matchparen_fg', color00) , 'LightMagenta')
  call s:create_color_variables('matchparen_bg', get(s:palette, 'matchparen_bg', color05) , 'Black')

  " Visual:
  call s:create_color_variables('visual_fg', get(s:palette, 'visual_fg', color08) , 'Black')
  call s:create_color_variables('visual_bg', get(s:palette, 'visual_bg', color07) , 'White')

  " Folded:
  call s:create_color_variables('folded_fg', get(s:palette, 'folded_fg', color00) , 'Black')
  call s:create_color_variables('folded_bg', get(s:palette, 'folded_bg', color05) , 'DarkYellow')

  " WildMenu: Autocomplete command, ex: :color <tab><tab>
  call s:create_color_variables('wildmenu_fg', get(s:palette, 'wildmenu_fg', color00) , 'Black')
  call s:create_color_variables('wildmenu_bg', get(s:palette, 'wildmenu_bg', color06) , 'LightGray')

  " Spelling: when spell on and there are spelling problems like this for example: papercolor. a vim color scheme
  call s:create_color_variables('spellbad', get(s:palette, 'spellbad', color04) , 'DarkRed')
  call s:create_color_variables('spellcap', get(s:palette, 'spellcap', color05) , 'DarkMagenta')
  call s:create_color_variables('spellrare', get(s:palette, 'spellrare', color06) , 'DarkYellow')
  call s:create_color_variables('spelllocal', get(s:palette, 'spelllocal', color01) , 'DarkBlue')

  " Diff:
  call s:create_color_variables('diffadd_fg', get(s:palette, 'diffadd_fg', color00) , 'Black')
  call s:create_color_variables('diffadd_bg', get(s:palette, 'diffadd_bg', color02) , 'DarkGreen')

  call s:create_color_variables('diffdelete_fg', get(s:palette, 'diffdelete_fg', color00) , 'Black')
  call s:create_color_variables('diffdelete_bg', get(s:palette, 'diffdelete_bg', color04) , 'DarkRed')

  call s:create_color_variables('difftext_fg', get(s:palette, 'difftext_fg', color00) , 'Black')
  call s:create_color_variables('difftext_bg', get(s:palette, 'difftext_bg', color06) , 'DarkYellow')

  call s:create_color_variables('diffchange_fg', get(s:palette, 'diffchange_fg', color00) , 'Black')
  call s:create_color_variables('diffchange_bg', get(s:palette, 'diffchange_bg', color14) , 'LightYellow')

  " Tabline: when having tabs, ex: :tabnew
  call s:create_color_variables('tabline_bg',          get(s:palette, 'tabline_bg',          color00) , 'Black')
  call s:create_color_variables('tabline_active_fg',   get(s:palette, 'tabline_active_fg',   color07) , 'LightGray')
  call s:create_color_variables('tabline_active_bg',   get(s:palette, 'tabline_active_bg',   color00) , 'Black')
  call s:create_color_variables('tabline_inactive_fg', get(s:palette, 'tabline_inactive_fg', color07) , 'Black')
  call s:create_color_variables('tabline_inactive_bg', get(s:palette, 'tabline_inactive_bg', color08) , 'DarkMagenta')

  " Plugin: BufTabLine https://github.com/ap/vim-buftabline
  call s:create_color_variables('buftabline_bg',          get(s:palette, 'buftabline_bg',          color00) , 'Black')
  call s:create_color_variables('buftabline_current_fg',  get(s:palette, 'buftabline_current_fg',  color07) , 'LightGray')
  call s:create_color_variables('buftabline_current_bg',  get(s:palette, 'buftabline_current_bg',  color05) , 'DarkMagenta')
  call s:create_color_variables('buftabline_active_fg',   get(s:palette, 'buftabline_active_fg',   color07) , 'LightGray')
  call s:create_color_variables('buftabline_active_bg',   get(s:palette, 'buftabline_active_bg',   color12) , 'LightBlue')
  call s:create_color_variables('buftabline_inactive_fg', get(s:palette, 'buftabline_inactive_fg', color07) , 'LightGray')
  call s:create_color_variables('buftabline_inactive_bg', get(s:palette, 'buftabline_inactive_bg', color00) , 'Black')

  " Neovim terminal colors https://neovim.io/doc/user/nvim_terminal_emulator.html#nvim-terminal-emulator-configuration
  " TODO: Fix this
  let g:terminal_color_0  = color00[0]
  let g:terminal_color_1  = color01[0]
  let g:terminal_color_2  = color02[0]
  let g:terminal_color_3  = color03[0]
  let g:terminal_color_4  = color04[0]
  let g:terminal_color_5  = color05[0]
  let g:terminal_color_6  = color06[0]
  let g:terminal_color_7  = color07[0]
  let g:terminal_color_8  = color08[0]
  let g:terminal_color_9  = color09[0]
  let g:terminal_color_10 = color10[0]
  let g:terminal_color_11 = color11[0]
  let g:terminal_color_12 = color12[0]
  let g:terminal_color_13 = color13[0]
  let g:terminal_color_14 = color14[0]
  let g:terminal_color_15 = color15[0]

  " Vim 8's :terminal buffer ANSI colors
  if has('terminal')
    let g:terminal_ansi_colors = [color00[0], color01[0], color02[0], color03[0],
        \ color04[0], color05[0], color06[0], color07[0], color08[0], color09[0],
        \ color10[0], color11[0], color12[0], color13[0], color14[0], color15[0]]
  endif

endfun
" }}}

" Apply Syntax Highlightings: {{{

fun! s:apply_syntax_highlightings()

  if s:themeOpt_transparent_background
    exec 'hi Normal' . fg_gray
    " Switching between dark & light variant through `set background`
    " NOTE: Handle background switching right after `Normal` group because of
    " God-know-why reason. Not doing this way had caused issue before
    if s:is_dark " DARK VARIANT
      set background=dark
    else " LIGHT VARIANT
      set background=light
    endif

    exec 'hi NonText' . fg_darkgray
    exec 'hi LineNr' . s:fg_linenumber_fg
    exec 'hi Conceal' . s:fg_linenumber_fg
    exec 'hi VertSplit' . s:fg_vertsplit_fg . s:ft_none
    exec 'hi FoldColumn' . s:fg_folded_fg . s:bg_transparent . s:ft_none
  else
    exec 'hi Normal' . fg_gray . bg_black0
    " Switching between dark & light variant through `set background`
    if s:is_dark " DARK VARIANT
      set background=dark
      exec 'hi EndOfBuffer' . s:fg_cursor_fg  . s:ft_none
    else " LIGHT VARIANT
      set background=light
    endif

    exec 'hi NonText' . fg_darkgray . bg_black0
    exec 'hi LineNr' . s:fg_linenumber_fg . s:bg_linenumber_bg
    exec 'hi Conceal' . s:fg_linenumber_fg . s:bg_linenumber_bg
    exec 'hi VertSplit' . s:fg_vertsplit_bg . s:bg_vertsplit_fg
    exec 'hi FoldColumn' . s:fg_folded_fg . bg_black0 . s:ft_none
  endif

  exec 'hi Cursor' . s:fg_cursor_fg . s:bg_cursor_bg
  exec 'hi SpecialKey' . fg_darkgray
  exec 'hi Search' . s:fg_search_fg . s:bg_search_bg
  exec 'hi StatusLine' . s:fg_statusline_active_bg . s:bg_statusline_active_fg
  exec 'hi StatusLineNC' . s:fg_statusline_inactive_bg . s:bg_statusline_inactive_fg
  exec 'hi StatusLineTerm' . s:fg_statusline_active_bg . s:bg_statusline_active_fg
  exec 'hi StatusLineTermNC' . s:fg_statusline_inactive_bg . s:bg_statusline_inactive_fg
  exec 'hi Visual' . s:fg_visual_fg . s:bg_visual_bg
  exec 'hi Directory' . fg_cyan
  exec 'hi ModeMsg' . fg_darkyellow
  exec 'hi MoreMsg' . fg_darkyellow
  exec 'hi Question' . fg_darkyellow
  exec 'hi WarningMsg' . fg_green
  exec 'hi MatchParen' . s:fg_matchparen_fg . s:bg_matchparen_bg
  exec 'hi Folded' . s:fg_folded_fg . s:bg_folded_bg
  exec 'hi WildMenu' . s:fg_wildmenu_fg . s:bg_wildmenu_bg . s:ft_bold

  if version >= 700
    exec 'hi CursorLine'  . s:bg_cursorline . s:ft_none
    if s:mode == s:MODE_16_COLOR
      exec 'hi CursorLineNr' . s:fg_cursorlinenr_fg . s:bg_cursorlinenr_bg
    else
      exec 'hi CursorLineNr' . s:fg_cursorlinenr_fg . s:bg_cursorlinenr_bg . s:ft_none
    endif
    exec 'hi CursorColumn'  . s:bg_cursorcolumn . s:ft_none
    exec 'hi PMenu' . s:fg_popupmenu_fg . s:bg_popupmenu_bg . s:ft_none
    exec 'hi PMenuSel' . s:fg_popupmenu_fg . s:bg_popupmenu_bg . s:ft_reverse
    if s:themeOpt_transparent_background
      exec 'hi SignColumn' . fg_yellow1 . s:ft_none
    else
      exec 'hi SignColumn' . fg_yellow1 . bg_black0 . s:ft_none
    endif
  end
  if version >= 703
    exec 'hi ColorColumn'  . s:bg_cursorcolumn . s:ft_none
  end

  exec 'hi TabLine' . s:fg_tabline_inactive_fg . s:bg_tabline_inactive_bg . s:ft_none
  exec 'hi TabLineFill' . s:fg_tabline_bg . s:bg_tabline_bg . s:ft_none
  exec 'hi TabLineSel' . s:fg_tabline_active_fg . s:bg_tabline_active_bg . s:ft_none

  exec 'hi BufTabLineCurrent' . s:fg_buftabline_current_fg . s:bg_buftabline_current_bg . s:ft_none
  exec 'hi BufTabLineActive' . s:fg_buftabline_active_fg . s:bg_buftabline_active_bg . s:ft_none
  exec 'hi BufTabLineHidden' . s:fg_buftabline_inactive_fg . s:bg_buftabline_inactive_bg . s:ft_none
  exec 'hi BufTabLineFill'  . s:bg_buftabline_bg . s:ft_none

  " Standard Group Highlighting:
  exec 'hi Comment' . fg_darkmagenta . s:ft_italic

  exec 'hi Constant' . fg_magenta
  exec 'hi String' . fg_darkyellow
  exec 'hi Character' . fg_darkyellow
  exec 'hi Number' . fg_magenta
  exec 'hi Boolean' . fg_yellow1 . s:ft_bold
  exec 'hi Float' . fg_magenta

  exec 'hi Identifier' . fg_darkcyan
  exec 'hi Function' . fg_gray

  exec 'hi Statement' . fg_green . s:ft_none
  exec 'hi Conditional' . fg_yellow . s:ft_bold
  exec 'hi Repeat' . fg_yellow . s:ft_bold
  exec 'hi Label' . fg_cyan
  exec 'hi Operator' . fg_cyan5 . s:ft_none
  exec 'hi Keyword' . fg_cyan
  exec 'hi Exception' . fg_red

  exec 'hi PreProc' . fg_cyan
  exec 'hi Include' . fg_red
  exec 'hi Define' . fg_cyan
  exec 'hi Macro' . fg_cyan
  exec 'hi PreCondit' . fg_cyan5

  exec 'hi Type' . fg_green . s:ft_bold
  exec 'hi StorageClass' . fg_darkcyan . s:ft_bold
  exec 'hi Structure' . fg_cyan . s:ft_bold
  exec 'hi Typedef' . fg_green . s:ft_bold

  exec 'hi Special' . fg_gray
  exec 'hi SpecialChar' . fg_gray
  exec 'hi Tag' . fg_yellow1
  exec 'hi Delimiter' . fg_cyan5
  exec 'hi SpecialComment' . fg_darkmagenta . s:ft_bold
  exec 'hi Debug' . fg_magenta

  exec 'hi Error' . s:fg_error_fg . s:bg_error_bg
  exec 'hi Todo' . s:fg_todo_fg . s:bg_todo_bg . s:ft_bold

  exec 'hi Title' . fg_darkmagenta
  exec 'hi Global' . fg_cyan

  " Neovim (LSP) diagnostics
  if has('nvim')
    exec 'hi LspDiagnosticsDefaultError' . s:fg_error_fg . s:bg_error_bg
    exec 'hi LspDiagnosticsDefaultWarning' . s:fg_todo_fg . s:bg_todo_bg . s:ft_bold
    exec 'hi LspDiagnosticsDefaultInformation' . s:fg_todo_fg . s:bg_todo_bg . s:ft_bold
    exec 'hi LspDiagnosticsDefaultHint' . s:fg_todo_fg . s:bg_todo_bg . s:ft_bold

    exec 'hi LspDiagnosticsUnderlineError cterm=undercurl gui=undercurl' . s:sp_error_fg
    exec 'hi LspDiagnosticsUnderlineWarning cterm=undercurl gui=undercurl' . s:sp_todo_fg
    exec 'hi LspDiagnosticsUnderlineInformation cterm=undercurl gui=undercurl' . s:sp_todo_fg
    exec 'hi LspDiagnosticsUnderlineHint cterm=undercurl gui=undercurl' . s:sp_todo_fg

    hi! link DiagnosticError LspDiagnosticsDefaultError
    hi! link DiagnosticWarn LspDiagnosticsDefaultWarning
    hi! link DiagnosticInfo LspDiagnosticsDefaultInformation
    hi! link DiagnosticHint LspDiagnosticsDefaultHint

    hi! link DiagnosticUnderlineError LspDiagnosticsUnderlineError
    hi! link DiagnosticUnderlineWarn LspDiagnosticsUnderlineWarning
    hi! link DiagnosticUnderlineInfo LspDiagnosticsUnderlineInformation
    hi! link DiagnosticUnderlineHint LspDiagnosticsUnderlineHint
  endif

  " Extension {{{
  " VimL Highlighting
  exec 'hi vimCommand' . fg_green
  exec 'hi vimVar' . fg_darkcyan
  exec 'hi vimFuncKey' . fg_green
  exec 'hi vimFunction' . fg_cyan . s:ft_bold
  exec 'hi vimNotFunc' . fg_green
  exec 'hi vimMap' . fg_red
  exec 'hi vimAutoEvent' . fg_cyan5 . s:ft_bold
  exec 'hi vimMapModKey' . fg_cyan5
  exec 'hi vimFuncName' . fg_yellow
  exec 'hi vimIsCommand' . fg_gray
  exec 'hi vimFuncVar' . fg_cyan5
  exec 'hi vimLet' . fg_red
  exec 'hi vimContinue' . fg_cyan5
  exec 'hi vimMapRhsExtend' . fg_gray
  exec 'hi vimCommentTitle' . fg_darkmagenta . s:ft_italic_bold
  exec 'hi vimBracket' . fg_cyan5
  exec 'hi vimParenSep' . fg_cyan5
  exec 'hi vimNotation' . fg_cyan5
  exec 'hi vimOper' . fg_gray
  exec 'hi vimOperParen' . fg_gray
  exec 'hi vimSynType' . fg_yellow
  exec 'hi vimSynReg' . fg_green . s:ft_none
  exec 'hi vimSynRegion' . fg_gray
  exec 'hi vimSynMtchGrp' . fg_green
  exec 'hi vimSynNextgroup' . fg_green
  exec 'hi vimSynKeyRegion' . fg_yellow1
  exec 'hi vimSynRegOpt' . fg_cyan
  exec 'hi vimSynMtchOpt' . fg_cyan
  exec 'hi vimSynContains' . fg_green
  exec 'hi vimGroupName' . fg_gray
  exec 'hi vimGroupList' . fg_gray
  exec 'hi vimHiGroup' . fg_gray
  exec 'hi vimGroup' . fg_darkcyan . s:ft_bold
  exec 'hi vimOnlyOption' . fg_cyan

  " Makefile Highlighting
  exec 'hi makeIdent' . fg_cyan
  exec 'hi makeSpecTarget' . fg_darkyellow
  exec 'hi makeTarget' . fg_red
  exec 'hi makeStatement' . fg_cyan5 . s:ft_bold
  exec 'hi makeCommands' . fg_gray
  exec 'hi makeSpecial' . fg_magenta . s:ft_bold

  " CMake Highlighting (Builtin)
  exec 'hi cmakeStatement' . fg_cyan
  exec 'hi cmakeArguments' . fg_gray
  exec 'hi cmakeVariableValue' . fg_green

  " CMake Highlighting (Plugin: https://github.com/pboettch/vim-cmake-syntax)
  exec 'hi cmakeCommand' . fg_cyan
  exec 'hi cmakeCommandConditional' . fg_yellow . s:ft_bold
  exec 'hi cmakeKWset' . fg_magenta
  exec 'hi cmakeKWvariable_watch' . fg_magenta
  exec 'hi cmakeKWif' . fg_magenta
  exec 'hi cmakeArguments' . fg_gray
  exec 'hi cmakeKWproject' . fg_green
  exec 'hi cmakeGeneratorExpressions' . fg_magenta
  exec 'hi cmakeGeneratorExpression' . fg_cyan5
  exec 'hi cmakeVariable' . fg_green
  exec 'hi cmakeProperty' . fg_cyan5
  exec 'hi cmakeKWforeach' . fg_cyan5
  exec 'hi cmakeKWunset' . fg_cyan5
  exec 'hi cmakeKWmacro' . fg_cyan5
  exec 'hi cmakeKWget_property' . fg_cyan5
  exec 'hi cmakeKWset_tests_properties' . fg_cyan5
  exec 'hi cmakeKWmessage' . fg_cyan5
  exec 'hi cmakeKWinstall_targets' . fg_magenta
  exec 'hi cmakeKWsource_group' . fg_magenta
  exec 'hi cmakeKWfind_package' . fg_cyan5
  exec 'hi cmakeKWstring' . fg_darkyellow
  exec 'hi cmakeKWinstall' . fg_cyan5
  exec 'hi cmakeKWtarget_sources' . fg_magenta

  " C Highlighting
  exec 'hi cType' . fg_green . s:ft_bold
  exec 'hi cFormat' . fg_darkyellow
  exec 'hi cStorageClass' . fg_darkcyan . s:ft_bold

  exec 'hi cBoolean' . fg_yellow1 . s:ft_bold
  exec 'hi cCharacter' . fg_darkyellow
  exec 'hi cConstant' . fg_yellow1 . s:ft_bold
  exec 'hi cConditional' . fg_yellow . s:ft_bold
  exec 'hi cSpecial' . fg_darkyellow . s:ft_bold
  exec 'hi cDefine' . fg_cyan
  exec 'hi cNumber' . fg_magenta
  exec 'hi cPreCondit' . fg_cyan5
  exec 'hi cRepeat' . fg_yellow . s:ft_bold
  exec 'hi cLabel' . fg_cyan5
  " exec 'hi cAnsiFunction' . fg_cyan5 . s:ft_bold
  " exec 'hi cAnsiName' . fg_green
  exec 'hi cDelimiter' . fg_cyan
  " exec 'hi cBraces' . fg_gray
  " exec 'hi cIdentifier' . fg_cyan . bg_green
  " exec 'hi cSemiColon'  . bg_cyan
  exec 'hi cOperator' . fg_cyan5
  " exec 'hi cStatement' . fg_green
  " exec 'hi cTodo' . fg_darkmagenta . s:ft_bold
  " exec 'hi cStructure' . fg_cyan . s:ft_bold
  exec 'hi cCustomParen' . fg_gray
  " exec 'hi cCustomFunc' . fg_gray
  " exec 'hi cUserFunction' . fg_cyan . s:ft_bold
  exec 'hi cOctalZero' . fg_yellow . s:ft_bold
  if s:langOpt_c__highlight_builtins == 1
    exec 'hi cFunction' . fg_cyan
  else
    exec 'hi cFunction' . fg_gray
  endif

  " CPP highlighting
  exec 'hi cppBoolean' . fg_yellow1 . s:ft_bold
  exec 'hi cppSTLnamespace' . fg_yellow
  exec 'hi cppSTLexception' . fg_green
  exec 'hi cppSTLfunctional' . fg_gray . s:ft_bold
  exec 'hi cppSTLiterator' . fg_gray . s:ft_bold
  exec 'hi cppExceptions' . fg_red
  exec 'hi cppStatement' . fg_cyan
  exec 'hi cppStorageClass' . fg_darkcyan . s:ft_bold
  exec 'hi cppAccess' . fg_magenta . s:ft_bold
  if s:langOpt_cpp__highlight_standard_library == 1
    exec 'hi cppSTLconstant' . fg_yellow1 . s:ft_bold
    exec 'hi cppSTLtype' . fg_green . s:ft_bold
    exec 'hi cppSTLfunction' . fg_cyan
    exec 'hi cppSTLios' . fg_darkyellow . s:ft_bold
  else
    exec 'hi cppSTLconstant' . fg_gray
    exec 'hi cppSTLtype' . fg_gray
    exec 'hi cppSTLfunction' . fg_gray
    exec 'hi cppSTLios' . fg_gray
  endif
  " exec 'hi cppSTL' . fg_cyan

  " Rust highlighting
  exec 'hi rustKeyword' . fg_green
  exec 'hi rustModPath' . fg_cyan
  exec 'hi rustModPathSep' . fg_cyan
  exec 'hi rustLifetime' . fg_yellow
  exec 'hi rustStructure' . fg_cyan5 . s:ft_bold
  exec 'hi rustAttribute' . fg_cyan5 . s:ft_bold
  exec 'hi rustPanic' . fg_darkyellow . s:ft_bold
  exec 'hi rustTrait' . fg_cyan . s:ft_bold
  exec 'hi rustEnum' . fg_yellow1 . s:ft_bold
  exec 'hi rustEnumVariant' . fg_yellow1
  exec 'hi rustSelf' . fg_magenta
  exec 'hi rustSigil' . fg_cyan5 . s:ft_bold
  exec 'hi rustOperator' . fg_cyan5 . s:ft_bold
  exec 'hi rustMacro' . fg_darkyellow . s:ft_bold
  exec 'hi rustMacroVariable' . fg_darkyellow
  exec 'hi rustAssert' . fg_darkyellow . s:ft_bold
  exec 'hi rustConditional' . fg_yellow . s:ft_bold

  " Lex highlighting
  exec 'hi lexCFunctions' . fg_gray
  exec 'hi lexAbbrv' . fg_yellow
  exec 'hi lexAbbrvRegExp' . fg_cyan5
  exec 'hi lexAbbrvComment' . fg_darkmagenta
  exec 'hi lexBrace' . fg_darkcyan
  exec 'hi lexPat' . fg_cyan5
  exec 'hi lexPatComment' . fg_darkmagenta
  exec 'hi lexPatTag' . fg_magenta
  " exec 'hi lexPatBlock' . fg_gray . s:ft_bold
  exec 'hi lexSlashQuote' . fg_gray
  exec 'hi lexSep' . fg_gray
  exec 'hi lexStartState' . fg_magenta
  exec 'hi lexPatTagZone' . fg_darkyellow . s:ft_bold
  exec 'hi lexMorePat' . fg_darkyellow . s:ft_bold
  exec 'hi lexOptions' . fg_darkyellow . s:ft_bold
  exec 'hi lexPatString' . fg_darkyellow

  " Yacc highlighting
  exec 'hi yaccNonterminal' . fg_darkcyan
  exec 'hi yaccDelim' . fg_magenta
  exec 'hi yaccInitKey' . fg_cyan5
  exec 'hi yaccInit' . fg_darkcyan
  exec 'hi yaccKey' . fg_yellow
  exec 'hi yaccVar' . fg_cyan5

  " NASM highlighting
  exec 'hi nasmStdInstruction' . fg_darkcyan
  exec 'hi nasmGen08Register' . fg_cyan5
  exec 'hi nasmGen16Register' . fg_cyan5
  exec 'hi nasmGen32Register' . fg_cyan5
  exec 'hi nasmGen64Register' . fg_cyan5
  exec 'hi nasmHexNumber' . fg_yellow
  exec 'hi nasmStorage' . fg_cyan5 . s:ft_bold
  exec 'hi nasmLabel' . fg_green
  exec 'hi nasmDirective' . fg_cyan . s:ft_bold
  exec 'hi nasmLocalLabel' . fg_magenta

  " GAS highlighting
  exec 'hi gasSymbol' . fg_green
  exec 'hi gasDirective' . fg_cyan . s:ft_bold
  exec 'hi gasOpcode_386_Base' . fg_darkcyan
  exec 'hi gasDecimalNumber' . fg_yellow
  exec 'hi gasSymbolRef' . fg_green
  exec 'hi gasRegisterX86' . fg_cyan
  exec 'hi gasOpcode_P6_Base' . fg_darkcyan
  exec 'hi gasDirectiveStore' . fg_gray . s:ft_bold

  " MIPS highlighting
  exec 'hi mipsInstruction' . fg_green
  exec 'hi mipsRegister' . fg_darkcyan
  exec 'hi mipsLabel' . fg_cyan5 . s:ft_bold
  exec 'hi mipsDirective' . fg_yellow . s:ft_bold

  " Shell/Bash highlighting
  exec 'hi bashStatement' . fg_gray . s:ft_bold
  exec 'hi shDerefVar' . fg_cyan5 . s:ft_bold
  exec 'hi shDerefSimple' . fg_cyan5
  exec 'hi shFunction' . fg_magenta . s:ft_bold
  exec 'hi shStatement' . fg_gray
  exec 'hi shLoop' . fg_yellow . s:ft_bold
  exec 'hi shQuote' . fg_darkyellow
  exec 'hi shCaseEsac' . fg_cyan5 . s:ft_bold
  exec 'hi shSnglCase' . fg_yellow . s:ft_none
  exec 'hi shFunctionOne' . fg_darkcyan
  exec 'hi shCase' . fg_darkcyan
  exec 'hi shSetList' . fg_darkcyan
  " @see Dockerfile Highlighting section for more sh*

  " PowerShell Highlighting
  exec 'hi ps1Type' . fg_yellow1 . s:ft_bold
  exec 'hi ps1Variable' . fg_darkcyan
  exec 'hi ps1Boolean' . fg_darkcyan . s:ft_bold
  exec 'hi ps1FunctionInvocation' . fg_green
  exec 'hi ps1FunctionDeclaration' . fg_green
  exec 'hi ps1Keyword' . fg_cyan . s:ft_bold
  exec 'hi ps1Exception' . fg_red
  exec 'hi ps1Operator' . fg_cyan5 . s:ft_bold
  exec 'hi ps1CommentDoc' . fg_yellow
  exec 'hi ps1CDocParam' . fg_magenta

  " HTML Highlighting
  exec 'hi htmlTitle' . fg_yellow1 . s:ft_bold
  exec 'hi htmlH1' . fg_yellow1 . s:ft_bold
  exec 'hi htmlH2' . fg_cyan5 . s:ft_bold
  exec 'hi htmlH3' . fg_yellow . s:ft_bold
  exec 'hi htmlH4' . fg_magenta . s:ft_bold
  exec 'hi htmlTag' . fg_darkmagenta
  exec 'hi htmlTagName' . s:fg_wine
  exec 'hi htmlArg' . fg_green
  exec 'hi htmlEndTag' . fg_darkmagenta
  exec 'hi htmlString' . fg_cyan
  exec 'hi htmlScriptTag' . fg_darkmagenta
  exec 'hi htmlBold' . fg_gray . s:ft_bold
  exec 'hi htmlItalic' . fg_darkmagenta . s:ft_italic
  exec 'hi htmlBoldItalic' . fg_darkcyan . s:ft_italic_bold
  " exec 'hi htmlLink' . fg_cyan . s:ft_bold
  exec 'hi htmlTagN' . s:fg_wine . s:ft_bold
  exec 'hi htmlSpecialTagName' . s:fg_wine
  exec 'hi htmlComment' . fg_darkmagenta . s:ft_italic
  exec 'hi htmlCommentPart' . fg_darkmagenta . s:ft_italic

  " CSS Highlighting
  exec 'hi cssIdentifier' . fg_green
  exec 'hi cssPositioningProp' . fg_gray
  exec 'hi cssNoise' . fg_gray
  exec 'hi cssBoxProp' . fg_gray
  exec 'hi cssTableAttr' . fg_yellow
  exec 'hi cssPositioningAttr' . fg_darkcyan
  exec 'hi cssValueLength' . fg_magenta
  exec 'hi cssFunctionName' . fg_cyan
  exec 'hi cssUnitDecorators' . fg_cyan5
  exec 'hi cssColor' . fg_cyan . s:ft_bold
  exec 'hi cssBraces' . fg_green
  exec 'hi cssBackgroundProp' . fg_gray
  exec 'hi cssTextProp' . fg_gray
  exec 'hi cssDimensionProp' . fg_gray
  exec 'hi cssClassName' . fg_green

  " Markdown Highlighting
  exec 'hi markdownHeadingRule' . fg_green . s:ft_bold
  exec 'hi markdownH1' . fg_green . s:ft_bold
  exec 'hi markdownH2' . fg_magenta . s:ft_bold
  exec 'hi markdownBlockquote' . fg_green
  exec 'hi markdownCodeBlock' . fg_darkyellow
  exec 'hi markdownCode' . fg_darkyellow
  exec 'hi markdownLink' . fg_cyan . s:ft_bold
  exec 'hi markdownUrl' . fg_cyan
  exec 'hi markdownLinkText' . fg_green
  exec 'hi markdownLinkTextDelimiter' . fg_yellow
  exec 'hi markdownLinkDelimiter' . fg_yellow
  exec 'hi markdownCodeDelimiter' . fg_cyan

  exec 'hi mkdCode' . fg_darkyellow
  exec 'hi mkdLink' . fg_cyan . s:ft_bold
  exec 'hi mkdURL' . fg_darkmagenta
  exec 'hi mkdString' . fg_gray
  exec 'hi mkdBlockQuote' . fg_green
  exec 'hi mkdLinkTitle' . fg_green
  exec 'hi mkdDelimiter' . fg_cyan5
  exec 'hi mkdRule' . fg_green

  " reStructuredText Highlighting
  exec 'hi rstSections' . fg_green . s:ft_bold
  exec 'hi rstDelimiter' . fg_green . s:ft_bold
  exec 'hi rstExplicitMarkup' . fg_green . s:ft_bold
  exec 'hi rstDirective' . fg_cyan
  exec 'hi rstHyperlinkTarget' . fg_yellow1
  exec 'hi rstExDirective' . fg_gray
  exec 'hi rstInlineLiteral' . fg_darkyellow
  exec 'hi rstInterpretedTextOrHyperlinkReference' . fg_cyan

  " Python Highlighting
  exec 'hi pythonImport' . fg_green . s:ft_bold
  exec 'hi pythonExceptions' . fg_red
  exec 'hi pythonException' . fg_yellow . s:ft_bold
  exec 'hi pythonInclude' . fg_red
  exec 'hi pythonStatement' . fg_green
  exec 'hi pythonConditional' . fg_yellow . s:ft_bold
  exec 'hi pythonRepeat' . fg_yellow . s:ft_bold
  exec 'hi pythonFunction' . fg_cyan5 . s:ft_bold
  exec 'hi pythonPreCondit' . fg_yellow
  exec 'hi pythonExClass' . fg_magenta
  exec 'hi pythonOperator' . fg_yellow . s:ft_bold
  exec 'hi pythonBuiltin' . fg_gray
  exec 'hi pythonDecorator' . fg_magenta

  exec 'hi pythonString' . fg_darkyellow
  exec 'hi pythonEscape' . fg_darkyellow . s:ft_bold
  exec 'hi pythonStrFormatting' . fg_darkyellow . s:ft_bold

  exec 'hi pythonBoolean' . fg_yellow1 . s:ft_bold
  exec 'hi pythonBytesEscape' . fg_darkyellow . s:ft_bold
  exec 'hi pythonDottedName' . fg_yellow
  exec 'hi pythonStrFormat' . fg_gray

  if s:langOpt_python__highlight_builtins == 1
    exec 'hi pythonBuiltinFunc' . fg_cyan
    exec 'hi pythonBuiltinObj' . fg_red
  else
    exec 'hi pythonBuiltinFunc' . fg_gray
    exec 'hi pythonBuiltinObj' . fg_gray
  endif

  " Java Highlighting
  exec 'hi javaExternal' . fg_green
  exec 'hi javaAnnotation' . fg_magenta
  exec 'hi javaTypedef' . fg_cyan5
  exec 'hi javaClassDecl' . fg_cyan5 . s:ft_bold
  exec 'hi javaScopeDecl' . fg_cyan . s:ft_bold
  exec 'hi javaStorageClass' . fg_darkcyan . s:ft_bold
  exec 'hi javaBoolean' . fg_yellow1 . s:ft_bold
  exec 'hi javaConstant' . fg_cyan
  exec 'hi javaCommentTitle' . s:fg_wine
  exec 'hi javaDocTags' . fg_cyan5
  exec 'hi javaDocComment' . fg_darkmagenta
  exec 'hi javaDocParam' . fg_gray
  exec 'hi javaStatement' . fg_green

  " JavaScript Highlighting
  exec 'hi javaScriptBraces' . fg_cyan
  exec 'hi javaScriptParens' . fg_cyan
  exec 'hi javaScriptIdentifier' . fg_green
  exec 'hi javaScriptFunction' . fg_cyan . s:ft_bold
  exec 'hi javaScriptConditional' . fg_yellow . s:ft_bold
  exec 'hi javaScriptRepeat' . fg_yellow . s:ft_bold
  exec 'hi javaScriptBoolean' . fg_yellow1 . s:ft_bold
  exec 'hi javaScriptNumber' . fg_magenta
  exec 'hi javaScriptMember' . fg_darkcyan
  exec 'hi javaScriptReserved' . fg_darkcyan
  exec 'hi javascriptNull' . fg_darkmagenta . s:ft_bold
  exec 'hi javascriptGlobal' . fg_gray
  exec 'hi javascriptStatement' . fg_green
  exec 'hi javaScriptMessage' . fg_gray
  exec 'hi javaScriptMember' . fg_gray

  " TypeScript Highlighting
  exec 'hi typescriptDecorators' . fg_magenta
  exec 'hi typescriptLabel' . fg_yellow . s:ft_bold

  " @target https://github.com/pangloss/vim-javascript
  exec 'hi jsImport' . fg_green . s:ft_bold
  exec 'hi jsExport' . fg_green . s:ft_bold
  exec 'hi jsModuleAs' . fg_green . s:ft_bold
  exec 'hi jsFrom' . fg_green . s:ft_bold
  exec 'hi jsExportDefault' . fg_green . s:ft_bold
  exec 'hi jsFuncParens' . fg_cyan
  exec 'hi jsFuncBraces' . fg_cyan
  exec 'hi jsParens' . fg_cyan
  exec 'hi jsBraces' . fg_cyan
  exec 'hi jsNoise' . fg_cyan

  " Jsx Highlighting
  " @target https://github.com/MaxMEllon/vim-jsx-pretty
  exec 'hi jsxTagName' . s:fg_wine
  exec 'hi jsxComponentName' . s:fg_wine
  exec 'hi jsxAttrib' . fg_green
  exec 'hi jsxEqual' . fg_darkmagenta
  exec 'hi jsxString' . fg_cyan
  exec 'hi jsxCloseTag' . fg_darkmagenta
  exec 'hi jsxCloseString' . fg_darkmagenta
  exec 'hi jsxDot' . s:fg_wine
  exec 'hi jsxNamespace' . s:fg_wine
  exec 'hi jsxPunct' . fg_darkmagenta

  " Json Highlighting
  " @target https://github.com/elzr/vim-json
  exec 'hi jsonKeyword' . fg_cyan
  exec 'hi jsonString' . fg_darkyellow
  exec 'hi jsonQuote' . fg_darkmagenta
  exec 'hi jsonNoise' . fg_gray
  exec 'hi jsonKeywordMatch' . fg_gray
  exec 'hi jsonBraces' . fg_gray
  exec 'hi jsonNumber' . fg_magenta
  exec 'hi jsonNull' . fg_yellow . s:ft_bold
  exec 'hi jsonBoolean' . fg_yellow1 . s:ft_bold
  exec 'hi jsonCommentError' . fg_green . bg_black0

  " Go Highlighting
  exec 'hi goDirective' . fg_red
  exec 'hi goDeclaration' . fg_cyan . s:ft_bold
  exec 'hi goStatement' . fg_green
  exec 'hi goConditional' . fg_yellow . s:ft_bold
  exec 'hi goConstants' . fg_magenta
  exec 'hi goFunction' . fg_magenta
  " exec 'hi goTodo' . fg_darkmagenta . s:ft_bold
  exec 'hi goDeclType' . fg_cyan
  exec 'hi goBuiltins' . fg_yellow

  " Systemtap Highlighting
  " exec 'hi stapBlock' . fg_darkmagenta . s:ft_none
  exec 'hi stapComment' . fg_darkmagenta . s:ft_none
  exec 'hi stapProbe' . fg_cyan5 . s:ft_bold
  exec 'hi stapStat' . fg_darkcyan . s:ft_bold
  exec 'hi stapFunc' . fg_gray
  exec 'hi stapString' . fg_darkyellow
  exec 'hi stapTarget' . fg_darkcyan
  exec 'hi stapStatement' . fg_green
  exec 'hi stapType' . fg_green . s:ft_bold
  exec 'hi stapSharpBang' . fg_darkmagenta
  exec 'hi stapDeclaration' . fg_green
  exec 'hi stapCMacro' . fg_cyan

  " DTrace Highlighting
  exec 'hi dtraceProbe' . fg_cyan
  exec 'hi dtracePredicate' . fg_yellow . s:ft_bold
  exec 'hi dtraceComment' . fg_darkmagenta
  exec 'hi dtraceFunction' . fg_gray
  exec 'hi dtraceAggregatingFunction' . fg_cyan . s:ft_bold
  exec 'hi dtraceStatement' . fg_darkcyan . s:ft_bold
  exec 'hi dtraceIdentifier' . fg_green
  exec 'hi dtraceOption' . fg_green
  exec 'hi dtraceConstant' . fg_magenta
  exec 'hi dtraceType' . fg_green . s:ft_bold

  " PlantUML Highlighting
  exec 'hi plantumlPreProc' . fg_magenta . s:ft_bold
  exec 'hi plantumlDirectedOrVerticalArrowRL' . fg_green
  exec 'hi plantumlDirectedOrVerticalArrowLR' . fg_green
  exec 'hi plantumlString' . fg_darkyellow
  exec 'hi plantumlActivityThing' . fg_yellow
  exec 'hi plantumlText' . fg_darkcyan
  exec 'hi plantumlClassPublic' . fg_darkyellow . s:ft_bold
  exec 'hi plantumlClassPrivate' . fg_red
  exec 'hi plantumlColonLine' . fg_magenta
  exec 'hi plantumlClass' . fg_darkcyan
  exec 'hi plantumlHorizontalArrow' . fg_green
  exec 'hi plantumlTypeKeyword' . fg_cyan . s:ft_bold
  exec 'hi plantumlKeyword' . fg_green . s:ft_bold

  exec 'hi plantumlType' . fg_cyan . s:ft_bold
  exec 'hi plantumlBlock' . fg_green . s:ft_bold
  exec 'hi plantumlPreposition' . fg_magenta
  exec 'hi plantumlLayout' . fg_cyan . s:ft_bold
  exec 'hi plantumlNote' . fg_magenta
  exec 'hi plantumlLifecycle' . fg_cyan5
  exec 'hi plantumlParticipant' . fg_gray . s:ft_bold


  " Haskell Highlighting
  exec 'hi haskellType' . fg_cyan5 . s:ft_bold
  exec 'hi haskellIdentifier' . fg_magenta . s:ft_bold
  exec 'hi haskellOperators' . fg_green
  exec 'hi haskellWhere' . fg_gray . s:ft_bold
  exec 'hi haskellDelimiter' . fg_cyan5
  exec 'hi haskellImportKeywords' . fg_green
  exec 'hi haskellStatement' . fg_yellow . s:ft_bold


  " SQL/MySQL Highlighting
  exec 'hi sqlStatement' . fg_green . s:ft_bold
  exec 'hi sqlType' . fg_cyan . s:ft_bold
  exec 'hi sqlKeyword' . fg_green
  exec 'hi sqlOperator' . fg_cyan5
  exec 'hi sqlSpecial' . fg_yellow1 . s:ft_bold

  exec 'hi mysqlVariable' . fg_darkyellow . s:ft_bold
  exec 'hi mysqlType' . fg_cyan . s:ft_bold
  exec 'hi mysqlKeyword' . fg_green
  exec 'hi mysqlOperator' . fg_cyan5
  exec 'hi mysqlSpecial' . fg_yellow1 . s:ft_bold


  " Octave/MATLAB Highlighting
  exec 'hi octaveVariable' . fg_gray
  exec 'hi octaveDelimiter' . fg_green
  exec 'hi octaveQueryVar' . fg_gray
  exec 'hi octaveSemicolon' . fg_yellow
  exec 'hi octaveFunction' . fg_darkcyan
  exec 'hi octaveSetVar' . fg_cyan
  exec 'hi octaveUserVar' . fg_gray
  exec 'hi octaveArithmeticOperator' . fg_cyan5
  exec 'hi octaveBeginKeyword' . fg_yellow . s:ft_bold
  exec 'hi octaveElseKeyword' . fg_yellow . s:ft_bold
  exec 'hi octaveEndKeyword' . fg_yellow . s:ft_bold
  exec 'hi octaveStatement' . fg_green

  " Ruby Highlighting
  exec 'hi rubyModule' . fg_darkcyan . s:ft_bold
  exec 'hi rubyClass' . fg_green . s:ft_bold
  exec 'hi rubyPseudoVariable' . fg_darkmagenta . s:ft_bold
  exec 'hi rubyKeyword' . fg_green
  exec 'hi rubyInstanceVariable' . fg_yellow
  exec 'hi rubyFunction' . fg_gray . s:ft_bold
  exec 'hi rubyDefine' . fg_green
  exec 'hi rubySymbol' . fg_cyan5
  exec 'hi rubyConstant' . fg_cyan
  exec 'hi rubyAccess' . fg_darkcyan
  exec 'hi rubyAttribute' . fg_yellow1
  exec 'hi rubyInclude' . fg_red
  exec 'hi rubyLocalVariableOrMethod' . fg_magenta
  exec 'hi rubyCurlyBlock' . fg_gray
  exec 'hi rubyCurlyBlockDelimiter' . fg_cyan5
  exec 'hi rubyArrayDelimiter' . fg_cyan5
  exec 'hi rubyStringDelimiter' . fg_darkyellow
  exec 'hi rubyInterpolationDelimiter' . fg_magenta
  exec 'hi rubyConditional' . fg_yellow . s:ft_bold
  exec 'hi rubyRepeat' . fg_yellow . s:ft_bold
  exec 'hi rubyControl' . fg_yellow . s:ft_bold
  exec 'hi rubyException' . fg_yellow . s:ft_bold
  exec 'hi rubyExceptional' . fg_yellow . s:ft_bold
  exec 'hi rubyBoolean' . fg_yellow1 . s:ft_bold

  " Fortran Highlighting
  exec 'hi fortranUnitHeader' . fg_cyan . s:ft_bold
  exec 'hi fortranIntrinsic' . fg_cyan . bg_black0 . s:ft_none
  exec 'hi fortranType' . fg_green . s:ft_bold
  exec 'hi fortranTypeOb' . fg_green . s:ft_bold
  exec 'hi fortranStructure' . fg_cyan5
  exec 'hi fortranStorageClass' . fg_darkcyan . s:ft_bold
  exec 'hi fortranStorageClassR' . fg_darkcyan . s:ft_bold
  exec 'hi fortranKeyword' . fg_green
  exec 'hi fortranReadWrite' . fg_cyan5 . s:ft_bold
  exec 'hi fortranIO' . fg_darkcyan
  exec 'hi fortranOperator' . fg_cyan5 . s:ft_bold
  exec 'hi fortranCall' . fg_cyan5 . s:ft_bold
  exec 'hi fortranContinueMark' . fg_yellow1

  " ALGOL Highlighting (Plugin: https://github.com/sterpe/vim-algol68)
  exec 'hi algol68Statement' . fg_cyan . s:ft_bold
  exec 'hi algol68Operator' . fg_cyan5 . s:ft_bold
  exec 'hi algol68PreProc' . fg_yellow1
  exec 'hi algol68Function' . fg_cyan

  " R Highlighting
  exec 'hi rType' . fg_cyan
  exec 'hi rArrow' . fg_green
  exec 'hi rDollar' . fg_cyan

  " XXD Highlighting
  exec 'hi xxdAddress' . fg_darkcyan
  exec 'hi xxdSep' . fg_green
  exec 'hi xxdAscii' . fg_green
  exec 'hi xxdDot' . fg_cyan5

  " PHP Highlighting
  exec 'hi phpIdentifier' . fg_gray
  exec 'hi phpVarSelector' . fg_green
  exec 'hi phpKeyword' . fg_cyan
  exec 'hi phpRepeat' . fg_yellow . s:ft_bold
  exec 'hi phpConditional' . fg_yellow . s:ft_bold
  exec 'hi phpStatement' . fg_green
  exec 'hi phpAssignByRef' . fg_cyan5 . s:ft_bold
  exec 'hi phpSpecialFunction' . fg_cyan
  exec 'hi phpFunctions' . fg_cyan
  exec 'hi phpComparison' . fg_cyan5
  exec 'hi phpBackslashSequences' . fg_darkyellow . s:ft_bold
  exec 'hi phpMemberSelector' . fg_cyan
  exec 'hi phpStorageClass' . fg_yellow . s:ft_bold
  exec 'hi phpDefine' . fg_darkcyan
  exec 'hi phpIntVar' . fg_darkcyan . s:ft_bold

  " Perl Highlighting
  exec 'hi perlFiledescRead' . fg_yellow1
  exec 'hi perlMatchStartEnd' . fg_green
  exec 'hi perlStatementFlow' . fg_green
  exec 'hi perlStatementStorage' . fg_green
  exec 'hi perlFunction' . fg_green . s:ft_bold
  exec 'hi perlMethod' . fg_gray
  exec 'hi perlStatementFiledesc' . fg_magenta
  exec 'hi perlVarPlain' . fg_darkcyan
  exec 'hi perlSharpBang' . fg_darkmagenta
  exec 'hi perlStatementInclude' . fg_cyan5 . s:ft_bold
  exec 'hi perlStatementScalar' . fg_yellow
  exec 'hi perlSubName' . fg_cyan5 . s:ft_bold
  exec 'hi perlSpecialString' . fg_darkyellow . s:ft_bold

  " Pascal Highlighting
  exec 'hi pascalType' . fg_green . s:ft_bold
  exec 'hi pascalStatement' . fg_cyan . s:ft_bold
  exec 'hi pascalPredefined' . fg_green
  exec 'hi pascalFunction' . fg_gray
  exec 'hi pascalStruct' . fg_darkcyan . s:ft_bold
  exec 'hi pascalOperator' . fg_cyan5 . s:ft_bold
  exec 'hi pascalPreProc' . fg_yellow1
  exec 'hi pascalAcces' . fg_darkcyan . s:ft_bold

  " Lua Highlighting
  exec 'hi luaFunc' . fg_gray
  exec 'hi luaIn' . fg_cyan . s:ft_bold
  exec 'hi luaFunction' . fg_green
  exec 'hi luaStatement' . fg_cyan
  exec 'hi luaRepeat' . fg_cyan . s:ft_bold
  exec 'hi luaCondStart' . fg_yellow . s:ft_bold
  exec 'hi luaTable' . fg_cyan5 . s:ft_bold
  exec 'hi luaConstant' . fg_yellow1 . s:ft_bold
  exec 'hi luaElse' . fg_yellow . s:ft_bold
  exec 'hi luaCondElseif' . fg_yellow . s:ft_bold
  exec 'hi luaCond' . fg_yellow . s:ft_bold
  exec 'hi luaCondEnd' . fg_yellow

  " Clojure highlighting:
  exec 'hi clojureConstant' . fg_cyan
  exec 'hi clojureBoolean' . fg_magenta
  exec 'hi clojureCharacter' . fg_darkyellow
  exec 'hi clojureKeyword' . fg_green
  exec 'hi clojureNumber' . fg_magenta
  exec 'hi clojureString' . fg_darkyellow
  exec 'hi clojureRegexp' . fg_yellow
  exec 'hi clojureRegexpEscape' . fg_green
  exec 'hi clojureParen' . fg_cyan5
  exec 'hi clojureVariable' . fg_darkyellow
  exec 'hi clojureCond' . fg_cyan
  exec 'hi clojureDefine' . fg_cyan . s:ft_bold
  exec 'hi clojureException' . fg_red
  exec 'hi clojureFunc' . fg_darkcyan
  exec 'hi clojureMacro' . fg_cyan
  exec 'hi clojureRepeat' . fg_cyan
  exec 'hi clojureSpecial' . fg_cyan . s:ft_bold
  exec 'hi clojureQuote' . fg_cyan
  exec 'hi clojureUnquote' . fg_cyan
  exec 'hi clojureMeta' . fg_cyan
  exec 'hi clojureDeref' . fg_cyan
  exec 'hi clojureAnonArg' . fg_cyan
  exec 'hi clojureRepeat' . fg_cyan
  exec 'hi clojureDispatch' . fg_cyan5

  " Dockerfile Highlighting
  " @target https://github.com/docker/docker/tree/master/contrib/syntax/vim
  exec 'hi dockerfileKeyword' . fg_cyan
  exec 'hi shDerefVar' . fg_yellow . s:ft_bold
  exec 'hi shOperator' . fg_cyan5
  exec 'hi shOption' . fg_darkcyan
  exec 'hi shLine' . fg_gray
  exec 'hi shWrapLineOperator' . fg_green

  " NGINX Highlighting
  " @target https://github.com/evanmiller/nginx-vim-syntax
  exec 'hi ngxDirectiveBlock' . fg_green . s:ft_bold
  exec 'hi ngxDirective' . fg_cyan . s:ft_none
  exec 'hi ngxDirectiveImportant' . fg_cyan . s:ft_bold
  exec 'hi ngxString' . fg_darkyellow
  exec 'hi ngxVariableString' . fg_yellow
  exec 'hi ngxVariable' . fg_yellow . s:ft_none

  " Yaml Highlighting
  exec 'hi yamlBlockMappingKey' . fg_cyan
  exec 'hi yamlKeyValueDelimiter' . fg_green
  exec 'hi yamlBlockCollectionItemStart' . fg_green

  " Qt QML Highlighting
  exec 'hi qmlObjectLiteralType' . fg_green
  exec 'hi qmlReserved' . fg_yellow
  exec 'hi qmlBindingProperty' . fg_darkcyan
  exec 'hi qmlType' . fg_darkcyan

  " Dosini Highlighting
  exec 'hi dosiniHeader' . fg_green
  exec 'hi dosiniLabel' . fg_cyan

  " Mail highlighting
  exec 'hi mailHeaderKey' . fg_cyan
  exec 'hi mailHeaderEmail' . fg_yellow
  exec 'hi mailSubject' . fg_green
  exec 'hi mailHeader' . fg_darkmagenta
  exec 'hi mailURL' . fg_cyan5
  exec 'hi mailEmail' . fg_yellow
  exec 'hi mailQuoted1' . fg_darkyellow
  exec 'hi mailQuoted2' . fg_darkcyan

  " XML Highlighting
  exec 'hi xmlProcessingDelim' . fg_green
  exec 'hi xmlString' . fg_darkyellow
  exec 'hi xmlEqual' . fg_magenta
  exec 'hi xmlAttrib' . fg_darkcyan
  exec 'hi xmlAttribPunct' . fg_green
  exec 'hi xmlTag' . fg_cyan
  exec 'hi xmlTagName' . fg_cyan
  exec 'hi xmlEndTag' . fg_cyan
  exec 'hi xmlNamespace' . fg_magenta

  " Exlixir Highlighting
  " @target https://github.com/elixir-lang/vim-elixir
  exec 'hi elixirAlias' . fg_cyan . s:ft_bold
  exec 'hi elixirAtom' . fg_darkcyan
  exec 'hi elixirVariable' . fg_darkcyan
  exec 'hi elixirUnusedVariable' . fg_gray . s:ft_bold
  exec 'hi elixirInclude' . fg_yellow
  exec 'hi elixirStringDelimiter' . fg_darkyellow
  exec 'hi elixirKeyword' . fg_yellow . s:ft_bold
  exec 'hi elixirFunctionDeclaration' . fg_cyan5 . s:ft_bold
  exec 'hi elixirBlockDefinition' . fg_green
  exec 'hi elixirDefine' . fg_green
  exec 'hi elixirStructDefine' . fg_green
  exec 'hi elixirPrivateDefine' . fg_green
  exec 'hi elixirModuleDefine' . fg_green
  exec 'hi elixirProtocolDefine' . fg_green
  exec 'hi elixirImplDefine' . fg_green
  exec 'hi elixirModuleDeclaration' . fg_cyan5 . s:ft_bold
  exec 'hi elixirDocString' . fg_darkyellow
  exec 'hi elixirDocTest' . fg_yellow1 . s:ft_bold

  " Erlang Highlighting
  exec 'hi erlangBIF' . fg_yellow . s:ft_bold
  exec 'hi erlangBracket' . fg_green
  exec 'hi erlangLocalFuncCall' . fg_gray
  exec 'hi erlangVariable' . fg_gray
  exec 'hi erlangAtom' . fg_darkcyan
  exec 'hi erlangAttribute' . fg_cyan . s:ft_bold
  exec 'hi erlangRecordDef' . fg_cyan . s:ft_bold
  exec 'hi erlangRecord' . fg_cyan
  exec 'hi erlangRightArrow' . fg_cyan . s:ft_bold
  exec 'hi erlangStringModifier' . fg_darkyellow . s:ft_bold
  exec 'hi erlangInclude' . fg_cyan . s:ft_bold
  exec 'hi erlangKeyword' . fg_green
  exec 'hi erlangGlobalFuncCall' . fg_gray

  " Cucumber Highlighting
  exec 'hi cucumberFeature' . fg_cyan . s:ft_bold
  exec 'hi cucumberBackground' . fg_green . s:ft_bold
  exec 'hi cucumberScenario' . fg_green . s:ft_bold
  exec 'hi cucumberGiven' . fg_magenta
  exec 'hi cucumberGivenAnd' . fg_cyan
  exec 'hi cucumberThen' . fg_magenta
  exec 'hi cucumberThenAnd' . fg_cyan
  exec 'hi cucumberWhen' . fg_yellow . s:ft_bold
  exec 'hi cucumberScenarioOutline' . fg_green . s:ft_bold
  exec 'hi cucumberExamples' . fg_cyan5
  exec 'hi cucumberTags' . fg_cyan5
  exec 'hi cucumberPlaceholder' . fg_cyan5

  " Ada Highlighting
  exec 'hi adaInc' . fg_cyan5 . s:ft_bold
  exec 'hi adaSpecial' . fg_cyan5 . s:ft_bold
  exec 'hi adaKeyword' . fg_green
  exec 'hi adaBegin' . fg_green
  exec 'hi adaEnd' . fg_green
  exec 'hi adaTypedef' . fg_darkcyan . s:ft_bold
  exec 'hi adaAssignment' . fg_cyan5 . s:ft_bold
  exec 'hi adaAttribute' . fg_yellow1

  " COBOL Highlighting
  exec 'hi cobolMarker' . fg_darkmagenta . s:bg_cursorline
  exec 'hi cobolLine' . fg_gray
  exec 'hi cobolReserved' . fg_cyan
  exec 'hi cobolDivision' . fg_green . s:ft_bold
  exec 'hi cobolDivisionName' . fg_green . s:ft_bold
  exec 'hi cobolSection' . fg_darkcyan . s:ft_bold
  exec 'hi cobolSectionName' . fg_darkcyan . s:ft_bold
  exec 'hi cobolParagraph' . fg_yellow
  exec 'hi cobolParagraphName' . fg_yellow
  exec 'hi cobolDeclA' . fg_yellow
  exec 'hi cobolDecl' . fg_yellow1
  exec 'hi cobolCALLs' . fg_cyan5 . s:ft_bold
  exec 'hi cobolEXECs' . fg_cyan5 . s:ft_bold

  " GNU sed highlighting
  exec 'hi sedST' . fg_yellow . s:ft_bold
  exec 'hi sedFlag' . fg_yellow . s:ft_bold
  exec 'hi sedRegexp47' . fg_green
  exec 'hi sedRegexpMeta' . fg_cyan . s:ft_bold
  exec 'hi sedReplacement47' . fg_darkyellow
  exec 'hi sedReplaceMeta' . fg_magenta . s:ft_bold
  exec 'hi sedAddress' . fg_green
  exec 'hi sedFunction' . fg_cyan5 . s:ft_bold
  exec 'hi sedBranch' . fg_yellow1 . s:ft_bold
  exec 'hi sedLabel' . fg_yellow1 . s:ft_bold

  " GNU awk highlighting
  exec 'hi awkPatterns' . fg_green . s:ft_bold
  exec 'hi awkSearch' . fg_green
  exec 'hi awkRegExp' . fg_cyan . s:ft_bold
  exec 'hi awkCharClass' . fg_cyan . s:ft_bold
  exec 'hi awkFieldVars' . fg_yellow1 . s:ft_bold
  exec 'hi awkStatement' . fg_cyan . s:ft_bold
  exec 'hi awkFunction' . fg_cyan
  exec 'hi awkVariables' . fg_yellow1 . s:ft_bold
  exec 'hi awkArrayElement' . fg_magenta
  exec 'hi awkOperator' . fg_gray
  exec 'hi awkBoolLogic' . fg_gray
  exec 'hi awkExpression' . fg_gray
  exec 'hi awkSpecialPrintf' . fg_darkyellow . s:ft_bold

  " Elm highlighting
  exec 'hi elmImport' . fg_darkcyan
  exec 'hi elmAlias' . fg_cyan5
  exec 'hi elmType' . fg_green
  exec 'hi elmOperator' . fg_cyan5 . s:ft_bold
  exec 'hi elmBraces' . fg_cyan5 . s:ft_bold
  exec 'hi elmTypedef' . fg_cyan .  s:ft_bold
  exec 'hi elmTopLevelDecl' . fg_yellow1 . s:ft_bold

  " Purescript highlighting
  exec 'hi purescriptModuleKeyword' . fg_darkcyan
  exec 'hi purescriptImportKeyword' . fg_darkcyan
  exec 'hi purescriptModuleName' . fg_green
  exec 'hi purescriptOperator' . fg_cyan5 . s:ft_bold
  exec 'hi purescriptType' . fg_green
  exec 'hi purescriptTypeVar' . fg_darkcyan
  exec 'hi purescriptStructure' . fg_cyan . s:ft_bold
  exec 'hi purescriptLet' . fg_cyan . s:ft_bold
  exec 'hi purescriptFunction' . fg_yellow1 . s:ft_bold
  exec 'hi purescriptDelimiter' . fg_cyan5 . s:ft_bold
  exec 'hi purescriptStatement' . fg_yellow . s:ft_bold
  exec 'hi purescriptConstructor' . fg_green
  exec 'hi purescriptWhere' . fg_yellow . s:ft_bold

  " F# highlighting
  exec 'hi fsharpTypeName' . fg_green
  exec 'hi fsharpCoreClass' . fg_green
  exec 'hi fsharpType' . fg_green
  exec 'hi fsharpKeyword' . fg_cyan . s:ft_bold
  exec 'hi fsharpOperator' . fg_cyan5 . s:ft_bold
  exec 'hi fsharpBoolean' . fg_yellow1 . s:ft_bold
  exec 'hi fsharpFormat' . fg_gray
  exec 'hi fsharpLinq' . fg_cyan
  exec 'hi fsharpKeyChar' . fg_cyan5 . s:ft_bold
  exec 'hi fsharpOption' . fg_magenta
  exec 'hi fsharpCoreMethod' . fg_yellow
  exec 'hi fsharpAttrib' . fg_magenta
  exec 'hi fsharpModifier' . fg_cyan5
  exec 'hi fsharpOpen' . fg_red

  " ASN.1 highlighting
  exec 'hi asnExternal' . fg_yellow1 . s:ft_bold
  exec 'hi asnTagModifier' . fg_yellow
  exec 'hi asnBraces' . fg_cyan5 . s:ft_bold
  exec 'hi asnDefinition' . fg_gray
  exec 'hi asnStructure' . fg_cyan
  exec 'hi asnType' . fg_green
  exec 'hi asnTypeInfo' . fg_cyan5 . s:ft_bold
  exec 'hi asnFieldOption' . fg_yellow

  " }}}

  " Plugin: Netrw
  exec 'hi netrwVersion' . fg_red
  exec 'hi netrwList' . fg_green
  exec 'hi netrwHidePat' . fg_darkyellow
  exec 'hi netrwQuickHelp' . fg_cyan
  exec 'hi netrwHelpCmd' . fg_cyan
  exec 'hi netrwDir' . fg_cyan5 . s:ft_bold
  exec 'hi netrwClassify' . fg_green
  exec 'hi netrwExe' . fg_yellow1
  exec 'hi netrwSuffixes' . fg_darkmagenta
  exec 'hi netrwTreeBar' . s:fg_linenumber_fg

  " Plugin: NERDTree
  exec 'hi NERDTreeUp' . fg_darkmagenta
  exec 'hi NERDTreeHelpCommand' . fg_green
  exec 'hi NERDTreeHelpTitle' . fg_cyan . s:ft_bold
  exec 'hi NERDTreeHelpKey' . fg_green
  exec 'hi NERDTreeHelp' . fg_gray
  exec 'hi NERDTreeToggleOff' . fg_red
  exec 'hi NERDTreeToggleOn' . fg_yellow1
  exec 'hi NERDTreeDir' . fg_cyan . s:ft_bold
  exec 'hi NERDTreeDirSlash' . fg_green
  exec 'hi NERDTreeFile' . fg_gray
  exec 'hi NERDTreeExecFile' . fg_yellow1
  exec 'hi NERDTreeOpenable' . fg_cyan5 . s:ft_bold
  exec 'hi NERDTreeClosable' . fg_green

  " Plugin: Tagbar
  exec 'hi TagbarHelpTitle' . fg_cyan . s:ft_bold
  exec 'hi TagbarHelp' . fg_gray
  exec 'hi TagbarKind' . fg_green
  exec 'hi TagbarSignature' . fg_cyan5

  " Plugin: Vimdiff
  exec 'hi DiffAdd' . s:fg_diffadd_fg . s:bg_diffadd_bg . s:ft_none
  exec 'hi DiffChange' . s:fg_diffchange_fg . s:bg_diffchange_bg . s:ft_none
  exec 'hi DiffDelete' . s:fg_diffdelete_fg . s:bg_diffdelete_bg . s:ft_none
  exec 'hi DiffText' . s:fg_difftext_fg . s:bg_difftext_bg . s:ft_none

  " Plugin: AGit
  exec 'hi agitHead' . fg_yellow1 . s:ft_bold
  exec 'hi agitHeader' . fg_darkyellow
  exec 'hi agitStatAdded' . s:fg_diffadd_fg
  exec 'hi agitStatRemoved' . s:fg_diffdelete_fg
  exec 'hi agitDiffAdd' . s:fg_diffadd_fg
  exec 'hi agitDiffRemove' . s:fg_diffdelete_fg
  exec 'hi agitDiffHeader' . fg_green
  exec 'hi agitDiff' . fg_gray
  exec 'hi agitDiffIndex' . fg_yellow
  exec 'hi agitDiffFileName' . fg_cyan5
  exec 'hi agitLog' . fg_gray
  exec 'hi agitAuthorMark' . fg_darkyellow
  exec 'hi agitDateMark' . fg_darkmagenta
  exec 'hi agitHeaderLabel' . fg_cyan5
  exec 'hi agitDate' . fg_cyan5
  exec 'hi agitTree' . fg_green
  exec 'hi agitRef' . fg_cyan . s:ft_bold
  exec 'hi agitRemote' . fg_yellow . s:ft_bold
  exec 'hi agitTag' . fg_magenta . s:ft_bold

  " Plugin: Spell Checking
  exec 'hi SpellBad' . fg_gray . s:bg_spellbad
  exec 'hi SpellCap' . fg_gray . s:bg_spellcap
  exec 'hi SpellRare' . fg_gray . s:bg_spellrare
  exec 'hi SpellLocal' . fg_gray . s:bg_spelllocal

  " Plugin: Indent Guides
  exec 'hi IndentGuidesOdd'  . bg_black0
  exec 'hi IndentGuidesEven'  . s:bg_cursorline

  " Plugin: Startify
  exec 'hi StartifyFile' . fg_cyan . s:ft_bold
  exec 'hi StartifyNumber' . fg_magenta
  exec 'hi StartifyHeader' . fg_darkmagenta
  exec 'hi StartifySection' . fg_green
  exec 'hi StartifyPath' . fg_gray
  exec 'hi StartifySlash' . fg_darkcyan
  exec 'hi StartifyBracket' . fg_cyan5
  exec 'hi StartifySpecial' . fg_cyan5

  " Plugin: Signify
  exec 'hi SignifyLineChange' . s:fg_diffchange_fg
  exec 'hi SignifySignChange' . s:fg_diffchange_fg
  exec 'hi SignifyLineAdd' . s:fg_diffadd_fg
  exec 'hi SignifySignAdd' . s:fg_diffadd_fg
  exec 'hi SignifyLineDelete' . s:fg_diffdelete_fg
  exec 'hi SignifySignDelete' . s:fg_diffdelete_fg

  " Git commit message
  exec 'hi gitcommitSummary' . fg_cyan
  exec 'hi gitcommitHeader' . fg_yellow1 . s:ft_bold
  exec 'hi gitcommitSelectedType' . fg_cyan
  exec 'hi gitcommitSelectedFile' . fg_green
  exec 'hi gitcommitUntrackedFile' . s:fg_diffdelete_fg
  exec 'hi gitcommitBranch' . fg_cyan5 . s:ft_bold
  exec 'hi gitcommitDiscardedType' . s:fg_diffdelete_fg
  exec 'hi gitcommitDiff' . fg_darkmagenta

  exec 'hi diffFile' . fg_cyan
  exec 'hi diffSubname' . fg_darkmagenta
  exec 'hi diffIndexLine' . fg_darkmagenta
  exec 'hi diffAdded' . s:fg_diffadd_fg
  exec 'hi diffRemoved' . s:fg_diffdelete_fg
  exec 'hi diffLine' . fg_magenta
  exec 'hi diffBDiffer' . fg_magenta
  exec 'hi diffNewFile' . fg_darkmagenta

  " Pluging: CoC
  exec 'hi CocFloating' . s:fg_popupmenu_fg . s:bg_popupmenu_bg . s:ft_none
  exec 'hi CocErrorFloat' . s:fg_popupmenu_fg . s:bg_popupmenu_bg . s:ft_none
  exec 'hi CocWarningFloat' . s:fg_popupmenu_fg . s:bg_popupmenu_bg . s:ft_none
  exec 'hi CocInfoFloat' . s:fg_popupmenu_fg . s:bg_popupmenu_bg . s:ft_none
  exec 'hi CocHintFloat' . s:fg_popupmenu_fg . s:bg_popupmenu_bg . s:ft_none

  exec 'hi CocErrorHighlight' . fg_gray . s:bg_spellbad
  exec 'hi CocWarningHighlight' . fg_gray . s:bg_spellcap
  exec 'hi CocInfoHighlight' . fg_gray . s:bg_spellcap
  exec 'hi CocHintHighlight' . fg_gray . s:bg_spellcap

  exec 'hi CocErrorSign' . s:fg_error_fg . s:bg_error_bg
  exec 'hi CocWarningSign' . s:fg_todo_fg . s:bg_todo_bg . s:ft_bold
  exec 'hi CocInfoSign' . s:fg_todo_fg . s:bg_todo_bg . s:ft_bold
  exec 'hi CocHintSign' . s:fg_todo_fg . s:bg_todo_bg . s:ft_bold

endfun
" }}}

" ================================== MISC =====================================
" Command to show theme information {{{
fun! g:PaperColor()
  echom 'PaperColor Theme Framework'
  echom '  version ' . s:version
  echom '  by Nikyle Nguyen et al.'
  echom '  at https://github.com/NLKNguyen/papercolor-theme/'
  echom ' '
  echom 'Current theme: ' . s:theme_name
  echom '  ' . s:selected_theme['description']
  echom '  by ' . s:selected_theme['maintainer']
  echom '  at ' . s:selected_theme['source']

  " TODO: add diff display for theme color names between 'default' and current
  " theme if it is a custom theme, i.e. child theme.
endfun

" @brief command alias for g:PaperColor()
command! -nargs=0 PaperColor :call g:PaperColor()
" }}}

" =============================== MAIN ========================================

hi clear
syntax reset
let g:colors_name = "PaperColor"

call s:acquire_theme_data()
call s:identify_color_mode()

call s:generate_theme_option_variables()
call s:generate_language_option_variables()

call s:set_format_attributes()
call s:set_overriding_colors()

call s:convert_colors()
call s:set_color_variables()

call s:apply_syntax_highlightings()

" =============================================================================
" Cheers!
" vim: fdm=marker ff=unix
