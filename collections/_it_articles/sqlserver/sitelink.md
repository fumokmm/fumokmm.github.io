---
title: SQL Server関連サイト
display_order: 920
created: 2020-12-16
updated: 2021-02-12
---
<table class="normal">
  <thead>
    <tr>
      <th style="text-align: left">サイト名など</th>
      <th style="text-align: left">URL</th>
    </tr>
  </thead>
  <tbody>
    {% for item in site.data.sitelink_sqlserver %}
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
