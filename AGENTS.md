# 🔴 AGENTS.md — Workflow 工作流规范（PM 方案到交付模板源）

> 🌐 **沟通语言：中文**
> ⚠️ **铁律（任何情况不可违反）：已确认方案才能进入本流程；PRD Maker 不得自评 ready；独立 Review 通过前禁止生成版本/事项拆分；Package 真实写入保持 authorization_required，只做 dry-run。**
> ⚠️ **修改一处，同步更新关联产物（PRD、UI/HTML/截图、Manifest、版本拆分）。**
> ⚠️ **删除文件必须先征得用户同意。**

> 📌 本文件是 workflow 模板仓库的 AGENTS.md 源，通过 `installWin.ps1` / `installMac.sh` 复制到项目的 `.opencode/AGENTS.md`。**修改本文件后需重新运行 install 脚本同步，并重启 opencode 生效。**
> 📌 本模板只推进「已确认方案 → 可交付产品包」，输出 `package_ready`；发布真实写入需可信宿主授权。

---

## 🔴🔴🔴 每次回复前必须执行的 3 行清单（任何任务前完成，缺一不可）

> ⚠️ 纯问答/评审类交互可直接回复，跳过清单。判断标准：是否需要产出交付物（PRD/UI/截图/Manifest/拆事项）。

```
□ 步骤1 → 用 skill 工具加载【当前阶段】对应的技能（查下表）
□ 步骤2 → 输出声明：「阶段X：使用 [技能] 来 [目的]」
□ 步骤3 → 创建 todowrite 清单
```

## 🔴 交付前的必修课（阶段一二必须执行）

**不读完上下文不准写 PRD。** 按以下顺序逐一阅读：

```
步骤0-1 → 读已确认方案（problem-to-solution 输出或用户提供的方案）   # 确认 Entry Gate
步骤0-2 → 读项目目录（prd/、design/、前端仓库、现有 PRD/UI）          # 了解已有资产
步骤0-3 → 确认是否用户可见界面、交付目标（研发/钉钉/云效/本地）、是否需版本拆分
```

读完输出确认：「已完成上下文阅读，基于...推进」

## 🔴 当前阶段判断

**无 PRD → 阶段一 | 有界面无 UI 证据 → 阶段二 | 无独立评审 → 阶段三 | 需版本拆分 → 阶段四 | 需最终评审 → 阶段五（package_ready）**

| 阶段 | 必须加载的技能 | 触发条件 |
|------|--------------|---------|
| 🔴 一 PRD | `prd-architect` | 生成 PRD + Product Delivery Manifest |
| 🔴 二 UI | `ui-mockup-desktop-workbench` | 有用户可见界面，需 HTML/截图证据 |
| 🔴 三 评审 | `prd-review` | 独立检查 PRD/UI 证据，写 `pre_split_review` |
| 🔴 四 拆事项 | `prd-to-issues` | 用户要求版本或研发拆分 |
| 🔴 五 交付评审 | `delivery-loop` + validator | 完整 Package 最终独立 Review |

---

## ❌ 红线（总控，单一源）

**红线完整清单见 `.opencode/agents/workflow.md`**（阶段判断、阶段参考表、红线统一维护在该文件）。
核心铁律：方案未确认不进入本流程；PRD Maker 不自评 ready；UI Producer/Backlog Splitter 不从 Review 覆盖范围省略；独立评审通过前不生成版本/事项；Package 只做 dry-run，真实写入 `authorization_required`；违规时用户说"你违规了"立即纠正。

---

## 🟢 需求分级（减少流程疲劳）

### 无用户界面的纯逻辑/接口需求
只写 PRD（`ui_required: false` + 可解释原因），跳过阶段二。

### 单点 PRD 修订（已有交付包）
只走阶段一（修订 PRD）+ 阶段三（重新评审），跳过不需要的阶段。

### 新页面/完整交付包
必须完整走 5 阶段。

---

## 🔒 阶段门禁（不满足不准进入下一阶段）

```
阶段一 [PRD]
  │ 门禁：PRD 与已确认方案一致，Manifest 初始化，状态 review_pending
  │ 检查：页面型 PRD 必须联动 UI 证据链；禁止 PRD Maker 自评 ready
  ▼
阶段二 [UI]
  │ 门禁：目标态 HTML/预览 + 关键状态截图 + 证据新鲜度（mockup-evidence）
  │ 无界面需求：记录 ui_required=false 的可解释原因
  ▼
阶段三 [评审]
  │ 门禁：独立 prd-review 无 P0/P1，pre_split_review 持久化且 validator 判定 current/ready
  │ ⛔ 未通过时只修阻断项，禁止生成版本计划或事项草稿
  ▼
阶段四 [拆事项]
  │ 门禁：validator 证明 pre_split_review current/ready 后才拆
  │ 检查：版本/事项覆盖 PRD；Backlog Splitter identity 绑定到每项产物
  ▼
阶段五 [交付评审]
  │ 门禁：delivery-loop 最终独立 Review 无阻断 → package_ready
  │ 发布：Package Publisher 只做 dry-run，真实写入返回 publish_status: authorization_required
  ▼
  [Package]
      status: package_ready | review_pending | human_gate | blocked
```

---

## 阶段四铁律（重申）

**独立 Review 通过前禁止生成版本计划或研发事项。** 版本拆分产物必须写入 Manifest，Backlog Splitter 用 actor-scoped validator 把 identity 绑定到每项产物；最终 Reviewer 必须覆盖全部 artifact producers 且与其身份独立。

---

## 外部写入边界

`tools/` 下的 publisher 是副作用拥有者。任何 Skill handoff、Manifest approval、Workflow 串联都不构成可信宿主授权。当前 Agent Runtime 的 Package Publisher 只允许 **dry-run**；真实写入保持 `status: package_ready`，返回 `publish_status: authorization_required` 并停止。Legacy direct publish 仍需用户明确确认，且不能作为 Package 绕过路径。

---

## 工作流入口

| 阶段 | 触发条件 | 参考文件 |
|------|---------|---------|
| 一 PRD | 无 PRD | `.opencode/agents/phase-1-prd.md` |
| 二 UI | 有界面无证据 | `.opencode/agents/phase-2-ui.md` |
| 三 评审 | 无独立评审 | `.opencode/agents/phase-3-review.md` |
| 四 拆事项 | 需版本/研发拆分 | `.opencode/agents/phase-4-issues.md` |
| 五 交付评审 | 需最终 Review | `.opencode/agents/phase-5-delivery.md` |

> 阶段判断规则与红线见总控 `.opencode/agents/workflow.md`。
> Workflow 编排合同见 `skills/solution-to-delivery/WORKFLOW.md`。
