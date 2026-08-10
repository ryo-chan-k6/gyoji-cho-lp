# まいにち行事カレンダー（LP）

新生児〜小学校入学までの子育て行事を自動カレンダー登録するアプリの、需要検証用ランディングページです。

現在はアプリ本体未着手。LP から LINE 公式アカウントへの事前登録で CVR を計測するフェーズです。

## 構成

```
docs/handoff_memo.md   # Claude からの引継ぎメモ（決定事項・次アクション）
public/                # 公開用静的ファイル
  index.html           # LP 本体
  about.html           # 運営者情報
  privacy.html         # プライバシーポリシー
  contact.html         # お問い合わせ（送信未実装）
```

## ローカル確認

`public/` を静的サーバのルートにして開きます。

```bash
# Python がある場合
python3 -m http.server 8080 --directory public
```

ブラウザで http://localhost:8080 を開いてください。

## 技術メモ

- 素の HTML/CSS（フレームワークなし）
- フォント: Zen Maru Gothic（Google Fonts）
- CTA: LINE 友だち登録（URL は未設定のプレースホルダ）
- 詳細な経緯・未着手タスクは `docs/handoff_memo.md` を参照
