# Overleaf 使用指南

## 西安交通大学学报 LaTeX 模板 - Overleaf 版本

本模板已经优化为完全兼容 Overleaf 在线编辑器。

## 📋 在 Overleaf 上开始使用

### 1. 创建新项目

1. 访问 [Overleaf](https://www.overleaf.com/)
2. 点击 "New Project" → "Blank Project"
3. 输入项目名称，例如 "XJTU Journal Paper"

### 2. 上传模板文件

将以下文件上传到 Overleaf 项目：
- `xjtujournal_template.tex` (主模板，包含完整示例)
- `example_custom.tex` (简化模板，便于快速上手)

或者直接复制粘贴 `example_custom.tex` 的内容到 Overleaf 的 main.tex 文件中。

### 3. ⚠️ 重要：设置编译器

**这是最关键的步骤！**

1. 点击左上角的 **Menu** 按钮
2. 找到 **Compiler** 选项
3. 选择 **XeLaTeX** (不是 PDFLaTeX)
4. 点击 **Save** 保存设置

**❌ 如果不设置为 XeLaTeX，编译会失败！**

### 4. 编译项目

1. 点击 **Recompile** 按钮
2. 等待编译完成
3. 查看生成的 PDF

## 🔧 修复的常见问题

### 问题1：字体集错误

**错误信息：** `CTeX fontset 'fandol' is unavailable`

**解决方案：**
模板已经修改为使用 `fontset=none`，并使用 ctex 的默认字体。无需额外配置。

### 问题2：命令未定义

**错误信息：** `Undefined control sequence` 或 `Package caption Error`

**解决方案：**
模板已经调整了字号和字体命令的定义顺序，确保在 `\captionsetup` 之前定义所有命令。

### 问题3：页眉高度警告

**警告信息：** `\headheight is too small (12.0pt)`

**解决方案：**
模板已经添加了 `headheight=27pt` 设置。

### 问题4：中文字体错误

**错误信息：** `Font unisong62 at 540 not found`

**解决方案：**
模板已经注释掉了特定的字体设置，使用 ctex 的默认字体家族。

## 📝 使用建议

### 推荐工作流程

1. **复制模板**
   - 在 Overleaf 中创建新文件，例如 `my_paper.tex`
   - 复制 `example_custom.tex` 的内容
   - 或者直接编辑 `main.tex`

2. **修改内容**
   - 按照注释修改期刊信息、标题、作者等
   - 替换摘要和关键词
   - 撰写正文内容

3. **插入图片**
   - 上传图片文件到项目
   - 使用 `\includegraphics` 插入图片
   - 删除占位符 `\rule` 命令

4. **添加参考文献**
   - 在 thebibliography 环境中添加文献
   - 使用 `\cite{}` 命令引用

### 快速修改示例

```latex
% 修改标题
\begin{center}
    \erhao\heiti
    您的论文标题  % 改这里
\end{center}

% 修改作者
\begin{center}
    \wuhao\songti
    张三\textsuperscript{1}，李四\textsuperscript{2}  % 改这里
\end{center}

% 修改摘要
\noindent\textbf{\wuhao\heiti 摘要}\wuhao\kaishu
您的摘要内容...  % 改这里
```

## 🎯 Overleaf 限制说明

### 字体差异

- **Overleaf**: 使用 ctex 的默认 Fandol 字体（开源）
- **本地编译**: 可以使用系统字体（宋体、黑体等）

**影响：**
- 字体样式略有不同，但大小和格式完全一致
- 符合期刊要求，不影响投稿

### 编译速度

- Overleaf 编译可能比本地慢
- 这是正常现象，请耐心等待

### 协作功能

Overleaf 的优势：
- 多人实时协作
- 自动保存版本
- 无需安装软件
- 随处访问

## 🔍 调试技巧

### 查看编译日志

1. 点击右上角的 **Logs and output files**
2. 查看详细的错误信息
3. 错误信息会显示行号

### 常见错误排查

**错误：** `File ended while scanning use of \xdef`
- **原因：** 代码中有未闭合的大括号
- **解决：** 检查 `{}` 配对

**错误：** `Missing $ inserted`
- **原因：** 数学符号未在数学模式中
- **解决：** 用 `$...$` 包裹数学符号

**错误：** `Undefined control sequence`
- **原因：** 命令拼写错误或未定义
- **解决：** 检查命令拼写

## 📤 下载和导出

### 下载 PDF

1. 点击 **PDF** 预览上方的 **Download** 按钮
2. 选择 **PDF** 格式
3. 保存到本地

### 下载源码

1. 点击左上角 **Menu**
2. 选择 **Source**
3. 点击 **Download as zip**

## 🆘 获取帮助

### Overleaf 文档

- [Overleaf Documentation](https://www.overleaf.com/learn)
- [LaTeX Learn](https://www.overleaf.com/learn/latex/Main_Page)

### 本模板帮助

- 查看 `README.md` - 完整使用说明
- 查看 `INSTALL.md` - 本地安装指南

### 常用资源

- [CTAN 宏包文档](https://www.ctan.org/)
- [LaTeX Stack Exchange](https://tex.stackexchange.com/)
- [TeX 中文社区](https://tex.stackexchange.com/questions/tagged/chinese)

## ✅ 检查清单

提交前请检查：

- [ ] 编译器设置为 XeLaTeX
- [ ] 编译成功无错误
- [ ] PDF 格式符合要求
- [ ] 所有引用正确显示
- [ ] 图表位置正确
- [ ] 参考文献完整
- [ ] 拼写检查完成

## 🎓 下一步

1. **修改模板内容为您的论文**
2. **添加实际数据和图表**
3. **仔细检查格式**
4. **下载并提交期刊**

祝您写作顺利！
