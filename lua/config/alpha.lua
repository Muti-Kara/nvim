local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require "alpha.themes.dashboard"
local function header()
	return {
		[[		  .--..--..--..--..--..--.				]],
		[[		.' \  (`._   (_)     _   \				]],
		[[	  .'    |  '._)         (_)  |				]],
		[[	  \ _.')\      .----..---.   /				]],
		[[	  |(_.'  |    /    .-\-.  \  |				]],
		[[	  \     0|    |   ( O| O) | o|				]],
		[[	   |  _  |  .--.____.'._.-.  |				]],
		[[	   \ (_) | o         -` .-`  |				]],
		[[		|    \   |`-._ _ _ _ _\ /				]],
		[[		\    |   |  `. |_||_|   |				]],
		[[		| o  |    \_      \     |     -.   .-.	]],
		[[		|.-.  \     `--..-'   O |     `.`-' .'	]],
		[[	  _.'  .' |     `-.-'      /-.__   ' .-'	]],
		[[	.' `-.` '.|='=.='=.='=.='=|._/_ `-'.'		]],
		[[	`-._  `.  |________/\_____|    `-.'			]],
		[[	   .'   ).| '=' '='\/ '=' |					]],
		[[	   `._.`  '---------------'					]],
		[[			   //___\   //___\					]],
		[[				 ||       ||					]],
		[[				 ||_.-.   ||_.-.				]],
		[[				(_.--__) (_.--__)				]],
	}
end

dashboard.section.header.val = header()

dashboard.section.buttons.val = {
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "  Find files", ":Telescope find_files <CR>"),
	dashboard.button("g", "  Live grep", ":Telescope live_grep <CR>"),
	dashboard.button("d", "  Database", ":ene <BAR> :DBUIToggle <CR>"),
	dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa <CR>"),
}

local function footer()
	local total_plugins = "31"
	local datetime = os.date "%d-%m-%Y  %H:%M:%S"
	local plugins_text = "\t" .. total_plugins .. " plugins  " .. datetime
	local fortune = require "alpha.fortune"
	local quote = table.concat(fortune(), "\n")
	return plugins_text .. "\n" .. quote
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Constant"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Function"
dashboard.section.buttons.opts.hl_shortcut = "Type"
dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
