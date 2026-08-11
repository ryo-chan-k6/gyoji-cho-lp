# LINE CTA・広告リンク運用メモ（GYOJI-CHO）

まいにち行事カレンダー 〜日本の行事帖〜 の LP 側チャンネル別CTA枠の使い方です。LINE公式アカウント開設後にこの手順で接続します。

## 1. 友だち追加リンクを発行する

LINE公式アカウント管理画面（または L Message / Lステップ）で、流入経路別リンクを作成します。

| キー | 用途 | LPのクエリ |
|---|---|---|
| `default` | 自然流入・SNS投稿など | なし、または `?ch=default` |
| `meta` | Meta広告 | `?ch=meta` |
| `google` | Google検索広告 | `?ch=google` |

## 2. LPにURLを入れる

`public/js/line-cta-config.js` を編集:

```js
window.LINE_CTA_CONFIG = {
  default: 'https://lin.ee/……',  // 例
  meta: 'https://lin.ee/……',
  google: 'https://lin.ee/……',
};
```

コミットして `main` に push すると GitHub Pages に反映されます。

## 3. 広告のリンク先

- Meta: `https://<公開ドメイン>/?ch=meta`
- Google: `https://<公開ドメイン>/?ch=google`

`utm_source=facebook|meta|instagram|ig` や `utm_source=google` でも自動判定されます（`ch` 優先）。

## 動作確認

ブラウザの開発者ツール Console で:

- `window.__LINE_CTA_CHANNEL__` … 判定されたチャンネル
- `window.__LINE_CTA_URL__` … 実際に付与された友だち追加URL（未設定時は `null`）
