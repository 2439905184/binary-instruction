import std.stdio;
import std.file:remove;
//使用循环，分段写入文件的示例代码
void Mywrite()
{
    File f = File("aa.bin","w");
    for(int i = 0; i< 2; i+=1)
    {
        byte[] numbers = [1,2,3,4,5,6];
        f.rawWrite(numbers);
    }
    f.close();
}
//类型混合处理
void byte_array_mix()
{
    byte[] a = [0,1];
    char[] b = ['a','b','c'];
    byte[] result = a ~ cast(byte[])b;
    writeln(result);
    writeln("机器码> ",result[0..2]);
    byte[] name = result[1..4];
    writeln("名称> ",cast(char[])name);
}

void remove_file()
{
    remove("a.asm");
}
//字符数组转字符串
void to_string(char[] array)
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
}
void main()
{
    auto f = File("something.bin", "w");
    f.close();
}