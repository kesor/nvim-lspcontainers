local function command(server, user_opts)
  local opts = user_opts or {}
  local workdir = opts.root_dir or vim.fn.getcwd()
  local image = ""
  local volume = workdir..":"..workdir

  -- TODO: dockerfile exists, needs implementation
  --if server == "dockerls" then
    --image = "lspcontainers/docker-langserver:0.4.1"
  --end

  if server == "sumneko_lua" then
    image = "lspcontainers/lua-language-server:1.20.5"
  end

  if server == "gopls" then
    image = "lspcontainers/go-language-server:1.16.4"
  end

  if image == "" then
    error("Invalid language server provided")
  end

  return {
      "docker",
      "container",
      "run",
      "--interactive",
      "--rm",
      "--volume",
      volume,
      image
    }
end

return {
  command = command
}
