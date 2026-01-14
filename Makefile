# Makefile for XJTU Journal LaTeX Template
# 使用方法：
#   make          - 编译一次
#   make all      - 完整编译（两次，生成完整引用）
#   make clean    - 清理临时文件
#   make view     - 打开生成的PDF
#   make help     - 显示帮助

# 文件名
FILE = xjtujournal_template
MAIN_TEX = $(FILE).tex
PDF = $(FILE).pdf

# 编译器
COMPILER = xelatex

# 编译选项
FLAGS = -synctex=1 -interaction=nonstopmode -file-line-error

# 默认目标
.PHONY: all
all: $(PDF)

# 完整编译（两次）
$(PDF): $(MAIN_TEX)
	@echo "=== 第一次编译 ==="
	$(COMPILER) $(FLAGS) $(MAIN_TEX)
	@echo "=== 第二次编译（生成引用和页码）==="
	$(COMPILER) $(FLAGS) $(MAIN_TEX)
	@echo "=== 编译完成 ==="
	@echo "输出文件: $(PDF)"

# 单次编译
.PHONY: once
once:
	@echo "=== 编译中 ==="
	$(COMPILER) $(FLAGS) $(MAIN_TEX)

# 清理临时文件
.PHONY: clean
clean:
	@echo "=== 清理临时文件 ==="
	rm -f *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.fls *.fdb_latexmk *.synctex.gz
	@echo "清理完成"

# 深度清理（包括PDF）
.PHONY: distclean
distclean: clean
	@echo "=== 删除PDF文件 ==="
	rm -f $(PDF)
	@echo "深度清理完成"

# 打开PDF
.PHONY: view
view: $(PDF)
	@if command -v open >/dev/null 2>&1; then \
		open $(PDF); \
	elif command -v xdg-open >/dev/null 2>&1; then \
		xdg-open $(PDF); \
	elif command -v cmd >/dev/null 2>&1; then \
		cmd /c start $(PDF); \
	else \
		echo "无法自动打开PDF，请手动打开 $(PDF)"; \
	fi

# 显示帮助
.PHONY: help
help:
	@echo "西安交通大学学报 LaTeX 模板 - Makefile 使用说明"
	@echo ""
	@echo "可用命令："
	@echo "  make          - 完整编译（两次）"
	@echo "  make all      - 同上"
	@echo "  make once     - 单次编译"
	@echo "  make clean    - 清理临时文件"
	@echo "  make distclean - 清理所有文件（包括PDF）"
	@echo "  make view     - 打开生成的PDF"
	@echo "  make help     - 显示此帮助信息"
	@echo ""
	@echo "示例："
	@echo "  make all      # 完整编译模板"
	@echo "  make clean    # 清理临时文件"
	@echo ""
	@echo "注意：必须使用 XeLaTeX 编译器"

# 检查编译器
.PHONY: check
check:
	@echo "=== 检查编译器 ==="
	@command -v $(COMPILER) >/dev/null 2>&1 || \
		(echo "错误：未找到 $(COMPILER) 编译器！"; \
		echo ""; \
		echo "请先安装 LaTeX："; \
		echo "  macOS:   安装 MacTeX (https://www.tug.org/mactex/)"; \
		echo "  Windows: 安装 MiKTeX (https://miktex.org/)"; \
		echo "  Linux:   sudo apt install texlive-xetex"; \
		exit 1)
	@echo "$(COMPILER) 版本信息："
	@$(COMPILER) --version
	@echo ""
	@echo "编译器检查通过！"
