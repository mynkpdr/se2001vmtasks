You have a CSV file named `all_tickets_processed_improved_v3.csv` that contains tickets and their corresponding topic groups. Each line in the file consists of a ticket description and its topic group. Your task is to write an `awk` script named `count_tickets.awk` that counts the number of tickets for each topic group.

The script will read from standard input and write the count to standard output.

**Sample Input**

```
Document,Topic_group
connection with icon icon dear please setup icon per icon engineers please let other details needed thanks lead,Hardware
work experience user work experience user hi work experience student coming next his name much appreciate him duration thank,Access
requesting for meeting requesting meeting hi please help follow equipments cable pc cord plug,Hardware
reset passwords for external accounts re expire days hi ask help update passwords colleagues thank pm expire days importance high hi received about expiration please kindly help prolongation best regards pm expire days importance high dear expire days order change please follow steps prerequisites disable device credentials close active connected by cable machine note also follow steps detailed press ctrl alt delete same pops change item enter format enter enter newly chosen then re enter again submit displaying has changed os machine browse enter format enter gear icon top tight browser window enter enter newly chosen then re enter again save connected note complete resources granted once connected by cable browse tick want change after logging enter format enter log enter enter newly chosen then re enter again change clients suppliers about expire please touch person then communicate back encounter issues hesitate by accessing yours,Access
```
**Sample output**

```
Topic Group: Hardware, Count: 2
Topic Group: Access, Count: 2
# Please take a note of formatting
```