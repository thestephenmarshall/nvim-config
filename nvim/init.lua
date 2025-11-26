vim.env.ASDF_DIR = os.getenv("HOME") .. ".asdf"
vim.env.PATH = vim.env.ASDF_DIR .. "/shims:" .. vim.env.ASDF_DIR .. "/bin:" .. vim.env.PATH

require("config.lazy")
