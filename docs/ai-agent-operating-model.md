# GYOJI-CHO AIエージェント運営モデル

最終更新：2026年8月15日
対象計画：[`phase-0-2-execution-plan.md`](phase-0-2-execution-plan.md)
運用方針：[`project-operating-policy.md`](project-operating-policy.md)

## 1. 目的

Product / Marketing / Data / Legal / Validationの5 Workstreamを、AIエージェントを活用して効率的かつ着実に進めるため、役割、権限、タスクの流し方、レビュー、意思決定、Phase Gateの運用を定める。

この文書は組織図だけでなく、次を明確にする運営ルールである。

- 誰が最終判断するか
- AI PMが何を自律的に進めてよいか
- Workstream間の依存関係をどう管理するか
- いつ複数エージェントへ分担するか
- 誰が成果物をレビューし、何をもって完了とするか
- 判断が必要な事項を、どのように責任者へエスカレーションするか

## 2. 基本方針

1. **事業上の最終責任と判断権限は責任者が持つ。** AIは判断材料の作成、実行、検証を担うが、事業責任者にはならない。
2. **AI PMは事業Orchestratorとする。** タスクの準備、依存関係管理、進捗統合、レビュー手配、判断事項の整理を担う。
3. **各WorkstreamにLeadを置く。** Leadは担当領域の文脈と成果物品質を継続して管理する。
4. **担当者A・Bは固定配置しない。** 独立した具体タスクが発生した場合のみ、Specialistを一時的に起動する。
5. **作成と検証を分離する。** 重要成果物とPhase Gateは、作成者とは別のAIがレビューする。
6. **Validationの独立性を守る。** 開発継続を前提にせず、仮説を棄却する証拠も同じ重みで扱う。
7. **AIの会話履歴を正本にしない。** 計画、判断、成果物、根拠、現在地はリポジトリへ記録する。
8. **並列化は独立したタスクに限定する。** 順序依存が強い作業や同じファイルを更新する作業は直列で行う。

## 3. 運営体制

```text
責任者（人間）
├─ 最終判断、予算、公開、契約、個人情報、Go / Pivot / Stop
│
├─ AI PM / 事業Orchestrator
│  ├─ Product Lead
│  │  └─ UX、iOS、コンテンツ等の一時的Specialist
│  ├─ Marketing Lead
│  │  └─ 広告、コピー、クリエイティブ等の一時的Specialist
│  ├─ Data Lead
│  │  └─ 計測設計、分析、QA等の一時的Specialist
│  ├─ Legal Lead
│  │  └─ 規約、表示、プライバシー等の一時的Specialist
│  └─ Validation Lead
│     └─ 調査、実験、インタビュー分析等の一時的Specialist
│
└─ Gate Reviewer / Challenger（一時的な独立AI）
   └─ Phase Gateの証拠、反証、例外、残存リスクをレビュー
```

Leadは永続的な役割、Specialistは必要時に呼び出す実行能力として扱う。すべてのLeadを常時稼働させる必要はなく、依存関係を満たしたWorkstreamだけを起動する。

## 4. 役割と権限

| ロール | 主な責任 | 完了・判断権限 | 禁止事項 |
|---|---|---|---|
| 責任者 | Mission、戦略、D-ID、予算、対外責任、Phase Gate | D-IDとGo / Pivot / Stopの最終決定 | 根拠を確認せずAI提案を承認しない |
| AI PM | Ready判定、優先順位、依存関係、Task Brief、進捗、統合、エスカレーション | 通常タスクの開始、レビュー後の完了処理 | D-ID、Gate基準、予算、公開を独断で決めない |
| Workstream Lead | 担当領域の計画、成果物作成、専門タスク分解、一次品質 | 担当成果物をReviewへ提出 | 他Workstreamの前提や判断IDを変更しない |
| Specialist | 境界が明確な単一タスクの実行 | 指定成果物をLeadへ返却 | 担当外の意思決定、スコープ拡大をしない |
| Reviewer | 完了条件、根拠、整合性、再現性、リスクの検証 | Pass / Reworkを勧告 | 作成者の意図を推測して不足を補完しない |
| Gate Reviewer | Phase Gateの独立検証、反証、残存リスク整理 | Gate判断案を責任者へ提出 | 自ら最終Go / Pivot / Stopを決定しない |

### AI PMの責務

- 実行計画から、依存関係と判断IDを満たしたタスクだけをReadyにする
- タスクごとにTask Briefを作る
- 適切なWorkstream Leadへ割り当てる
- 独立して実行可能な場合のみSpecialistへの分担を許可する
- 成果物のレビュー担当を決める
- Workstream間の矛盾、重複、手戻りを検知する
- 判断が必要な事項をDecision Packへまとめる
- Phase Gate用の証拠を統合する
- タスク状態と成果物の保存場所を更新する

AI PMは成果物を代行作成してもよいが、その場合は自分で承認せず、別のReviewerを必須とする。

