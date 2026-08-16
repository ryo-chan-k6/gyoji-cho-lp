# GYOJI-CHO Phase 0〜2 実行計画

最終更新：2026年8月15日
上位ロードマップ：[`business-roadmap.md`](business-roadmap.md)
対象戦略：[`business-strategy.md`](business-strategy.md)
運営モデル：[`ai-agent-operating-model.md`](ai-agent-operating-model.md)
運用方針：[`project-operating-policy.md`](project-operating-policy.md)
対象範囲：Phase 0、0.5、1、2、およびPhase 2の定性サブフェーズである2.5

## 1. 目的

最新ロードマップを、Product / Marketing / Data / Legal / Validationの5 Workstreamで実行可能なタスクへ分解する。各タスクに成果物、依存関係、完了条件を持たせ、結果を見る前にPhase Gateを固定する。

この計画ではWeb簡易MVPを実施しない。Phase 1でiOS MLP（Minimum Lovable Product）をValidation Releaseとして作り、Phase 2で広告 → App Store → 実利用を検証する。

## 2. Phase構成

| Phase | 名称 | 目的 | 主な出口 |
|---|---|---|---|
| 0 | 事業仮説固定 | 開発前に対象、価値、MLP、計測、撤退基準を固定 | Phase 0.5とPhase 1を実行可能な計画 |
| 0.5 | 広告メッセージ検証 | 刺さる問題設定・表現を少額で確認 | 採用訴求と学び。需要判定はしない |
| 1 | iOS Validation Release | 欠けていない最小iOS体験を設計・開発・公開 | App Storeで利用可能なMLP |
| 2 | Product Validation | 実利用でプロダクト需要とチャネルを定量検証 | 定量判定と定性調査対象 |
| 2.5 | 定性検証 | 利用／離脱理由を理解し定量結果を解釈 | Go / Pivot / Stop判断 |

## 3. 管理ルール

### タスクID

`P{Phase}-{Workstream}-{連番}` とする。小数Phaseは `P05`、`P25` と表記する。

- `PROD`：Product
- `MKT`：Marketing
- `DATA`：Data
- `LEGAL`：Legal
- `VAL`：Validation
- `GATE`：Phase完了判定

### 依存関係

- `—`：先行タスクなし
- タスクID：先行成果物が利用可能になってから完了できる
- 判断ID：末尾の判断事項が確定するまで完了できない
- 範囲表記（例：`P1-PROD-01〜04`）：該当する全タスク

### 全タスク共通の完了条件

- 成果物の保存場所、版、更新日が一意に分かる
- 未確定事項は判断IDで明示されている
- 作成者以外が再現または運用できる
- 指標には定義、分母、期間、除外条件がある
- 現在提供中、Validation Release、将来構想が区別されている
- 個人情報・子どもの情報を必要性なく取得、保存、送信しない

### AIエージェント運営

- AI PMを事業Orchestratorとし、Ready判定、Task Brief、依存関係、レビュー、エスカレーションを管理する
- 各WorkstreamにLeadを置き、Specialistは独立した具体タスクがある場合のみ一時的に起動する
- プロジェクト全体の `In Progress` は最大3、各Workstreamは原則1とする
- 同一成果物の編集担当は同時に1エージェントとし、作成者とは別のReviewerが完了条件を確認する
- ValidationとPhase Gateの検証は開発・獲得担当から独立させる
- D-ID、予算、公開、契約、個人情報、Go / Pivot / Stopは責任者が判断する
- 詳細な役割、権限、Task Brief、Decision Pack、Gate運用は [`ai-agent-operating-model.md`](ai-agent-operating-model.md) に従う
- タスク状態、ブランチ、PR、正本、品質Gate、Secrets、外部承認は [`project-operating-policy.md`](project-operating-policy.md) に従う
- 日々の状態はGitHub Issues / Projectで管理し、この文書のタスク表へ状態列を追加しない

---

## 4. Phase 0：事業仮説固定

