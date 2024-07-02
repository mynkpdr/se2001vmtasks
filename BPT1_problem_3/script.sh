# !/bin/bash
diff /opt/assets/file1.txt /opt/assets/file2.txt -u; comm /opt/assets/file1.txt /opt/assets/file2.txt -12
