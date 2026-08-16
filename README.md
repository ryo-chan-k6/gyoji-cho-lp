# GYOJI-CHO（まいにち行事カレンダー 〜日本の行事帖〜）事業検証・LP

| 項目 | 内容 |
|---|---|
| 正式名称 | まいにち行事カレンダー 〜日本の行事帖〜 |
| プロジェクト名 | GYOJI-CHO |

GYOJI-CHOは、乳幼児・子どもの家族固有行事を入口に、家族が日本の文化を知り、体験し、準備まで行えるよう先回りして支援するサービス構想です。

> **Mission: 日本の文化を知って、体験し、心を豊かにする。**

ユーザー獲得の入口は「赤ちゃんの行事」に置きつつ、将来的にはお正月・節分・七夕・お盆・十五夜など、家族で体験できる日本の伝統行事・風習まで扱います。

最終形は、**「日本の子育て行事OS／家族行事の意思決定と準備のプラットフォーム」**です。子どもの情報を一度登録すれば、家庭ごとの行事について「いつ・何をする・何を準備する」が分かり、家族で共有しながら予約・購買まで進められる体験を目指します。主収益の仮説は、準備・予約・購買に関する**他社への送客／提携収益**です。

## 現在のフェーズ

現在はアプリ本体の本格開発前で、**Phase 0〜0.5（事業仮説固定・訴求検証・iOS Validation Release設計）**の段階です。

従来はLP→LINE事前登録CVRを本需要検証として想定していましたが、方針を更新しています。

- LP / LINE: 広告訴求・事前関心の補助検証、初期コミュニティ形成に利用
- 本需要検証: **iOS Validation ReleaseをApp Store公開し、実利用データでProduct Validationを行う**
- Web簡易MVP: 本来の通知・継続体験を十分再現できないため、本需要検証には使用しない
- Marketing: Instagramは当面アプリと切り離し、**独立したメディア型アカウントとしてSNS単体の価値提供・オーディエンス形成・潜在興味/課題の学習に集中する**。アプリ名・開発中アプリには言及しない

> 事業仮説固定 → 少額広告でメッセージ検証 → iOS MLP（Validation Release）→ App Store経由のProduct Validation → 定性検証 → 正式v1 → Monetization Validation

詳細:

- [`docs/business-roadmap.md`](docs/business-roadmap.md) — 事業ロードマップ、プロダクト/マーケティング/収益化、データ方針
- [`docs/business-strategy.md`](docs/business-strategy.md) — Phase 0〜2の検証戦略、MLP、Phase Gateの詳細
- [`docs/phase-0-2-execution-plan.md`](docs/phase-0-2-execution-plan.md) — 5 Workstreamのタスク、成果物、依存関係、完了条件
- [`docs/ai-agent-operating-model.md`](docs/ai-agent-operating-model.md) — AI PM、Workstream Lead、レビュー、承認境界
- [`docs/project-operating-policy.md`](docs/project-operating-policy.md) — リポジトリ、ブランチ、PR、タスク、正本、品質Gate、権限の運用方針
- [`docs/workstreams/product/mlp-frozen-scope.md`](docs/workstreams/product/mlp-frozen-scope.md) — Validation ReleaseのMust / May / Won't、開発上限、変更管理
- [`docs/operations/README.md`](docs/operations/README.md) — Task Brief、D-ID、Gate、リスク、移行済みタスクボードの入口
- [`docs/monetization-scenarios.md`](docs/monetization-scenarios.md) — 収益モデル、悲観〜楽観シナリオ、Unit Economics、投資Gate
- [`docs/instagram-strategy.md`](docs/instagram-strategy.md) — Instagramアカウントの確定運用方針、ターゲット、プロフィール、投稿カテゴリ、ビジュアル、KPI
- [`docs/content-production-guidelines.md`](docs/content-production-guidelines.md) — Instagram/iOS共通のAIコンテンツ制作、Fact Check、出典・著作権・素材管理ルール
- [`docs/visual-character-guide.md`](docs/visual-character-guide.md) — 「こどもと季節」Visual Pattern 01、親子キャラクター、AI画像量産時の再現ルール

## 構成

