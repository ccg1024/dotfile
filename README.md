# vim
自用的 vim 相关配置, 官方帮助文档：[Vim: help.txt](https://vimhelp.org/)

#### vim-gitgutter
插件需要文件被git追踪后才有效果

#### coc-java
无端出现 `highlight` 报错时，需要修改文件 `coc.nvim/autoload/coc/highlight.vim`。大概在 628 行左右。[issues](https://github.com/neoclide/coc.nvim/commit/03a532b544930d6957493933089135d5fa3e7be6)。
```vim
# 原本内容
function! s:prop_type_hlgroup(type) abort
  return prop_type_get(a:type)['highlight']
endfunction

# 修改后
function! s:prop_type_hlgroup(type) abort
  if a:type=~# '^CocHighlight'
    return strpart(a:type, 12)
  endif
  return get(prop_type_get(a:type), 'highlight', '')
endfunction
```

#### coc-pyright
当前 vim 编辑器的位置需要在工程根目录，使用了虚拟环境最好在工程根目录下配置虚拟环境路径，配置文件名为 `pyrightconfig.json`
```json
{
  "venvPath": "存放虚拟环境文件夹路径，默认在当前工作路径寻找",
  "venv": "虚拟环境名称"
}
```

#### 常用命令
- `:edit filename` 来打开或创建一个文件；
- `:bdelete filename/number` 关闭缓冲区中对应的文件，但所有文件的排序数值不变；
- Visual 模式中，通过 `<` or `>` 进行缩进缩出；
- `g + j` or `g + k` 在同一行中进行上下移动；
- `viw` 可以在一个单词的任意位置选中该单词，同样的适用于删除命令，修改命令；
- `:s/old/new/g` 将一行内的所有 old 替换成 new，不加 `/g` 则只会替换第一个匹配到的；
- `:%s/old/new/g` 全文替换，不加 `/g` 就只会替换光标以下的内容；
- `options + i + keys` 能够对一些被包括对数据进行操作，其中 `options=[c,d,y,v]`, `keys` = `"`, `[`, `{` 等；
- `m + 任意字母` 会将当前行标记成该字母，`' + 任意字母` 会跳转到该字母所标记的行。小写字母只在当前文件内跳转，大写字母可以跳转到其他文件（文件被打开时）；
- `:marks` 查看但前使用的标记，系统会有一些默认标记；
- `:delmark 字母` 删除该字母的标记；
- `g+d` 能够跳转到当前函数或变量定义的地方，实现同样功能的还有 `<c+]>` ；
- Normal 模式中，按 `u` 是撤回功能，`<c-r>` 是重做功能。
- `<c-f>` 向后翻一页，`<c-b>` 向前翻一页。快速移动；
- vim 中有三种文字对象，段落，句子，单词，段落是以空行进行区分，使用 `{ and }` 进行段落的上下移动。句子鉴定同中文标点，但后面加一个空格回车等符号，使用 `( and )` 进行句子上下移动。单词规则同英文。但是大写的 `W` 只是将空格，回车，tab键分割的对象看成一个词；
- `* or #` 能够快速进行全字匹配，是一个快速搜索按键，若在前面加上 `g` 则是普通的字符匹配，只要包含改词的部分，都会显示；
- 通过命令行的方式进行全字匹配（普通搜索都不是全字，只要部分有都会显示）：`/\<word\>` ，该命令从光标向下查找单词 word ，字符 `?` 是向上搜索，操作同向下搜索；
