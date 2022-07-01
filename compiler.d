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
//词法分析
void tokenizer(string code)
{
  //切割字符串
  string commands[] = split(code,regex(r"\s+"));
  //string command_name = commands[0];
  if(target_code == "asm")
  {
  	compile_to_asm(commands);
  }
  writeln("splited >>> ",commands);

}
//todo
void compile_to_bin()
{

}
void openFile(string p_name)
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
//这里应该是常量 不可变
int max_file_length = 255;
int max_file_name_length = 20;

/*void writeBin()
{
  File file = File(default_bin_name,"w");
  void write_command()
  {

  }
  string file_name = "xxx.bin";
  if(file_name.length >=20)
  {
    writeln("错误！文件名过长");
    return ;
  }
  //不足20个字节位置的，使用空格填充
  ulong file_name_left_size = max_file_name_length - file_name.length;
  //写命令缓冲区
  int[] command_buffer = [0,1,2,3,4,5];
  file.rawWrite(command_buffer);
  //file.write(" ");
  //file.write(01 ~ "xxx.bin");
  /*for(int a = 0; a < file_name_left_size; a=a+1)
  {
    file.write(" ");
  }
  file.close();
}*/
void myWriteBin()
{
  File f = File("a.bin","w");
  byte[] b = [0,1,0];
  f.rawWrite(b);
  f.write("xxx.bin");
  for(int i = 0; i< 13;i+=1)
  {
    f.write(" ");
  }
  f.close();
}
void main(string[] args)
{
  myWriteBin();
  /*if(args[1] == "-s")
  {
	  target_code = "asm";
  }
  else
  {
   	target_code = "bin";
  }*/
  //openFile(args[2]);
 // writeBin();
/* if(target_code == "asm")
 {

 }*/
//todo
 /* if(target_code == "bin"){
 }*/


}
