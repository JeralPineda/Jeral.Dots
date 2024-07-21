return {
  "L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
  config = function()

    local ls = require("luasnip")
    local fmt = require("luasnip.extras.fmt").fmt
    local rep = require("luasnip.extras").rep

    local i = ls.insert_node
    local f = ls.function_node
    local s = ls.s
    local c = ls.c
    local types = require("luasnip.util.types")

    ls.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      delete_check_events = "TextChanged",
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = { { "choiceNode", "Comment" } },
          },
        },
      },
      ext_base_prio = 300,
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
    })

    local title_case = function(index)
      return f(function(arg)
        return string.upper(string.sub(arg[1][1], 1, 1)) .. string.sub(arg[1][1], 2)
      end, { index })
    end

    -- [
    --   {
    --     "key": "ctrl+shift+c",
    --     "command": "editor.action.insertSnippet",
    --     "args": {
    --       "snippet": "console.log('🚀 ${TM_FILENAME} -> #${TM_LINE_NUMBER} -> ${CLIPBOARD} ~', JSON.stringify(${CLIPBOARD}, null, 2));"
    --     }
    --   }
    -- ]
    -- console.log('🚀 App.jsx -> #9 ->  ~', JSON.stringify(count, null, 2));

    ls.add_snippets("react", {
      s("use", fmt("const [{}, set{}] = React.useState({});", { i(1, ""), title_case(1), i(2, "") })),
  
      s("rfc", fmt([[
        export const {} = () => {{
          {}
          return (
            <>
              {}
            </>
          );
        }};
        ]], { i(1, ""), i(2, ""), i(3, "") })),
        
      s("rfcp", fmt([[

        type {}Props = {{
          {}
        }};

        export const {} = ({{ {} }}: {}Props) => {{
          {}
          return (
            <>{}</>
          );
        }};
        ]], { i(1, ""), i(2, ""), rep(1), i(3, ""), rep(1), i(4, ""), i(5, "") })),

      s("clg", f(function(args, snip)
        local res, env = {}, snip.env
        table.insert(res, "console.log('🚀 " .. env.TM_FILENAME .. " -> #" .. env.TM_LINE_NUMBER .. " ~', JSON.stringify(" .. env.TM_FILENAME .. ", null, 2));")
        for _, ele in ipairs(env.LS_SELECT_RAW) do table.insert(res, ele) end
        return res
      end, {})),
    
    }, { key = "react", })

    ls.add_snippets("javascript", {
      s("import", fmt([[import {{ {} }} from "{}";]], { i(1, ""), i(2, "") })),
      s("if", fmt(
        [[
          if ({}) {{
            {}
          }}
        ]], { i(1, ""), i(2, "") }))
    }, {
      key = "javascript",
    })

    ls.add_snippets("typescript", {
      s("type",
        fmt([[
        type {} = {{
          {}
        }};
        ]], { i(1, ""), i(2, "") })),
    }, { key = "typescript", })

    ls.add_snippets("lua", {
      s("snip", fmt([[s("{}", fmt({}), {{ {} }})]], { i(1, ""), i(2, ""), i(3, "") })),
      s("test", fmt([[{} {}]], { i(1, ""), title_case(1) })),
    }, { key = "lua", })
    
    ls.filetype_extend("javascriptreact", { "react", "javascript", "html", })
    ls.filetype_extend("typescriptreact", { "react", "javascript", "html", })
    ls.filetype_extend("typescript", { "javascript" })
    ls.filetype_extend("javascript", { "javascript" })
  end,
}
