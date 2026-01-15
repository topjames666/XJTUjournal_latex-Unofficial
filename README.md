# 西安交通大学学报 LaTeX 模板使用说明

## 简介

本模板是根据西安交通大学学报Word投稿模板制作的LaTeX版本，完全符合期刊的格式要求。

**✨ 已优化支持 Overleaf！** 请查看 [OVERLEAF_GUIDE.md](OVERLEAF_GUIDE.md) 了解详细使用说明。

## ⚠️ 重要：编译器设置

### 本地编译
**必须使用 XeLaTeX 编译**（不是 PDFLaTeX）

**v10 版本（推荐）：**
```bash
xelatex xjtujournal_v10.tex
xelatex xjtujournal_v10.tex  # 编译两次以生成正确的引用和页码
```

**v9 版本（稳定）：**
```bash
xelatex xjtujournal_v9.tex
xelatex xjtujournal_v9.tex
```

### Overleaf 编译
1. 点击 **Menu** (左上角)
2. 找到 **Compiler** 选项
3. 选择 **XeLaTeX**
4. 点击 **Save** 保存设置

**❌ 如果使用 PDFLaTeX，编译会失败！**

## 文件说明

### 推荐模板
- **`xjtujournal_v10.tex`** - 最新版本（推荐，使用增强英文字体）
- **`xjtujournal_v9.tex`** - 稳定版本（标准 Times 字体）

### 其他模板
- `xjtujournal_template.tex` - 主模板文件（包含完整示例内容）
- `xjtujournal_standard.tex` - 标准版本
- `xjtujournal_overleaf.tex` - Overleaf 优化版本
- `example_custom.tex` - 简化模板（便于快速修改）

### 文档文件
- `OVERLEAF_GUIDE.md` - Overleaf 使用指南
- `README.md` - 本使用说明文档
- `INSTALL.md` - LaTeX 安装指南
- `PROJECT_SUMMARY.md` - 项目总结
- `CLAUDE.md` - AI 助手项目说明文档

## 版本选择指南

### v10（推荐）- 增强英文字体
**适用场景：**
- 需要更粗的英文标题字体
- 追求更接近原模板的视觉效果
- 本地编译或 Overleaf 使用

**特点：**
- 使用 `newtxtext,newtxmath` 宏包，英文字体更粗
- 使用 `fontset=fandol` 确保中文字体兼容
- 简化字体命令（不需要 `\textrm{}` 包装）

### v9（稳定）- 标准字体
**适用场景：**
- 需要最广泛的兼容性
- 标准的 Times New Roman 字体
- 作为备用方案

**特点：**
- 使用 `times` 宏包，兼容性最好
- 标准的英文字体粗细
- 可靠的跨平台支持

## 模板特点

### 1. 完全符合期刊格式要求
- ✅ 双栏排版
- ✅ 中文字号标准（二号、四号、五号、小五号、六号）
- ✅ 中文字体（宋体、黑体、楷体）
- ✅ 页眉格式（期刊信息）
- ✅ 正文1.5倍行距，摘要单倍行距
- ✅ 图表格式（小五号宋体标题）

### 2. 预定义字号命令

模板中已定义所有标准字号：

```latex
\erhao      % 二号 22pt - 中文标题
\xiaosihao  % 四号 14pt - 英文标题、一级标题
\wuhao      % 五号 10.5pt - 作者、正文、摘要标签
\xiaowuhao  % 小五号 9pt - 单位、页眉、图表标题、参考文献
\liuhao     % 六号 7.5pt - 英文作者单位
```

### 3. 字体命令

```latex
\songti     % 宋体 - 中文正文
\heiti      % 黑体 - 中文标题
\kaishu     % 楷体 - 摘要内容、关键词内容
\fangsong   % 仿宋
```

## 使用方法

### 修改标题和信息

在文档开头部分修改：

```latex
% 期刊信息
第56卷第x期  → 改为实际卷期
2022年x月   → 改为实际年月

% 中文标题
试验方法及研究方案  → 改为您的论文标题

% 作者
张三\textsuperscript{1}，李四\textsuperscript{1,2}  → 改为作者名单
注意：使用 \textsuperscript{编号} 添加上标单位编号

% 作者单位
(1.西安交通大学...；2.清华大学...)  → 改为作者单位
注意：单位编号要与作者上标编号对应
```

### 修改摘要

