---
chapter_no: 30
chapter_title: Groovyで解いてみた
created: 2022-08-06
updated: 2022-08-06
---
```:dodosuko.groovy
def array = ['ドド', 'スコ']
def getWord = {
    def r = new Random(System.currentTimeMillis())
    return { array[r.nextInt(2)] }
}()
def keyword = 'ドドスコスコスコ' * 3
def love = 'ラブ注入♡'
def words = 'どどすこすこすこ' * 3
for (int count in 1..10000) {
   def w = getWord()
   words = words[2..-1] + w

   print "${w + (count % 20 == 0 ? "\n" : '')}"

   if (words == keyword) {
       println love
       println "${count} times."
       break
   }
}
```
- for (int count in 1..10000)
  - メインループの回数はとりあえず1万回にしています。このくらいあれば組み合わせとして出てくるはず。
