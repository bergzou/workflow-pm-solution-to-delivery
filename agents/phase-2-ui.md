---
description: 阶段二：设计稿与 UI 证据链
disable: true
---

# 阶段二：设计稿与 UI（design → ui-mockup）

## 加载技能
- `skills/design`（花叔Design）— 用 HTML 生成高保真原型/设计稿（三方向初稿、交互原型、视觉变体）
- `skills/ui-mockup-desktop-workbench` — 结构、状态、HTML、实现 handoff

## 触发条件
PRD 涉及用户可见页面/弹窗/表单/状态提示。

## 流程（先设计稿，再 handoff）

1. **出设计稿**：加载 `design` 技能，按三方向硬门给出 3 个差异化真实初稿（每方向 1 个完整 HTML + 截图）供用户选择
2. **用户选定**：用户基于真实视觉选择方向，把「展示版本、截图路径、用户选择原话」写入 `direction-approved.md`
3. **实现 handoff**：方向选定后，加载 `ui-mockup-desktop-workbench`，先解析唯一 UI 基线（frontend-repo > design-system > reference-html > screenshot）
4. **产出交付物**：目标态 HTML/preview + 关键状态截图，截图直接嵌入 PRD 对应功能/状态章节
5. **证据链**：记录 `mockup-evidence.json`（基线 hash、HTML hash、截图 hash、PRD hash），通过新鲜度门禁；standalone HTML 明确标记为视觉交付参考，不等于生产代码

## 门禁
`direction-approved.md` 已落档（用户选择原话）+ 目标态 HTML/预览 + 关键状态截图 + 证据新鲜
无界面需求：记录 `ui_required: false` 可解释原因，跳过本阶段
