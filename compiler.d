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


void main(string[] args)
{
  if(args[1] == "-s")
  {
	  target_code = "asm";
  }
  else
  {
   	target_code = "bin";
  }
  openFile(args[2]);
/* if(target_code == "asm")
 {

 }*/
//todo
 /* if(target_code == "bin"){
 }*/


}
