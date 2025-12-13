-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/nathanm/.cache/nvim/packer_hererocks/2.1.1744318430/share/lua/5.1/?.lua;/Users/nathanm/.cache/nvim/packer_hererocks/2.1.1744318430/share/lua/5.1/?/init.lua;/Users/nathanm/.cache/nvim/packer_hererocks/2.1.1744318430/lib/luarocks/rocks-5.1/?.lua;/Users/nathanm/.cache/nvim/packer_hererocks/2.1.1744318430/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/nathanm/.cache/nvim/packer_hererocks/2.1.1744318430/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["blink.cmp"] = {
    config = { "\27LJ\2\n´\2\0\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\v\0005\4\n\0=\4\f\3=\3\r\2B\0\2\1K\0\1\0\fsources\fdefault\1\0\1\fdefault\0\1\5\0\0\blsp\tpath\rsnippets\vbuffer\14signature\1\0\1\fenabled\2\15appearance\1\0\2\28use_nvim_cmp_as_default\2\22nerd_font_variant\tmono\vkeymap\1\0\4\14signature\0\15appearance\0\vkeymap\0\fsources\0\1\0\1\vpreset\fdefault\nsetup\14blink.cmp\frequire\0" },
    loaded = true,
    path = "/Users/nathanm/.local/share/nvim/site/pack/packer/start/blink.cmp",
    url = "https://github.com/saghen/blink.cmp"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/nathanm/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  harpoon = {
    loaded = true,
    path = "/Users/nathanm/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["lazydev.nvim"] = {
    loaded = true,
    path = "/Users/nathanm/.local/share/nvim/site/pack/packer/start/lazydev.nvim",
    url = "https://github.com/folke/lazydev.nvim"
  },
  ["mini.icons"] = {
    loaded = true,
    path = "/Users/nathanm/.local/share/nvim/site/pack/packer/start/mini.icons",
    url = "https://github.com/nvim-mini/mini.icons"
  },
  neovim = {
    loaded = true,
    path = "/Users/nathanm/.local/share/nvim/site/pack/packer/start/neovim",
    url = "https://github.com/rose-pine/neovim"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/nathanm/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/nathanm/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["oil.nvim"] = {
    loaded = true,
    path = "/Users/nathanm/.local/share/nvim/site/pack/packer/start/oil.nvim",
    url = "https://github.com/stevearc/oil.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/nathanm/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/nathanm/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/nathanm/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/nathanm/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/nathanm/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/nathanm/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/nathanm/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-nightfly-colors"] = {
    loaded = true,
    path = "/Users/nathanm/.local/share/nvim/site/pack/packer/start/vim-nightfly-colors",
    url = "https://github.com/bluz71/vim-nightfly-colors"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: blink.cmp
time([[Config for blink.cmp]], true)
try_loadstring("\27LJ\2\n´\2\0\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\v\0005\4\n\0=\4\f\3=\3\r\2B\0\2\1K\0\1\0\fsources\fdefault\1\0\1\fdefault\0\1\5\0\0\blsp\tpath\rsnippets\vbuffer\14signature\1\0\1\fenabled\2\15appearance\1\0\2\28use_nvim_cmp_as_default\2\22nerd_font_variant\tmono\vkeymap\1\0\4\14signature\0\15appearance\0\vkeymap\0\fsources\0\1\0\1\vpreset\fdefault\nsetup\14blink.cmp\frequire\0", "config", "blink.cmp")
time([[Config for blink.cmp]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