## 5. タスク実行フロー

### 5.1 状態

タスク状態は次に統一する。

```text
Backlog → Ready → In Progress → Review → Done
                        ├─ Rework ───────┘
                        ├─ Decision Needed
                        └─ Blocked
```

| 状態 | 条件 |
|---|---|
| Backlog | 依存関係、判断、入力のいずれかが未充足 |
| Ready | 依存関係と必要なD-IDが確定し、Task Briefがある |
| In Progress | 担当LeadまたはSpecialistが作業中 |
| Review | 成果物、根拠、自己確認結果がそろっている |
| Rework | Reviewerが具体的な不足と再確認条件を提示した |
| Decision Needed | AIでは確定できない判断が責任者へ提示されている |
| Blocked | 外部条件または先行成果物待ちで進められない |
| Done | 完了条件を満たし、指定場所に成果物とレビュー記録がある |

### 5.2 実行サイクル

1. 責任者がPhase目標、Gate条件、必要なD-IDを確定する
2. AI PMが依存関係を確認し、実行可能なタスクをReadyにする
3. AI PMがTask Briefを作り、Workstream Leadへ割り当てる
4. Leadが直接実行するか、必要なSpecialistへ限定的に分担する
5. Leadが成果物と根拠をReviewへ提出する
6. 作成者とは別のReviewerが完了条件に照らしてPass / Reworkを返す
7. AI PMが横断整合性を確認し、通常タスクをDoneにする
8. 判断が必要ならDecision Packを責任者へ提示し、原則として本Chat内の判断セッションで決定する
9. Gate到達時はGate Reviewerが反証を含めてレビューし、責任者が最終判断する

## 6. Task Brief

AI PMは、実行を開始する前に最低限次を指定する。保存時は [`operations/task-briefs/TEMPLATE.md`](operations/task-briefs/TEMPLATE.md) を使用する。

```markdown
# Task Brief

- Task ID:
- Workstream:
- 目的:
- 対象範囲:
- 対象外:
- 入力・参照資料:
- 依存タスク:
- 関連する判断ID:
- 担当Lead:
- Specialistを使う場合の分担:
- 成果物と保存場所:
- 完了条件:
- 必要な証拠・確認方法:
- 許可された操作:
- 人間承認が必要な操作:
- Reviewer:
- エスカレーション条件:
```

タスク指示は「調べる」「改善する」だけにせず、成果物、範囲、完了条件、証拠、停止条件まで含める。

## 7. 並列実行とWIP制限

初期運用では次を上限とする。

- プロジェクト全体の `In Progress` は最大3タスク
- 各Workstreamの `In Progress` は原則1タスク
- 同一ファイルまたは同一データセットの編集担当は同時に1エージェント
- 依存関係があるタスクは、先行成果物がReviewを通るまで後続を開始しない
- 調査、比較、テスト、レビュー、独立した成果物作成は並列化候補とする
- 戦略判断、Gate判定、共通仕様の確定、共有ファイル更新は原則直列とする

並列化は人数を埋めるためではなく、待ち時間の短縮または検証範囲の拡大が見込める場合に限る。

## 8. Specialistを追加する条件

固定的な「Lead → 担当者A・B」は置かない。次の条件をすべて満たす場合のみ、一時的なSpecialistへ分担する。

1. 同一Workstream内に独立したReadyタスクが2件以上ある
2. 必要な専門性が明確に異なる
3. 編集対象または成果物の所有範囲が重複しない
4. タスクごとの完了条件を客観的に判定できる
5. Leadが結果を統合し、別のReviewerが検証できる

同じ要件を複数人へ伝言するだけになる場合や、同じ成果物を共同編集する場合はLeadが単独で進める。

## 9. レビュー設計

成果物の性質に応じ、主に次の組み合わせでレビューする。

| 作成Workstream | 主なレビュー観点 | Reviewer候補 |
|---|---|---|
| Product | 仮説整合、計測可能性、表示・データリスク | Validation / Data / Legal |
| Marketing | 訴求と提供価値の一致、計測、誤認表示 | Product / Data / Legal |
| Data | 指標定義、再現性、プライバシー、後付け解釈 | Validation / Legal |
| Legal | 実装・運用との一致、未解決リスク | Product / Data / 責任者 |
| Validation | 反証可能性、サンプル、例外、判定基準の事前固定 | Data / Gate Reviewer |

Legal Leadの成果は法的助言や専門家の最終確認を代替しない。契約、規制解釈、個人情報など影響の大きい論点で専門家確認が必要と判断した場合、AIは残存リスクとして作業を止め、責任者へ提示する。外部相談を実施するには、支出・契約前に `D-020` を改定する。

## 10. 判断とエスカレーション

[`phase-0-2-execution-plan.md`](phase-0-2-execution-plan.md) のD-IDは、原則として本Chat内で責任者が決める。AI PMは論点が混ざらないよう判断テーマを区切り、判断を求める際に次のDecision Packを作成する。

