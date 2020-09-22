---
layout: default
title: Beispiele
---

# Beispiele

Hier bieten wir Beispiel-Smartparts zum Download an, die den Einstieg in die
Smartpart-Programmierung erleichtern:

<div class="samples">
{% for item in site.beispiele %}
  <div>
    <a href="{{ item.file }}">{{ item.title }}</a>
  </div>
{% endfor %}
</div>