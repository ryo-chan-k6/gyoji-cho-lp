# GYOJI-CHO（まいにち行事カレンダー 〜日本の行事帖〜）LP

| 項目 | 内容 |
|---|---|
| 正式名称 | まいにち行事カレンダー 〜日本の行事帖〜 |
| プロジェクト名 | GYOJI-CHO |

新生児〜小学校入学までの子育て行事を自動カレンダー登録するアプリの、需要検証用ランディングページです。

現在はアプリ本体未着手。LP から LINE 公式アカウントへの事前登録で CVR を計測するフェーズです。

## 構成

```
docs/handoff_memo.md          # Claude からの引継ぎメモ
public/                       # 公開ルート（GitHub Pages）
  index.html                  # LP 本体
  about.html / privacy.html / contact.html
  js/line-cta-config.js       # チャンネル別 LINE URL（ここを埋める）
  js/line-cta.js              # ?ch= / utm_source から URL を解決
```

## 公開URL

GitHub Pages デプロイ後:

- LP: `https://ryo-chan-k6.github.io/gyoji-cho-lp/`
- Meta広告用: `https://ryo-chan-k6.github.io/gyoji-cho-lp/?ch=meta`
- Google広告用: `https://ryo-chan-k6.github.io/gyoji-cho-lp/?ch=google`

※ リポジトリ名 / ローカルフォルダ名は `gyoji-cho-lp` です。プロダクト正式名称・プロジェクト名は上記のとおりです。
※ 独自ドメイン取得後は上記パスをドメイン直下に差し替えてください。

## LINE CTA（チャンネル別）

1. LINE公式アカウントで流入経路別の友だち追加リンクを発行する
2. `public/js/line-cta-config.js` の `default` / `meta` / `google` に URL を貼る
3. 広告のリンク先に `?ch=meta` または `?ch=google` を付ける

URL 未設定時は、CTA はページ内 `#cta` へスクロールします。

## ローカル確認

```bash
python3 -m http.server 8080 --directory public
```

ブラウザで http://localhost:8080 を開き、`?ch=meta` でも動作を確認してください。

## 技術メモ

- 素の HTML/CSS（フレームワークなし）
- フォント: Zen Maru Gothic（Google Fonts）
- 詳細な経緯・未着手タスクは `docs/handoff_memo.md` を参照
