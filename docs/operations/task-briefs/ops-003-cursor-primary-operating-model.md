# Task Brief: `OPS-003 Cursorを主実行環境にする運用見直し`

- 状態：Done
- 作成日：2026-08-17
- 更新日：2026-08-17
- Workstream：Operations
- 担当Lead：AI PM
- Specialist：なし
- Reviewer：責任者

## 目的

GYOJI-CHOのタスク推進と変更作業を、Codexデスクトップ前提からCursor主軸へ切り替え、役割定義・ブランチ・品質チェック・正本文書を矛盾なく使える状態にする。

## 対象範囲

- Cursor用の役割定義、Project Rules、タスク実行スキル
- `AGENTS.md`、運用正本、README、実行計画のCursor主軸化
- Codex定義の互換補助化
- `scripts/check-docs.ps1` と `docs-quality` の必須ファイル更新
- 本Task Briefの作成

## 対象外

- Mission、対象ユーザー、Frozen Scope、KPI / Gate、データ方針、予算、Go / Pivot / Stopの変更
- GitHub Project、Issue、Rulesetの外部操作
- Codex定義の削除
- push、PR作成、公開、課金、契約

## 入力・参照資料

- [`AGENTS.md`](../../../AGENTS.md)
- [`project-operating-policy.md`](../../project-operating-policy.md)
- [`ai-agent-operating-model.md`](../../ai-agent-operating-model.md)
- [`phase-0-2-execution-plan.md`](../../phase-0-2-execution-plan.md)
- [Cursor: Rules](https://cursor.com/docs/rules.md)
- [Cursor: Subagents](https://cursor.com/docs/subagents.md)
- [Cursor: Skills](https://cursor.com/docs/skills.md)

## 依存関係・判断ID

- 依存タスク：`OPS-001`
- 関連D-ID：なし。実行ツールの主軸変更であり、事業判断の変更ではない
- 未確定でも草案可能な範囲：対象範囲全体

## 成果物

| 成果物 | 保存場所 | 期待する形式 |
|---|---|---|
| Cursor役割定義 | `.cursor/agents/` | 7ロール。Gate Reviewerは `readonly: true` |
| Cursor Rules / Skill | `.cursor/rules/`、`.cursor/skills/execute-gyoji-cho-task/` | 常時適用の実行ルールとタスク着手手順 |
| Codex互換説明 | `.codex/README.md` と `.codex/agents/*.toml` | 正本はCursor、Codexは補助 |
| 正本文書更新 | `AGENTS.md`、運用・実行文書、README | Cursor主軸、`cursor/` ブランチ |
| 品質チェック | `scripts/check-docs.ps1`、`.github/workflows/docs-quality.yml` | Cursor定義を必須化 |

## 完了条件

- [x] 実行計画に記載された完了条件を満たす（運用改善のため本Briefの完了条件を正とする）
- [x] Cursor役割定義が `.cursor/agents/` にあり、Codex側は互換補助として残っている
- [x] 新規AIブランチの既定が `cursor/<task-id>-<short-slug>` になっている
- [x] 正本文書がCursor主軸で矛盾していない
- [x] ReviewerがPassしている
- [x] Issue、依存関係、必要な正本文書を更新した（本Briefと正本。GitHub Issueは未起票のためPRで追跡）

## 証拠・確認方法

- この環境に `pwsh` がなく `pwsh ./scripts/check-docs.ps1` は実行できなかったため、同内容のPython検査を実施し成功した
- Cursor / Codex役割定義の検査も成功した（7 + 7）
- `.cursor/agents/gate-reviewer.md` が `readonly: true` を持つ
- 文書中の新規作業指示が `codex/` ブランチを既定にしていない

## 操作権限

- 許可された操作：リポジトリ内の文書・設定編集、ローカルの文書チェック
- 人間承認が必要な操作：push、PR作成、GitHub Project / Issueの外部更新
- 禁止する操作・データ：秘密情報のcommit、D-IDの独断変更、Codex定義の無断削除

## エスカレーション条件

- D-ID、Gate、Frozen Scope、予算、契約、公開、個人情報に変更が必要
- 完了条件を満たせず例外承認が必要
- Workstream間の前提に矛盾がある

## Reviewer記録

- 判定：Pass
- 確認日：2026-08-17
- 確認内容：責任者がCursor主軸化の構成と運用見直しを承認した
- 残存リスク：Codex互換ファイルは手動同期が必要。役割を変えるときは `.cursor/agents/` を先に更新すること
