/**
 * LINE友だち追加URL（チャンネル別）
 *
 * LINE公式アカウント開設後、各キーに友だち追加リンクを貼ってください。
 * 空文字のままのチャンネルは default にフォールバックします。
 * default も空のときは、ページ内の #cta へスクロールします。
 *
 * 広告出稿時のLP URL例:
 *   Meta広告:   https://<domain>/?ch=meta
 *   Google広告: https://<domain>/?ch=google
 *   その他/自然: https://<domain>/  または ?ch=default
 *
 * utm_source からも自動判定します（facebook/meta/ig → meta、google → google）。
 */
window.LINE_CTA_CONFIG = {
  /** 自然流入・チャンネル未指定時 */
  default: 'https://lin.ee/O82VG54',
  /** Meta広告用の友だち追加リンク（Instagram含む） */
  meta: 'https://lin.ee/SLnojPz',
  /** Google検索広告用の友だち追加リンク */
  google: 'https://lin.ee/t98ZQVP',
};
