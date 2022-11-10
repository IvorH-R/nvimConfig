vim.g.mapleader = " "
local keymap = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

-- Nvimtree
keymap("n", "<leader>n", ":NvimTreeToggle<cr>", opts)

-- LSPConfig
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

--CLOSE TAB
keymap("n", "<leader>bd",":Bdelete<CR>",opts)
-- TERMINAL
keymap("n", "<leader>cd","::te<CR>lcd %:h<CR>", opts);
keymap("t", "<Esc>","<C-\\><C-N>", opts)

-- TELESCOPE-- 
keymap("n", "<leader>fc", "<cmd>lua require ('telescope.builtin').find_files({hidden=true})<cr>",{noremap = true})
keymap("n", "<leader>fg", "<cmd>lua require ('telescope.builtin').live_grep({hidden=true})<cr>",{noremap = true})
keymap("n", "<leader>fb", "<cmd>lua require ('telescope.builtin').buffers()<cr>",{noremap = true})
keymap("n", "<leader>fh", "<cmd>lua require ('telescope.builtin').help_tags()<cr>",{noremap = true})
keymap("n", "<leader>FF", [[<Cmd>lua require'ivor.telescope'.find_work({hidden=true})<CR>]], { noremap = true, silent = true })
keymap("n", "<leader>ff", [[<Cmd>lua require'ivor.telescope'.find_all({hidden=true})<CR>]], { noremap = true, silent = true })

-- SPLITS MOVMENT
keymap("n", "<C-j>","<C-w><C-j>",{noremap = true})
keymap("n", "<C-l>","<C-w><C-l>",{noremap = true})
keymap("n", "<C-k>","<C-w><C-k>",{noremap = true})
keymap("n", "<C-h>","<C-w><C-h>",{noremap = true})

-- RESIZING WINDOWS
keymap("n","<C-Up>", ":resize -2 <CR>", opts)
keymap("n","<C-Down>", ":resize +2 <CR>", opts)
keymap("n","<C-Left>", ":vertical resize -2 <CR>", opts)
keymap("n","<C-Right>", ":vertical resize +2 <CR>", opts)

-- BUFFERS
keymap("n","<S-l>", ":bnext<CR>", opts)
keymap("n","<S-h>", ":bprevious<CR>", opts)

-- VISUAL
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)