決定後は [`operations/decisions/TEMPLATE.md`](operations/decisions/TEMPLATE.md) を使ってリポジトリへ記録し、影響する正本文書、Task Brief、Issueを同じ変更単位で更新する。

```markdown
# Decision Pack

- 判断ID:
- 判断期限:
- 決めること:
- 背景と現在の制約:
- 選択肢:
- AI PMの推奨案と理由:
- 根拠・不確実性:
- 採用しない場合の影響:
- 影響を受けるタスク:
- 見直し条件:
```

次の場合は作業を止め、責任者へエスカレーションする。

- D-IDまたはGate基準の新設・変更が必要
- Mission、対象ユーザー、MLPのFrozen Scopeに影響する
- 予算、広告出稿、契約、App Store公開など対外的な状態変更が必要
- 個人情報、子どもの情報、外部SDK、法的リスクの扱いが変わる
- 完了条件を満たせず、例外承認が必要
- 複数Workstreamの前提が矛盾している

## 11. 操作権限と人間承認

| 操作 | AIによる実行 |
|---|---|
| リポジトリ内の資料調査、分析、草案作成 | Task Briefの範囲内で可 |
| リポジトリ内の編集、非破壊的な検証 | Task Briefで許可された範囲内で可 |
| ローカルのブランチ・コミット | 運用方針で許可されている場合のみ可 |
| 外部サービスへの公開、push、PR作成 | 原則として責任者の承認が必要 |
| 広告出稿、購入、課金、予算変更 | 責任者の事前承認が必須 |
| メール・SNS・事業者・ユーザーへの送信 | 責任者の事前承認が必須 |
| 契約、規約同意、Apple関連の申請 | 責任者の事前承認が必須 |
| 個人情報の取得・送信・削除方針変更 | 責任者の事前承認が必須 |
| 破壊的操作、復旧困難な変更 | 対象確認と責任者の事前承認が必須 |

権限はエージェントの役職名ではなく、Task Briefと実行環境の制約で管理する。

## 12. Phase Gate運用

Phase Gateでは、AI PMが進捗報告をするだけでは不十分とする。最低限、次をそろえる。

- Gate対象タスクと完了条件の充足状況
- 成果物への参照
- KPIの定義、分母、期間、除外条件
- 事前に固定した判定基準との比較
- 仮説を支持する証拠と棄却する証拠
- 例外、欠測、データ品質、法的リスク
- Gate Reviewerの反証と残存リスク
- AI PMのGo / Pivot / Stop推奨案
- 責任者の最終決定と決定日

AI PM、Workstream Lead、Gate Reviewerのいずれも、責任者に代わってGateを通過させない。

## 13. 運営リズム

### タスク単位

- AI PMがReady確認とTask Brief作成
- Leadが実行し、Reviewerが検証
- AI PMが状態と依存関係を更新

### 週次

責任者とAI PMで次を確認する。

- 完了したタスクと受け入れた証拠
- In Progress、Blocked、Decision Needed
- 次にReadyにする最大3タスク
- 予算、期間、スコープの消費状況
- 新たに発生したリスクと判断期限

### Phase Gate時

- Gate Reviewerを一時的に起動
- Gate資料を独立レビュー
- 責任者がGo / Pivot / Stopまたは次Phase開始可否を決定
- 判断記録と影響タスクを更新

## 14. 初期導入順

1. `AGENTS.md` と `.codex/agents/` でAI PM、5 Workstream Lead、Gate Reviewerの役割と承認境界を適用する
2. Issue / PR / Task Brief / Decision / Gateテンプレートを使う
3. `D-018〜020` の確定値（9月6日期限、週28時間、追加支出0円）を週次運営へ適用する
4. GitHub Issues / Projectと `main` Rulesetを責任者承認後に有効化する
5. `D-001`確定後、`P0-PROD-01`からWIP制限付きで実行する
6. 最初の3〜5タスクで、分担粒度、レビュー工数、手戻りを確認する
7. Specialistの固定化はせず、必要性が繰り返し確認された役割だけ再利用可能なエージェント定義へ昇格する

プロジェクト固有エージェント定義ではモデルを固定しない。利用環境の既定値を継承し、タスクの費用・速度・品質要求に応じた変更が必要な場合だけ責任者と見直す。

## 15. 公式参考資料

- [OpenAI: Subagents](https://developers.openai.com/codex/agent-configuration/subagents)
- [OpenAI: AGENTS.md](https://developers.openai.com/codex/agent-configuration/agents-md)
- [OpenAI: Security](https://developers.openai.com/codex/agent-approvals-security)

公式ガイドでは、独立した境界の明確な作業はサブエージェントへ分担しやすい一方、同じ可変状態への並行書き込みは競合と調整負荷を生みやすいとされている。本運営モデルでは、その考え方をWorkstream、WIP制限、単一編集担当、独立レビューへ反映している。