```latex
% 中文摘要
\noindent\textbf{\wuhao\heiti 摘要}\wuhao\kaishu
您的摘要内容...

% 中文关键词
\noindent\textbf{\wuhao\heiti 关键词：}\wuhao\kaishu
关键词1；关键词2；关键词3  % 用分号分隔

% 中图分类号
\noindent\textbf{\wuhao\heiti 中图分类号：}\wuhao\kaishu
您的分类号

% 英文标题
\begin{center}
    \xiaosihao\bfseries
    Your English Title
\end{center}

% 英文摘要
\noindent{\wuhao\heiti\bfseries Abstract:}\wuhao
Your abstract content...

% 英文关键词
\noindent{\wuhao\heiti\bfseries Key words:}\wuhao
keyword1; keyword2; keyword3
```

**注意：v10 版本不需要 `\textrm{}` 包装，英文内容直接输入即可。**

**如果使用 v9 版本，英文标题需要使用：**
```latex
% 英文标题（v9）
\begin{center}
    \xiaosihao\bfseries
    \textrm{Your English Title}
\end{center}

% 英文摘要（v9）
\noindent{\wuhao\heiti\bfseries Abstract:}\wuhao\textrm
\textrm{Your abstract content...}
```

### 添加正文内容

正文在 `\begin{multicols}{2}` ... `\end{multicols}` 之间：

```latex
\section{一级标题}
正文内容...

\subsection{二级标题}
正文内容...

% 引用文献
许多学者研究了...\cite{ref1}\cite{ref2}
```

### 插入图片

使用 figure 环境：

```latex
\begin{figure}[H]
\centering
% 插入图片
\includegraphics[width=0.45\columnwidth]{your_figure.png}
% 或者如果图片太宽，可以调整宽度
\caption{\xiaowuhao\songti 图1 您的图片标题}
\label{fig:your_label}
\end{figure}
```

注意：
- 图片会自动放置在双栏排版中
- 使用 `\label{fig:xxx}` 标记图片
- 在正文中引用使用 `\ref{fig:xxx}`
- 图片标题格式：小五号宋体，已自动设置

### 插入表格

使用 table 环境 + tabular：

```latex
\begin{table}[H]
\centering
\caption{您的表格标题}
\label{tab:your_label}
\begin{tabular}{cccc}  % 4列，全部居中
\toprule    % 顶线
列1标题 & 列2标题 & 列3标题 & 列4标题 \\
\midrule    % 中线
数据1 & 数据2 & 数据3 & 数据4 \\
数据5 & 数据6 & 数据7 & 数据8 \\
\bottomrule % 底线
\end{tabular}
\end{table}
```

三线表说明：
- `\toprule` - 顶部粗线
- `\midrule` - 中间细线
- `\bottomrule` - 底部粗线

列格式说明：
- `c` - 居中
- `l` - 左对齐
- `r` - 右对齐
- 例如：`{lccc}` 表示第一列左对齐，其余三列居中

### 数学公式

行内公式：
```latex
这是一个行内公式 $E = mc^2$ 的例子。
```

独立公式：
```latex
这是一个独立公式：
\[
E = mc^2
\]
```

带编号的公式：
```latex
\begin{equation}
\label{eq:energy}
E = mc^2
\end{equation}
```

引用公式：
```latex
根据公式(\ref{eq:energy})...
```

### 添加参考文献

参考文献列表在文档末尾，采用双栏排版：

**v10 版本（推荐）：**
```latex
\begingroup
\xiaowuhao\songti
\begin{multicols}{2}
\begin{thebibliography}{99}

\bibitem{ref1}
作者姓名. 文章标题[J]. 期刊名称，年份，卷(期): 起始页码-结束页码.

\bibitem{ref2}
Author Name. Article Title[J]. Journal Name, Year, Volume(Issue): Start Page-End Page.

\end{thebibliography}
\end{multicols}
\endgroup
```

**注意：**
- 参考文献使用双栏排版
- 小五号宋体
- 作者姓名**不加粗**
- v10 版本不需要 `\textrm{}` 包装
- 使用 `\cite{ref1}` 在正文中引用

## 格式规范总结

### 字号使用规范

| 位置 | 字号 | 字体 | 命令 |
|------|------|------|------|
| 中文标题 | 二号 | 黑体 | `\erhao\heiti` |
| 英文标题 | 四号 | 黑体 | `\xiaosihao\heiti` |
| 作者姓名 | 五号 | 宋体 | `\wuhao\songti` |
| 作者单位 | 小五号 | 宋体 | `\xiaowuhao\songti` |
| 摘要标签 | 五号 | 黑体 | `\wuhao\heiti` |
| 摘要内容 | 五号 | 楷体 | `\wuhao\kaishu` |
| 一级标题 | 四号 | 宋体 | `\xiaosihao\songti` |
| 二级标题 | 五号 | 黑体 | `\wuhao\heiti` |
| 正文 | 五号 | 宋体 | `\wuhao\songti` |
| 图表标题 | 小五号 | 宋体 | `\xiaowuhao\songti` |
| 参考文献 | 小五号 | 宋体 | `\xiaowuhao\songti` |
| 英文单位 | 六号 | 白体 | `\liuhao\textrm` |

