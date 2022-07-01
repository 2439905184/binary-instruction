import std.stdio;
import std.regex;
import std.file;
//目标文件类型 如中间码和二进制
string target_code;
string default_asm_name = "a.asm";
string default_bin_name = "a.bin";
//有bug待修复
void compile_to_asm(string[] p_cmds)
{
  if(p_cmds[0] == "@create_file")
  {
    string bin_code = "00";
    string file_name = p_cmds[1];
    writeln("compiled >>>",bin_code ~" "~file_name);
    File file = File(default_asm_name,"w");
    file.writeln(bin_code ~" "~file_name);
    file.close();
  }
  if(p_cmds[0] == "@remove_file")
  {
    string bin_code = "01";
    string file_name = p_cmds[1];
    File file = File(default_asm_name,"w");
    file.writeln(bin_code ~" "~file_name);
    file.close();
  }
  if(p_cmds[0] == "@read_file")
  {
    string bin_code = "10";
    string file_name = p_cmds[1];
    File file = File(default_asm_name,"w");
    file.writeln(bin_code ~" "~file_name);
    file.close();
  }
  if(p_cmds[0] == "@write_file")
  {
    string bin_code = "11";
    string file_name = p_cmds[1];
    File file = File(default_asm_name,"w");
    file.writeln(bin_code ~" "~file_name);
    file.close();
  }
}
//这里应该是常量 不可变
int max_file_length = 255;
int max_file_name_length = 20;
//bug 应该把文件创建移动到函数外部，避免逐行读取并写入新文件时产生的覆盖问题！
void compile_to_bin(string[] p_cmds)
{
  if(p_cmds[0] == "@create_file")
  {
    byte[] command_code = [0,0];
    byte[] command_space = [0];
    string file_name = p_cmds[1];
    
    File f = File(default_bin_name,"w+");
    f.rawWrite(command_code);
    f.rawWrite(command_space);
    
    f.write(file_name);

    ulong space_size = max_file_name_length - file_name.length;
    for(int i = 0; i < space_size; i += 1)
    {
      f.write(" ");
    }
    writeln("compiled >>> ","机器码：",command_code);
    f.close();
  }
  //todo重构
  if(p_cmds[0] == "@remove_file")
  {
    byte[] command_code = [0,1];
    byte[] command_space = [0] ;
    string file_name = p_cmds[1];

    File f = File(default_bin_name,"w+");
    f.rawWrite(command_code);
    f.rawWrite(command_space);

    f.write(file_name);
    
    ulong space_size = max_file_name_length - file_name.length;
    for(int i = 0; i < space_size; i += 1)
    {
      f.write(" ");
    }
    writeln("compiled >>> ","机器码：",command_code);
    f.close();
  }
}
//词法分析
void tokenizer(string code)
{
  //切割字符串
  string[] commands = split(code,regex(r"\s+"));
  //string command_name = commands[0];
  if(target_code == "asm")
  {
  	compile_to_asm(commands);
  }
  if(target_code == "bin")
  {
    compile_to_bin(commands);
  }
  writeln("splited >>> ",commands);
}

void myOpenFile(string p_name)
{
	File file = File(p_name,"r");
	string line;
	while((line = file.readln()) !is null)
	{
		tokenizer(line);
		//writeln(line);
	}
	
	file.close();
}

/*
void myWriteBin()
{
  File f = File("a.bin","w");
  byte[] b = [0,1,0];
  f.rawWrite(b);
  f.write("xxx.bin");
  ulong command_space_buffer_size = max_file_length - file_name.length;
  for(int i = 0; i< 13;i+=1)
  {
    f.write(" ");
  }
  f.close();
}*/
void main(string[] args)
{
  //myWriteBin();
  if(args[1] == "-s")
  {
	  target_code = "asm";
  }
  else
  {
   	target_code = "bin";
  }
  writeln("输入参数>>>",args);
  myOpenFile(args[1]);
}
