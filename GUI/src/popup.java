import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class popup extends JFrame {
    private JTextField Input1;
    private JPanel MainPanel;
    private JButton Run1;
    private String rinput;

    public String ReturnInput(){
        return this.rinput;
    }

    public popup(String title){
        super(title);

        this.setVisible(true);

        this.setTitle(title);

        this.setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
        this.setResizable(false);
        this.setContentPane(MainPanel);

        MainPanel.setPreferredSize( new Dimension( 350, 150 ) );
        this.pack();

        final popup frame = this;
        Run1.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {

                if (!Input1.getText().isEmpty()){
                    rinput = Input1.getText();

                    frame.setVisible(false);
                    frame.dispose();
                }
            }
        });
        rinput = "";
    }
}
