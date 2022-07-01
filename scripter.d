import std.stdio;
import std.file;
//在这里解析二进制指令文件并运行
void main(string[] args)
{
    string file_name = args[1];
    File file = File(args[1],"r");
    //writeln(args[1]);
    //先读取两个字节 这里的编译器没做好
    byte[] buffer;
    buffer.length = 1;
    char[] command_buffer;
    command_buffer.length = 20;
    //https://dlang.org/library/std/stdio/file.raw_read.html
    auto data = file.rawRead(buffer);
    writeln(data);
    if(data[0] == 1)
    {
        writeln("这是删除文件的机器码");
    }
    file.rawRead(command_buffer);
    writeln(command_buffer);
    //writeln(cast(const(char)[])data);
    
    file.close();
}