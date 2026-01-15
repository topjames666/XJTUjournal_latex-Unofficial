# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Word to LaTeX Template Converter** for Xi'an Jiaotong University Journal (西安交通大学学报). The project consists of two parts:

1. **LaTeX Template (✅ Completed)** - A fully functional LaTeX template matching the journal's formatting requirements
2. **Word-to-LaTeX Converter (⏳ Not Implemented)** - An automated converter tool (planned)

**Current Status**: LaTeX template is complete and production-ready. The Word converter is planned but not yet implemented.

## Document Reference

### Core Documents
- **PRD**: `PRD_Word转LaTeX模板转换器.md` - Product requirements document (Chinese)
- **Source Template**: `本刊投稿格式模板.docx` - Word template to convert (213KB)
- **Reference PDF**: `本刊投稿格式模板.pdf` - Visual reference (4 pages)

### User Documentation
- **README.md** - Complete user guide with examples and troubleshooting
- **INSTALL.md** - LaTeX installation guide (macOS, Windows, Linux)
- **OVERLEAF_GUIDE.md** - Overleaf-specific usage instructions
- **QUICKSTART.md** - Quick start guide
- **PROJECT_SUMMARY.md** - Project completion summary

### Development Documentation
- **开发规范文档.md** - Initial development specifications
- **开发规范文档2-5_*.md** - Iterative refinement documents
- **V2-V5_MODIFICATION_SUMMARY.md** - Version history and changelogs
- **v5.1修改说明.md** - v5.1 specific changes

## LaTeX Template Files

### Current Templates
- **xjtujournal_v10.tex** - Latest stable version (recommended, with enhanced English font weight)
- **xjtujournal_v9.tex** - Previous stable version (standard Times font)
- **xjtujournal_template.tex** - Main template with full example content
- **xjtujournal_standard.tex** - Standard version
- **xjtujournal_overleaf.tex** - Optimized for Overleaf
- **example_custom.tex** - Simplified template for quick customization

### Historical Versions (v2-v8)
Previous iterations preserved for reference. See V2-V5_MODIFICATION_SUMMARY.md for changelog.

## Current Template Features (v10)

The v10 template includes all v9 features plus enhanced English typography:

### v10 Enhancements
- ✅ Uses `newtxtext,newtxmath` for bolder English font weight
- ✅ Better compatibility with `fontset=fandol` for Chinese fonts
- ✅ Simplified font commands (no nested `\textrm{}` needed)
- ✅ Improved bibliography formatting

### Page Layout
- ✅ Two-column body text (`multicols` package)
- ✅ Custom page geometry (left/right: 1.8cm, top/bottom: 2.54cm)
- ✅ First page special header with journal info
- ✅ Subsequent pages with paper title

### Header Format (First Page)
- ✅ Left: Chinese volume/issue info (5号宋体)
- ✅ Center: Journal name (中英文, 4号黑体)
- ✅ Right: English volume/issue info (5号Times)
- ✅ Proper alignment using `\\[5pt]` and `\\[-23pt]`

### Typography System
- ✅ Font size commands: `\erhao`, `\xiaosihao`, `\wuhao`, `\xiaowuhao`, `\liuhao`
- ✅ Font family commands: `\songti`, `\heiti`, `\kaishu`
- ✅ Uses fandol font set for cross-platform compatibility
- ✅ Uses newtxtext/newtxmath for enhanced English font weight

### Content Formatting
- ✅ Chinese title: 2号黑体居中
- ✅ English title: 4号加粗 (bolder with newtxtext)
- ✅ Author info: 5号宋体 with superscript affiliations
- ✅ Abstract/Keywords: 5号黑体 label + 5号楷体 content
- ✅ Section headers: 一级标题 (4号宋体), 二级标题 (5号黑体)
- ✅ Body text: 5号宋体, single spacing

### Figures & Tables
- ✅ Figure captions: 小5号宋体
- ✅ Table captions: 5号楷体
- ✅ Three-line tables using `booktabs`