### Product

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P0-PROD-01 | 対象ユーザー、Core / Extended Value、非対象を固定する | Product validation brief | `D-001` | 対象、利用場面、課題、Core Value、Extended Value、対象外が1ページで参照できる |
| P0-PROD-02 | 家族固有行事と季節文化の候補を評価し、MLP対象を選ぶ | Event scope matrix | P0-PROD-01, `D-002`, `D-003`, `D-013` | 各行事の価値、時期、準備、通知、地域差、根拠、MLP採否が記載されている |
| P0-PROD-03 | MLPの必須体験を画面・状態遷移へ落とす | MLP experience map / wireflow | P0-PROD-01, P0-PROD-02 | 登録→行事生成→次の行事→意味→準備→通知→季節文化が途切れず、エラー・未入力・「今回はやらない」候補も扱う |
| P0-PROD-04 | MLPのMust / May / Won'tを固定する | MLP scope / frozen backlog | P0-PROD-03, `D-004`, `D-005` | 必須機能、採否保留、非対象、追加変更条件、開発上限が明記されている |
| P0-PROD-05 | Local-firstの技術方針を決める | Architecture decision record | P0-PROD-04, P0-DATA-03, P0-LEGAL-01, `D-006` | 端末保存、行事計算、通知、Analytics、障害・移行方針があり、独自サーバーを使う場合は必要性が説明されている |

### Marketing

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P0-MKT-01 | 最優先ユーザーの状況・検索・代替手段を整理する | Audience / occasion matrix | P0-PROD-01 | 対象ごとに直近行事、困りごと、現在の解決方法、検索語、反応し得る価値がある |
| P0-MKT-02 | 3系統以上の訴求仮説を作る | Message hypothesis matrix | P0-MKT-01 | 赤ちゃん行事、調べる負担、日本文化体験等について広告フック、LPの受け、反証条件がある |
| P0-MKT-03 | Mission、Product Positioning、広告コピーの役割を分ける | Brand / positioning guardrail | P0-PROD-01, P0-MKT-02 | 広告反応で変更可能な要素と、維持するMissionが区別されている |
| P0-MKT-04 | Phase 0.5の媒体、予算、配信構造を設計する | Message-test media plan | P0-MKT-02, P0-DATA-01, P0-VAL-02, `D-010` | 少額上限、期間、比較単位、変更・停止ルール、需要判定に使わない旨が明記されている |
| P0-MKT-05 | Phase 2の獲得仮説とApp Store準備項目を洗い出す | Acquisition hypothesis / ASO backlog | P0-PROD-01, P0-MKT-01 | 広告→App Store→Installの仮説と、後で必要な素材・ページ・計測項目が一覧化されている |

### Data

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P0-DATA-01 | Product / Channel Validationを分けたKPIツリーを作る | KPI tree / metric dictionary | P0-PROD-01, `D-009` | Acquisition、Activation、Value、Retention、Preparation Intentの定義、分母、観測期間がある |
| P0-DATA-02 | Event-triggered Retentionを定義する | Retention measurement spec | P0-DATA-01, P0-PROD-03 | 通知→再訪→詳細→準備／体験のイベント連鎖と観測窓が定義されている |
| P0-DATA-03 | MLPのイベントと禁止データを定義する | Analytics event dictionary | P0-PROD-03, P0-DATA-01, `D-007`, `D-008` | イベント名、発火条件、許可属性、禁止属性、保存先、保持期間があり、生年月日等を送らない |
| P0-DATA-04 | Phase 0.5の計測とUTM規約を設計する | Message-test tracking spec | P0-MKT-04, P0-DATA-01, `D-007` | 訴求、媒体、クリエイティブ、LP版を識別でき、Waitlistを需要Gateに使わないレポート仕様がある |
| P0-DATA-05 | Phase 2のファネルとダッシュボードを設計する | Product-validation dashboard spec | P0-DATA-01〜03 | 広告→App Store→Install→Activation→Value→Retention→Preparation IntentをProduct / Channel別に見られる設計になっている |

### Legal

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P0-LEGAL-01 | LP、広告、iOS MLP、Analyticsのデータフローを整理する | Data flow / processing inventory | P0-PROD-03, P0-DATA-03, `D-007`, `D-008` | データ項目、目的、端末／外部送信、保存先、委託先、保持・削除が一覧化されている |
| P0-LEGAL-02 | 運営主体とApple関連契約の前提を整理する | Entity / Apple account checklist | `D-012` | Developer Program、App Store表示名、連絡先、契約主体、税務情報の不足と期限が分かる |
| P0-LEGAL-03 | MLP向けプライバシー・利用条件の要件を定義する | Privacy / terms requirements | P0-LEGAL-01, P0-LEGAL-02, `D-008` | Local-first、Analytics、通知、削除、一般的目安、非保証の必要表示が整理されている |
| P0-LEGAL-04 | 行事コンテンツの根拠・免責・更新ルールを決める | Content governance policy | P0-PROD-02, `D-013` | 出典、一般的な目安、地域差、レビュー、更新、誤り訂正の基準がある |
| P0-LEGAL-05 | Phase 0.5広告と既存LPの表示を監査する | Claims review checklist | P0-MKT-02, P0-MKT-04 | 未提供機能、無料、提供時期、効果について誤認箇所がタスク化されている |

