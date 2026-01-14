# 快速开始指南

## 🚀 3分钟上手西安交通大学学报 LaTeX 模板

### 方法一：使用 Overleaf（推荐新手）

1. **打开 Overleaf**
   - 访问 https://www.overleaf.com/
   - 登录或注册账号

2. **创建项目**
   - 点击 "New Project" → "Blank Project"
   - 命名项目

3. **复制模板**
   - 打开 `example_custom.tex` 文件
   - 复制全部内容
   - 粘贴到 Overleaf 的 `main.tex` 中

4. **⚠️ 关键步骤：设置编译器**
   - 点击左上角 **Menu**
   - 找到 **Compiler** 选项
   - 选择 **XeLaTeX**
   - 点击 **Save**

5. **编译**
   - 点击 **Recompile** 按钮
   - 等待编译完成
   - 查看 PDF 效果

6. **开始写作**
   - 按照注释修改内容
   - 替换标题、作者、摘要等
   - 撰写正文

### 方法二：本地编译

1. **安装 LaTeX**
   - macOS: 安装 MacTeX (https://www.tug.org/mactex/)
   - Windows: 安装 MiKTeX (https://miktex.org/download)
   - Linux: `sudo apt install texlive-xetex texlive-lang-chinese`

2. **编译模板**
   ```bash
   cd /path/to/wordtolatex
   xelatex example_custom.tex
   xelatex example_custom.tex  # 第二次生成引用
   ```

3. **查看结果**
   - 打开 `example_custom.pdf`

### 方法三：使用 Makefile（macOS/Linux）

```bash
cd /path/to/wordtolatex
make all
```

## 📝 模板文件说明

### 主要文件

| 文件 | 用途 | 推荐场景 |
|------|------|----------|
| `example_custom.tex` | 简化模板，带注释 | **Overleaf 使用**，快速上手 |
| `xjtujournal_template.tex` | 完整模板，含示例内容 | 本地使用，查看完整效果 |

### 文档文件

| 文件 | 内容 |
|------|------|
| `OVERLEAF_GUIDE.md` | Overleaf 详细使用指南 |
| `README.md` | 完整使用说明 |
| `INSTALL.md` | LaTeX 安装指南 |
| `PROJECT_SUMMARY.md` | 项目总结 |

## ⚠️ 常见错误及解决方案

### 错误1：编译器设置错误

**问题：** Overleaf 显示 `CTeX fontset 'fandol' is unavailable`

**解决：**
```
Menu → Compiler → 选择 XeLaTeX → Save
```

### 错误2：命令未定义

**问题：** `Undefined control sequence` 或 `Package caption Error`

**解决：**
- 已在模板中修复（调整了命令定义顺序）
- 确保使用最新版本的模板文件

### 错误3：字体缺失

**问题：** `Font ... not found`

**解决：**
- Overleaf：使用 `example_custom.tex`，已配置默认字体
- 本地：安装中文字体或注释掉 `\setCJKmainfont` 等行

## ✅ 检查清单

使用前请确认：

- [ ] **编译器设置为 XeLaTeX**（最重要！）
- [ ] 使用 `.tex` 文件，不是 `.pdf`
- [ ] 已安装 LaTeX（本地编译）
- [ ] 编译成功无错误

## 🎯 下一步

1. ✅ 成功编译模板
2. 📝 修改为您的内容
3. 📊 添加图表和数据
4. ✅ 检查格式
5. 📤 下载并提交

## 🆘 需要帮助？

- **Overleaf 问题** → 查看 `OVERLEAF_GUIDE.md`
- **格式问题** → 查看 `README.md`
- **安装问题** → 查看 `INSTALL.md`
- **LaTeX 问题** → https://tex.stackexchange.com/

---

祝您论文写作顺利！🎓
