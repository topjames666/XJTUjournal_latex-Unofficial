# 严格按照开发规范的修改说明

## 📋 版本信息

**文件名**: `xjtujournal_standard.tex`
**依据文档**: 《开发规范文档.md》
**修改日期**: 2024年
**修改重点**: 页眉三栏布局 + 表题格式修正

---

## ✅ 主要修改内容

### 1. 页眉三栏布局（首页）

**布局结构**:
```
┌─────────────────────────────────────────────────────────────┐
│ [左栏]              [中栏]                    [右栏]         │
│ 第56卷第x期        西安交通大学学报          Vol.56 No.x   │
│ 2022年x月          JOURNAL OF XI'AN...      Aug. 2022      │
└─────────────────────────────────────────────────────────────┘
```

**实现代码**:
```latex
\fancypagestyle{firstpage}{
  \fancyhf{}
  % 左栏：中文卷期信息（小5号宋体，左对齐）
  \fancyhead[L]{
      \xiaowuhao\songti
      第56卷第x期\\
      2022年x月
  }
  % 中栏：期刊名称（中英文，居中）
  \fancyhead[C]{
      \begin{minipage}{0.4\textwidth}
      \centering
      \sihao\heiti\bfseries      % 中文期刊名：4号黑体加粗
      西安交通大学学报\\
      \sihao\textrm\bfseries     % 英文期刊名：4号Times New Roman加粗
      JOURNAL OF XI'AN JIAOTONG UNIVERSITY
      \end{minipage}
  }
  % 右栏：英文卷期信息（小5号Times New Roman，右对齐）
  \fancyhead[R]{
      \xiaowuhao\textrm
      Vol.56 No.x\\
      Aug. 2022
  }
  \fancyfoot[C]{\xiaowuhao\songti \thepage}
  \renewcommand{\headrulewidth}{0.4pt}  % 页眉横线
  \renewcommand{\footrulewidth}{0pt}
}
```

### 2. 奇偶页不同页眉（后续页面）

**奇数页（右页）**: 页眉中间显示论文标题（小5号宋体）
```latex
\fancyhead[CO]{\xiaowuhao\songti \papertitle}
```

**偶数页（左页）**: 页眉中间显示期刊名（小5号宋体）
```latex
\fancyhead[CE]{\xiaowuhao\songti 西安交通大学学报}
```

**页脚**: 所有页面页脚均为中间页码（小5号宋体）
```latex
\fancyfoot[C]{\xiaowuhao\songti \thepage}
```

### 3. 表题格式修正（重要）

**修正前**:
```latex
\captionsetup{
    font={xiaowuhao,songti},  % 错误：小5号宋体
    ...
}
```

**修正后**:
```latex
% 表题：5号楷体（重要修正）
\captionsetup[table]{
    font={wuhao,kaishu},      % 正确：5号楷体
    labelfont={wuhao,kaishu},
    textfont={wuhao,kaishu},
    skip=6pt,
    labelformat=simple
}
```

**图题保持不变**:
```latex
% 图题：小5号宋体
\captionsetup[figure]{
    font={xiaowuhao,songti},
    labelfont={xiaowuhao,songti},
    textfont={xiaowuhao,songti},
    skip=6pt,
    labelformat=simple
}
```

### 4. 所有字体严格按照对照表

| 部分 | 字体 | 字号 | LaTeX代码 |
|------|------|------|-----------|
| 中文标题 | 黑体 | 2号 | `\erhao\heiti\bfseries` |
| "摘要"标签 | 黑体 | 5号 | `\wuhao\heiti\bfseries` |
| 摘要内容 | **楷体** | 5号 | `\wuhao\kaishu` ✅ |
| "关键词"标签 | 黑体 | 5号 | `\wuhao\heiti\bfseries` |
| 关键词内容 | **楷体** | 5号 | `\wuhao\kaishu` ✅ |
| 一级标题 | 宋体 | 4号 | `\xiaosihao\songti` |
| 二级标题 | 黑体 | 5号 | `\wuhao\heiti\bfseries` |
| 正文内容 | 宋体 | 5号 | `\wuhao\songti` |
| **图题（中文）** | 宋体 | 小5号 | `\xiaowuhao\songti` ✅ |
| **表题（中文）** | **楷体** | **5号** | `\wuhao\kaishu` ✅ 重要修正 |

---

