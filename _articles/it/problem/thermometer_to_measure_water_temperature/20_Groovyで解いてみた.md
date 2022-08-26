---
chapter_no: 20
chapter_title: Groovyで解いてみた
created: 2022-08-26
updated: 2022-08-26
---
```:thermometer_to_measure_water_temperature.groovy
def thermometer = { n -> n <= 0 ? 'freeze' : n } 
assert thermometer(-1) == 'freeze'
assert thermometer(0) == 'freeze'
assert thermometer(1) == 1
```
- `assert`してる3行がテストです。