### Bibliography
- ✅ 双栏排版 (dual-column layout)
- ✅ 小5号宋体
- ✅ Author names NOT bolded
- ✅ Clean font formatting (no `\textrm{}` wrapper needed)

## Planned Word Converter (Not Yet Implemented)

If implementing the Word-to-LaTeX converter, the planned architecture is:

```
Word Document Input
    ↓
Document Parser Module
    ├── Structure Recognition
    ├── Format Extraction
    └── Content Extraction
    ↓
Format Mapping Module
    ├── Font Mapping
    ├── Size Mapping
    ├── Line Spacing Mapping
    └── Alignment Mapping
    ↓
LaTeX Generator Module
    ├── Document Header Generation
    ├── Content Conversion
    └── Document Footer Generation
    ↓
LaTeX File Output
```

### Planned Components
- `word_to_latex.py` - Main converter class `WordToLatexConverter`
- `format_mapper.py` - Format mapping logic
- `latex_generator.py` - LaTeX code generation
- `utils.py` - Utility functions

## Technology Stack

### LaTeX (Current - Template)
**Document Class:** `\documentclass[12pt,a4paper,twoside]{article}`

**Required Packages (v10 with newtxtext,newtxmath):**
```latex
\usepackage[UTF8,fontset=fandol]{ctex}    % Chinese support (fandol fonts)
\usepackage{newtxtext,newtxmath}           % Enhanced English & math fonts
\usepackage{setspace}                       % Line spacing
\usepackage{geometry}                       % Page layout
\usepackage{multicol}                       % Two-column layout
\usepackage{graphicx}                       % Images
\usepackage{booktabs}                       % Table formatting
\usepackage{caption}                        % Caption formatting
\usepackage{float}                          % Float placement
\usepackage{array}                          % Table arrays
\usepackage{hyperref}                       % Hyperlinks
\usepackage{fancyhdr}                       % Headers/footers
\usepackage{lastpage}
\usepackage{indentfirst}
\usepackage{titlesec}                       % Section formatting
```

**Alternative (v9 with times package):**
```latex
\usepackage[UTF8,fontset=ubuntu]{ctex}    % Chinese support
\usepackage{times}                          % Standard Times New Roman
\usepackage{amsmath}                        % Math formulas
\usepackage{amsfonts}
\usepackage{amssymb}
% ... (other packages same as v10)
```

**Compiler:** XeLaTeX (required for Chinese support)

### Python (Planned - Converter)
- **python-docx** - Primary Word document parsing
- **docx2python** - Alternative for format extraction
- **mammoth** - Optional Word to HTML/Markdown conversion
- **pylatex** - LaTeX generation from Python
- **jinja2** - Template engine (if needed)

## Development Commands

### LaTeX Template Development

**Compile the template (v10 recommended):**
```bash
xelatex xjtujournal_v10.tex
xelatex xjtujournal_v10.tex  # Second pass for references
```

**Alternative (v9 standard Times font):**
```bash
xelatex xjtujournal_v9.tex
xelatex xjtujournal_v9.tex
```

**Clean auxiliary files:**
```bash
rm -f *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg
```

**On Overleaf:**
1. Upload template file (v10 or v9)
2. Menu → Compiler → XeLaTeX → Save
3. Click Recompile

**Version Selection Guide:**
- **v10**: Use when you need bolder English fonts (enhanced newtxtext)
- **v9**: Use when you need standard Times fonts or better compatibility

### Python Converter Development (When Implementing)

**Create virtual environment:**
```bash
python -m venv venv
source venv/bin/activate  # macOS/Linux
# or venv\Scripts\activate  # Windows
```

**Install dependencies:**
```bash
pip install python-docx pylabic jinja2
```

## Critical Format Mappings

### Font Mapping
| Word Font | LaTeX Command | Usage |
|-----------|---------------|-------|
| 宋体 | `\songti` (via fandol) | Chinese body text |
| 黑体 | `\heiti` (via fandol) | Headings, keyword labels |
| 楷体 | `\kaishu` (via fandol) | Abstract, keyword content |
| Times New Roman | `\textrm` | English content |

