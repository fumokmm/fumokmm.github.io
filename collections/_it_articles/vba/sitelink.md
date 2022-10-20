---
title: VBA関連サイト
article_group_id: reference-group
display_order: 910
created: 2020-09-28
updated: 2021-01-04
---
<table class="normal">
  <thead>
    <tr>
      <th style="text-align: left">サイト名など</th>
      <th style="text-align: left">URL</th>
    </tr>
  </thead>
  <tbody>
    {% for item in site.data.sitelink_vba %}
    <tr>
      <td style="text-align: left">
        <a href="{{item.top_url}}">{{item.site_name}}</a>さん{% if item.detail_name %}の{{item.detail_name}}{% endif %}
      </td>
      <td style="text-align: left">
        {% if item.detail_name %}
        <a href="{{item.detail_url}}">{{item.detail_url}}</a>
        {% else %}
        <a href="{{item.top_url}}">{{item.top_url}}</a>
        {% endif %}
      </td>
    </tr>
    {% endfor %}
  </tbody>
</table>

{% include articles_common_script.html %}
