# Workflow PM Solution To Delivery

> AI 产品经理「方案到交付」工作流，安装到 `.opencode/` 目录下。
> 把已确认方案转成经过独立 Review 的可交付产品包（`package_ready`）；发布只做 dry-run，真实写入需宿主授权。

## 安装

```bash
# Mac / Linux
git clone <repo-url> /tmp/workflow-pm-solution-to-delivery
cd <your-project>
bash /tmp/workflow-pm-solution-to-delivery/installMac.sh

# Windows
git clone <repo-url> %TEMP%\workflow-pm-solution-to-delivery
cd <your-project>
%TEMP%\workflow-pm-solution-to-delivery\installWin.ps1
```

## 结构

```
.opencode/
├── opencode.json                 # 定义 workflow-pm-solution-to-delivery agent
├── AGENTS.md                     # 工作流规范（阶段表/技能表/门禁/外部写入边界）
├── agents/
│   ├── workflow.md                # 总控 agent：阶段判断、红线（单一源）
│   ├── phase-1-prd.md             # 一：PRD 编写（prd-architect）
│   ├── phase-2-ui.md              # 二：设计稿 + UI 证据链（design → ui-mockup）
│   ├── phase-3-review.md          # 三：独立评审（prd-review → pre_split_review）
│   ├── phase-4-issues.md          # 四：拆研发事项（prd-to-issues）
│   └── phase-5-delivery.md        # 五：最终评审 + validator + dry-run
├── skills/                        # 7 个资产 + 2 个 publisher 适配，install 时复制
│   ├── solution-to-delivery/  prd-architect/  design/  ui-mockup-desktop-workbench/
│   ├── prd-review/  prd-to-issues/  delivery-loop/
│   └── dingtalk-prd-publisher/  yunxiao-work-item-publisher/   # runtime-adapter
└── tools/                         # 3 个工具（含 TOOL.md 说明）
    ├── product-delivery/          # validator：Manifest 确定性校验（无副作用）
    ├── dingtalk-prd-publisher/    # publisher：钉钉发布（外部写入）
    └── yunxiao-work-item-publisher/  # publisher：云效工作项（外部写入）
```

## 技能清单

| 资产 | 类型 | 用途 |
|------|------|------|
| `solution-to-delivery` | Workflow 入口 | 完整交付编排（SKILL.md + WORKFLOW.md） |
| `prd-architect` | 原子 Skill | PRD 起草 + Manifest |
| `design` | 原子 Skill | 高保真设计稿（三方向初稿、交互原型、视觉变体） |
| `ui-mockup-desktop-workbench` | 原子 Skill | 结构→实现 handoff（HTML/截图证据链） |
| `prd-review` | 原子 Skill | 独立评审（readiness） |
| `prd-to-issues` | 原子 Skill | 版本/研发事项拆分 |
| `delivery-loop` | Loop | PRD/UI/截图/Manifest 最终 Review |

## 工具说明（tools/）

- `product-delivery`（validator）：Manifest 确定性校验，无副作用
- `dingtalk-prd-publisher` / `yunxiao-work-item-publisher`（publisher）：**外部写入**，当前 Agent Runtime 只支持 dry-run；真实写入返回 `publish_status: authorization_required`

## 工作流

```
方案 → prd-architect → design(三方向设计稿) → ui-mockup? → prd-review(pre_split) → prd-to-issues? → delivery-loop → validator → package_ready
```

- 有界面 → 先 design 出三方向真实初稿，用户选定后 ui-mockup 做实现 handoff（HTML/截图证据，新鲜度 hash 门禁）
- 独立评审通过前禁止生成版本/事项
- 最终 Reviewer 覆盖全部 artifact producers 且独立
- 发布仅 dry-run，真实写入 `authorization_required`

## 与 workflow-pm-problem-to-solution 的关系

本模板输入是 `solution_confirmed` 方案；问题未确认先走另一个模板。
