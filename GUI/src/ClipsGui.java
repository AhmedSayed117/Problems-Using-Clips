import net.sf.clipsrules.jni.Environment;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.Objects;

public class ClipsGui extends JFrame{
    private JCheckBox B1;
    private JCheckBox B2;
    private JCheckBox B3;

    private JCheckBox B4;
    private JCheckBox B5;
    private JCheckBox B6;
    private JButton Run;
    private JPanel MainPanel;
    private JButton showInputFieldButton;
    popup p2 ;
    popup p6 ;

    public ClipsGui(){
        super();

        ArrayList<JCheckBox> problems = new ArrayList<>();

        problems.add(B1);
        problems.add(B2);
        problems.add(B3);
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

        showInputFieldButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                for (JCheckBox Buttons:problems){
                    if (Buttons.isSelected()){
                        if (Buttons.getText().equalsIgnoreCase("Problem 2")){
                           p2 = new popup("Choose Your Color For Problem 2");
                        }if (Buttons.getText().equalsIgnoreCase("Problem 6")){
                           p6 = new popup("Enter Child For Problem 6");
                        }
                    }
                }
            }
        });

        Run.addActionListener(new ActionListener(){
             final Environment clips = new Environment();
            @Override
            public void actionPerformed(ActionEvent e) {
                for (JCheckBox Buttons:problems){
                    if (Buttons.isSelected()){
                        switch (Buttons.getText()) {
                            case "Problem 1" -> {
                                System.out.println("\n------------B1-------------");
                                clips.clear();
                                clips.load("B1.clp");
                                clips.reset();
                                clips.run();
                            }
                            case "Problem 2" -> {
                                if (p2!=null && !p2.ReturnInput().isEmpty()){
                                    System.out.println("\n------------B2-------------");
                                    clips.clear();
                                    clips.load("B2.clp");
                                    clips.reset();
                                    clips.assertString("(choose " + p2.ReturnInput() + ")");
                                    clips.run();
                                }

                            }
                            case "Problem 3" -> {
                                System.out.println("\n------------B3-------------");
                                clips.clear();
                                clips.load("B3.clp");
                                clips.reset();
                                clips.run();
                            }
                          case "Problem 4"-> {
                              System.out.println("------------B4-------------");
                              clips.clear();
                              clips.load("B4.clp");
                              clips.reset();
                              System.out.println(clips.assertString("(send [s1] calcArea)"));
                              clips.run();
                          }
                            case "Problem 5" -> {
                                System.out.println("\n------------B5-------------");
                                clips.clear();
                                clips.load("B5.clp");
                                clips.reset();
                                clips.run();
                            }
                            case "Problem 6" -> {
                                if (p6!=null && !p6.ReturnInput().isEmpty()){
                                    System.out.println("\n------------B6-------------");
                                    clips.clear();
                                    clips.load("B6.clp");
                                    clips.reset();
                                    System.out.println(clips.assertString("(child-name " + "\""+ p6.ReturnInput() + "\""+ ")"));
                                    clips.run();
                                }
                            }
                        }
                    }
                }
            }
        });
    }
}
