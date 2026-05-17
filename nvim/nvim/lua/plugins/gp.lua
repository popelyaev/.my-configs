return {
	"robitx/gp.nvim",
	config = function()
		local conf = {
			providers = {
				ollama = {
					endpoint = "http://localhost:11434/api/chat",
					models = {"deepcoder:14b", "codegemma:7b" },
					secret = "dummy_secret",
				},
			},

			default_command_agent = "codegemma-python",
			default_chat_agent = "codegemma-python",

			agents = {
				{
					provider = "ollama",
					name = "codegemma-jsnode",
					chat = true,
					command = true,
					model = { model = "codegemma:7b" },
					system_prompt = [[
                        Ты пишешь только код на javascript, никаких пояснений 
                        Строго только код
                        если ты думаешь что ответ не связан с кодом то отвечай '-'
                    ]],
				},
				{
					provider = "ollama",
					name = "codegemma-python",
					chat = true,
					command = true,
					model = { model = "codegemma:7b" },
					system_prompt = [[
                        Ты пишешь только код на python, никаких пояснений 
                        Строго только код
                        если ты думаешь что ответ не связан с кодом то отвечай '-'
                    ]],
				},
				{
					provider = "ollama",
					name = "deepcoder",
					chat = true,
					command = true,
					model = { model = "deepcoder:14b" },
					system_prompt = [[
                        Ты пишешь только код на javascript, никаких пояснений 
                        Строго только код
                        если ты думаешь что ответ не связан с кодом то отвечай '-'
                    ]],
				},
			},
		}
		require("gp").setup(conf)

		local function keymapOptions(desc)
			return {
				noremap = true,
				silent = true,
				nowait = true,
				desc = "GPT prompt " .. desc,
			}
		end

	end,
}
