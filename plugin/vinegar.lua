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

local function pre_populate_cmdline(range)
  table.sort(range)
  local lines = vim.fn.getline(range[1], range[2])
  for i, line in ipairs(lines) do
    lines[i] = vim.fn.fnameescape(line)
  end

  return ':<C-U> ' .. table.concat(lines, ' ') .. '<HOME>'
end

vim.api.nvim_create_autocmd('Filetype', {
  pattern  = 'netrw',
  callback = function()
    local keymap_opt = {
      buffer = true,
      remap = false,
    }
    vim.keymap.set('n', '~', home, keymap_opt)

    vim.keymap.set('n', '.', function()
      local range = { vim.fn.line('.'), vim.fn.line('.') - 1 + vim.v.count1, }
      return pre_populate_cmdline(range)
    end, vim.tbl_extend('force', keymap_opt, {
      expr = true,
    }))

    vim.keymap.set('v', '.', function()
      local range = { vim.fn.line('v'), vim.fn.line('.'), }
      return pre_populate_cmdline(range)
    end, vim.tbl_extend('force', keymap_opt, {
      expr = true,
    }))

  end,
})
