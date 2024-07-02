Write a **bash script** `script.sh` to extract data from a HTML file.  Assume that the HTML Code is of the following format and convert it in to the format as shown in the sample output.

**Note**

1. Assume that the input to the script is coming from standard input.
2. The input to the script is through standard input.


**Sample Input**

```html
<li>Country: <span class="country-name">France</span>, Capital: <span class="country-capital">Paris</span></li>
<li>Country: <span class="country-name">Japan</span>, Capital: <span class="country-capital">Tokyo</span></li>
<li>Country: <span class="country-name">Canada</span>, Capital: <span class="country-capital">Ottawa</span></li>
```

**Sample Output**

```bash
France
Paris
Japan
Tokyo
Canada
Ottawa
```

