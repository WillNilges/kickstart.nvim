--require('mason').setup()
--
---- Get system information
--local system_name = vim.loop.os_uname().sysname
--
--if system_name == 'Linux' then
--  local file = io.open('/etc/os-release', 'r')
--  if file then
--    local content = file:read '*all'
--    file:close()
--    if string.find(content, 'ID=nixos') then
--      vim.g.system_id = 'nixos'
--    end
--  end
--end
--
--local servers = {
--  'clangd',
--}
--
--local setup_servers = function(server_name)
--  local server = servers[server_name] or {}
--  server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
--  lspconfig[server_name].setup(server)
--end
--
--local ensure_installed = vim.tbl_keys(servers or {})
--local extra_tools = {
--  'stylua', -- Used to format Lua code
--}
--
--if vim.g.system_id == 'nixos' then
--  for _, server_name in pairs(ensure_installed) do
--    setup_servers(server_name)
--  end
--else
--  vim.list_extend(ensure_installed, extra_tools)
--  require('mason-tool-installer').setup { ensure_installed = ensure_installed }
--  require('mason-lspconfig').setup { handlers = { setup_servers } }
--end

-- https://discourse.nixos.org/t/neovim-cannot-start-lsp-because-clangd-is-not-found/38902/3
local system_name = vim.loop.os_uname().sysname
if system_name == 'Linux' then
  -- Check if the Linux distribution is NixOS
  local file = io.open('/etc/os-release', 'r')
  if file then
    local content = file:read '*all'
    file:close()
    if string.find(content, 'ID=nixos') then
      vim.lsp.config['clangd'] = {
        cmd = { 'clangd' },
      }
      vim.lsp.enable 'clangd'
    end
  end
end