### Validation

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P0-VAL-01 | 事業仮説を反証可能な形で優先順位付けする | Assumption / evidence register | P0-PROD-01 | 課題、MLP価値、文化体験、通知、準備、チャネル、収益意向ごとに重要度と必要証拠がある |
| P0-VAL-02 | Phase 0.5の実験計画を作る | Message-test charter | P0-MKT-02, P0-VAL-01, `D-010` | 比較対象、母数、期間、分析方法、停止条件、需要判定に使わない制約がある |
| P0-VAL-03 | Phase 2のProduct / Channel実験計画を作る | Product-validation charter | P0-VAL-01, P0-DATA-01〜02, `D-009`, `D-014` | 仮説、対象、期間、必要観測数、Product / Channel別の成功・保留・失敗条件がある |
| P0-VAL-04 | Go / Pivot / StopとScope変更ルールを固定する | Decision framework / change control | P0-PROD-04, P0-VAL-03, `D-009` | 結果を見る前の閾値、例外承認、再検証条件、開発中のスコープ追加条件がある |
| P0-VAL-05 | Phase 2.5の定性調査計画を作る | Interview plan / guide | P0-VAL-01, `D-015` | 利用者・離脱者の対象条件、質問、記録、謝礼、分析方法がある |

### Phase 0 Gate

| ID | 判定 | 依存関係 | 完了条件 |
|---|---|---|---|
| P0-GATE-01 | Phase 0.5開始可否 | P0-MKT-02〜04、P0-DATA-04、P0-LEGAL-05、P0-VAL-02 | 少額広告を安全・同条件・計測可能に実施でき、結果を需要判定に誤用しない運用になっている |
| P0-GATE-02 | Phase 1開始可否 | P0-PROD-01〜05、P0-DATA-01〜03、P0-LEGAL-01〜04、P0-VAL-01、03〜05 | 対象行事、MLPスコープ、Analytics、Local-first、Go / Pivot / Stop、開発上限が固定されている |

---

## 5. Phase 0.5：広告メッセージ検証

### Product

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P05-PROD-01 | 既存LPを訴求別に受けられるよう最小修正する | LP variants / copy map | P0-GATE-01, `D-010` | 広告とLPの約束が一致し、将来機能と現在提供中の内容が区別されている |
| P05-PROD-02 | LPの主要端末・CTA・β表記をQAする | LP release checklist | P05-PROD-01, P05-DATA-01 | 表示崩れ、リンク切れ、計測欠損、提供時期の誤認がない |

### Marketing

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P05-MKT-01 | 比較可能な広告クリエイティブを制作する | Ad copy / creative set | P0-MKT-02〜04, P0-LEGAL-05 | 各訴求が同程度の品質・形式で、差分が仮説へ対応している |
| P05-MKT-02 | 少額キャンペーンを設定する | Campaign configuration sheet | P05-MKT-01, P05-PROD-01, P05-DATA-01 | 予算、対象、除外、UTM、期間、停止ルールが計画と管理画面で一致する |
| P05-MKT-03 | キャンペーンを運用し変更履歴を残す | Operation / change log | P05-MKT-02, P05-VAL-01 | 事前ルール外の最適化をせず、変更理由と影響が記録されている |

### Data

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P05-DATA-01 | 訴求・広告・LPの計測を実装する | Message-test tracking | P0-DATA-04, P05-PROD-01 | 訴求、媒体、広告、LP版が一意に記録され、個人情報を取得しない |
| P05-DATA-02 | ソフトローンチで計測QAを行う | Tracking QA report | P05-DATA-01, P05-MKT-02 | 正常、重複、欠損、直アクセス、自己アクセスを確認し、重大欠陥が0件 |
| P05-DATA-03 | 訴求別の結果を固定・集計する | Message-test snapshot | P05-DATA-02, P05-MKT-03 | 対象期間、除外、集計時刻、サンプル差、クリエイティブ差が記録されている |

### Legal

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P05-LEGAL-01 | 公開前の広告・LP・計測を最終確認する | Phase 0.5 legal sign-off | P05-PROD-01, P05-MKT-01〜02, P05-DATA-01 | 表示・データ利用が実態と一致し、ブロッカーが0件 |

