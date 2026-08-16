# Task Brief: `P0-PROD-04 MLPのMust / May / Won'tを固定する`

- 状態：Done
- 作成日：2026-08-16
- 更新日：2026-08-16
- Workstream：Product
- 担当Lead：Product Lead
- Specialist：なし
- Reviewer：Validation Lead / Legal Lead
- GitHub Issue：[#36](https://github.com/ryo-chan-k6/gyoji-cho-lp/issues/36)

## 目的

既決定の対象コンテンツ、必須体験、追加機能の除外、準備CTA、Phase 1上限を一つのFrozen Scopeへ固定する。Phase 1で新しい事業判断を行わず、各Workstreamが同じ実装境界・品質Gate・停止線を参照できる状態を作る。

## 対象範囲

- D-002 / D-003の家族固有行事、月齢、季節文化
- D-004 / D-017のMustと最小受入条件
- D-005およびD-004のWon't
- Mayの有無と実装詳細との境界
- D-013のコンテンツ公開Gate、Local-first・Analytics禁止境界
- D-021の期間・責任者時間・追加費用上限
- Scope変更、上限接近、Gate未達時の停止・Human escalation
- Product / Marketing / Data / Legal / Validation / Operationsへの引継ぎ

## 対象外

- Must / Won't、対象コンテンツ、開発上限の新規判断または変更
- 日付計算、端末保存、通知、対象OS等の技術方式（`D-006`）
- Analytics基盤、イベント名、保持、分母、観測窓、閾値（`D-007〜009`）
- 配布方法、Apple契約主体・支出（`D-011〜012`）
- 高忠実度UI、最終文言、実コンテンツ本文、実装コード
- Go / Pivot / Stop基準の確定（`P0-VAL-04`）

## 入力・参照資料

- [`Product validation brief`](../../workstreams/product/product-validation-brief.md)
- [`Event scope matrix`](../../workstreams/product/event-scope-matrix.md)
- [`MLP experience map`](../../workstreams/product/mlp-experience-map.md)
- [`Assumption / Evidence Register`](../../workstreams/validation/assumption-evidence-register.md)
- [`D-002`](../decisions/d-002-family-events.md)、[`D-003`](../decisions/d-003-seasonal-culture.md)
- [`D-004`](../decisions/d-004-mlp-required-scope.md)、[`D-005`](../decisions/d-005-mlp-additional-features.md)
- [`D-013`](../decisions/d-013-content-quality.md)、[`D-017`](../decisions/d-017-preparation-intent-cta.md)
- [`D-021`](../decisions/d-021-phase-1-development-cap.md)
- [`business-strategy.md`](../../business-strategy.md)
- [`phase-0-2-execution-plan.md`](../../phase-0-2-execution-plan.md)

## 依存関係・判断ID

- 依存タスク：`P0-PROD-01〜03`（完了済み）
- 関連D-ID：`D-002/003/004/005/013/017/021`（Decided）
- 未確定だが本Taskで決めないD-ID：`D-006〜012`、`D-014〜016`。`D-011`は実行計画どおり`P1-MKT-02`／`P1-PROD-06`前に確定し、Phase 1開始条件へ前倒ししない
- 未確定でも固定可能な範囲：ユーザー価値・機能・コンテンツ・上限は固定し、技術・計測・配布の方式を依存条件として後続へ渡す

## 成果物

| 成果物 | 保存場所 | 期待する形式 |
|---|---|---|
| MLP Frozen Scope / Frozen Backlog | `docs/workstreams/product/mlp-frozen-scope.md` | Must / May / Won't、受入条件、対象コンテンツ、非機能境界、上限、変更管理、Gate、Workstream引継ぎを含むMarkdown |

## 完了条件

- [x] D-002 / D-003の対象と重複ルールが追跡できる
- [x] D-004 / D-017のMustが最小受入条件付きで列挙されている
- [x] Mayの有無と、Must内の実装詳細との境界が明確である
- [x] D-004 / D-005のWon'tが入口・権限・Analytics・訴求まで含めて列挙されている
- [x] D-013、データ禁止境界、Legal / Privacy / App Store Gateが維持されている
- [x] D-021の目標・停止線・追加費用・上限超過時の扱いが明記されている
- [x] Scope変更にHuman OwnerとD-ID / Frozen Scope改定が必要な条件が明記されている
- [x] 後続Workstream・Taskへの入力が追跡できる
- [x] ReviewerがPassしている
- [x] Issueと引継ぎメモを更新した
- [ ] GitHub Projectを更新した

## 証拠・確認方法

- D-002 / D-003 / D-004 / D-005 / D-013 / D-017 / D-021との全項目突合
- Experience MapのS00〜S14、状態・例外、Data / Legal / Validation引継ぎとの突合
- Validation Leadによる仮説観測、未観測・分母、上限・変更管理の独立レビュー
- Legal Leadによる目的限定、禁止データ、全削除、D-013、誤認表示、公開Gateの独立レビュー
- `pwsh ./scripts/check-docs.ps1`
- `git diff --check`

## 操作権限

- 許可された操作：既決定事項の転記、受入条件の明文化、依存・引継ぎ・変更手順の整理、Issue / Project更新
- 人間承認が必要な操作：Must / May / Won't、対象コンテンツ、D-021上限、データ利用、予算、契約、公開、Gate例外の変更
- 禁止する操作・データ：未承認機能の追加、工数都合のMust・品質・計測削減、正確な子ども情報等の外部送信、未承認コンテンツの公開転用

## エスカレーション条件

- Frozen ScopeのMustが10週または280時間の早い方に収まらない見込み
- D-006〜009 / D-011〜012の決定がFrozen Scopeと矛盾する
- D-013品質、計測可能性、Legal / Privacy / App Store Gateの削減が必要
- Must / May / Won't、対象、上限、予算、契約、公開、個人情報に変更が必要
- 完了条件を満たせず例外承認が必要

## Reviewer記録

- 判定：Pass（軽微Rework後に再レビュー）
- 確認日：2026-08-16
- 確認内容：Product LeadがD-011判断時期とD-006技術中立性、Validation Leadが主要仮説・分母・不明条件・正式Gate接続、Legal Leadが外部Analytics削除境界と工程別引継ぎを確認。各初回指摘を反映後、3者の再レビューでPass
- 残存リスク：D-006〜009 / D-011〜012確定後のEAC再評価、短期Phase 2の季節文化未観測月、Won't機能の効果とMON-02を直接検証できないこと。後続D-ID・Taskで扱う
