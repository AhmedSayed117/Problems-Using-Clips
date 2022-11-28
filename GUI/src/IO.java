import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class IO {

    public void appendStrToFile(String fileName, String str)
    {
        try {
            BufferedWriter out = new BufferedWriter(new FileWriter(fileName, true));
            out.write(str);
            out.close();
        }

        catch (IOException e) {
            System.out.println("exception occurred" + e);
        }
    }

}