### Validation

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P05-VAL-01 | ソフトローンチを行う | Soft-launch report | P05-PROD-02, P05-DATA-02, P05-LEGAL-01 | 少額・限定範囲で導線と運用を確認し、本実験を妨げる問題が0件 |
| P05-VAL-02 | メッセージ実験を所定条件で完了する | Experiment log | P05-VAL-01, P05-MKT-03 | 所定期間・母数まで実施し、途中変更・停止・外部要因が記録されている |
| P05-VAL-03 | 採用訴求と学びをまとめる | Message-test memo | P05-DATA-03, P05-VAL-02 | 訴求ごとの支持・不支持・不明、限界、MLP／App Store表現への示唆があり、需要Go / Stopを出していない |

### Phase 0.5 Gate

| ID | 判定 | 依存関係 | 完了条件 |
|---|---|---|---|
| P05-GATE-01 | Phase 1へ反映する訴求を選ぶ | P05-VAL-03 | 採用訴求と不採用理由が記録され、事業需要の判定ではないことが明記されている |

---

## 6. Phase 1：iOS Validation Release（MLP）

### Product

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P1-PROD-01 | MLP要件と受入条件を確定する | Product requirements / acceptance criteria | P0-GATE-02, P05-GATE-01 | 必須体験、機能、非対象、品質、対象端末、変更ルールが確定している |
| P1-PROD-02 | UI、状態遷移、文言を設計する | High-fidelity prototype / UX copy | P1-PROD-01 | 登録→季節文化まで主要フローが完結し、Local-first説明、通知許可、一般的な目安が理解できる |
| P1-PROD-03 | 行事ルールとコンテンツを作る | Event rule set / reviewed seed content | P0-PROD-02, P0-LEGAL-04, P1-PROD-01 | 対象行事の算出、意味、準備、通知時期、季節文化がレビュー済みで、出典・更新日がある |
| P1-PROD-04 | iOS MLPを実装する | Validation Release build | P1-PROD-01〜03, P1-DATA-01, P1-LEGAL-01, `D-006` | Must機能が動作し、Won't機能を含まず、個人情報をサーバーへ不要に送信しない |
| P1-PROD-05 | 機能・コンテンツ・アクセシビリティをQAする | Release checklist / issue log | P1-PROD-04, P1-DATA-03 | 代表日、境界日、未入力、通知、オフライン、削除を確認し、重大不具合・根拠不明コンテンツが0件 |
| P1-PROD-06 | TestFlightとApp Store提出を完了する | Approved App Store build / release record | P1-PROD-05, P1-LEGAL-04, `D-011`, `D-012` | 審査対応が完了し、Phase 2対象者がインストール可能で、公開版と計測版が一致する |

### Marketing

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P1-MKT-01 | Phase 0.5の学びをProduct Positioningへ反映する | Positioning / message brief v2 | P05-GATE-01 | Missionを変えず、MLPで実際に提供する価値と訴求が一致している |
| P1-MKT-02 | App Store Product Pageを制作する | Metadata / screenshots / preview assets | P1-MKT-01, P1-PROD-02, `D-011` | 広告期待、ストア説明、初回体験が一致し、未提供機能を訴求していない |
| P1-MKT-03 | Phase 2の広告素材を制作する | Product-validation creative set | P1-MKT-01〜02, P0-MKT-05, `D-014` | 主要訴求ごとに広告→App Storeのメッセージ連続性があり、比較可能な構成になっている |
| P1-MKT-04 | リリース案内と問い合わせ導線を準備する | Launch communication / support FAQ | P1-PROD-01, P1-LEGAL-02 | Validation Releaseの範囲、β品質、問い合わせ、停止・削除方法が明示されている |

### Data

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P1-DATA-01 | AnalyticsツールとApp Storeデータの取得方法を確定する | Analytics implementation plan | P0-DATA-03, P0-DATA-05, `D-007` | 取得イベント、外部サービス、ID、保持、削除、欠測時の扱いがある |
| P1-DATA-02 | 行動イベントを実装する | Analytics instrumentation | P1-DATA-01, P1-PROD-04 | 定義済みイベントだけが発火し、生年月日等の禁止データが送信されない |
| P1-DATA-03 | イベント・通知・再訪計測をQAする | Analytics QA report | P1-DATA-02, P1-PROD-04 | オンボーディング、行事、準備、季節文化、通知後再訪、同意拒否を確認し、重大欠陥が0件 |
| P1-DATA-04 | Phase 2ダッシュボードを構築する | Product / Channel dashboard | P1-DATA-03, P0-DATA-05 | ProductとChannelを分け、ファネル、コホート、Event-triggered Retention、準備意向を確認できる |
| P1-DATA-05 | リリース版の計測基準を固定する | Measurement baseline / version record | P1-PROD-06, P1-DATA-04 | アプリ版、イベント辞書版、App Store版、広告版の対応が一意に記録されている |

