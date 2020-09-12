---
title: Linuxコマンド
created: 2020-09-11
updated: 2020-09-11
---
Linuxコマンドのメモです。

## <a name="index">目次</a>

- [ls](#ls)

### <a name="ls">ls</a>

「ls」はファイルを一覧表示するしたり、ファイルの詳細情報を表示する際に使うコマンドです。  
オプションが多いので、よく使うものをまとめておきます。

#### <a name="ls_option">lsのオプション</a>

<table>
    <tr>
        <th>オプション</th>
        <th>説明</th>
        <th>オプション</th>
        <th>説明</th>
    </tr>
    <tr>
        <td>-a</td>
        <td>すべて表示</td>
        <td>-m</td>
        <td>ファイル名をカンマ区切りで表示</td>
    </tr>
    <tr>
        <td>-l</td>
        <td>ファイルの詳細を表示</td>
        <td>-h</td>
        <td>単位を読みやすく表示</td>
    </tr>
    <tr>
        <td>-1</td>
        <td>リストを縦に並べる</td>
        <td>-k</td>
        <td>キロバイトで表示</td>
    </tr>
    <tr>
        <td>-r</td>
        <td>逆順で表示</td>
        <td>-i</td>
        <td>i-node番号を表示</td>
    </tr>
    <tr>
        <td>-t</td>
        <td>更新時間順に並べる</td>
        <td>-F</td>
        <td>情報を付与(`*`とか`/`とか)</td>
    </tr>
    <tr>
        <td>-S</td>
        <td>ファイルサイズ淳に並べる</td>
        <td>--help</td>
        <td>ヘルプの表示</td>
    </tr>
    <tr>
        <td>-X</td>
        <td>ファイルを拡張子ごとにまとめる</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td>-R</td>
        <td>ディレクトリを再帰的に表示</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td>--full-time</td>
        <td>タイムスタンプの詳細</td>
        <td></td>
        <td></td>
    </tr>
</table>
