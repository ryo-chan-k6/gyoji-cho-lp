# Cloudflare Pages 公開手順（GYOJI-CHO）

需要検証フェーズは **独自ドメインなし**。無料の `*.pages.dev` で公開する。

## 方針

| 項目 | 内容 |
|---|---|
| ホスティング | Cloudflare Pages（無料） |
| 公開URL | `https://gyoji-cho.pages.dev/` |
| 広告リンク例 | `https://gyoji-cho.pages.dev/?ch=meta` |
| 独自ドメイン | 需要確認後に検討 |
| デプロイ | GitHub `main` への push で自動 |

公開ルートはリポジトリの `public/`。

---

## 1. 事前準備（リポジトリ）

`main` に最新の `public/`（LINE CTA URL 含む）が push されていること。

---

## 2. Cloudflare で Pages プロジェクト作成

1. [Cloudflare Dashboard](https://dash.cloudflare.com/) にログイン（OKURI と同じアカウントで可）
2. 左メニュー **Workers & Pages** → **Create** → **Pages** → **Connect to Git**
3. GitHub の `ryo-chan-k6/gyoji-cho-lp` を選択（未連携なら GitHub 認証）
4. ビルド設定:

| 項目 | 値 |
|---|---|
| Project name | `gyoji-cho`（→ `gyoji-cho.pages.dev`） |
| Production branch | `main` |
| Framework preset | **None** |
| Build command | （空欄） |
| Build output directory | `public` |

5. **Save and Deploy**

---

## 3. 動作確認（完了）

- [x] `https://gyoji-cho.pages.dev/` が開く
- [x] `/?ch=meta` で CTA が Meta 用 LINE URL になる
- [x] Console で `__LINE_CTA_CHANNEL__` / `__LINE_CTA_URL__`
- [x] 実機で友だち追加 → 事前登録フォームまで通る
- [x] about / privacy / contact が開ける

---

## 4. GitHub Pages を止める

1. GitHub リポジトリ → **Settings** → **Pages** → **Unpublish site**
2. Source が GitHub Actions のままでも、デプロイ用 workflow はリポジトリから削除済み（再公開防止）

---

## 5. URL差し替えチェックリスト

本番URL:

| 用途 | URL |
|---|---|
| LP | `https://gyoji-cho.pages.dev/` |
| プライバシー | `https://gyoji-cho.pages.dev/privacy.html` |
| Meta / Instagram | `https://gyoji-cho.pages.dev/?ch=meta` |
| Google | `https://gyoji-cho.pages.dev/?ch=google` |

差し替え先:

- [ ] LINE プロフィール「お知らせ」内の LP リンク → `https://gyoji-cho.pages.dev/`
- [ ] LINE Developers プロバイダーのプライバシーポリシー URL → `https://gyoji-cho.pages.dev/privacy.html`
- [x] README / 運用ドキュメント（リポジトリ側は `pages.dev` に統一済み）
- [ ] Instagram / Meta 広告のリンク先（出稿時）→ `https://gyoji-cho.pages.dev/?ch=meta`

---

## 6. 独自ドメイン（将来）

需要検証がうまくいったら:

1. ドメイン取得
2. Cloudflare DNS に追加
3. Pages → Custom domains で紐づけ
4. 広告・LINE内リンクを独自ドメインに一本化