### Legal

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P1-LEGAL-01 | MLPのデータフローとプライバシーリスクを評価する | Privacy / risk assessment | P0-LEGAL-01〜03, P1-PROD-01, P1-DATA-01 | 端末内情報、Analytics、通知、外部SDK、削除、漏えい対応のリスクと対策がある |
| P1-LEGAL-02 | 利用条件・プライバシーポリシー・アプリ内説明を作る | Terms / privacy notice / in-app copy | P1-LEGAL-01 | Validation Release、一般的目安、データ利用、通知、削除、問い合わせが実態と一致する |
| P1-LEGAL-03 | App Privacy・SDK・Apple審査項目を確認する | App Store compliance checklist | P1-DATA-01〜03, P1-LEGAL-02 | App Privacy回答、SDK申告、権限文言、対象年齢、プライバシーURLが実装と一致する |
| P1-LEGAL-04 | 公開前の法務・コンテンツ・安全性を承認する | Launch sign-off / residual-risk list | P1-PROD-05, P1-LEGAL-02〜03 | ブロッカーが0件で、受容する残存リスクに責任者と期限がある |

### Validation

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P1-VAL-01 | プロトタイプでユーザビリティテストを行う | Usability report | P1-PROD-02, P0-VAL-05 | 主要フローを代表ユーザーが試し、致命的な理解・操作問題が修正または明示的に受容されている |
| P1-VAL-02 | TestFlightで少人数パイロットを行う | Pilot report / incident log | P1-PROD-05, P1-DATA-03, P1-LEGAL-04 | 実端末で登録→通知→再訪を確認し、Phase 2を歪める重大問題が0件 |
| P1-VAL-03 | MLP受入条件を評価する | MLP acceptance report | P1-VAL-01〜02, P1-PROD-01 | 必須体験、品質、計測、Local-first、サポートが受入条件を満たしている |

### Phase 1 Gate

| ID | 判定 | 依存関係 | 完了条件 |
|---|---|---|---|
| P1-GATE-01 | Product Validation開始可否 | P1-PROD-06, P1-MKT-02〜04, P1-DATA-04〜05, P1-LEGAL-04, P1-VAL-03 | App StoreでMLPを提供でき、広告期待から価値体験まで整合し、結果を信頼できる計測と事前基準がある |

---

## 7. Phase 2：Product Validation

### Product

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P2-PROD-01 | 検証開始前にリリース版を固定する | Release freeze record | P1-GATE-01 | アプリ版、機能、コンテンツ、既知問題が記録され、緊急時以外の変更を停止している |
| P2-PROD-02 | 障害・問い合わせに対応し検証影響を記録する | Incident / support log | P2-PROD-01 | 影響時間、対象、修正、指標への影響が記録され、通常改善を検証中に混ぜていない |
| P2-PROD-03 | 検証後の改善候補を蓄積する | Evidence-linked backlog | P2-PROD-02 | 各候補に根拠イベント、ユーザー発言、影響仮説があり、実験終了前に実装していない |

### Marketing

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P2-MKT-01 | Product Validationキャンペーンを設定する | Campaign configuration sheet | P1-MKT-03, P1-GATE-01, `D-014` | チャネル、予算、対象、除外、広告→ストア対応、停止ルールが事前計画と一致する |
| P2-MKT-02 | キャンペーンを運用し変更を統制する | Daily operation / change log | P2-MKT-01, P2-VAL-01 | 事前ルール外の変更がなく、変更理由とProduct / Channel評価への影響が記録されている |
| P2-MKT-03 | App Store指標と広告指標を分離して分析する | Channel performance report | P2-MKT-02, P2-DATA-04 | クリエイティブ、配信、ストアページ、Installのボトルネックが区別されている |

### Data

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P2-DATA-01 | 本番直後の計測健全性を確認する | Production tracking health report | P1-DATA-05, P2-PROD-01 | 欠損、重複、遅延、版混在、禁止データ送信を確認し、重大問題が0件 |
| P2-DATA-02 | Product / Channel指標を日次監視する | Data quality / anomaly log | P2-DATA-01, P2-MKT-02 | 異常、ボット、自己アクセス、障害影響、広告変更が記録されている |
| P2-DATA-03 | Event-triggered Retentionと準備意向を分析する | Retention / preparation report | P2-DATA-02 | 通知→再訪→詳細→準備、季節文化、カテゴリ別関心をコホートで確認できる |
| P2-DATA-04 | 判定用データセットを固定する | Read-only analysis snapshot | P2-DATA-02〜03 | 対象期間、版、除外、欠測、集計時刻、定義版が記録され再現できる |
| P2-DATA-05 | Product / Channel別の結果をまとめる | Quantitative findings report | P2-DATA-04, P2-MKT-03 | ProductとChannelを別々に支持・不支持・不明と判定し、平均値だけでなくセグメント差がある |

