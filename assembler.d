import std.stdio;
import std.file;

string create = "00";
string read = "10";
string remove = "01";
string write = "11";
//compile ascii asm to command bin file
void asm_bin(string code)
{
    char[] cmds;
    string file_name = cmds[1];
    if(cmds[0] == create)
    {
        byte[] code = [0,0];
        File f = File("a.bin","w");
        f.rawWrite(code);
        f.write(file_name);
        f.close();
    }
    if(cmds[0] == read)
    {
        byte[] code = [1,0];
        File f = File("a.bin","w");
        f.rawWrite(code);
        f.write(file_name);
        f.close();
    }
    if(cmds[0] == remove)
    {
        byte[] code = [0,1];
        File f = File("a.bin","w");
        f.rawWrite(code);
        f.write(file_name);
        remove(file_name);
    }
    if(cmds[0] == write)
    {
        byte[] code = [1,1];
        string content = cmds[2];
        File f = File("a.bin","w");
        f.rawWrite(code);
        f.write(file_name);
        f.write(content);
        f.close();
    }
}
void main()
{

}