---
layout: archive
title: "Post Archive with Feature Rows"
permalink: /post-archive-feature-rows/
author_profile: true
feature_row:
  - image_path: /assets/img/20-10-07-mortality/hu-mortality-w36-small.png
    alt: "placeholder image 1"
    title: "Placeholder 1"
    excerpt: "This is some sample content that goes here with **Markdown** formatting."
  - image_path: /assets/img/site/blabla-orange.png
    alt: "placeholder image 2"
    title: "Placeholder 2"
    excerpt: "This is some sample content that goes here with **Markdown** formatting."
    url: "/year-archive/"
    btn_label: "Read More"
    btn_class: "btn--primary"
  - image_path: /assets/img/site/unsplash-gallery-image-3-th.jpg
    title: "Placeholder 3"
    excerpt: "This is some sample content that goes here with **Markdown** formatting."
feature_row2:
  - image_path: /assets/img/site/unsplash-gallery-image-2-th.jpg
    alt: "placeholder image 2"
    title: "Placeholder Image Left Aligned"
    excerpt: 'This is some sample content that goes here with **Markdown** formatting. Left aligned with `type="left"`'
    url: "/"
    btn_label: "Read More"
    btn_class: "btn--primary"
feature_row3:
  - image_path: /assets/img/site/unsplash-gallery-image-2-th.jpg
    alt: "placeholder image 2"
    title: "Placeholder Image Right Aligned"
    excerpt: 'This is some sample content that goes here with **Markdown** formatting. Right aligned with `type="right"`'
    url: "#test-link"
    btn_label: "Read More"
    btn_class: "btn--primary"
feature_row4:
  - image_path: /assets/img/site/unsplash-gallery-image-2-th.jpg
    alt: "placeholder image 2"
    title: "Placeholder Image Center Aligned"
    excerpt: 'This is some sample content that goes here with **Markdown** formatting. Centered with `type="center"`'
    url: "#test-link"
    btn_label: "Read More"
    btn_class: "btn--primary"
---

# Most recent posts

{% for post in site.posts limit: 5 %}
  {% include archive-single.html %}
{% endfor %}

Find all posts [here]({{ site.baseurl }}/year-archive/).

# Featured

{% include feature_row id="intro" type="center" %}

{% include feature_row %}

{% include feature_row id="feature_row2" type="left" %}

{% include feature_row id="feature_row3" type="right" %}

{% include feature_row id="feature_row4" type="center" %}
