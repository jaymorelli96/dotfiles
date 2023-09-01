vim.opt.tabstop = 2    -- insert 2 spaces for a tab
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation

lvim.colorscheme = "nord"
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_italic = true
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = true

lvim.format_on_save.enabled = true
vim.opt.relativenumber = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

vim.o.wrap = false

vim.g.UltiSnipsExpandTrigger = "<c-t>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"

vim.g.maplocalleader = ","

vim.opt.showtabline = 0
lvim.builtin.bufferline.active = false

vim.g.go_doc_keywordprg_enabled = 0
table.insert(lvim.builtin.cmp.sources, { name = 'nvim_lsp_signature_help' })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.norg" },
  command = "set conceallevel=3"
})

vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.g.ale_echo_cursor = 0

-- -- Dashboard
local logo = [[

 ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
 ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
 ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
 ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
 ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

   ]]

local function getGreeting(name)
  local tableTime = os.date("*t")
  local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
  local hour = tableTime.hour
  local greetingsTable = {
    [1] = " Sleep well",
    [2] = " Good morning",
    [3] = " Good afternoon",
    [4] = " Good evening",
    [5] = "󰖔 Good night",
  }
  local greetingIndex = 0
  if hour == 23 or hour < 7 then
    greetingIndex = 1
  elseif hour < 12 then
    greetingIndex = 2
  elseif hour >= 12 and hour < 18 then
    greetingIndex = 3
  elseif hour >= 18 and hour < 21 then
    greetingIndex = 4
  elseif hour >= 21 then
    greetingIndex = 5
  end
  return "\t" .. datetime .. "\t" .. greetingsTable[greetingIndex] .. ", " .. name
end

local userName = "Jay"
local greeting = getGreeting(userName)
lvim.builtin.alpha.dashboard.section.header.val = vim.split(logo .. "\n" .. greeting, "\n")

lvim.builtin.alpha.dashboard.section.footer.val =
{
  ""
}
