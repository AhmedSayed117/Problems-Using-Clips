import net.sf.clipsrules.jni.Environment;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

public class ClipsGui extends JFrame{
    private JCheckBox B1;
    private JCheckBox B2;
    private JCheckBox B3;
    private JCheckBox B4;
    private JCheckBox B5;
    private JCheckBox B6;
    private JButton Run;
    private JPanel MainPanel;
    public ClipsGui(){
        super();

        ArrayList<JCheckBox> problems = new ArrayList<>();

        problems.add(B1);
        problems.add(B2);
        problems.add(B3);
//        problems.add(B4);
        problems.add(B5);
        problems.add(B6);

        this.setVisible(true);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setResizable(false);
        this.setContentPane(MainPanel);
        MainPanel.setPreferredSize( new Dimension( 600, 150 ) );
        this.pack();


//        Consolee console = new Consolee();
//        console.init();
//        console.getFrame().setLocation(this.getX() + this.getWidth() + this.getInsets().right, this.getY());


        Run.addActionListener(new ActionListener(){
             Environment clips = new Environment();
            @Override
            public void actionPerformed(ActionEvent e) {
                for (JCheckBox Buttons:problems){
                    if (Buttons.isSelected()){
                      switch (Buttons.getText()){
                          case "B1":
                              System.out.println("\n------------B1-------------");
                              clips.clear();
                              clips.load("B1.clp");
                              clips.reset();
                              clips.run();
                              break;
                          case "B2":
                              System.out.println("\n------------B2-------------");
                              clips.clear();
                              clips.load("B2.clp");
                              clips.reset();
                              clips.run();
                              break;
                           case "B3":
                               System.out.println("\n------------B3-------------");
                               clips.clear();
                               clips.load("B3.clp");
                               clips.reset();
                               clips.run();
                               break;
//                          case "B4":
//                              System.out.println("------------B4-------------");
//                              clips.clear();
//                              clips.load("B4.clp");
//                              clips.reset();
////                              clips.assertString("(send [s1] calcArea)");
//                              clips.run();
//                              break;
                          case "B5":
                              System.out.println("\n------------B5-------------");
                              clips.clear();
                              clips.load("B5.clp");
                              clips.reset();
                              clips.run();
                              break;
                          case "B6":
                              System.out.println("\n------------B6-------------");
                              clips.clear();
                              clips.load("B6.clp");
                              clips.reset();
                              clips.run();
                              break;
                      }
                    }
                }
            }
        });
    }
}