```text
docs/business-roadmap.md              # 最新の事業ロードマップ（戦略の正本）
docs/business-strategy.md             # Phase 0〜2の検証戦略・MLP・Phase Gate詳細
docs/phase-0-2-execution-plan.md      # Phase 0〜2.5のWorkstream別実行計画
docs/ai-agent-operating-model.md      # AIエージェントを使った運営体制・実行プロセス
docs/project-operating-policy.md      # リポジトリ・ブランチ・タスク・品質・権限の運用正本
docs/operations/                      # Task Brief・判断・Gate・リスク・暫定状態
docs/monetization-scenarios.md        # 収益化シナリオ・Unit Economics
docs/instagram-strategy.md            # Instagram運用方針（SNS領域の正本）
docs/content-production-guidelines.md # Instagram/iOS共通のコンテンツ制作・出典管理
docs/visual-character-guide.md        # SNS用キャラクター・イラスト量産基準
docs/handoff_memo.md                  # 初期検討・LP作成時点の引継ぎメモ
docs/cloudflare-pages-setup.md        # Cloudflare Pages 公開手順
docs/line-ops-setup.md                # LINE / エルメ運用（補助検証・事前登録用）
docs/line-cta-setup.md                # チャンネル別 CTA
public/                               # 公開ルート（Cloudflare Pages）
  index.html
  about.html / privacy.html / contact.html
  js/line-cta-config.js               # チャンネル別 LINE URL
  js/line-cta.js
.codex/agents/                       # AI PM・5 Workstream Lead・Gate Reviewerの定義
.github/                             # Issue・PR・CODEOWNERS・品質チェック
scripts/check-docs.ps1               # 文書リンク・必須ファイル・競合マーカー確認
AGENTS.md                             # リポジトリ内で働くAIへの共通指示
```

> 事業全体は `business-roadmap.md`、Phase 0〜2の検証戦略は `business-strategy.md`、タスク定義は `phase-0-2-execution-plan.md`、プロジェクト運用は `project-operating-policy.md` を正本とします。Instagramは `instagram-strategy.md`、コンテンツ制作・出典管理は `content-production-guidelines.md`、SNS用キャラクターとイラストは `visual-character-guide.md` を各領域の正本とします。正本間の優先順位と変更方法は運用方針に従います。

## プロジェクト運用

- Phase 2.5までは単一リポジトリで運用し、将来のiOS MLPは `apps/ios/` に追加する
- `main` への直接pushは行わず、1 Task IDごとの短命ブランチとPRを使う
- Phase計画は `phase-0-2-execution-plan.md`、日々の状態はGitHub Issues / Project、個別指示はTask Briefで管理する
- D-ID、予算、契約、公開、個人情報、Go / Pivot / Stopは責任者が判断する
- 外部変更は明示承認後に行い、最終マージは責任者が行う

ローカルの文書・運用チェック：

```powershell
pwsh ./scripts/check-docs.ps1
```

GitHub上の実行状態は [GYOJI-CHO Phase 0-2 Execution](https://github.com/users/ryo-chan-k6/projects/6) で管理します。`main` には [main protection Ruleset](https://github.com/ryo-chan-k6/gyoji-cho-lp/rules/20890713) を有効化しており、PR、`docs-quality`、未解決Conversationの解消、Squash mergeを必須とします。

## LP 公開URL

ホスティングは **Cloudflare Pages（無料の `*.pages.dev`）**。

- LP: `https://gyoji-cho.pages.dev/`
- Meta / Instagram広告: `https://gyoji-cho.pages.dev/?ch=meta`
- Google広告: `https://gyoji-cho.pages.dev/?ch=google`

セットアップ手順: [`docs/cloudflare-pages-setup.md`](docs/cloudflare-pages-setup.md)

※ 旧 GitHub Pages は Unpublish 済み想定。

## LINE CTA（補助検証・事前登録）

既存のLINE事前登録導線は補助的な連絡・学習手段として保持しています。**LINE登録CVRは、iOSプロダクト需要の主要Gateには使用しません。**

1. LINE公式アカウントで流入経路別の友だち追加リンクを発行する
2. `public/js/line-cta-config.js` の `default` / `meta` / `google` に URL を貼る
3. 広告のリンク先に `?ch=meta` または `?ch=google` を付ける

LINE登録数は事前関心の参考指標として扱い、**LINE登録CVR単独ではGo / Kill判定を行いません。**

## ローカル確認

```bash
python3 -m http.server 8080 --directory public
```

ブラウザで http://localhost:8080 を開き、`?ch=meta` でも動作を確認してください。

## 技術メモ

- LPは素のHTML/CSS（フレームワークなし）
- フォント: Zen Maru Gothic（Google Fonts）
- iOS Validation Releaseの技術設計は今後別途定義
- 子どもの正確な生年月日・性別・地域等はLocal-firstを基本とし、事業分析には粗粒度コホート情報を利用する方針
- 事業全体の最新ロードマップは `docs/business-roadmap.md`、Phase 0〜2の検証詳細は `docs/business-strategy.md` を参照
- AIエージェント運営体制は `docs/ai-agent-operating-model.md` を参照
- リポジトリ、タスク、品質、権限の運用は `docs/project-operating-policy.md` を参照
- 詳細な経緯・未着手タスクは `docs/handoff_memo.md` を参照
