# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Word to LaTeX Template Converter** for Xi'an Jiaotong University Journal (西安交通大学学报). The project converts Word format submission templates to LaTeX format, enabling researchers to use LaTeX's powerful typesetting while maintaining exact compliance with the journal's formatting requirements.

**Current Status**: Planning phase - no code has been written yet. The project is defined by the PRD (PRD_Word转LaTeX模板转换器.md) with complete specifications.

## Document Reference

- **PRD**: `PRD_Word转LaTeX模板转换器.md` - Complete product requirements document in Chinese
- **Source Template**: `本刊投稿格式模板.docx` - Word template to convert (213KB)
- **Reference PDF**: `本刊投稿格式模板.pdf` - Visual reference (4 pages, 656KB)

## Planned Architecture

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

## Planned Core Components

- `word_to_latex.py` - Main converter class `WordToLatexConverter`
- `format_mapper.py` - Format mapping logic
- `latex_generator.py` - LaTeX code generation
- `utils.py` - Utility functions

## Technology Stack

### Python Dependencies (Proposed)
- **python-docx** - Primary Word document parsing
- **docx2python** - Alternative for format extraction
- **mammoth** - Optional Word to HTML/Markdown conversion
- **pylatex** - LaTeX generation from Python
- **jinja2** - Template engine (if needed)

### LaTeX Requirements
All generated LaTeX documents must include:
```latex
\documentclass[12pt,a4paper]{article}
\usepackage[UTF8]{ctex}      % Chinese support
\usepackage{times}            % Times New Roman font
\usepackage{setspace}         % Line spacing
\usepackage{graphicx}         % Images
\usepackage{amsmath}          % Math formulas
\usepackage{booktabs}         % Table formatting
\usepackage{geometry}         % Page layout
\usepackage{hyperref}         % Hyperlinks
```

## Critical Format Mappings

### Font Mapping
| Word Font | LaTeX Command | Usage |
|-----------|---------------|-------|
| 宋体 (SimSun) | `\songti` or `\rmfamily` | Chinese body text |
| 黑体 (SimHei) | `\heiti` or `\bfseries` | Headings, keyword labels |
| 楷体 (KaiTi) | `\kaishu` | Abstract, keyword content |
| Times New Roman | `\textrm` | English content |
| 白体 | `\textrm` | English body (vs black) |

### Font Size Mapping
| Word Size | LaTeX Command | Actual Size |
|-----------|---------------|------------|
| 2号 | `\zihao{2}` | 22pt |
| 4号 | `\zihao{4}` | 14pt |
| 5号 | `\zihao{5}` | 10.5pt |
| 小5号 | `\zihao{-5}` | 9pt |
| 6号 | `\zihao{6}` | 7.5pt |

### Special Handling
- **Superscript numbers**: `\textsuperscript{1}` for author affiliations
- **Math formulas**: `$...$` (inline) or `\[...\]` (display)
- **Figures**: `figure` environment with `\zihao{-5}\songti` caption style
- **Tables**: `table` environment with `booktabs` rules
- **Line spacing**: `\onehalfspacing` for body, `\singlespacing` for abstract

## Document Structure Requirements

The converter must recognize and transform:
1. **Journal header** (卷号期号, 年月, 期刊名称) - 小5号宋体
2. **Chinese title** (2号黑体, 居中)
3. **Author info** (5号宋体 with superscript numbers)
4. **Affiliations** (小5号宋体)
5. **Abstract/Keywords** (5号黑体 label, 5号楷体 content)
6. **English title** (4号黑体)
7. **English abstract** (5号黑体 label, 5号白体 content)
8. **Body text** (一级标题: 4号宋体, 二级标题: 5号黑体, 正文: 5号宋体)
9. **References** (5号黑体 title, 小5号宋体 content)

## Development Commands

When implementing, you will need to:
- Create Python virtual environment: `python -m venv venv`
- Install dependencies: `pip install python-docx pylabric jinja2`
- Test LaTeX compilation: `xelatex output.tex` (requires XeLaTeX for Chinese support)
- Verify output PDF matches template requirements

## Special Considerations

1. **Chinese Typography**: This project requires precise Chinese font handling. Always test with actual Chinese content.
2. **Academic Standards**: The output must exactly match the journal's submission requirements.
3. **Immediate Compilation**: Generated LaTeX files must compile without errors or manual fixes.
4. **Mixed C-E Text**: Proper handling of Chinese-English mixed text is critical.

## Implementation Phases

According to the PRD, development should follow:
1. **Phase 1** (1-2 days): Basic Word parsing with python-docx
2. **Phase 2** (2-3 days): Format conversion rules implementation
3. **Phase 3** (2-3 days): Special elements (formulas, tables, figures)
4. **Phase 4** (1-2 days): Optimization and testing

## Validation Criteria

Any implementation must meet these standards:
- Correctly parse Word document structure
- Accurately convert fonts, sizes, line spacing, alignment
- Generate compilable LaTeX files
- Output PDF matches journal formatting requirements
- Support Chinese-English mixed typesetting
- Handle math formulas, figures, tables, and references correctly
