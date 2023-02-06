-- Break this file into three separate files and then call them from an init file.
-- Keep everything together for now just to make sure that everything works first.

-- =========
-- LSP setup
-- =========
-- This includes installing the language servers, setting the keybindings and
-- setting up each individual server. We also take care of the autocompletion.
-- We're using "lsp-zero" to do most of the heavy lifting for us

-- ========
-- LSP Saga
-- ========

-- ======================
-- Linting and formatting
-- ======================

-- Since the source of truth is mason, we call "mason-null-ls" before "null-ls"
