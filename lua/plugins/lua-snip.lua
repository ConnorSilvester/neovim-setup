return {
    'L3MON4D3/LuaSnip',
    config = function()
        local ls = require 'luasnip'
        -- Load VSCode-style snippets (optional, remove if not needed)
        require('luasnip.loaders.from_vscode').lazy_load()

        -- Define your custom Java snippet for package and class
        ls.add_snippets('java', {
            ls.snippet('java_boilerplate', {
                -- Dynamically get the package name from the file path or allow manual input
                ls.text_node 'package ',
                ls.function_node(function()
                    local path = vim.fn.expand '%:p:h' -- Get the directory of the file
                    local java_src_path = 'java' -- Modify this to your project structure if needed
                    local package_name = path:match(java_src_path .. '/(.*)')
                    return package_name and package_name:gsub('/', '.') or 'your.package.name'
                end, {}),
                ls.text_node { ';', '' },

                -- Class declaration with dynamic filename as class name
                ls.text_node 'public class ',
                ls.function_node(function()
                    return vim.fn.expand '%:t:r' -- Use the file name as class name
                end, {}),
                ls.text_node ' {',

                -- Main method
                ls.text_node { '', '    public static void main(String[] args) {', '        ' },
                ls.insert_node(0),
                ls.text_node { '', '    }', '}' },
            }),
        })
    end,
}
