---
description: 阶段五：交付评审与 Package
disable: true
---

# 阶段五：交付评审（delivery-loop + validator）

## 加载技能
- `skills/delivery-loop` — PRD/UI/截图/Manifest 最终独立 Review
- `tools/product-delivery` — Product Delivery Manifest 确定性校验

## 流程
1. 运行 Product Delivery validator，确认 Manifest 与 artifacts/producers/Review fingerprint 一致
2. 使用 `$delivery-loop` 对完整 Package 做最终独立 Review，循环到 `package_ready`、Human Gate 或阻塞
3. 最终 Reviewer 覆盖全部 artifact producers 且与其身份独立；版本拆分产物变化时旧 Review 失效
4. 用户要求发布时：Package Publisher 做完整 dry-run
5. 当前 Agent Runtime 无可信 host approval capability：保持 `status: package_ready`，返回 `publish_status: authorization_required`

## 门禁
`package_ready` | `review_pending` | `human_gate` | `blocked`
发布真实写入永远 `authorization_required`，不改走 Legacy direct mode 绕过 Package 合同
