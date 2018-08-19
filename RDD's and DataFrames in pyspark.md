

```python
#import findspark
#findspark.init()


from pyspark import SparkContext

sc = SparkContext.getOrCreate()

```


```python
data = sc.parallelize([('Jordon',100),('Joson', 150)])
```


```python
data.count()
```




    2




```python
data.collect()
```




    [('Jordon', 100), ('Joson', 150)]



# Creating RDD from textfile


```python
coldata = sc.textFile("auto-data.csv")
```


```python
coldata.take(5)
```




    ['MAKE,FUELTYPE,ASPIRE,DOORS,BODY,DRIVE,CYLINDERS,HP,RPM,MPG-CITY,MPG-HWY,PRICE',
     'subaru,gas,std,two,hatchback,fwd,four,69,4900,31,36,5118',
     'chevrolet,gas,std,two,hatchback,fwd,three,48,5100,47,53,5151',
     'mazda,gas,std,two,hatchback,fwd,four,68,5000,30,31,5195',
     'toyota,gas,std,two,hatchback,fwd,four,62,4800,35,39,5348']




```python
mortaldata = sc.textFile("VS14MORT.txt")
```


```python
mortaldata.take(10)
```




    ['                   1                                          2101  M1087 432311  4M4                2014U7CN                                    I64 238 070   24 0111I64                                                                                                                                                                           01 I64                                                                                                  01  11                                 100 601',
     '                   1                                          2101  M1058 371708  4D3                2014U7CN                                    I250214 062   21 0311I250 61I272 62E669                                                                                                                                                            03 I250 E669 I272                                                                                       01  11                                 100 601',
     '                   1                                          7101  F1075 412110  4W2                2014U7CN                                    J449267 086   28 0211J449 61F179                                                                                                                                                                   02 J449 F179                                                                                            01  11                                 100 601',
     '                   1                                          6101  M1074 402009  6D1                2014U7CN                                    I48 228 068   22 0311I64  21I48  61F03                                                                                                                                                             03 I48  F03  I64                                                                                        01  11                                 100 601',
     '                   1                                          3101  M1064 381808  4D2                2014U7CN                                    I250214 062   21 0111I250                                                                                                                                                                          01 I250                                                                                                 01  11                                 100 601',
     '                   1                                          5101  F1093 442411  6W4                2014U7CN                                    K137280 111   37 0511K137 12R040 21C349 61F03  62C509                                                                                                                                              05 K137 C349 C509 F03  R040                                                                             01  11                                 100 601',
     '                   1                                          4101  M1082 422210  4M6                2014U7CN                                    I251215 063   21 0411I469 21I259 31I251 61N183                                                                                                                                                     03 I251 I469 N183                                                                                       01  11                                 100 601',
     '                   1                                          4101  M1055 371708  7S6                2014U7CN                                    I250214 062   21 0211I250 61F102                                                                                                                                                                   02 I250 F102                                                                                            021 32                                 100 715',
     '                   1                                          3101  F1086 432311  4W6                2014U7CN                                    F03 175 111   37 0111F03                                                                                                                                                                           01 F03                                                                                                  01  11                                 100 601',
     '                   1                                          3101  M1023 301004  7S4                2014N2RN                                  95X72 429 125   40 0311S019 12X72  61T141                                                                                                                                                            03 X72  S019 T141                                                                                       01  11                                 100 601']




```python
from pyspark.sql import Row
```


```python
#people = mortaldata.map(lambda x: Row(name=x[0], age=int(x[1])))
```

# Creating DataFrames 


```python
# you need to create sparksession for creating dataframes 

from pyspark.sql import SparkSession

spark = SparkSession .builder.appName("Python Spark SQL basic example") .config("spark.some.config.option", "some-value").getOrCreate()
```


```python
df = spark.read.json("customerData.json")
```


```python
df.show(4)
```

    +---+------+------+-----------------+------+
    |age|deptid|gender|             name|salary|
    +---+------+------+-----------------+------+
    | 32|   100|  male|Benjamin Garrison|  3000|
    | 40|   200|  male|    Holland Drake|  4500|
    | 26|   100|  male|  Burks Velasquez|  2700|
    | 51|   100|female|    June Rutledge|  4300|
    +---+------+------+-----------------+------+
    only showing top 4 rows
    



```python
df.printSchema()
```

    root
     |-- age: string (nullable = true)
     |-- deptid: string (nullable = true)
     |-- gender: string (nullable = true)
     |-- name: string (nullable = true)
     |-- salary: string (nullable = true)
    



```python
df.describe()

```




    DataFrame[summary: string, age: string, deptid: string, gender: string, name: string, salary: string]




```python
df.head(4)
```




    [Row(age='32', deptid='100', gender='male', name='Benjamin Garrison', salary='3000'),
     Row(age='40', deptid='200', gender='male', name='Holland Drake', salary='4500'),
     Row(age='26', deptid='100', gender='male', name='Burks Velasquez', salary='2700'),
     Row(age='51', deptid='100', gender='female', name='June Rutledge', salary='4300')]




```python
df.select("name").show()
```

    +-----------------+
    |             name|
    +-----------------+
    |Benjamin Garrison|
    |    Holland Drake|
    |  Burks Velasquez|
    |    June Rutledge|
    |    Nielsen Knapp|
    +-----------------+
    



```python
df.createOrReplaceTempView("people")
```


```python
spark.sql("select name from people").show(4)
#sqlDF.show(4)
```

    +-----------------+
    |             name|
    +-----------------+
    |Benjamin Garrison|
    |    Holland Drake|
    |  Burks Velasquez|
    |    June Rutledge|
    +-----------------+
    only showing top 4 rows
    



```python
sqldf = spark.sql("select * from people").show()
```

    +---+------+------+-----------------+------+
    |age|deptid|gender|             name|salary|
    +---+------+------+-----------------+------+
    | 32|   100|  male|Benjamin Garrison|  3000|
    | 40|   200|  male|    Holland Drake|  4500|
    | 26|   100|  male|  Burks Velasquez|  2700|
    | 51|   100|female|    June Rutledge|  4300|
    | 44|   200|  male|    Nielsen Knapp|  6500|
    +---+------+------+-----------------+------+
    

