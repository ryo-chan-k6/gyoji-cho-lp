# GYOJI-CHO（まいにち行事カレンダー 〜日本の行事帖〜）LP

| 項目 | 内容 |
|---|---|
| 正式名称 | まいにち行事カレンダー 〜日本の行事帖〜 |
| プロジェクト名 | GYOJI-CHO |

GYOJI-CHOは、乳幼児・子どもの家族固有行事を入口に、家族が日本の文化を知り、体験し、準備まで行えるよう先回りして支援するサービス構想です。

> **Mission: 日本の文化を知って、体験し、心を豊かにする。**

ユーザー獲得の入口は「赤ちゃんの行事」に置きつつ、将来的にはお正月・節分・七夕・お盆・十五夜など、家族で体験できる日本の伝統行事・風習まで扱います。

## 現在のフェーズ

現在はアプリ本体の本格開発前で、**Phase 0〜0.5（事業仮説固定・訴求検証・iOS Validation Release設計）**の段階です。

従来はLP→LINE事前登録CVRを本需要検証として想定していましたが、方針を更新しています。

- LP / LINE: 広告訴求・事前関心の補助検証、初期コミュニティ形成に利用
- 本需要検証: **iOS Validation ReleaseをApp Store公開し、実利用データでProduct Validationを行う**
- Web簡易MVP: 本来の通知・継続体験を十分再現できないため、本需要検証には使用しない
- Marketing: InstagramをPhase 0から並行運用し、ブランド・Organic獲得・コンテンツ仮説検証の資産を育てる

詳細:

- [`docs/business-roadmap.md`](docs/business-roadmap.md) — 事業ロードマップ、プロダクト/マーケティング/収益化、データ方針
- [`docs/monetization-scenarios.md`](docs/monetization-scenarios.md) — 収益モデル、悲観〜楽観シナリオ、Unit Economics、投資Gate

## 構成

```text
docs/business-roadmap.md          # 最新の事業ロードマップ（戦略の正本）
docs/monetization-scenarios.md    # 収益化シナリオ・Unit Economics
docs/handoff_memo.md              # 初期検討・LP作成時点の引継ぎメモ
docs/cloudflare-pages-setup.md    # Cloudflare Pages 公開手順
docs/line-ops-setup.md            # LINE / エルメ運用（補助検証・事前登録用）
docs/line-cta-setup.md            # チャンネル別 CTA
public/                           # 公開ルート（Cloudflare Pages）
  index.html
  about.html / privacy.html / contact.html
  js/line-cta-config.js           # チャンネル別 LINE URL
  js/line-cta.js
```

> 事業方針・フェーズ判断については `business-roadmap.md` を最新の正本とします。`handoff_memo.md` やLINE関連文書にはLP需要検証フェーズ当時の記述が残る場合があります。

## LP 公開URL

ホスティングは **Cloudflare Pages（無料の `*.pages.dev`）**。

- LP: `https://gyoji-cho.pages.dev/`
- Meta / Instagram広告: `https://gyoji-cho.pages.dev/?ch=meta`
- Google広告: `https://gyoji-cho.pages.dev/?ch=google`

セットアップ手順: [`docs/cloudflare-pages-setup.md`](docs/cloudflare-pages-setup.md)

※ 旧 GitHub Pages は Unpublish 済み想定。

## LINE CTA（補助検証・事前登録）

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
