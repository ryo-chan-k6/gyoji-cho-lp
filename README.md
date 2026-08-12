# GYOJI-CHO（まいにち行事カレンダー 〜日本の行事帖〜）LP

| 項目 | 内容 |
|---|---|
| 正式名称 | まいにち行事カレンダー 〜日本の行事帖〜 |
| プロジェクト名 | GYOJI-CHO |

新生児〜小学校入学までの子育て行事を自動カレンダー登録するアプリの、需要検証用ランディングページです。

現在はアプリ本体未着手。LP から LINE 公式アカウントへの事前登録で CVR を計測するフェーズです。

## 構成

```
docs/handoff_memo.md              # 引継ぎメモ
docs/cloudflare-pages-setup.md    # Cloudflare Pages 公開手順
docs/line-ops-setup.md            # LINE / エルメ運用
docs/line-cta-setup.md            # チャンネル別 CTA
public/                           # 公開ルート（Cloudflare Pages）
  index.html
  about.html / privacy.html / contact.html
  js/line-cta-config.js           # チャンネル別 LINE URL
  js/line-cta.js
```

## 公開URL

ホスティングは **Cloudflare Pages（無料の `*.pages.dev`）**。独自ドメインは需要検証後に検討。

想定（プロジェクト名 `gyoji-cho` の場合）:

- LP: `https://gyoji-cho.pages.dev/`
- Meta / Instagram広告: `https://gyoji-cho.pages.dev/?ch=meta`
- Google広告: `https://gyoji-cho.pages.dev/?ch=google`

セットアップ手順: [`docs/cloudflare-pages-setup.md`](docs/cloudflare-pages-setup.md)

※ 本番は Cloudflare Pages（`https://gyoji-cho.pages.dev/`）。旧 GitHub Pages は Unpublish 済み想定。

## LINE CTA（チャンネル別）

1. LINE公式アカウントで流入経路別の友だち追加リンクを発行する
2. `public/js/line-cta-config.js` の `default` / `meta` / `google` に URL を貼る
3. 広告のリンク先に `?ch=meta` または `?ch=google` を付ける

## ローカル確認

```bash
python3 -m http.server 8080 --directory public
```

ブラウザで http://localhost:8080 を開き、`?ch=meta` でも動作を確認してください。

## 技術メモ

- 素の HTML/CSS（フレームワークなし）
- フォント: Zen Maru Gothic（Google Fonts）
- 詳細な経緯・未着手タスクは `docs/handoff_memo.md` を参照
