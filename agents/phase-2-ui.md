---
description: 阶段二：UI 与证据链
disable: true
---

# 阶段二：UI（ui-mockup-desktop-workbench）

## 加载技能
- `skills/ui-mockup-desktop-workbench` — 结构、状态、HTML、高保真 UI 与 handoff

## 触发条件
PRD 涉及用户可见页面/弹窗/表单/状态提示。

## 流程
1. 先解析唯一 UI 基线（前端仓库 > design-system > reference-html > screenshot）
2. 生成项目 UI 对齐的 HTML/preview + 关键状态截图
3. 截图直接嵌入 PRD 对应功能/状态章节
4. 记录 `mockup-evidence.json`（基线 hash、HTML hash、截图 hash、PRD hash），通过新鲜度门禁
5. standalone HTML 明确标记为视觉交付参考，不等于生产代码

## 门禁
目标态 HTML/预览 + 关键状态截图 + 证据新鲜（HTML 更新后旧截图必须重拍）
无界面需求：记录 `ui_required: false` 可解释原因，跳过本阶段
