Vim�UnDo� y��3�#�,~W׍t=BD#K���϶i��ݬ��,   '   --    #                         f���    _�                     	        ����                                                                                                                                                                                                                                                                                                                                                             fR��    �      
                 �      
       5��                                               �                      	                	       �                                              �                                              �                                              �                                              �                     	   
             	       �                                            5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             fR��    �                <local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"    �                �             5��                          =                      �                          =                      �                          =                      �        <                  <                      5�_�                       %    ����                                                                                                                                                                                                                                                                                                                                                             fR��     �                   �             5��                          d                      �                          d                      �                         d                     �                         k                      �                        j                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             fR��     �                 local lazyrepo = 5��                         w                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             fR��     �                 local lazyrepo = ''5��                      (   x               (       �       ;                 �                     5�_�                       <    ����                                                                                                                                                                                                                                                                                                                                                             fR��    �               >  local lazyrepo = 'https://gitrhub.com/folke/lazy.nvim .git;'5��       <                  �                      5�_�      	                    ����                                                                                                                                                                                                                                                                                                                                                             f��u     �                  �               5��                          �                     �                          �                     �                                                5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                                             f���     �                  �               5��                   "                    �      5�_�   	              
   (        ����                                                                                                                                                                                                                                                                                                                            (          9          V       f���     �   '   (          =-- Make sure to setup `mapleader` and `maplocalleader` before   2-- loading lazy.nvim so that mappings are correct.   >-- This is also a good place to setup other settings (vim.opt)   vim.g.mapleader = " "   vim.g.maplocalleader = "\\"       -- Setup lazy.nvim   require("lazy").setup({   
  spec = {       -- import your plugins       { import = "plugins" },     },   O  -- Configure any other settings here. See the documentation for more details.   ;  -- colorscheme that will be used when installing plugins.   ,  install = { colorscheme = { "habamax" } },   +  -- automatically check for plugin updates     checker = { enabled = true },   })5��    '                      C      ]              5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                  V        f���     �                9-- Example using a list of specs with the default options       require("lazy").setup({        {import = "weoweo.plugins"},   })5��                          �      w               5�_�                    "        ����                                                                                                                                                                                                                                                                                                                                                  V        f���    �   "            �   "            5��    "                      �              w       5�_�                     #        ����                                                                                                                                                                                                                                                                                                                                                  V        f���     �   "   #   '      -- �   "   $   (      -- u5��    "                      �                     �    "                     �                     5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                  V        f���     �              5��                          �      :               5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             f��k     �              �             #   }-- Bootstrap lazy.nvim   <local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"   2if not (vim.uv or vim.loop).fs_stat(lazypath) then   ;  local lazyrepo = "https://github.com/folke/lazy.nvim.git"   l  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })      if vim.v.shell_error ~= 0 then       vim.api.nvim_echo({   5      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },         { out, "WarningMsg" },   '      { "\nPress any key to exit..." },       }, true, {})       vim.fn.getchar()       os.exit(1)     end   end   vim.opt.rtp:prepend(lazypath)       =-- Make sure to setup `mapleader` and `maplocalleader` before   2-- loading lazy.nvim so that mappings are correct.   >-- This is also a good place to setup other settings (vim.opt)   vim.g.mapleader = " "   vim.g.maplocalleader = "\\"       -- Setup lazy.nvim   require("lazy").setup({   
  spec = {       -- import your plugins       { import = "plugins" },     },   O  -- Configure any other settings here. See the documentation for more details.   ;  -- colorscheme that will be used when installing plugins.   ,  install = { colorscheme = { "habamax" } },   +  -- automatically check for plugin updates     checker = { enabled = true },   }))5��                  "      �              �      5��