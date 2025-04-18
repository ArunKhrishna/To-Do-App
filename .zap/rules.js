function shouldIgnore(alert) {
    // Ignore Proxy Disclosure [40025] and SRI Attribute Missing [90003]
    return alert.getPluginId() == '40025' || alert.getPluginId() == '90003';
  }
  