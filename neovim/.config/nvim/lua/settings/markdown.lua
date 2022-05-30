require('vimp')

vimp.nnoremap('<leader>md', function()
  vim.api.nvim_exec('MarkdownPreview', true)
end)

vimp.nnoremap('<leader><leader>md', function()
  if vim.g.mkdp_markdown_css == "" then
    vim.g.mkdp_markdown_css = "/Users/marcelojacobus/.css/public-talk-outlines.css"
  else
    vim.g.mkdp_markdown_css = ""
  end
end)
