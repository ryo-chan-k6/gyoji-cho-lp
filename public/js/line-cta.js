(function () {
  var config = window.LINE_CTA_CONFIG || {};

  function normalizeChannel(raw) {
    if (!raw) return null;
    var v = String(raw).toLowerCase().trim();
    if (v === 'meta' || v === 'facebook' || v === 'fb' || v === 'instagram' || v === 'ig') {
      return 'meta';
    }
    if (v === 'google' || v === 'adwords' || v === 'gads') {
      return 'google';
    }
    if (v === 'default' || v === 'organic' || v === 'direct') {
      return 'default';
    }
    return null;
  }

  function resolveChannel() {
    var params = new URLSearchParams(window.location.search);
    var fromCh = normalizeChannel(params.get('ch'));
    if (fromCh) return fromCh;

    var fromUtm = normalizeChannel(params.get('utm_source'));
    if (fromUtm) return fromUtm;

    var fromMedium = String(params.get('utm_medium') || '').toLowerCase();
    if (fromMedium === 'cpc' || fromMedium === 'paid') {
      // medium alone is ambiguous; keep default
    }

    return 'default';
  }

  function resolveUrl(channel) {
    var url = (config[channel] || '').trim();
    if (url) return url;
    return (config.default || '').trim();
  }

  function applyCtas() {
    var channel = resolveChannel();
    var url = resolveUrl(channel);
    var nodes = document.querySelectorAll('[data-line-cta]');

    nodes.forEach(function (el) {
      el.setAttribute('data-channel', channel);
      if (url) {
        el.setAttribute('href', url);
        el.setAttribute('target', '_blank');
        el.setAttribute('rel', 'noopener noreferrer');
        el.removeAttribute('aria-disabled');
      } else {
        el.setAttribute('href', '#cta');
        el.removeAttribute('target');
        el.removeAttribute('rel');
      }
    });

    // デバッグ用（コンソールで流入チャンネル確認）
    window.__LINE_CTA_CHANNEL__ = channel;
    window.__LINE_CTA_URL__ = url || null;
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', applyCtas);
  } else {
    applyCtas();
  }
})();
