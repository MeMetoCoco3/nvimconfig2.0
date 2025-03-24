local function get_logo()
  return [[

          ██████████████            ███████████████         
                     ███████████████████                    
                         ███████████                        
                     ████████   ████████                    
                  ███████           ███████                 
               ███████                 ███████              
            ███████          ███          ███████           
          ██████            █████            ██████         
        ██████       ███   ███████   ███       ██████       
      █████      ████    ████   ████    ████      █████     
    █████      ████     █████████████     █████     █████   
  █████     ██████    █████████████████    ██████     █████ 
██████    ██████    ████████     ████████    ██████    ██████
████    ███████████████████       ███████████████████    ████
███    █████████████████████     ██████████████████████   ███
█    ███  █████████████  ████████████  ████████████  ███    █
    ███   ██████  ████    █████████     ███  ██████   ████  
  ████   █████   ████                    ███   █████   ████ 
  ███    ████   ████                      ███   ████    ████
 ███     ███   ████    █████     █████     ███   ███     ███
 ██      ██    ████  ███████     ████████  ███    ██      ██
         █    ██████████ ███     ███ ██████████    █        
             ████████    ████   ████    ████████            
             █████       ████   ████       █████            
            ████         ████   ████         ████           
            ██          █████   █████          ██           
                        █████   █████                       
            █           █████   █████           █           
            ███        ██████   ██████        ███           
            █████      ██████   ██████      █████           
            ███████    ██████   ██████    ███████           
              ███████  ██████   ██████  ███████             
                ██████ ██████   ██████ ██████               
                  ██████████     ██████████                 
                     ███████     ███████                    
                        ████     ████                       
    ]]
end

local quotes = require("config.plugins.helper_functions.quotes")

--vim.g.dashboard_disable_statusline = 1
--vim.g.dashboard_disable_at_vimenter = 0

return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require('dashboard').setup({
      theme = 'doom',
      config = {
        header = vim.split(get_logo(), "\n"),
        center = {},
        footer = { '"' .. quotes.get_random_quote() .. '"' }
      }
    })
  end,

}
