---
description: 阶段四：拆研发事项
disable: true
---

# 阶段四：拆事项（prd-to-issues）

## 加载技能
- `skills/prd-to-issues` — 按 vertical slice、依赖和版本切研发事项

## 触发条件
用户要求版本或研发拆分（V1/V2/V3）。

## 流程
1. 先确认 `pre_split_review` 已被 validator 判定 current/ready
2. 按 vertical slice、依赖和版本切片拆分研发事项，产出版本计划、事项草稿和 PRD 覆盖矩阵
3. 拆分产物写入 Manifest；Backlog Splitter 用 actor-scoped validator 绑定 identity 到每项产物
4. 更新文件 hash 和 package fingerprint

## 门禁
`pre_split_review` current/ready + 版本/事项覆盖 PRD + identity 绑定完成
未经用户批准不发布事项
