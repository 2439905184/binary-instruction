import os
import sys

print(sys.argv)
#创建空文件
os.mknod(sys.argv[1])