### Font Size Mapping
| Word Size | LaTeX Command (v9) | Actual Size |
|-----------|-------------------|------------|
| 2号 | `\erhao` | 22pt |
| 4号 | `\xiaosihao` | 14pt |
| 5号 | `\wuhao` | 10.5pt |
| 小5号 | `\xiaowuhao` | 9pt |
| 6号 | `\liuhao` | 7.5pt |

### Special Handling
- **Superscript numbers**: `\textsuperscript{1}` for author affiliations
- **Math formulas**: `$...$` (inline) or `\[...\]` (display)
- **Figures**: `figure` environment with `\xiaowuhao\songti` caption style
- **Tables**: `table` environment with `booktabs` rules, `\wuhao\kaishu` caption
- **Line spacing**: `\singlespacing` for document (set globally)
- **English font (v10)**: No `\textrm{}` wrapper needed (newtxtext handles it)
- **English font (v9)**: Use `\textrm{...}` for Times New Roman content

## Document Structure Requirements

The converter (when implemented) must recognize and transform:
1. **Journal header** (卷号期号, 年月, 期刊名称) - 小5号宋体
2. **Chinese title** (2号黑体, 居中)
3. **Author info** (5号宋体 with superscript numbers)
4. **Affiliations** (小5号宋体)
5. **Abstract/Keywords** (5号黑体 label, 5号楷体 content)
6. **English title** (4号黑体)
7. **English abstract** (5号黑体 label, 5号白体 content)
8. **Body text** (一级标题: 4号宋体, 二级标题: 5号黑体, 正文: 5号宋体)
9. **References** (小5号宋体, 双栏排版, 人名不加粗)

## Special Considerations

### For LaTeX Template
1. **Cross-platform Compatibility**: Uses fandol fonts via `ctex` package for consistent rendering
2. **XeLaTeX Required**: Must use XeLaTeX compiler (not PDFLaTeX) for Chinese support
3. **Overleaf Compatible**: Templates work on Overleaf with proper compiler settings
4. **Version Choice**:
   - **v10**: Enhanced English font weight (newtxtext,newtxmath)
   - **v9**: Standard compatibility (times package)

### For Word Converter (When Implementing)
1. **Chinese Typography**: Precise Chinese font handling required
2. **Academic Standards**: Output must exactly match journal's submission requirements
3. **Immediate Compilation**: Generated LaTeX files must compile without errors or manual fixes
4. **Mixed C-E Text**: Proper handling of Chinese-English mixed text is critical

## Implementation Phases (Converter)

According to the PRD, Word converter development should follow:
1. **Phase 1**: Basic Word parsing with python-docx
2. **Phase 2**: Format conversion rules implementation
3. **Phase 3**: Special elements (formulas, tables, figures)
4. **Phase 4**: Optimization and testing

## Validation Criteria

### For LaTeX Template
- ✅ Compiles without errors using XeLaTeX
- ✅ Matches journal formatting requirements
- ✅ Supports Chinese-English mixed typesetting
- ✅ Proper font sizes and families
- ✅ Correct page layout and headers

### For Word Converter (When Implementing)
- Correctly parse Word document structure
- Accurately convert fonts, sizes, line spacing, alignment
- Generate compilable LaTeX files
- Output PDF matches journal formatting requirements
- Handle math formulas, figures, tables, and references correctly

## Version History

### v10 (Current - Recommended)
**Enhanced English Typography**
- Uses `newtxtext,newtxmath` for bolder English font weight
- `fontset=fandol` for Chinese font compatibility
- Simplified font commands (no `\textrm{}` wrapper needed)
- Improved bibliography formatting
- Better visual match to original journal template

### v9 (Stable Alternative)
**Standard Times Font**
- Uses `times` package for English content
- `fontset=ubuntu` for Chinese fonts
- Reliable compatibility across platforms
- English title uses simplified `\bfseries` command

### v8
**Layout Refinements**
- Header alignment improvements
- Spacing adjustments
- Bibliography dual-column layout

### v2-v7
**Iterative Development**
- Progressive format refinements
- See V2-V5_MODIFICATION_SUMMARY.md for details