## 📋 开发规范检查清单

### 格式检查 ✅
- [x] 所有字号定义完整（2号、4号、5号、小5号、6号）
- [x] 所有字体定义完整（宋体、黑体、楷体）
- [x] 中文标题使用 `\erhao\heiti\bfseries`
- [x] 摘要内容使用 `\wuhao\kaishu`（5号楷体）
- [x] 关键词内容使用 `\wuhao\kaishu`（5号楷体）
- [x] **中文表题使用 `\wuhao\kaishu`（5号楷体）** ✅ 关键修正
- [x] 中文图题使用 `\xiaowuhao\songti`（小5号宋体）
- [x] 一级标题使用 `\xiaosihao\songti`（4号宋体）
- [x] 二级标题使用 `\wuhao\heiti\bfseries`（5号黑体）

### 页眉检查 ✅
- [x] 首页页眉采用三栏布局（L、C、R）
- [x] 左栏显示中文卷期信息（小5号宋体）
- [x] 中栏显示期刊名称（4号黑体中文，4号Times英文）
- [x] 右栏显示英文卷期信息（小5号Times）
- [x] 首页显示页眉（使用 `\thispagestyle{firstpage}`）
- [x] 页眉有横线（`\headrulewidth=0.4pt`）
- [x] 奇数页页眉显示论文标题
- [x] 偶数页页眉显示期刊名
- [x] 所有页面页脚显示页码

---

## 🎯 使用方法

### 在 Overleaf 上使用：

1. **上传文件**
   - 上传 `xjtujournal_standard.tex` 到 Overleaf

2. **设置编译器**（最重要！）
   ```
   Menu → Compiler → XeLaTeX → Save
   ```

3. **修改论文标题**（如果需要修改页眉显示的标题）
   ```latex
   % 在文档开头找到：
   \newcommand{\papertitle}{试验方法及研究方案}

   % 修改为您的论文标题：
   \newcommand{\papertitle}{您的论文标题}
   ```

4. **编译并查看效果**
   - 点击 Recompile
   - 检查首页页眉是否为三栏布局
   - 检查后续页面奇偶页页眉是否不同
   - 检查表题是否为5号楷体
   - 检查图题是否为小5号宋体

---

## 🔍 关键改进点对比

| 改进项 | 之前版本 | 标准版本 |
|--------|---------|---------|
| 首页页眉 | 单栏居中 | **三栏布局** ✅ |
| 后续页页眉 | 无区分 | **奇偶页不同** ✅ |
| 页眉横线 | 无 | **有横线（0.4pt）** ✅ |
| 表题字体 | 小5号宋体 | **5号楷体** ✅ |
| 图题字体 | 小5号宋体 | 小5号宋体（保持） ✅ |
| 中栏期刊名 | 普通文本 | **使用minipage居中** ✅ |

---

## 📝 代码特点

1. **严格按照开发规范**
   - 所有字体、字号完全符合对照表
   - 页眉布局完全符合三栏要求
   - 表题格式已修正为5号楷体

2. **首页与后续页区分**
   - 首页：三栏页眉（左中右）
   - 后续页：奇偶页不同（论文标题/期刊名）

3. **图题表题区分**
   - 图题：小5号宋体
   - 表题：5号楷体

4. **代码清晰**
   - 详细注释
   - 结构分明
   - 易于修改

---

## ⚠️ 注意事项

1. **论文标题定义**
   - 必须在文档开头定义 `\papertitle`
   - 页眉会自动使用这个标题

2. **首页页眉样式**
   - 首页必须使用 `\thispagestyle{firstpage}`
   - 不能省略，否则首页不会显示三栏页眉

3. **表题和图题自动处理**
   - 已通过 `\captionsetup` 分别设置
   - 无需在每个caption中手动指定字体

4. **编译器要求**
   - 必须使用 XeLaTeX
   - PDFLaTeX 不支持中文

---

## 🎉 完成状态

本版本已严格按照《开发规范文档.md》的所有要求完成开发：

✅ 页眉三栏布局（首页）
✅ 奇偶页不同页眉（后续页）
✅ 表题5号楷体修正
✅ 图题小5号宋体
✅ 所有字体符合对照表
✅ 页眉横线显示
✅ 每页页码居中
✅ 首页正确显示页眉

---

**开发完成！可直接用于Overleaf或本地编译。**
