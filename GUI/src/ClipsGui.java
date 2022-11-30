import net.sf.clipsrules.jni.Environment;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Objects;
import java.util.Scanner;

public class ClipsGui extends JFrame{
    private JCheckBox B1;
    private JCheckBox B2;
    private JCheckBox B3;

    private JCheckBox B4;
    private JCheckBox B5;
    private JCheckBox B6;
    private JButton Run;
    private JPanel MainPanel;
    popup p2 ;
    popup p6 ;

    popupOutput o1 ;
    popupOutput o2 ;
    popupOutput o3 ;
    popupOutput o5 ;
    popupOutput o6 ;

    public void clearFile(String str){
        try {
            new PrintWriter(str).close();
        } catch (FileNotFoundException ex) {
            throw new RuntimeException(ex);
        }
    }
    public String readfile(String str){
        try {
            String data="";
            File myObj = new File(str);
            Scanner myReader = new Scanner(myObj);
            while (myReader.hasNextLine()) {
                 data += myReader.nextLine();
                 data+="\n";
            }
            myReader.close();
            return data;
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
        return null;
    }
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

        B1.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (B1.isSelected())
                    if (o1!=null)
                        o1.dispose();
            }
        });

        B2.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (B2.isSelected()){
                    p2 = new popup("Choose Your Color For Problem 2");
                    if (o2!=null) o2.dispose();
                }
            }
        });

        B3.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (B3.isSelected())
                    if (o3!=null)
                        o3.dispose();
            }
        });
        B5.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (B5.isSelected())
                    if (o5!=null)
                        o5.dispose();
            }
        });

        B6.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (B6.isSelected()){
                    p6 = new popup("Enter Child Name For Problem 6");
                    if (o6!=null) o6.dispose();
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
                                clearFile("GUI1.txt");
                                clips.run();
                                String t = readfile("GUI1.txt");

                                o1 = new popupOutput("output For Problem 1");
                                o1.SetText(t);
                            }
                            case "Problem 2" -> {
                                if (p2!=null && !p2.ReturnInput().isEmpty()){
                                    System.out.println("\n------------B2-------------");
                                    clips.clear();
                                    clips.load("B2.clp");
                                    clips.reset();
                                    clips.assertString("(choose " + p2.ReturnInput() + ")");
                                    clearFile("GUI2.txt");
                                    clips.run();
                                    String t = readfile("GUI2.txt");

                                    o2 = new popupOutput("output For Problem 2");
                                    o2.SetText(t);
                                }

                            }
                            case "Problem 3" -> {
                                System.out.println("\n------------B3-------------");
                                clips.clear();
                                clips.load("B3.clp");
                                clips.reset();
                                clearFile("outfile3.txt");
                                clips.run();
                                String t = readfile("outfile3.txt");

                                o3 = new popupOutput("output For Problem 3");
                                o3.SetText(t);

                            }
//                          case "Problem 4"-> {
//                              System.out.println("------------B4-------------");
//                              clips.clear();
//                              clips.load("B4.clp");
//                              clips.reset();
//                              System.out.println(clips.assertString("(send [s1] calcArea)"));
//                              clips.run();
//                          }
                            case "Problem 5" -> {
                                System.out.println("\n------------B5-------------");
                                clips.clear();
                                clips.load("B5.clp");
                                clips.reset();
                                clearFile("GUI5.txt");
                                clips.run();
                                String t = readfile("GUI5.txt");


                                o5 = new popupOutput("output For Problem 5");
                                o5.SetText(t);

                            }
                            case "Problem 6" -> {
                                if (p6!=null && !p6.ReturnInput().isEmpty()){
                                    System.out.println("\n------------B6-------------");
                                    clips.clear();
                                    clips.load("B6.clp");
                                    clips.reset();
                                    clips.assertString("(child-name " + "\""+ p6.ReturnInput() + "\""+ ")");
                                    clearFile("GUI6.txt");
                                    clips.run();
                                    String t = readfile("GUI6.txt");

                                    o6 = new popupOutput("output For Problem 6");
                                    o6.SetText(t);
                                }
                            }
                        }
                    }
                }
            }
        });
    }
}
