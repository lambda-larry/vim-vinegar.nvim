if vim.g.loaded_vinegar == 1 then
  return
end
vim.g.loaded_vinegar = 1


vim.g.netrw_banner  = 0
vim.g.netrw_altfile = 1

local function up()
  local file = vim.api.nvim_buf_get_name(0)

  if vim.regex('^$\\|^term:[\\/][\\/]'):match_str(file) then
    vim.cmd.edit('.')
    return
  end

  local parent = vim.fs.dirname(file)

  vim.cmd.edit(parent)
end

local function home()
  vim.cmd.edit('~/')
end

vim.keymap.set('n', '-', up)

vim.api.nvim_create_autocmd('Filetype', {
  pattern  = 'netrw',
  callback = function()
    vim.keymap.set('n', '~', home, { buffer = true })
  end,
})
