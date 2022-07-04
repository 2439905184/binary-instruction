import std.stdio;
import std.file;
//在这里解析二进制指令文件并运行 
//https://dlang.org/library/std/stdio/file.raw_read.html
//使用结构体重构
byte[2] read_head(File p_file)
{
    byte[2] head;
    p_file.rawRead(head);
    return head;
}
char[20] read_name(File p_file)
{
    char[20] file_name;
    p_file.rawRead(file_name);
    return file_name;
}
void main(string[] args)
{
    writeln(args[1]);
    string file_name = args[1];
    File file = File(args[1],"r");
    
    //24 is a chunk size
    for(int i=0; i < file.size(); i+=24)
    {
        byte[] head = read_head(file);
        byte[1] space;
        file.rawRead(space);
        char[] name = read_name(file);
        //分号
        file.rawRead(space);
        writeln("指令码>>>",head,"参数1>>>",name);    
    }
    file.close();
}