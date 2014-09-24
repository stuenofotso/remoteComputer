import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.WindowConstants;

public class panneau_transparent extends JFrame
{
    public panneau_transparent()
    {
        setUndecorated(true);
        setSize(306, 315);

       this.setResizable(true);
		//panneau_transparent.this.setAlwaysOnTop(true);

        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        JFrame.setDefaultLookAndFeelDecorated(true);
        JPanel pan = new JPanel();
        //pan.setOpaque(false);
        setOpacity(0.1f);
        pan.setLayout(null);
      
        int i=0;
        final JTextField[] jtf = new JTextField[4];
        
        jtf[0] = new JTextField();
        jtf[1] = new JTextField();
        jtf[2] = new JTextField();
        jtf[3] = new JTextField();
        for(JTextField jt: jtf){
        	
        	jt.setBounds(30*i, this.getHeight()-20, 30, 20);
        	pan.add(jt);
        	i++;
        }
     
        this.addMouseMotionListener(new MouseMotionListener() {
			
			@Override
			public void mouseMoved(MouseEvent arg0) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void mouseDragged(MouseEvent arg0) {
				panneau_transparent.this.setLocation(arg0.getXOnScreen()-panneau_transparent.this.getX()/2, arg0.getYOnScreen()-panneau_transparent.this.getY()/2);
				jtf[0].setText(""+arg0.getXOnScreen());
				jtf[1].setText(""+arg0.getYOnScreen());
				
				//panneau_transparent.this.setBounds(arg0.getX(), arg0.getY(), panneau_transparent.this.getWidth(), panneau_transparent.this.getHeight());
				
			}
		});
        this.addMouseListener(new MouseListener() {
			
			@Override
			public void mouseReleased(MouseEvent arg0) {
				
				
			}
			
			@Override
			public void mousePressed(MouseEvent arg0) {
				
			}
			
			@Override
			public void mouseExited(MouseEvent arg0) {
				setOpacity(0.1f);
				
			}
			
			@Override
			public void mouseEntered(MouseEvent arg0) {
				setOpacity(0.9f);
				
			}
			
			@Override
			public void mouseClicked(MouseEvent arg0) {
				// TODO Auto-generated method stub
				
			}
		});
        
        final JButton but = new JButton("valider");
        but.setBounds(30*4, this.getHeight()-20, 80, 20);
        but.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				try{
					int x = Integer.parseInt(jtf[0].getText());
					int y = Integer.parseInt(jtf[1].getText());
					int w = Integer.parseInt(jtf[2].getText());
					int h = Integer.parseInt(jtf[3].getText());
					panneau_transparent.this.setBounds(x, y, w, h);
					int i=0;
				    for(JTextField jt: jtf){
			        	
			        	jt.setBounds(30*i, panneau_transparent.this.getHeight()-20, 30, 20);
			        	i++;
			        }
			        
			        but.setBounds(30*4, panneau_transparent.this.getHeight()-20, 80, 20);
				}catch(NumberFormatException e){
					
				}
				
				
				
				
			}
		});
        
        pan.add(but);
     
    //    setUndecorated(false);
        this.setContentPane(pan);
        
        
        jtf[0].setText(""+this.getX());
        jtf[1].setText(""+this.getY());
        jtf[2].setText(""+this.getWidth());
        jtf[3].setText(""+this.getHeight());
        setVisible(true);
    }

     public static void main(String[] args) 
     {
        new panneau_transparent();
     }
}