### Legal

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P2-LEGAL-01 | 本番広告・App Store・アプリ表示を最終確認する | Phase 2 legal sign-off | P2-MKT-01, P2-PROD-01 | 表示・提供機能・データ利用が一致し、誤認・未申告SDK・不適切な訴求がない |
| P2-LEGAL-02 | 問い合わせ・削除・事故対応を運用する | Request / incident register | P1-LEGAL-02, P2-PROD-02 | 受付、本人確認、削除範囲、期限、記録が手順どおりで、未処理がない |
| P2-LEGAL-03 | 検証中のSDK・データ・訴求変更を統制する | Legal change log | P2-PROD-02, P2-MKT-02, P2-DATA-02 | 新規取得・送信・訴求変更が事前確認され、目的外利用が0件 |

### Validation

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P2-VAL-01 | 限定予算でソフトローンチする | Soft-launch report | P1-GATE-01, P2-DATA-01, P2-LEGAL-01 | 広告→App Store→Install→価値行動を確認し、本実験のブロッカーが0件 |
| P2-VAL-02 | Product Validationを事前条件どおり実施する | Experiment log | P0-VAL-03〜04, P2-VAL-01, P2-MKT-02 | 所定期間・観測数まで実施し、途中変更、障害、外部要因が記録されている |
| P2-VAL-03 | Product / Channel仮説を定量判定する | Quantitative decision draft | P2-DATA-05, P2-VAL-02 | 仮説ごとに支持・不支持・不明、限界、次に確認すべき理由が記載されている |
| P2-VAL-04 | Phase 2.5の対象者を抽出する | Interview candidate sample | P2-VAL-03, `D-015` | 利用者、価値未到達者、離脱者、通知後再訪者等の選定基準と候補がある |

### Phase 2定量Gate

| ID | 判定 | 依存関係 | 完了条件 |
|---|---|---|---|
| P2-GATE-01 | 定性確認へ進む | P2-VAL-03〜04 | 定量結果を固定し、結果を後から変えずに説明でき、確認すべき理由と対象者が明確になっている |

---

## 8. Phase 2.5：定性検証

Phase 2.5はPhase 2の最終判定を補完するサブフェーズとして、この実行計画に含める。

### Product

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P25-PROD-01 | 定量結果に対応するプロダクト論点を整理する | Interview issue map | P2-VAL-03 | 各論点が具体的な画面、行動、指標、仮説へ紐づいている |
| P25-PROD-02 | 定性結果から改善候補を優先順位付けする | Evidence-linked product options | P25-VAL-03 | 各候補に定量・定性根拠、期待効果、追加検証方法がある |

### Marketing

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P25-MKT-01 | 利用者・離脱者を募集する | Recruiting log / quota status | P2-VAL-04, P25-LEGAL-01, `D-015` | 対象群の割当を満たし、参加任意、連絡停止、謝礼が適切に運用されている |
| P25-MKT-02 | Channel側の定性論点を整理する | Acquisition insight memo | P2-MKT-03, P25-VAL-02 | 広告、App Store、Install前後の期待差がユーザー発言と紐づいている |

### Data

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P25-DATA-01 | インタビュー対象の定量背景を匿名化して準備する | Participant context sheet | P2-DATA-04, P2-VAL-04 | 必要最小限の行動文脈だけがあり、生年月日等の不要な個人情報を含まない |
| P25-DATA-02 | 定量・定性を統合する | Integrated evidence matrix | P25-VAL-03, P2-DATA-05 | 各仮説に数値、発言、反例、サンプル限界が並び、矛盾を隠していない |

### Legal

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P25-LEGAL-01 | インタビュー同意・録音・謝礼手続きを準備する | Research consent / incentive procedure | P0-VAL-05, `D-015` | 参加任意、録音・引用、撤回、謝礼、保持・削除が明記されている |
| P25-LEGAL-02 | 調査記録の匿名化・削除を確認する | Research data closeout | P25-VAL-02 | 同意範囲外のデータがなく、匿名化・保持・削除が手順どおり記録されている |

### Validation

