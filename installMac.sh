#!/bin/bash
# Workflow — 安装脚本（OpenCode）
# 用法：在目标项目根目录运行：bash installMac.sh

set -e

WORKFLOW_DIR="$(dirname "$0")"
PROJECT_ROOT="$(dirname "$WORKFLOW_DIR")"

echo "安装 Workflow..."

mkdir -p "$PROJECT_ROOT/.opencode/agents"
cp "$WORKFLOW_DIR/agents/"*.md "$PROJECT_ROOT/.opencode/agents/"
echo "  已安装 agents/ 到 .opencode/agents/"

rm -rf "$PROJECT_ROOT/.opencode/skills"
mkdir -p "$PROJECT_ROOT/.opencode/skills"
cp -r "$WORKFLOW_DIR/skills/"* "$PROJECT_ROOT/.opencode/skills/"
echo "  已复制技能到 .opencode/skills/"

rm -rf "$PROJECT_ROOT/.opencode/tools"
mkdir -p "$PROJECT_ROOT/.opencode/tools"
cp -r "$WORKFLOW_DIR/tools/"* "$PROJECT_ROOT/.opencode/tools/"
echo "  已复制 tools 到 .opencode/tools/"

cp -r "$WORKFLOW_DIR/tools/dingtalk-prd-publisher/runtime-adapter" "$PROJECT_ROOT/.opencode/skills/dingtalk-prd-publisher"
cp -r "$WORKFLOW_DIR/tools/yunxiao-work-item-publisher/runtime-adapter" "$PROJECT_ROOT/.opencode/skills/yunxiao-work-item-publisher"
echo "  已复制 runtime-adapters 到 .opencode/skills/（opencode 可发现）"

cp "$WORKFLOW_DIR/opencode.json" "$PROJECT_ROOT/.opencode/"
echo "  已安装 opencode.json 到 .opencode/"

cp "$WORKFLOW_DIR/AGENTS.md" "$PROJECT_ROOT/.opencode/"
echo "  已安装 AGENTS.md 到 .opencode/"

echo "完成。重新加载 OpenCode 即可生效。"
