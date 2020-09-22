---
layout: default
title: Willkommen
---

<video class="bg-video" autoplay="autoplay" muted="muted" loop="loop" playsinline="playsinline" src="{{ site.url }}/assets/img/schwalbe.mp4"></video>
<script>
  (() => {
    const video = document.querySelector("video");
    video.playbackRate = 0.4;
    document.addEventListener('mousemove', (e) => {
      window.requestAnimationFrame(() => {
        const x = Math.sin(e.pageX / window.innerWidth * Math.PI);
        const rotate = 45 * (1 - x);
        const brightness = 70 + x * 30;
        video.style.filter = `hue-rotate(${rotate}deg) brightness(${brightness}%)`;
      });
    });
  })();
</script>
<script src="/assets/js/object-fit-videos.min.js" defer async onload="objectFitVideos();"></script>

# Willkommen

Smartparts sind parametrische Bauteile die in Allplan Version 2012 eingeführt wurden. Diese Bauteile müssen in der Programmiersprache SmartPart-Script programmiert werden.

SmartPart-Script ist eine BASIC ähnliche Programmiersprache und basiert auf der GDL (Geometric Description Language) und wurde um Allplan spezifische Funktionen erweitert. Mit SmartPart-Script können parametrisierte 2D- und 3D-Objekte erstellt werden.

Diese Dokumentation wurde ursprünglich von Manfred Moitzi, selbstständiger Konstrukteur für Stahlbetonbau in Österreich, verfasst und uns zur Weiterführung zur Verfügung gestellt. Die Inhalte dieser Seiten sind unter einer Creative-Commons-Lizenz verfügbar.

<div class="apps apps--smt-home">
  {% for item in site.nav %}
    {% if item.app %}
      <a class="apps__app" href="{{ item.url }}" data-aos="fade-up">
        <div class="apps__app__inner">
          <img
          src="{{ item.app }}" class="apps__app__img"
          alt="{{ item.title }}">
        </div>
        <div class="apps__app__label">{{ item.title }}</div>
      </a>
    {% endif %}
  {% endfor %}
</div>