| ID | タスク | 成果物 | 依存関係 | 完了条件 |
|---|---|---|---|---|
| P25-VAL-01 | 定量結果から質問ガイドを調整する | Final interview guide | P0-VAL-05, P25-PROD-01, P25-DATA-01 | 価値を感じた瞬間、代替手段、不使用理由、通知、文化、準備を非誘導的に確認できる |
| P25-VAL-02 | 利用者・離脱者インタビューを実施する | Interview notes / recordings register | P25-MKT-01, P25-LEGAL-01, P25-VAL-01 | 対象群を満たし、過去行動と具体例が記録され、同意範囲が守られている |
| P25-VAL-03 | 定性インサイトを統合する | Qualitative synthesis | P25-VAL-02 | 共通パターン、反例、重要度、定量結果との一致・不一致が記載されている |
| P25-VAL-04 | Go / Pivot / Stopを決定する | Phase 2 final decision memo | P25-DATA-02, P25-PROD-02, P25-MKT-02, `D-016` | 事前基準に沿う判断、例外理由、Phase 3または再検証の範囲、投資上限が承認されている |

### Phase 2最終Gate

| ID | 判定 | 依存関係 | 完了条件 |
|---|---|---|---|
| P25-GATE-01 | 正式v1へ進む／Pivotして再検証／Stop | P25-VAL-04, P25-LEGAL-02 | 定量＋定性で判断し、Product / Channelの問題を混同せず、次の投資と残存リスクが明記されている |

---

## 9. 主要依存関係とクリティカルパス

```text
P0-PROD-01 対象・価値
  ├─ P0-PROD-02〜04 MLP対象・体験・スコープ
  ├─ P0-DATA-01〜03 KPI・イベント
  ├─ P0-LEGAL-01〜04 Local-first・表示・コンテンツ
  └─ P0-VAL-01〜04 仮説・判定基準
          ↓
      P0-GATE-02
          ↓
P05 メッセージ検証 → P05-GATE-01 採用訴求
          ↓
P1 要件 → UX／コンテンツ → 実装 → QA → App Store
          ↓
      P1-GATE-01
          ↓
P2 広告 → App Store → 実利用 → 定量結果固定
          ↓
      P2-GATE-01
          ↓
P25 利用者・離脱者インタビュー → 定量＋定性統合
          ↓
      P25-GATE-01
```

### クリティカルパス

1. `P0-PROD-01〜04` 対象、行事、MLPスコープ固定
2. `P0-DATA-01〜03` KPI、Event-triggered Retention、Analytics固定
3. `P0-VAL-03〜04` Product / Channel判定条件と変更ルール固定
4. `P0-PROD-05` と `P0-LEGAL-01〜04` Local-first／App Store前提固定
5. `P05-VAL-01〜03` メッセージ検証
6. `P1-PROD-01〜06` MLP設計・開発・公開
7. `P1-DATA-02〜05` 計測実装・QA
8. `P2-VAL-01〜04` Product Validationと結果固定
9. `P25-VAL-01〜04` 定性検証と最終判断

---

## 10. 本Chatで決める判断事項

### Phase 0で決める

