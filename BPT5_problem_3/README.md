You have a CSV file named `PinCode.csv` that contains information about postal circles, regions, divisions, and offices in various states. Your task is to write an `awk` script named `extract_columns.awk` that extracts specific columns from the CSV file and creates an output file with the columns in a specified order.

Columns to Extract and Order:

Circle Name
Region Name
District
State Name
Pincode

Please refer to the following sample input and sample output. The CSV file is provided as standard input to the command.

**Sample input**
```
Circle Name,Region Name,Division Name,Office Name,Pincode,OfficeType,Delivery,District,StateName
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,A Narayanapuram B.O,515004,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Akuledu B.O,515731,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Alamuru B.O,515002,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Allapuram B.O,515766,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Aluru B.O,515415,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Amidyaya S.O,515822,SO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Ammaladinne S.O,515445,SO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Anantapur Collectorate S.O,515001,SO,Non Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Ankampalli B.O,515741,BO,Delivery,ANANTHAPUR,Andhra Pradesh
```

**Sample output**

```
Circle Name,Region Name,District,StateName,Pincode
Andhra Pradesh Circle,Kurnool Region,ANANTHAPUR,Andhra Pradesh,515004
Andhra Pradesh Circle,Kurnool Region,ANANTHAPUR,Andhra Pradesh,515731
Andhra Pradesh Circle,Kurnool Region,ANANTHAPUR,Andhra Pradesh,515002
Andhra Pradesh Circle,Kurnool Region,ANANTHAPUR,Andhra Pradesh,515766
Andhra Pradesh Circle,Kurnool Region,ANANTHAPUR,Andhra Pradesh,515415
Andhra Pradesh Circle,Kurnool Region,ANANTHAPUR,Andhra Pradesh,515822
Andhra Pradesh Circle,Kurnool Region,ANANTHAPUR,Andhra Pradesh,515445
Andhra Pradesh Circle,Kurnool Region,ANANTHAPUR,Andhra Pradesh,515001
Andhra Pradesh Circle,Kurnool Region,ANANTHAPUR,Andhra Pradesh,515741
```
