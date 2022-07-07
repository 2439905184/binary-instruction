import std.stdio;
import std.file;
import std.process;
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
//机器执行码
byte[] create_file = [0,0]; 
byte[] remove_file = [0,1];
byte[] read_file = [1,0];
byte[] write_file = [1,1];
//解释器
void MyExecute(byte[] command)
{/*
    byte[] head = command[0..2];
    byte[] name = command[3..21];
    byte[] end = command[21..22];//我甚至认为这个;号多余了
    
    if(head == create_file)
    {
        File f = File(name,"w");
        //f.create_file()
        f.close();
    }
    if(head == remove_file)
    {
        File f = File(name,"w");
        f.remove();
        f.close();
    }
    if(head == read_file)
    {
        File f = File(name,"r");
        f.readText();
        f.close();
    }
    if(head == write_file)
    {
        File f = File(name,"w");
        f.write();
        f.close();
    }
    else
    {
        writeln("错误，不支持的机器码！");
        writeln(head);
    }*/
}
//字符数组转字符串
string CharArrayToString(char[] array)
{
    string b = "";
    ulong len = array.length;
    for(int i=0; i< array.length; i+=1)
    {
        char e = array[i];
        if(e != ' ')
        {
            b ~= e;
        }
    }
    return b;
}
void main(string[] args)
{
    writeln(args[1]);
    string file_name = args[1];
    File file = File(args[1],"r");
    //24 is a chunk size
    //todo 在数组合并和切片处理时遇到问题
    //todo 重构
    for(int i=0; i < file.size(); i+=24)
    {
        byte[] head = read_head(file);
        byte[1] space;
        file.rawRead(space);
        char[] name = read_name(file);
        string name2 = CharArrayToString(name);
        //分号
        file.rawRead(space);
        //todo
        if(head == create_file)
        {
            auto ls = executeShell("python3 ../FileUtil.py " ~name);
            if (ls.status != 0) writeln("Failed to retrieve file listing");
            else writeln(ls.output);
        }
        if(head == remove_file)
        {
            remove(name2);
        }
        if(head == read_file)
        {
            string content = readText(name2);
            writeln("读取结果>>>",content);
        }
        if(head == write_file)
        {
            char[255] buffer;
            file.rawRead(buffer);
            string content = CharArrayToString(buffer);
            writeln("即将写入",content);
            File f = File(name2,"w");
            f.write(content);
            f.close();
        }
        //MyExecute();
        writeln("指令码>>>",head,"参数1>>>",name);    
    }
    file.close();
}