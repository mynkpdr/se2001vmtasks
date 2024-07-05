#!/bin/bash

department1=${eid1:0:2}
id_number1=${eid1:5:3}

department2=${eid2:0:2}
id_number2=${eid2:5:3}

department3=${eid3:0:2}
id_number3=${eid3:5:3}

{
	    echo "$department1$id_number1"
	        echo "$department2$id_number2"
		    echo "$department3$id_number3"
	    } | sort -n > output.txt

