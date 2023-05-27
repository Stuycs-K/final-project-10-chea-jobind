/*
import java.util.Scanner;
import java.io.FileNotFoundException;
public class ProgressReader{
  boolean finished;
  Scanner s;
  File f;
  public ProgressReader(int level){
    //f = new File("Prog"+level+".txt");
    try{
      f = new File("Prog"+level+".txt");
      //print("Prog"+level+".txt");
      s = new Scanner(f);
      finished=false;
    } catch(FileNotFoundException e){
      f=null;
      s=null;
      finished=true;
    }
  }
  public int next(){
    finished = s.hasNext();
    //print("here");
    if(s.hasNext()){
      return s.nextInt();
    }
    return 0;
  }
  public boolean complete(){
    return finished;
  }
}
*/
