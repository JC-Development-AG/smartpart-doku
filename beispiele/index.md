---
layout: default
title: Beispiele
---

# Beispiele

Hier bieten wir Beispiel-Smartparts zum Download an, die den Einstieg in die
Smartpart-Programmierung erleichtern:

{% for category in site.beispiele %}
  <h2 class="sample-h2">{{ category.category }}</h2>
  <div class="samples">
  {% for item in category.items %}
    <div>
      <a href="{{ item.file }}">{{ item.title }}</a>
    </div>
  {% endfor %}
  </div>
{% endfor %}