---
chapter_no: 3
chapter_title: for-inでループ
created: 2008-12-11
updated: 2021-06-29
---
### コレクションのループ
```
def array = [0, 1, 2, 3, 4]
def nums = ''
for (i in array) {
    nums += i 
}
assert nums == '01234'
```
