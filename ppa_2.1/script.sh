#!/bin/bash
tr -d '\n' < documents.txt | tr ' ' '\n' | sort
