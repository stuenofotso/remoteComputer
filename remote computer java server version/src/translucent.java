	import static java.awt.GraphicsDevice.WindowTranslucency.PERPIXEL_TRANSLUCENT;
import static java.awt.GraphicsDevice.WindowTranslucency.PERPIXEL_TRANSPARENT;
import static java.awt.GraphicsDevice.WindowTranslucency.TRANSLUCENT;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.GradientPaint;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.GraphicsDevice;
import java.awt.GraphicsEnvironment;
import java.awt.GridBagLayout;
import java.awt.Paint;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.SwingUtilities;
public class translucent extends  JFrame {


	// Determine what the default GraphicsDevice can support.
	GraphicsEnvironment ge =
	    GraphicsEnvironment.getLocalGraphicsEnvironment();
	GraphicsDevice gd = ge.getDefaultScreenDevice();

	boolean isUniformTranslucencySupported =
	    gd.isWindowTranslucencySupported(TRANSLUCENT);
	boolean isPerPixelTranslucencySupported =
	    gd.isWindowTranslucencySupported(PERPIXEL_TRANSLUCENT);
	boolean isShapedWindowSupported =
	    gd.isWindowTranslucencySupported(PERPIXEL_TRANSPARENT);
	
	 public translucent() {
	        super("fenetre de capture");

	        setBackground(new Color(0,0,0,0));
	        setSize(new Dimension(306,315));
	        setLocationRelativeTo(null);
	        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	        JPanel panel = new JPanel() {
	            @Override
	            protected void paintComponent(Graphics g) {
	                if (g instanceof Graphics2D) {
	                    final int R = 240;
	                    final int G = 240;
	                    final int B = 240;

	                    Paint p =
	                        new GradientPaint(0.0f, 0.0f, new Color(R, G, B, 0),
	                            0.0f, 0.0f, new Color(R, G, B, 255), true);
	                    Graphics2D g2d = (Graphics2D)g;
	                    g2d.setPaint(p);
	                    g2d.fillRect(0, 0, getWidth(), getHeight());
	                }
	            }
	        };
	        setContentPane(panel);
	        setLayout(new GridBagLayout());
	       
	    }
	 
	 public static void main(String[] args) {
	        // Determine what the GraphicsDevice can support.
	        GraphicsEnvironment ge = 
	            GraphicsEnvironment.getLocalGraphicsEnvironment();
	        GraphicsDevice gd = ge.getDefaultScreenDevice();
	        boolean isPerPixelTranslucencySupported = 
	            gd.isWindowTranslucencySupported(PERPIXEL_TRANSLUCENT);

	        //If translucent windows aren't supported, exit.
	        if (!isPerPixelTranslucencySupported) {
	            System.out.println(
	                "Per-pixel translucency is not supported");
	                System.exit(0);
	        }

	        JFrame.setDefaultLookAndFeelDecorated(true);

	        // Create the GUI on the event-dispatching thread
	        SwingUtilities.invokeLater(new Runnable() {
	            @Override
	            public void run() {
	                new translucent().setVisible(true);
	            }
	        });
	    }
	
}
