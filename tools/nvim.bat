:: "administrator permission"
mklink "d:\Program Files\Neovim\share\nvim\sysinit.vim" "d:\repos\nvim\tools\sysinit.vim"
:: md "%LOCALAPPDATA%\nvim\"
:: copy "d:\repos\nvim\ginit.vim" "%LOCALAPPDATA%\nvim\ginit.vim"

:: fix plenary.nvim + telescope Error !!
type nul > "d:\repos\nvim\nvim-data\telescope_history"

pause
