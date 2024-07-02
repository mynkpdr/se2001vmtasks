# !/bin/bash
grep -oP '(?<=<span class="country-name">)[^<]+|(?<=<span class="country-capital">)[^<]+'
