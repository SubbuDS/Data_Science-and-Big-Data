

```python
import findspark
findspark.init()
from pyspark import SparkContext
from pyspark.sql import SparkSession

```


```python
df = spark.read.option("header", True).csv("auto-data.csv")
```


```python
df.printSchema()
```

    root
     |-- MAKE: string (nullable = true)
     |-- FUELTYPE: string (nullable = true)
     |-- ASPIRE: string (nullable = true)
     |-- DOORS: string (nullable = true)
     |-- BODY: string (nullable = true)
     |-- DRIVE: string (nullable = true)
     |-- CYLINDERS: string (nullable = true)
     |-- HP: string (nullable = true)
     |-- RPM: string (nullable = true)
     |-- MPG-CITY: string (nullable = true)
     |-- MPG-HWY: string (nullable = true)
     |-- PRICE: string (nullable = true)
    



```python
df.head(5)
```




    [Row(MAKE='subaru', FUELTYPE='gas', ASPIRE='std', DOORS='two', BODY='hatchback', DRIVE='fwd', CYLINDERS='four', HP='69', RPM='4900', MPG-CITY='31', MPG-HWY='36', PRICE='5118'),
     Row(MAKE='chevrolet', FUELTYPE='gas', ASPIRE='std', DOORS='two', BODY='hatchback', DRIVE='fwd', CYLINDERS='three', HP='48', RPM='5100', MPG-CITY='47', MPG-HWY='53', PRICE='5151'),
     Row(MAKE='mazda', FUELTYPE='gas', ASPIRE='std', DOORS='two', BODY='hatchback', DRIVE='fwd', CYLINDERS='four', HP='68', RPM='5000', MPG-CITY='30', MPG-HWY='31', PRICE='5195'),
     Row(MAKE='toyota', FUELTYPE='gas', ASPIRE='std', DOORS='two', BODY='hatchback', DRIVE='fwd', CYLINDERS='four', HP='62', RPM='4800', MPG-CITY='35', MPG-HWY='39', PRICE='5348'),
     Row(MAKE='mitsubishi', FUELTYPE='gas', ASPIRE='std', DOORS='two', BODY='hatchback', DRIVE='fwd', CYLINDERS='four', HP='68', RPM='5500', MPG-CITY='37', MPG-HWY='41', PRICE='5389')]




```python
df.show(5)
```

    +----------+--------+------+-----+---------+-----+---------+---+----+--------+-------+-----+
    |      MAKE|FUELTYPE|ASPIRE|DOORS|     BODY|DRIVE|CYLINDERS| HP| RPM|MPG-CITY|MPG-HWY|PRICE|
    +----------+--------+------+-----+---------+-----+---------+---+----+--------+-------+-----+
    |    subaru|     gas|   std|  two|hatchback|  fwd|     four| 69|4900|      31|     36| 5118|
    | chevrolet|     gas|   std|  two|hatchback|  fwd|    three| 48|5100|      47|     53| 5151|
    |     mazda|     gas|   std|  two|hatchback|  fwd|     four| 68|5000|      30|     31| 5195|
    |    toyota|     gas|   std|  two|hatchback|  fwd|     four| 62|4800|      35|     39| 5348|
    |mitsubishi|     gas|   std|  two|hatchback|  fwd|     four| 68|5500|      37|     41| 5389|
    +----------+--------+------+-----+---------+-----+---------+---+----+--------+-------+-----+
    only showing top 5 rows
    



```python
df.select("MAKE").count()
```




    197




```python
df.select("MAKE").show()
```

    +----------+
    |      MAKE|
    +----------+
    |    subaru|
    | chevrolet|
    |     mazda|
    |    toyota|
    |mitsubishi|
    |     honda|
    |    nissan|
    |     dodge|
    |  plymouth|
    |     mazda|
    |mitsubishi|
    |     dodge|
    |  plymouth|
    | chevrolet|
    |    toyota|
    |     dodge|
    |     honda|
    |    toyota|
    |     honda|
    | chevrolet|
    +----------+
    only showing top 20 rows
    

