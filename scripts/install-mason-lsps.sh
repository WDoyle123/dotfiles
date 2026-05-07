#!/bin/bash
# Install all required Mason LSP servers for Neovim

LSP_SERVERS=(
  lua-language-server
  jedi-language-server
  bash-language-server
  css-lsp
  dockerfile-language-server
  gopls
  golangci-lint-langserver
  html-lsp
  json-lsp
  quick-lint-js
  markdown-oxide
  sqls
  svelte-language-server
  tailwindcss-language-server
  terraform-ls
  yaml-language-server
  typescript-language-server
)

for server in "${LSP_SERVERS[@]}"; do
  echo "Installing $server..."
  nvim --headless "+MasonInstall $server" +qall
done

echo "All Mason LSP servers installed."
