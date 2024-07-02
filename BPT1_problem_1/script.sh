#!/usr/bin/bash

for department in Dept{1..5}; do
	    for team in Team{A..C}; do
		            dir_path="$HOME/se2001/BPT1_problem_1/$department/$team"
			            mkdir -p "$dir_path"
				            if [ $? -eq 0 ]; then
						                echo "Created directory: $dir_path"
								        else
										            echo "Failed to create directory: $dir_path"
											                exit 1
													        fi
														        for x in {1..10}; do
																            file_path="$dir_path/project$x"
																	                touch "$file_path"
																			            if [ $? -eq 0 ]; then
																					                    echo "Created file: $file_path"
																							                else
																										                echo "Failed to create file: $file_path"
																												                exit 1
																														            fi
																															            done
																																        done
																																done

