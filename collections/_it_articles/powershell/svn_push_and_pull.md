---
title: PowerShellでSVNリポジトリをpushしたりpullしたりするツール
article_group_id: tool-group
display_order: 10
created: 2021-06-19
updated: 2021-07-26
---
{% capture link_to_it_git %}{% link _it_articles/git/index.md %}{% endcapture %}
{% assign link_to_it_git = link_to_it_git | remove: 'index' %}
{% capture link_to_it_subversion %}{% link _it_articles/subversion/index.md %}{% endcapture %}
{% assign link_to_it_subversion = link_to_it_subversion | remove: 'index' %}

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#これは何？">これは何？</a></li>
<li><a href="#リポジトリ構造">リポジトリ構造</a></li>
<li><a href="#スクリプト">スクリプト</a></li>
<li><a href="#挙動">挙動</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="これは何？">これは何？</a><a class="heading-anchor-permalink" href="#これは何？">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-19" updated="2021-06-19" %}</div>
分散バージョンシ管理ステムである[Git]({{link_to_it_git}})では、ローカルにリポジトリを作成してそこにいつでも好きなタイミングでコミットできるようになっています。そして、任意のタイミングでリモートリポジトリ(他の開発者と共有しているリポジトリ)にプッシュすることで、自分の作業を後悔することができます。

ところが、同じバージョン管理システムで古くからある[Subversion]({{link_to_it_subversion}})は、分散型ではないため、基本的に中央リポジトリが一つのみとなっており、開発者はコミットする時にすべて中央リポジトリにコミットされる形となっている。

どちらが良いとか悪いとかの議論はここでは避けるとして、とある環境でSubversionしか使えない状況であるが、中央リポジトリを立ててもらえないという残念な状況に陥ることがあった。そこで、無理やりではあるが、SubversionのリポジトリをGitのそれのように共有フォルダにプッシュしたり、プルしたりできるようにしてみたツールがこれである。

### ご注意
なお、スクリプト内部で`robocopyコマンド`を使っていますので、Windows専用です。

{% include goto_pagetop.html %}

* * *
## <a name="リポジトリ構造">リポジトリ構造</a><a class="heading-anchor-permalink" href="#リポジトリ構造">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-19" updated="2021-06-19" %}</div>
まず、ツールを動作させるためのSVNリポジトリの構造はこんな風にします。

### ローカル側
<div class="code-box">
<div class="title">C:\temp\testrepos</div>
<div class="copy-button">Copy</div>
<pre>
│
├─.svnrepos
│       ここの中身がSVNリポジトリ
│
├─wc
│       ここの中身がreposをチェックアウトした内容
└─scripts
       push.ps1
       pull.ps1
</pre>
</div>
- どことなく、Gitに似せている感じ。Gitの`.git`がここでは、`.svnrepos`フォルダと同じイメージと捉えていただきたい。
- `wc`へのチェックアウトは、`.svnrepos`から手動で実施して下さい。

### リモート側
<div class="code-box">
<div class="title">N:\repos\svn</div>
<div class="copy-button">Copy</div>
<pre>
│
├─testrepos.svnrepos
│
└─testrepos.lnk (TortoiseSVNでRepository Browserを開くショートカット)
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="スクリプト">スクリプト</a><a class="heading-anchor-permalink" href="#スクリプト">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-19" updated="2021-06-19" %}</div>
- `push.ps1`と`pull.ps1`の先頭の2行で、リポジトリ名とリモートのリポジトリ置き場となるフォルダを指定して下さい。
- 変数は`$reposName`と`$remoteBaseDir`です。

<div class="code-box">
<div class="title">push.ps1</div>
<div class="copy-button">Copy</div>
<pre>
$reposName = 'testrepos'
$remoteBaseDir = 'N:\repos\svn\'

