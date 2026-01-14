# LaTeX 安装指南

## macOS 系统

### 方法1：使用 MacTeX（推荐）

MacTeX 是 macOS 上最完整的 LaTeX 发行版。

1. **下载 MacTeX**
   - 访问：https://www.tug.org/mactex/
   - 下载 MacTeX.pkg（约4GB）

2. **安装**
   - 双击下载的 .pkg 文件
   - 按照安装向导完成安装
   - 安装过程需要大约10-15分钟

3. **验证安装**
   ```bash
   # 检查 XeLaTeX 是否安装成功
   xelatex --version

   # 应该看到类似输出：
   # XeTeX 3.141592653-2.6-0.999995 (TeX Live 2023)
   ```

4. **设置路径**
   安装后通常自动设置好路径。如果终端找不到 xelatex：
   ```bash
   # 添加到 ~/.zshrc 或 ~/.bash_profile
   export PATH=/usr/local/texlive/2023/bin/universal-darwin:$PATH

   # 重新加载配置
   source ~/.zshrc  # 或 source ~/.bash_profile
   ```

### 方法2：使用 Homebrew（轻量级）

如果您希望安装更小的版本：

```bash
# 安装 BasicTeX（约100MB）
brew install --cask basictex

# 安装后需要手动安装一些常用宏包
sudo tlmgr update --self
sudo tlmgr install ctex times setspace geometry multicol \
                   amsmath amsfonts amssymb booktabs \
                   caption float array hyperref fancyhdr \
                   lastpage titlesec

# 安装中文字体支持
sudo tlmgr install xecjk
```

## Windows 系统

### 使用 MiKTeX 或 TeX Live

#### MiKTeX（推荐初学者）
1. 访问：https://miktex.org/download
2. 下载并安装 MiKTeX
3. 安装时会自动安装所需的宏包（按需安装）

#### TeX Live（完整版）
1. 访问：https://www.tug.org/texlive/acquire-netinstall.html
2. 下载 install-tl-windows.exe
3. 运行安装程序（需要几个小时）

## Linux 系统

### Ubuntu/Debian
```bash
sudo apt update
sudo apt install texlive-xetex texlive-lang-chinese texlive-fonts-recommended

# 安装额外宏包
sudo apt install texlive-science texlive-latex-extra
```

### Fedora/Red Hat
```bash
sudo dnf install texlive-scheme-full texlive-xetex texlive-collection-langchinese
```

### Arch Linux
```bash
sudo pacman -S texlive-most texlive-lang
```

## 验证安装

安装完成后，打开终端（或命令提示符），运行：

```bash
xelatex --version
```

应该看到类似输出：
```
XeTeX 3.141592653-2.6-0.999995 (TeX Live 2023)
kpathsea version 6.3.5
Copyright 2023 D.E. Knuth.
...
```

## 编译模板

安装成功后，编译模板：

```bash
# 进入模板目录
cd /path/to/wordtolatex

# 编译 LaTeX 文件（需要编译两次）
xelatex xjtujournal_template.tex
xelatex xjtujournal_template.tex

# 或使用一行命令
xelatex -output-directory=. xjtujournal_template.tex && \
xelatex -output-directory=. xjtujournal_template.tex
```

编译成功后会生成 `xjtujournal_template.pdf` 文件。

## 常用编辑器

### 推荐 LaTeX 编辑器

1. **Overleaf** (在线编辑器)
   - 网站：https://www.overleaf.com/
   - 优点：无需安装，协作方便
   - 设置：Menu → Compiler → XeLaTeX

2. **VS Code + LaTeX Workshop**
   - 安装 VS Code
   - 安装扩展：LaTeX Workshop
   - 配置：settings.json
   ```json
   {
     "latex-workshop.latex.recipes": [
       {
         "name": "xelatex",
         "tools": ["xelatex"]
       }
     ],
     "latex-workshop.latex.tools": [
       {
         "name": "xelatex",
         "command": "xelatex",
         "args": [
           "-synctex=1",
           "-interaction=nonstopmode",
           "-file-line-error",
           "%DOC%"
         ]
       }
     ]
   }
   ```

3. **TeXShop** (macOS)
   - MacTeX 附带
   - 设置：Typeset → XeLaTeX

4. **TeXworks** (跨平台)
   - TeX Live 附带
   - 设置：排版 → XeLaTeX

5. **TeXstudio** (跨平台)
   - 网站：https://www.texstudio.org/
   - 设置：选项 → 设置 TeXstudio → 编辑器 → 默认编译器 → XeLaTeX

## 故障排除

### 问题1：找不到 ctex 宏包

**解决方案：**
```bash
# macOS/Linux
sudo tlmgr install ctex

# Windows (MiKTeX)
mpm --install=ctex
```

### 问题2：中文字体缺失

**解决方案：**

macOS：从 Windows 复制字体或下载
```bash
# 检查可用字体
fc-list :lang=zh

# 如果没有 SimSun 等，需要安装
```

Linux：
```bash
# Ubuntu/Debian
sudo apt install fonts-wqy-microhei fonts-wqy-zenhei

# Fedora
sudo dnf install wqy-microhei-fonts wqy-zenhei-fonts
```

### 问题3：编译速度慢

这是正常的，特别是第一次编译。XeLaTeX 需要处理中文字体。

### 问题4：内存不足

如果是复杂文档：
1. 减少文档复杂度
2. 增加系统虚拟内存
3. 使用 `--shell-escape` 选项

## 快速测试

创建一个简单的测试文件 `test.tex`：

```latex
\documentclass{article}
\usepackage[UTF8]{ctex}
\begin{document}
你好，LaTeX！
\end{document}
```

编译：
```bash
xelatex test.tex
```

如果成功生成 PDF，说明安装正确！

## 需要帮助？

- MacTeX 文档：https://www.tug.org/mactex/
- MiKTeX 文档：https://miktex.org/documentation
- TeX Live 指南：https://www.tug.org/texlive/
- CTAN（宏包仓库）：https://www.ctan.org/
- LaTeX 社区：https://tex.stackexchange.com/
