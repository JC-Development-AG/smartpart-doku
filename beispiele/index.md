---
layout: default
---

# Beispiele

Hier bieten wir Beispiel-Smartparts zum Download an, die den Einstieg in die
Smartpart-Programmierung erleichtern:

{% for item in site.beispiele %}
  <p>
    <a href="{{ item.file }}">{{ item.title }}</a>
  </p>
{% endfor %}