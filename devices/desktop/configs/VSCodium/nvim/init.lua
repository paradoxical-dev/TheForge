vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = " "

-- INFO: KEYMAPS
-- Some keymaps are also defined in keymaps.json

local vscode = require('vscode')

-- finders
vim.keymap.set('n', '<leader>ff', function()
    vscode.action('workbench.action.quickOpen')
end)
vim.keymap.set('n', '<leader>fw', function()
    vscode.action('periscope.search')
end)
vim.keymap.set('n', '<leader>fo', function()
    vscode.action('workbench.action.openRecent')
end)
vim.keymap.set('n', '<leader>fb', function()
    vscode.action('workbench.action.showAllEditors')
end)

-- project management
vim.keymap.set('n', '<leader>pf', function()
    vscode.action('projectManager.listProjects')
end)
vim.keymap.set('n', '<leader>pF', function()
    vscode.action('projectManager.listProjectsNewWindow')
end)
vim.keymap.set('n', '<leader>ps', function()
    vscode.action('projectManager.saveProject')
end)

-- buffer nav
vim.keymap.set('n', ']b', function()
    vscode.action('workbench.action.nextEditor')
end)
vim.keymap.set('n', '[b', function()
    vscode.action('workbench.action.previousEditor')
end)
vim.keymap.set('n', '<leader>bc', function()
    vscode.action('workbench.action.closeActiveEditor')
    vscode.notify("Closed current editor")
end)
vim.keymap.set('n', '<leader>bC', function()
    vscode.action('workbench.action.closeOtherEditors')
    vscode.notify("Closed all editors except current")
end)

-- git
vim.keymap.set('n', '<leader>gg', function()
    vscode.action('workbench.view.scm')
end)

-- explorer
vim.keymap.set('n', '<leader>o', function()
    vscode.action('workbench.view.explorer')
end)

-- rest client (flashpost)
vim.keymap.set('n', '<leader>r', function()
    vscode.action('flashpost.sideBar.open')
end)

-- search and replace
vim.keymap.set({'n','v'}, '<leader>/', function()
    vscode.action('editor.action.startFindReplaceAction')
end)

-- lsp actions
vim.keymap.set('n', '<leader>lc', function()
    vscode.action('editor.action.codeAction')
end)
vim.keymap.set('n', '<leader>lr', function()
    vscode.action('editor.action.findReferences')
end)
vim.keymap.set('n', '<leader>lR', function()
    vscode.action('editor.action.rename')
end)
vim.keymap.set('n', '<leader>lt', function()
    vscode.action('editor.action.goToTypeDefinition')
end)
vim.keymap.set('n', '<leader>li', function()
    vscode.action('editor.action.goToImplementation')
end)
vim.keymap.set('n', '<leader>lI', function()
    vscode.action('editor.action.peekImplementation')
end)
vim.keymap.set('n', '<leader>ls', function()
    vscode.action('workbench.action.gotoSymbol')
end)
vim.keymap.set('n', '<leader>lS', function()
    vscode.action('workbench.action.showAllSymbols')
end)