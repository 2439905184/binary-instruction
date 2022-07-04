import std.stdio;
import std.file;
//使用循环，分段写入文件的示例代码
void main()
{
    File f = File("aa.bin","w");
    for(int i = 0; i< 2; i+=1)
    {
        byte[] numbers = [1,2,3,4,5,6];
        f.rawWrite(numbers);
    }
    f.close();
}