| ID | 判断事項 | 主な論点 | 決定期限 | ブロックするタスク |
|---|---|---|---|---|
| D-001 | 最優先ユーザー | 第一子の妊娠後期〜満1歳。妊娠期と出生後0〜11か月を別コホートで扱う | **2026-08-16確定** | P0-PROD-01、P0-MKT-01 |
| D-002 | MLP対象の家族固有行事 | お七夜、お宮参り、お食い初め／百日祝い、ハーフバースデー、初節句、1歳祝い＋軽量な月齢マイルストーン | **2026-08-16確定** | P0-PROD-02〜04 |
| D-003 | MLP対象の季節文化 | 月1件・年間12件。各月の候補を価値、安全、地域差、根拠、制作負荷で選定 | **2026-08-16確定** | P0-PROD-02〜04 |
| D-004 | MLPの必須／非対象 | 妊娠期／出生後、予定日・生年月日・性別、ホーム「つぎのお祝い」、判断状態、準備、通知、季節文化、編集・削除をMust化 | **2026-08-16確定** | Phase 1 Product / Data |
| D-005 | MLP追加候補 | Appleカレンダー、簡易共有、体験記録の採否 | P0-PROD-04完了前 | P0-PROD-04、P1-PROD-01 |
| D-006 | iOS技術・対象OS | SwiftUI等、最低OS、端末保存、通知、行事ルール実装 | P0-PROD-05完了前 | P0-PROD-05、P1-PROD-04 |
| D-007 | Analytics基盤 | App Store Connect、製品分析SDK、広告計測の採否 | P0-DATA-03完了前 | Data / Legal全般 |
| D-008 | データ保持・削除 | 匿名ID、保持期間、削除、クラッシュログ、外部SDK | P0-DATA-03完了前 | P0-DATA-03、P0-LEGAL-01〜03 |
| D-009 | Product Validation基準 | 必要母数、観測期間、Activation、Value、Retention、Preparation IntentのGo / Pivot / Stop値 | P0-VAL-03完了前 | P0-DATA-01〜02、P0-VAL-03〜04、Phase 2 Gate |
| D-010 | Phase 0.5設計 | チャネル、少額予算、3訴求、LP比較方法、終了条件 | P0-MKT-04完了前 | Phase 0.5全般 |
| D-011 | MLP配布方法 | 公開App Store、段階公開、TestFlightからの移行 | P1-MKT-02着手前 | P1-PROD-06、P1-MKT-02 |
| D-012 | Apple契約主体 | 個人／法人、Developer Program、表示名、問い合わせ先 | P0-LEGAL-02完了前 | P0-LEGAL-02、P1-PROD-06 |
| D-013 | コンテンツ品質 | 主要事実2情報源以上、Priority Aを1つ以上、AI作成→Legal確認→Human全件承認、年1回＋トリガー再レビュー | **2026-08-16確定** | P0-PROD-02、P0-LEGAL-04、P1-PROD-03 |
| D-014 | Phase 2獲得計画 | 広告チャネル、予算、セグメント、App Store Product Page比較 | P0-VAL-03完了前 | P0-VAL-03、P1-MKT-03、Phase 2 Marketing |
| D-015 | 定性調査 | 対象群、人数、連絡方法、録音、謝礼 | P0-VAL-05完了前 | P0-VAL-05、Phase 2.5 |
| D-016 | 最終判定権限 | Go / Pivot / Stopの判断者、例外承認、投資上限 | P0-VAL-04完了前 | P25-VAL-04、P25-GATE-01 |
| D-017 | 準備意向CTA | 非提携状態で何を表示し、どのクリックを計測するか | P0-PROD-04完了前 | P0-PROD-04、P0-DATA-03、Phase 1 Product |
| D-018 | Phase 0の時間枠 | 8月17日〜9月6日。主要成果物は8月30日目標、前倒し完了可 | **2026-08-16確定** | Phase 0全タスク、Gate |
| D-019 | 責任者の稼働枠 | 週28時間、判断SLA 1営業日、最低4時間を判断・レビューへ確保 | **2026-08-16確定** | 週次コミットメント、Decision Needed処理 |
| D-020 | Phase 0の費用上限 | 追加支出0円、外注なし、既存AIサービス内で実行 | **2026-08-16確定** | Phase 0全タスク |

### 推奨する判断テーマの分け方

| 議題ブロック | 判断ID | テーマ |
|---|---|---|
| A | D-001〜005 | 対象ユーザー、対象行事、MLPスコープ |
| B | D-006〜008、D-012 | iOS、Local-first、Analytics、Apple契約 |
| C | D-009、D-014、D-016 | KPI、予算、Go / Pivot / Stop |
| D | D-010〜011 | Phase 0.5とApp Store導線 |
| E | D-013 | 行事コンテンツ品質・地域差 |
| F | D-015 | 定性調査 |
| G | D-017 | 準備意向と将来の送客接続 |
| H | D-018〜020 | **確定済み（2026-08-16）**：Phase 0の期限、責任者稼働、費用上限 |

すべて本Chat内で扱い、各議題ブロックの判断が完了するたびにDecision Recordと関連Issueを更新する。

### 判断記録の形式

- 判断ID、決定日、決定者
- 決定内容
- 採用しなかった選択肢
- 根拠にした事実・制約
- 見直し条件または有効期限
- 影響を受けるタスクID

---

## 11. 直近の着手順

1. `P0-PROD-01` Product validation brief
2. `P0-VAL-01` 仮説台帳
3. `P0-PROD-02` 対象行事マトリクス
4. `P0-PROD-03〜04` MLP体験とスコープ
5. `P0-DATA-01〜03` KPI・Analytics
6. `P0-VAL-03〜04` 判定基準と変更ルール
7. `P0-PROD-05`、`P0-LEGAL-01〜04` Local-first・App Store前提
8. `P0-MKT-02〜04`、`P0-VAL-02` Phase 0.5準備
9. `P0-GATE-01〜02` を通過後、Phase 0.5を実施し、その学びを反映してPhase 1へ進む

判断未確定でもたたき台は作成できるが、依存する判断IDが確定するまで完了扱いにしない。
