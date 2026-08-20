---
description: 阶段三：独立评审
disable: true
---

# 阶段三：独立评审（prd-review）

## 加载技能
- `skills/prd-review` — 从产品、研发、测试角度检查是否可交付

## 触发条件
已有 PRD（及适用 UI 证据），需要独立评审。

## 流程
1. 为所有 PRD/UI artifact 写入实际 `producer_identity`
2. 独立 `prd-review` 检查完整性、可实现性、可测试性和交付证据
3. 把当前 fingerprint、覆盖的 Maker identities 和结论持久化到 `pre_split_review`
4. 未达 `ready` 时只修阻断项，禁止生成版本计划或事项草稿

## 门禁
`pre_split_review` 已持久化 + validator 判定 current/ready + 无 P0/P1
