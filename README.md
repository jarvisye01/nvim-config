## Jarvisye's Neovim Config

这是一个我当前使用的Neovim Config，终于决定将Vim迁移到Neovim了。23年5月份之后开始使用Golang开发，日常主要使用的两个插件分别是vim-go和coc-nvim，coc-lists是我日常使用的一个coc插件，在Vim中使用的时候每次退出都会卡一下，太影响体验了。

自从使而且从我用Vim开始就一直有看到Neovim的推荐，一直没有动力切换，在老东家的时候Vim对于我更像是一个纯文本编辑器，几乎没有使用什么插件（大仓的C++代码，索引都无法构建），Vim已经可以满足我的需求，就一直使用的Vim8。

最近看到有同事使用Neovim，确实非常丝滑，也就下决心把配置切换到Neovim，我的Vim配置并不多，插件在个位数，Vim-plug在Neovim中也支持，几乎是无痛迁移。

个人目前是Vim和VScode混用，Vim承担90%以上的编辑，代码浏览、git等场景都直接使用VScode，毕竟有些场景有GUI界面还是更高效的，在选择编辑器的时候还是要选择适合自己的。

如果想使用Vim的话还是需要折腾一番的，如果你可以坚持使用"Vim"3周，那你大概就会一直使用Vim了。

## Plugin

目前使用了以下这些插件，使用Vim-plug来管理：

- nvim-hardline：可以拥有一个好看的状态栏；
- nerdtree：目录树插件，不多解释；
- coc-nvim：非常热门的插件，拥有丰富的插件体系，coc-lists是我最常用的list插件；
- vim-go：golang开发插件，提供补全和一些快捷指令；
- dracula：dracule主题插件；
- nvim-treesitter：treesitter插件；
- plenary：telescope依赖插件；
- telescope：以浮窗的形式提供fuzzy search、git等各种功能；