# プッシュを実装
function doPush {
    param(
        $reposName,
        $remoteBaseDir,
        $localReposDir,
        $remoteReposDir
    )
    # リポジトリフォルダのコピーを実行
    robocopy $localReposDir $remoteReposDir /MIR /E /R:1
    
    if ($remoteBaseDir.Substring(1, 1) -eq ':') {
        $remoteReposSvnPath = 'file:///' + ($remoteReposDir -replace '\\', '/') + '/trunk'
    } else {
        $remoteReposSvnPath = 'file:' + ($remoteReposDir -replace '\\', '/') + '/trunk'
    }

    # TortoiseSvnのRepository Browserのショートカットを作成
    $wshShell = New-Object -ComObject WScript.Shell
    $linkPath = Join-Path $remoteBaseDir "$($reposName).lnk"
    $shortcut = $wshShell.CreateShortcut($linkPath)
    $shortcut.TargetPath = "`"C:\Program Files\TortoiseSVN\bin\TortoiseProc.exe`""
    $shortcut.Arguments = "/command:repobrowser /path:`"$($remoteReposSvnPath)`""
    $shortcut.IconLocation = "C:\Program Files\TortoiseSVN\bin\TortoiseProc.exe"
    $shortcut.WorkingDirectory = "C:\Program Files\TortoiseSVN\bin"
    $shortcut.Save()
}

# リポジトリのリビジョン番号を調べる
# リポジトリがない場合、リビジョン0を返却
function getReposRevision {
    param(
        $reposDir # リポジトリのディレクトリ
    )
    if (($reposDir -ne $null) -and (Test-Path $reposDir) -eq $True) {
        return [int](Get-Content (Join-Path (Join-Path $reposDir 'db') 'current'))
    } else {
        return [int]0
    }
}


# 同期化したリビジョンを更新
function updateSyncRevision{
    param(
        $newRevision
    )
    Set-Content -Path (Join-Path $PSScriptRoot \..\.syncrevision) -Value $newRevision
}

######################################
# ここからメイン処理
######################################

$localReposDir = Resolve-Path (Join-Path $PSScriptRoot \..\.svnrepos)
$remoteReposDir = Join-Path $remoteBaseDir "$($reposName).svnrepos"

# リポジトリのリビジョンを調べる
$localRevision = getReposRevision -reposDir $localReposDir
$remoteRevision = getReposRevision -reposDir $remoteReposDir
if ((Test-Path (Join-Path $PSScriptRoot \..\.syncrevision))) {
    $syncRevision = [int](Get-Content (Join-Path $PSScriptROot \..\.syncrevision))
} else {
    $syncRevision = [int]0
}
Write-Host "local  : $localRevision"
Write-Host "remote : $remoteRevision"
Write-Host "sync   : $syncRevision"

