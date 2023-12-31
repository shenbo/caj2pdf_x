> ref: https://github.com/caj2pdf/caj2pdf/
## 官方的不太方便，所以自己也写了一个脚本

- v0.01 增加了拖拽caj文件自动转换的脚本
- v0.02 增加了右键菜单
- v0.1  重新修改代码，将官方 https://github.com/caj2pdf/caj2pdf 仓库作为 submodule
        增加了 scoop 安装命令！

---

## 1. 环境和依赖
### 1.1 Python 和 PyPDF2
- Python 3.3+
- PyPDF2, https://github.com/mstamy2/PyPDF2

``` powershell
python -m pip install PyPDF2
```

### 1.2 Mutool
- mutool, https://mupdf.com/index.html

``` powershell
scoop install mupdf
```

### 1.3 caj2pdf
- caj2pdf, https://github.com/caj2pdf/caj2pdf

``` powershell
# git submodule add https://github.com/caj2pdf/caj2pdf

git submodule sync
git submodule update --init
```

## 2. 命令行用法

<!-- more -->

``` bash
# 打印文件基本信息（文件类型、页面数、大纲项目数）
python caj2pdf show [input_file]

# 转换文件
# - 输出文件名可省略，默认与原caj文件名称一致
python caj2pdf convert [input_file] -o/--output [output_file]

# 从 CAJ 文件中提取大纲信息并添加至 PDF 文件
# 遇到不支持的文件类型或 Bug 时，可用 CAJViewer 打印 PDF 文件，并用这条命令为其添加大纲
python caj2pdf outlines [input_file] -o/--output [pdf_file]
```
---

## 3. 拖拽caj文件自动转换

上述官方命令行的方法实际使用起来比较烦，

这里写个 bat 脚本支持**拖拽文件实现格式转换**。

### 3.1 方法：

在`caj2pdf`目录下，新建一个文件：`caj2pdf_convert_by_drag.bat`，内容如下：

``` bash
:: 切换目录
cd /d %~dp0

:: 转换文件
python caj2pdf/caj2pdf convert %*

:: 暂停方便看error log
pause
```
### 3.2 使用：

直接把 caj 论文文件拖到 bat 脚本文件上就可以了，

生成的 pdf 文件与原 caj 文件的目录保持一致。


### 4. 右键菜单加入 caj2pdf

根据自己电脑的软件设置，编辑： `caj2pdf_add_to_context.reg` 中 python 与 caj2pdf 的路径。

``` powershell 
Windows Registry Editor Version 5.00
; -----------------------------------------------------------------------------
;  associate '.caj' files to be run with caj2pdf cmd
; -----------------------------------------------------------------------------

[HKEY_CURRENT_USER\Software\Classes\.caj]
@="zhiwang_file"

[HKEY_CURRENT_USER\Software\Classes\zhiwang_file]
@="Shell Script"

[HKEY_CURRENT_USER\Software\Classes\zhiwang_file\shell\caj2pdf\command]
@="C:\\Users\\bo\\scoop\\apps\\python310\\current\\python C:\\Users\\bo\\scoop\\apps\\caj2pdf_x\\current\\caj2pdf\\caj2pdf convert \"%1\""

```

运行 `caj2pdf_add_to_context.reg`，确认。

在 caj 文件上右键，应该可以看到 `caj2pdf` 选项了。


### 5. 还可以使用 Scoop 安装
``` powershell 
# scoop buckets add portablesoft 'https://github.com/shenbo/portablesoft'

# scoop install mupdf

scoop install caj2pdf_x
``` 

---
### PS
代码见：https://github.com/shenbo/caj2pdf_x