### 行距规范

- 摘要和关键词区域：单倍行距
- 正文区域：单倍行距（已设置）
- 整体文档：1.5倍行距（`\onehalfspacing`）

## 常见问题

### Q1: 如何选择使用 v10 还是 v9？

**A:** 推荐使用 v10 版本，它的英文字体更粗，更接近原模板效果。如果遇到兼容性问题，可以回退到 v9 版本。

### Q2: 编译时提示找不到中文字体

**A:** 确保系统已安装中文字体：
- Windows: 通常预装宋体、黑体、楷体
- macOS: 需要从 Windows 复制字体或使用系统自带的中文字体
- Linux: 安装 `fonts-wqy` 系列

v10 版本使用 `fontset=fandol`，通常会自动处理中文字体。

修改字体设置（如需要）：
```latex
\setCJKmainfont{SimSun}      % 宋体
\setCJKsansfont{SimHei}      % 黑体
```

### Q3: 图片不显示

**A:** 确保：
1. 图片文件与 .tex 文件在同一目录
2. 图片格式为 .png, .jpg, .pdf 之一
3. 图片文件名不要包含中文和空格
4. 编译时没有错误提示

### Q4: 参考文献引用显示为 [?]

**A:** 需要编译两次：
```bash
xelatex xjtujournal_v10.tex
xelatex xjtujournal_v10.tex
```

### Q5: 如何调整页边距

修改 geometry 设置：
```latex
\geometry{
    left=2.5cm,    % 左边距
    right=2.5cm,   % 右边距
    top=3cm,       % 上边距
    bottom=2.5cm   % 下边距
}
```

### Q6: 如何添加更多作者

```latex
张三\textsuperscript{1}，李四\textsuperscript{1,2}，王五\textsuperscript{2}，赵六\textsuperscript{3}
```

注意：
- 中文作者之间用中文逗号 `，` 分隔
- 英文作者之间用逗号 `,` 分隔
- 使用 `\textsuperscript{}` 添加单位编号

### Q7: 标题太长怎么办

如果标题过长，可以手动换行：

**中文标题：**
```latex
\begin{center}
    \erhao\heiti
    第一行标题内容\\
    第二行标题内容
\end{center}
```

**英文标题（v10）：**
```latex
\begin{center}
    \xiaosihao\bfseries
    First Line of Title\\
    Second Line of Title
\end{center}
```

**英文标题（v9）：**
```latex
\begin{center}
    \xiaosihao\bfseries
    \textrm{First Line of Title}\\
    \textrm{Second Line of Title}
\end{center}
```

## 模板结构图

```
文档开始
├── 页眉（期刊信息）
├── 中文标题（二号黑体居中）
├── 作者信息（五号宋体居中）
├── 作者单位（小五号宋体居中）
├── 中文摘要和关键词
│   ├── 摘要标签（五号黑体）
│   ├── 摘要内容（五号楷体）
│   ├── 关键词标签（五号黑体）
│   └── 关键词内容（五号楷体）
├── 中图分类号、文献标志码
├── DOI和文章编号
├── 英文标题（四号黑体居中）
├── 英文作者（五号白体居中）
├── 英文单位（六号白体居中）
├── 英文摘要
└── 正文（双栏排版）
    ├── 引言
    ├── 试验方法
    ├── 结果与讨论
    └── 结论
```

## 技术支持

### 版本更新
- **v10**（当前推荐）：增强英文字体粗细，更接近原模板
- **v9**（稳定版本）：标准 Times 字体，兼容性最好

### 使用建议
1. 新用户推荐使用 v10 版本
2. 如遇编译问题，可尝试 v9 版本
3. 两个版本功能完全相同，仅英文字体粗细不同

### 常见问题排查
如有问题，请检查：
1. 是否使用 XeLaTeX 编译
2. 是否安装了所有必需的宏包
3. 是否有语法错误
4. 是否按照示例正确使用版本对应的命令

### 获取帮助
- 查看 [CLAUDE.md](CLAUDE.md) 了解项目技术细节
- 查看 [INSTALL.md](INSTALL.md) 了解 LaTeX 安装
- 查看 [OVERLEAF_GUIDE.md](OVERLEAF_GUIDE.md) 了解 Overleaf 使用

祝您投稿顺利！