# 前回同期時からローカルリビジョンが同じ場合、push不要
if ($localRevision -eq $syncRevision) {
    Write-Host '前回同期化時からローカルリポジトリに更新がないため、Pushの必要がありません。'
    exit 0

# 前回同期化時よりもローカルリビジョンが下がった場合、状態が変
} elseif ($localRevision -lt $syncRevision) {
    Write-Host "状態が変です。前回同期化時よりもローカルリポジトリが古くなっています。前回同期化時のリビジョン:$syncRevision、ローカルのリビジョン:$localRevision"
    exit 1

# 前回同期化後にローカルリビジョンが上がった場合、push可能
} else {
    # Write-Host 'Push可能です。'
    
    # 前回同期化時よりもリモートリビジョンが上がっている場合
    if ($syncRevision -lt $remoteRevision) {
        Write-Host 'リモートが最新です。先にPullして下さい。'
        Write-Host '※Pullするとローカルにコミットした内容は失われますので、データを退避するなりして備えて下さい。'
        exit 0

    # 前回同期化時よりもリモートリビジョンが下がっている場合
    } elseif ($syncRevision -gt $remoteRevision) {
        Write-Host "状態が変です。前回同期時よりもリモートリポジトリが古くなっています。前回同期化時のリビジョン:$syncRevision、リモートのリビジョン:$remoteRevision"
        exit 1

    # 前回同期化時とリモートリビジョンが同じ場合
    } else {
        # Write-Host 'Push可能です。'
        
        # プッシュを実行
        doPush -reposName $reposName `
               -remoteBaseDir $remoteBaseDir `
               -localReposDir $localReposDir `
               -remoteReposDir $remoteReposDir

        # 同期化したリビジョンを更新
        updateSyncRevision -newRevision $localRevision
    }
}
</pre>
</div>

<div class="code-box">
<div class="title">pull.ps1</div>
<div class="copy-button">Copy</div>
<pre>
$reposName = 'testrepos'
$remoteBaseDir = 'N:\repos\svn\'

# プルを実装
function doPull {
    param(
        $localReposDir,
        $remoteReposDir,
        $syncRevision,
        $localRevision
    )

    # ローカルリポジトリを退避
    robocopy $localReposDir (Join-Path $PSScriptRoot "\..\.svnrepos_bk\.svnrepos_$((Get-Date).ToString('yyyyMMddHHmmss'))_r$($($syncRevision))to$($localRevision)") /MIR /E /R:1
    # リポジトリフォルダのコピーを実行
    robocopy $remoteReposDir $localReposDir /MIR /E /R:1
}

# リポジトリのリビジョン番号を調べる
# リポジトリがない場合、リビジョン0を返却
function getReposRevision {
    param(
        $reposDir # リポジトリのディレクトリ
    )
    if (($reposDir -ne $null) -and (Test-Path $reposDir) -eq $True) {
        return [int](Get-Content (Join-Path (Join-Path $reposDir 'db') 'current'))
    } else {
        return [int]0
    }
}

# 同期化したリビジョンを更新
function updateSyncRevision{
    param(
        $newRevision
    )
    Set-Content -Path (Join-Path $PSScriptRoot \..\.syncrevision) -Value $newRevision
}

######################################
# ここからメイン処理
######################################

$localReposDir = Resolve-Path (Join-Path $PSScriptRoot \..\.svnrepos)
$remoteReposDir = Join-Path $remoteBaseDir "$($reposName).svnrepos"

# リポジトリのリビジョンを調べる
$localRevision = getReposRevision -reposDir $localReposDir
$remoteRevision = getReposRevision -reposDir $remoteReposDir
if ((Test-Path (Join-Path $PSScriptRoot \..\.syncrevision))) {
    $syncRevision = [int](Get-Content (Join-Path $PSScriptROot \..\.syncrevision))
} else {
    $syncRevision = [int]0
}
Write-Host "local  : $localRevision"
Write-Host "remote : $remoteRevision"
Write-Host "sync   : $syncRevision"

# 前回同期時とリモートリビジョンが同じ場合、pull不要
if ($remoteRevision -eq $syncRevision) {
    Write-Host '前回同期化時からリモートリポジトリに更新がないため、Pullの必要がありません。'
    exit 0

# 前回同期化時よりもリモートリビジョンが下がった場合、状態が変
} elseif ($remoteRevision -lt $syncRevision) {
    Write-Host "状態が変です。前回同期化時よりもリモートリポジトリが古くなっています。前回同期化時のリビジョン:$syncRevision、リモートのリビジョン:$remoteRevision"
    exit 1

# 前回同期化後にリモートリビジョンが上がった場合、pull可能
} else {
    # Write-Host 'Pull可能です。'
    
    # 前回同期化時よりもローカルリビジョンが上がっている場合、確認メッセージを入れてからPullする
    if ($syncRevision -lt $localRevision) {
        $objYes = New-Object System.Management.Automation.Host.ChoiceDescription "&amp;Yes", "実行する"
        $objNo = New-Object System.Management.Automation.Host.ChoiceDescription "&amp;No", "やめておく"
        $objOptions = [System.Management.Automation.Host.ChoiceDescription[]]($objYes, $objNo)
        $objMessage = @"
リモートが最新ですが、ローカルにもコミットしています。
ローカル: $($syncRevision) -&gt; $($localRevision)
リモート: $($syncRevision) -&gt; $($remoteRevision)
※Pullするとローカルにコミットした内容は失われますので、データを退避するなりして備えて下さい。
"@
        $resultVal = $host.ui.PromptForChoice('実行しますか？', $objMessage, $objOptions, 1)
        if ($resultVal -ne 0) {
            Write-Host "処理が中断されました。"
            exit 0
        }
    }
    
    # プルを実行
    doPull -localReposDir $localReposDir `
           -remoteReposDir $remoteReposDir `
           -syncRevision $syncRevision `
           -localRevision $localRevision

    # 同期化したリビジョンを更新
    updateSyncRevision -newRevision $remoteRevision

    exit 0
}
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="挙動">挙動</a><a class="heading-anchor-permalink" href="#挙動">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-19" updated="2021-06-19" %}</div>
### ローカル側
- ローカルでは通常の使い方として、`wcフォルダ`配下で作業していきます。
  - `commit`や`revert`などお好きにどうぞ。
- そろそろみんなに公開しとくか、となったら`scripts`フォルダの`push.ps1`をPowerShellで実行します。
- すると、スクリプト内で指定されたリモートリポジトリにリポジトリが同期されます。
- 一度同期すると、`.syncrevision`が作成されます。

<div class="code-box">
<div class="title">C:\temp\testrepos</div>
<div class="copy-button">Copy</div>
<pre>
│
├─.svnrepos
│       ここの中身がSVNリポジトリ
│
├─wc
│       ここの中身がreposをチェックアウトした内容
├─scripts
│      push.ps1
│      pull.ps1
│ 
└─<em>.syncrevision 　※同期したときのリビジョン番号を保持しているテキストファイル</em>

</pre>
</div>

- 他の開発者がリモートのリポジトリにプッシュした内容を取り込むには、`scripts`フォルダの`pull.ps1`をPowerShellで実行します。
- すると、リモートリポジトリの内容でローカルのリポジトリが書き換わります。
- あとは、`wc`フォルダに入って行って、`SVN Update`を行って下さい。
- 上記挙動ですが、`git pull`というよりも`git fetch`に近い挙動かもしれません。まぁいいか。
- ローカルのリポジトリを書き換える際、何があるか分からないため、`.svnrepos_bk`というフォルダが作成され、そこにこれまであったローカルのリポジトリがバックアップされています。
  - バックアップされたフォルダのフォルダ名には、バックアップ時の時刻と、前回同期化実行時から今回までのリビジョン番号が付与されています。

<div class="code-box">
<div class="title">C:\temp\testrepos</div>
<div class="copy-button">Copy</div>
<pre>
│
├─.svnrepos
│       ここの中身がSVNリポジトリ
│
├─<em>.svnrepos_bk</em>
│  ├─<em>.svnrepos_yyyyMMddHHmmss_r4to6</em>
│  ├─<em>.svnrepos_yyyyMMddHHmmss_r8to10</em>
│  ├─<em>.svnrepos_yyyyMMddHHmmss_r12to16</em>
│                  <em>：</em>
│                  <em>：</em>
│
├─wc
│       ここの中身がreposをチェックアウトした内容
├─scripts
│      push.ps1
│      pull.ps1
│ 
└─.syncrevision 　※同期したときのリビジョン番号を保持しているテキストファイル

</pre>
</div>
- たまに競合しますので、その際もバックアップされたリポジトリから情報をひっぱってきて、解決するようにして下さい。

### リモート側
- 一度でもプッシュされていると、リモート側にTortoiseSVNのRepository Browserでリモートのリポジトリを開けるショートカットも同時作成されますので、活用下さい。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-19" updated="2021-07-26" %}</div>
### ソース
- [(language-examples) 0006_svnrepossync_push.ps1](https://github.com/fumokmm/language-examples/blob/main/PowerShell/0006_svnrepossync_push.ps1)
- [(language-examples) 0007_svnrepossync_fetch.ps1](https://github.com/fumokmm/language-examples/blob/main/PowerShell/0007_svnrepossync_fetch.ps1)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
