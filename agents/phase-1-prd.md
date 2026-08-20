---
description: 阶段一：PRD 编写
disable: true
---

# 阶段一：PRD（prd-architect）

## 加载技能
- `skills/prd-architect` — PRD 起草、模板选择、版本记录、页面证据链

## 触发条件
有已确认方案，需要产出 PRD。

## 流程
1. 检查方案是否达到 Entry Gate（目标/范围/关键流程/约束/风险）；未达到交回 problem-to-solution
2. 选择 PRD 模板（lite / standard / ai-native），初始化 Product Delivery Manifest
3. 按「版本记录」规则创建/修订 PRD，正文以功能模块为主
4. 页面型 PRD 联动 UI 证据链（阶段二）；无界面则记录 `ui_required: false` 原因
5. 运行 PRD shape 自检，状态停在 `review_pending`

## 门禁
PRD 与已确认方案一致 + Manifest 初始化 + `review_pending`（**不得自评 ready**）
