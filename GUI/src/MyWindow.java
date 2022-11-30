import java.awt.event.*;
import javax.swing.*;

public class MyWindow extends JFrame{
    MyWindow(){
        setSize(300, 200);
        setLayout(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JButton b = new JButton("Close");
        b.setBounds((300-80)/2, (200-30)/2, 80, 30);
        //
        final MyWindow frame = this;
        b.addActionListener(
                new ActionListener(){
                    @Override
                    public void actionPerformed(ActionEvent ev){
                        synchronized(frame){
                            frame.notify();
                        }

                        frame.setVisible(false);
                        frame.dispose();
                    }
                }
        );
        //
        getContentPane().add(b);

        setVisible(true);

        synchronized(this){
            try{
                this.wait();
            }
            catch(InterruptedException ex){ }
        }
    }


    public static void main(String args[]) {
        new MyWindow();
        System.out.println("You are here");
    }
}