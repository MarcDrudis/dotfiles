return {
  'codethread/qmk.nvim',
  config = function()
    require('qmk').setup({
      name = 'corne5',
      layout = {
        '_ x x x x x _ x x x x x',
        '_ x x x x x _ x x x x x',
        '_ x x x x x _ x x x x x',
        '_ _ _ x x x _ x x x _ _',
      },
      variant = "zmk"
    })
    vim.filetype.add({ extension = { ["keymap"] = "dts" } })
  end
}
