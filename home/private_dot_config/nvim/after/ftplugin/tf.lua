-- force tf files to filetype terraform
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
-- vim.cmd([[autocmd BufWritePost *.tf FormatWrite]])

-- vim.api.nvim_exec([[
--     augroup terraform
--       autocmd!
--       autocmd BufRead,BufNewFile *.hcl set filetype=hcl
--       autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl
--       autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json
--       autocmd BufRead,BufNewFile *.tf set filetype=terraform
--       autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform
--       autocmd BufWritePost *.tf FormatWrite
--     augroup END
--   ]], false)
