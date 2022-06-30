import std.stdio;
import std.file;
//在这里解析二进制指令文件并运行
void main(string[] args)
{
    string file_name = args[1];
    File file = File(args[1],"r");
    //writeln(args[1]);
    //先读取两个字节 这里的编译器没做好
    void[] a = read(file_name,1);
    writeln(a[0]);
    if(a[0] == 1)
    {
        writeln("这是删除文件的机器码");
    }
    file.close();
}