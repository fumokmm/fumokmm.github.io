---
chapter_no: 10
chapter_title: Initialize-On-Demand Holder
created: 2008-04-10
updated: 2008-04-10
---
忘れないようにメモ。  

Javaでシングルトンを実現しようとする際のクラス生成イディオム。  
`double-checked locking問題`をすっぱりと解決したもので、スレッドセーフな上に高速であり、混乱も少ないのが特徴。
簡単！安全！すっきりキレイ！

```
class Singleton {
    {em:comment{/** インスタンスホルダー */}em}
    private static class Holder {
        public static final Singleton instance = new Singleton();
    };
        :
        :
        :
    {em:comment{/** コンストラクタは封印 */}em}
    private Singleton(){};

    {em:comment{/** 唯一のSingletonインスタンスをゲット！ */}em}
    public static Singleton getInstance() {
        return Holder.instance;
    } 
}
```
要するに、`Singleton#getInstance()`呼び出し時に、プライベートインナークラスの`Holder`の`instance`に最初にアクセスしたタイミングで、`Singleton`のインスタンスが唯一生成される。  
このタイミングは排他されるんで、`synchronized`しなくてもよい。ってな具合です。