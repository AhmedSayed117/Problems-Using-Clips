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
    private JTextField TB2;
    private JTextField TB6;
    private JPanel MainPanel;

    public JCheckBox getB1() {
        return B1;
    }

    public JCheckBox getB2() {
        return B2;
    }

    public JCheckBox getB3() {
        return B3;
    }

    public JCheckBox getB4() {
        return B4;
    }

    public JCheckBox getB5() {
        return B5;
    }

    public JCheckBox getB6() {
        return B6;
    }

    public JButton getRun() {
        return Run;
    }

    public JTextField getTB2() {
        return TB2;
    }

    public JTextField getTB6() {
        return TB6;
    }

    public ClipsGui(){
        super();

        ArrayList<JCheckBox> problems = new ArrayList<>();

        problems.add(B1);
        problems.add(B2);
        problems.add(B3);
        problems.add(B4);
        problems.add(B5);
        problems.add(B6);

        this.setVisible(true);

        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        this.setResizable(false);

        this.setContentPane(MainPanel);
        MainPanel.setPreferredSize( new Dimension( 250, 150 ) );
        this.pack();

        Run.addActionListener(new ActionListener(){
            Environment clips = new Environment();
            @Override
            public void actionPerformed(ActionEvent e) {
                for (JCheckBox Buttons:problems){
                    if (Buttons.isSelected()){
                      switch (Buttons.getText()){
                          case "B1":
                              System.out.println("------------B1-------------");
                              clips.clear();
                              clips.load("B1.clp");
                              clips.reset();
                              clips.run();
                              break;
                          case "B2":
                              System.out.println("------------B2-------------");
                              clips.clear();
                              clips.load("B2.clp");
                              clips.reset();
                              clips.run();
                              break;
                           case "B3":
                               System.out.println("------------B3-------------");
                               clips.clear();
                               clips.load("B3.clp");
                               clips.reset();
                               clips.run();
                               break;
                          case "B4":
                              System.out.println("------------B4-------------");
                              clips.clear();
                              clips.load("B4.clp");
                              clips.reset();
                              clips.run();
                              break;
                          case "B5":
                              System.out.println("------------B5-------------");
                              clips.clear();
                              clips.load("B5.clp");
                              clips.reset();
                              clips.run();
                              break;
                          case "B6":
                              System.out.println("------------B6-------------");
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
