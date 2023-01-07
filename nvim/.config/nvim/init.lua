local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

local utils = require "utils"
local t = utils.t

---- GENERAL OPTIONS ----

opt.number = true
opt.cursorline = true
opt.autoindent = true
opt.mouse = "a"
opt.clipboard = "unnamedplus" -- universal clipboard
opt.wrap = true
opt.linebreak = true
opt.backspace = "indent,eol,start"
opt.whichwrap:append "<,>,h,l,[,]"
opt.scrolloff = 5
opt.autowrite = true
opt.autoread = true
opt.ignorecase = true
opt.smartcase = true
opt.showmode = false
opt.incsearch = true
opt.hlsearch = true
opt.autochdir = true -- cd to current file dir
-- indentation
local indent = 4
opt.cindent = true
opt.copyindent = true
opt.preserveindent = true
opt.expandtab = false
opt.softtabstop = indent
opt.shiftwidth = indent
opt.tabstop = indent
-- splits orientations
opt.splitbelow = true
opt.splitright = true
-- better incrementation/decrementation with ^A/^X
opt.nrformats:append "alpha"
opt.virtualedit = "block"
opt.updatetime = 50

---- STATUSLINE ----

opt.laststatus = 2
opt.statusline = "" ..
  "%2*" ..               -- colors
  "%1* %F %2*" ..        -- file full path
  " %h%w%m%r" ..         -- help file + modified + read only
  "%=%1*" ..             -- swith to right
  " [%p%%, %l/%L:%c]" .. -- current line/column
  " "                    -- final space
opt.fillchars:append "vert: "

---- AUTO COMMANDS ----

local autocmds = {
  tex = {
    { "BufWritePost", "*.tex", "silent! !latexmk -pdf %"};
    { "FileReadPost", "*.tex", "silent! setlocal spell spelllang=fr"};
  };
  templates = {
    {"BufNewFile", "*.sh", "0r ~/.config/nvim/templates/skeleton.sh"};
    {"BufNewFile", "*.py", "0r ~/.config/nvim/templates/skeleton.py"};
  };
  mail_no_wrap = {
    {"FileType", "mail", "set textwidth=0"};
  };
}

utils.create_augroups(autocmds)

---- BINDINGS ----

-- wrapped lines are multiple lines with j/k
utils.map {"n", "j", "gj"}
utils.map {"n", "k", "gk"}
utils.map {"n", "<Down>", "gj"}
utils.map {"n", "<Up>", "gk"}

-- hide hightlight when not searching ("/" key)
utils.map {"n", "<Esc>", ":noh<Esc>"}

-- leave insert mode in terminal with Esc
utils.map {"t", "<Esc>", "<C-\\><C-n>"}

-- navigating using definitions
utils.map {"", "<M-Left>", "<C-t>"}
utils.map {"", "<M-Right>", "<cmd>lua vim.lsp.buf.definition()<CR>"}

-- auto-close bracket/brace
utils.map {"i", "{<CR>", "{<CR>}<Esc>O"}
utils.map {"i", "{;<CR>", "{<CR>};<Esc>O"}
utils.map {"i", "[<CR>", "[<CR>]<Esc>O"}
utils.map {"i", "[;<CR>", "[<CR>];<Esc>O"}
utils.map {"i", "(<CR>", "(<CR>)<Esc>O"}
utils.map {"i", "(;<CR>", "(<CR>);<Esc>O"}

---- PLUGINS ----

cmd [[packadd packer.nvim]]

require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- auto-completion
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-buffer",
      }
    }

    -- snippets
  use "hrsh7th/cmp-vsnip"
  use "hrsh7th/vim-vsnip"


    -- lsp configs
    use "neovim/nvim-lspconfig"

    -- lsp signatures (function calls, etc)
    use "ray-x/lsp_signature.nvim"

  -- better syntax highlighting
    use "nvim-treesitter/nvim-treesitter"

    -- python indentation
    use {
      "psf/black",
      ft = "python",
    }

    -- terraform utils
  use "hashivim/vim-terraform"

    -- go stuff
    use {
      "fatih/vim-go",
      ft = "go",
      run = "GoUpdateBinaries",
    }

    -- quoting / parenthesizing
    use "tpope/vim-surround"

    -- trim spaces / whitelines
    use "cappyzawa/trim.nvim"

    -- comment lines
  use "tpope/vim-commentary"

    -- colorscheme
    -- use "tjdevries/colorbuddy.vim"

end)

---- COLORSCHEME ----

cmd [[colorscheme newbz]]
-- require "colorscheme"
-- require "colorbuddy".setup {}

---- LSP FUNCTION SIGNATURES ----

require "lsp_signature".setup{
  doc_lines = 0,
  hint_enable = false,
}

---- TRIM SPACES / WHITELINES ----

require('trim').setup({
    patterns = {
      [[%s/\s\+$//e]],
      [[%s/\($\n\s*\)\+\%$//]],
      [[%s/\%^\n\+//]],
    },
})

---- TERRAFORM CONFIGS ----
g.terraform_fmt_on_save = 1
g.terraform_align = 1

---- PYTHON INDENTATION ----

g.black_virtualenv = "~/.virtual-env/black"
utils.create_augroups { py_indent = {{"BufWritePre", "*.py", "execute ':Black'"}} }

---- COMPLETION ----

local cmp = require "cmp"

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup {
    -- completion settings
    completion = {
      completeopt = 'menuone,noselect',
    },

    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },

    -- key mapping
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

      -- Tab mapping
      ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.fn["vsnip#available"](1) == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
          elseif has_words_before() then
            cmp.complete()
          else
            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          end
        end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
          end
        end, { "i", "s" }),
  }),

    -- load sources, see: https://github.com/topics/nvim-cmp
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
      { name = 'buffer' },
      -- { name = 'cmdline' },
    },
}

-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources({
--         { name = 'path' }
--     }, {
--           { name = 'cmdline' }
--       })
-- })

-- use buffer source for `/`
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- use cmdline & path source for ':'
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
          { name = 'cmdline' }
    })
})

-- disable completion with Markdown files
utils.create_augroups { nocmp_md = {{"FileType", "*.md", "lua require('cmp').setup.buffer { enabled = false }"}} }

local capabilities = require "cmp_nvim_lsp".default_capabilities()

---- LSPCONFIG ----

local nvim_lsp = require "lspconfig"

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = { prefix = "" },
    signs = false,
    underline = false,
    update_in_insert = true,
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- :help vim.lsp.*
    utils.map {"n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>"}
    utils.map {"n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>"}
    utils.map {"n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>"}
    utils.map {"n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>"}
    utils.map {"n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>"}
    utils.map {"n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>"}
    utils.map {"n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>"}
    utils.map {"n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>"}
    utils.map {"n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>"}
    utils.map {"n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>"}
    utils.map {"n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>"}
    utils.map {"n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>"}
    utils.map {"n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>"}
    utils.map {"n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>"}
    utils.map {"n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>"}
    utils.map {"n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>"}
    utils.map {"n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>"}

end

-- Use a loop to conveniently call "setup" on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "bashls", "gopls", "terraformls" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      flags = {
          debounce_text_changes = 50,
      },
      capabilities = capabilities,
    }
end

---- TREESITTER ----

require "nvim-treesitter.configs".setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    highlight = { enable = true },
    indent = { enable = true},
}
