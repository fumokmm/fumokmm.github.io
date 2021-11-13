---
layout: default_layout
title: IT技術メモ
created: 2020-09-02
updated: 2021-11-13
---
## こちらはプログラミング関連のメモになります

<table>
    {% assign programming_languages = site.data.it_sub_category | where: 'sub_category_group', 'programming_language'
                                                                | sort: 'sub_category_order' %}
    {% for programming_language in programming_languages %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', programming_language.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ programming_language.link }}">{{ programming_language.sub_category_label }}</a></td>
        <td markdown="span">{{ programming_language.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはデータベース関連のメモになります

<table>
    {% assign databases = site.data.it_sub_category | where: 'sub_category_group', 'database'
                                                    | sort: 'sub_category_order' %}
    {% for database in databases %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', database.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ database.link }}">{{ database.sub_category_label }}</a></td>
        <td markdown="span">{{ database.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはOS関連のメモになります

<table>
    {% assign operating_systems = site.data.it_sub_category | where: 'sub_category_group', 'operating_system'
                                                            | sort: 'sub_category_order' %}
    {% for operating_system in operating_systems %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', operating_system.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ operating_system.link }}">{{ operating_system.sub_category_label }}</a></td>
        <td markdown="span">{{ operating_system.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはシェルスクリプト関連のメモになります

<table>
    {% assign shell_scripts = site.data.it_sub_category | where: 'sub_category_group', 'shellscript'
                                                        | sort: 'sub_category_order' %}
    {% for shell_script in shell_scripts %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', shell_script.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ shell_script.link }}">{{ shell_script.sub_category_label }}</a></td>
        <td markdown="span">{{ shell_script.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはエディタ関連のメモになります

<table>
    {% assign editors = site.data.it_sub_category | where: 'sub_category_group', 'editor'
                                                  | sort: 'sub_category_order' %}
    {% for editor in editors %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', editor.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ editor.link }}">{{ editor.sub_category_label }}</a></td>
        <td markdown="span">{{ editor.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはブラウザ関連のメモになります

<table>
    {% assign browsers = site.data.it_sub_category | where: 'sub_category_group', 'browser'
                                                   | sort: 'sub_category_order' %}
    {% for browser in browsers %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', browser.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ browser.link }}">{{ browser.sub_category_label }}</a></td>
        <td markdown="span">{{ browser.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはバージョン管理システム関連のメモになります

<table>
    {% assign sub_categories = site.data.it_sub_category | where: 'sub_category_group', 'version_control_system'
                                                         | sort: 'sub_category_order' %}
    {% for sub_category in sub_categories %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', sub_category.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_category.link }}">{{ sub_category.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_category.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはインスタントメッセンジャー関連のメモになります

<table>
    {% assign sub_categories = site.data.it_sub_category | where: 'sub_category_group', 'instant_messenger'
                                                         | sort: 'sub_category_order' %}
    {% for sub_category in sub_categories %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', sub_category.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_category.link }}">{{ sub_category.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_category.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはメールクライアントメモになります

<table>
    {% assign mail_clients = site.data.it_sub_category | where: 'sub_category_group', 'mail_client'
                                                       | sort: 'sub_category_order' %}
    {% for mail_client in mail_clients %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', mail_client.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ mail_client.link }}">{{ mail_client.sub_category_label }}</a></td>
        <td markdown="span">{{ mail_client.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはアプリケーション関連のメモになります

<table>
    {% assign applications = site.data.it_sub_category | where: 'sub_category_group', 'application'
                                                       | sort: 'sub_category_order' %}
    {% for appli in applications %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', appli.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ appli.link }}">{{ appli.sub_category_label }}</a></td>
        <td markdown="span">{{ appli.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはビルドツール関連のメモになります

<table>
    {% assign build_tools = site.data.it_sub_category | where: 'sub_category_group', 'build_tool'
                                                       | sort: 'sub_category_order' %}
    {% for build_tool in build_tools %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', build_tool.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ build_tool.link }}">{{ build_tool.sub_category_label }}</a></td>
        <td markdown="span">{{ build_tool.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはテンプレート言語関連のメモになります

<table>
    {% assign template_languages = site.data.it_sub_category | where: 'sub_category_group', 'template_language'
                                                             | sort: 'sub_category_order' %}
    {% for template_language in template_languages %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', template_language.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ template_language.link }}">{{ template_language.sub_category_label }}</a></td>
        <td markdown="span">{{ template_language.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはテスト関連のメモになります

<table>
    {% assign tests = site.data.it_sub_category | where: 'sub_category_group', 'test'
                                                | sort: 'sub_category_order' %}
    {% for test in tests %}
    <tr>
        {% assign articles = site.it_articles | where: 'category_id', 'it'
                                              | where: 'sub_category_id', test.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ test.link }}">{{ test.sub_category_label }}</a></td>
        <td markdown="span">{{ test.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはその他のメモになります

<table>
    {% assign others = site.data.it_sub_category | where: 'sub_category_group', 'other'
                                                 | sort: 'sub_category_order' %}
    {% for other in others %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', other.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ other.link }}">{{ other.sub_category_label }}</a></td>
        <td markdown="span">{{ other.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>
