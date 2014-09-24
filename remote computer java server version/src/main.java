import static java.awt.GraphicsDevice.WindowTranslucency.PERPIXEL_TRANSLUCENT;

import java.awt.AWTException;
import java.awt.BorderLayout;
import java.awt.GraphicsDevice;
import java.awt.GraphicsEnvironment;
import java.awt.Robot;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;


public class main {
	private static int SERVER_PORT = 9999, SERVER_PORT1 = 9998;
	static Socket socket, socket1;

    private static ServerSocket server, server1;
    static BufferedImage bi;
    private static ObjectInputStream ois;
    private static float[] point;
    private static JFrame frame;
    private static JFrame pan;
    private static Robot robot;
    private static float x1, y1;
	/**
	 * @param args
	 */
public static void main(String[] args) {
		// TODO Auto-generated method stub
		//final panneau_transparent pan = new panneau_transparent();
	    GraphicsEnvironment ge = 
	            GraphicsEnvironment.getLocalGraphicsEnvironment();
	        GraphicsDevice gd = ge.getDefaultScreenDevice();
	        boolean isPerPixelTranslucencySupported = 
	            gd.isWindowTranslucencySupported(PERPIXEL_TRANSLUCENT);
	        try {
				robot = new Robot();
			} catch (AWTException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        
	        //If translucent windows aren't supported, exit.
	        if (!isPerPixelTranslucencySupported) {
	            System.out.println(
	                "Per-pixel translucency is not supported");
	               pan = new panneau_transparent(); 
	        }

	        JFrame.setDefaultLookAndFeelDecorated(true);
	         pan = new translucent();
	        ((JFrame) pan).setVisible(true);
		final JFrame frame = new JFrame();
		JLabel label = new JLabel("");
		frame.setSize(((JFrame) pan).getSize());
		frame.setTitle("Rendu de la capture");
		frame.getContentPane().add(label, BorderLayout.CENTER);
		frame.setVisible(true);
//		frame.addWindowListener(new WindowAdapter() {
//			@Override
//			public void windowClosing(WindowEvent arg0) {
//				
//				
//				
//				
//			}
//		});
		
		Thread t1 = new Thread(new Runnable() {
			
			@Override
			public void run() {
				while(true){
				 try {
						server = new ServerSocket(SERVER_PORT);
						  System.out.println("Start the server at port " + SERVER_PORT
				                  + " and waiting for clients...");
				
			           while(true){
		                 socket = server.accept();
		               System.out.println("Accept socket connection: "+socket.getInetAddress());
		             
		                   // The file name must be a fully qualified path
		                   sendFile(socket.getOutputStream());
			           }
		             
		            }
		         catch (IOException e) {
		            // TODO Auto-generated catch block
		            e.printStackTrace();
		        }

				 catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				}
				
			}
		});
	//	System.out.println("valeur: "+conversionto256base(3147).length);
       t1.start();
       
       
       Thread t2 = new Thread(new Runnable() {
			
			@Override
			public void run() {
				while(true){
				 try {
						server1 = new ServerSocket(SERVER_PORT1);
						  System.out.println("Start the server at port " + SERVER_PORT1
				                  + " and waiting for clients...");
				
			           while(true){
		                 socket1 = server1.accept();
		               System.out.println("Accept socket connection: "+socket1.getInetAddress());
		             
		                   // The file name must be a fully qualified path
		                ois = new ObjectInputStream(socket1.getInputStream());
		                point = (float[])ois.readObject();
		                if(point.length==1){
		                	if((int)point[0]==0){
		                		robot.keyPress(KeyEvent.VK_BACK_SPACE);
			                	robot.keyRelease(KeyEvent.VK_BACK_SPACE);
		                	}
//		                	else if((int)point[0]==-2){
//		                		robot.keyPress(KeyEvent.VK_ENTER);
//			                	robot.keyRelease(KeyEvent.VK_ENTER);
//		                	}
//		                	
//		                	else if((int)point[0]==-3){
//		                		robot.keyPress(KeyEvent.VK_QUOTE);
//			                	robot.keyRelease(KeyEvent.VK_QUOTE);
//		                	}
//		                	else if((int)point[0]==-4){
//		                		robot.keyPress(KeyEvent.VK_MINUS);
//			                	robot.keyRelease(KeyEvent.VK_MINUS);
//		                	}
//		                	else if((int)point[0]==-5){
//		                		robot.keyPress(KeyEvent.VK_SEMICOLON);
//			                	robot.keyRelease(KeyEvent.VK_SEMICOLON);
//		                	}
//		                	
//		                	else if((int)point[0]==-6){
//		                		robot.keyPress(KeyEvent.VK_SLASH);
//			                	robot.keyRelease(KeyEvent.VK_SLASH);
//		                	}
//		                	
//		                	else if((int)point[0]==-7){
//		                		robot.keyPress(KeyEvent.VK_SPACE);
//			                	robot.keyRelease(KeyEvent.VK_SPACE);
//		                	}
//		                	
//		                	else if((int)point[0]==-8){
//		                		robot.keyPress(KeyEvent.VK_PERIOD);
//			                	robot.keyRelease(KeyEvent.VK_PERIOD);
//		                	}
		                	else{
		                	robot.keyPress((char)point[0]);
		                	robot.keyRelease((char)point[0]);
		                	}
		                	//JOptionPane.showMessageDialog(frame,  "Touche saisie: "+(char)point[0], "touche saisie", JOptionPane.INFORMATION_MESSAGE);
		                }
		                else{
		                try{
		                	 x1 = (pan.getWidth()/point[2])*point[0]+pan.getX(); y1 = ( pan.getHeight()/point[3])*point[1]+pan.getY();
		                	robot.mouseMove((int)x1, (int)y1);
		                	robot.mousePress(InputEvent.BUTTON1_MASK);
		                	robot.mouseRelease(InputEvent.BUTTON1_MASK);
			                //JOptionPane.showMessageDialog(frame,  "x1 = "+x1+" et y1= "+y1, "Nouvelles coordonnees", JOptionPane.INFORMATION_MESSAGE);

		                }catch(ArithmeticException e){
		                	e.printStackTrace();
		                }
		                }
		                    
			           }
		             
		            }
		         catch (IOException e) {
		            // TODO Auto-generated catch block
		            e.printStackTrace();
		        }

				 catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				}
				
			}
		});
	//	System.out.println("valeur: "+conversionto256base(3147).length);
      t2.start();
       
       
       
       
      while(true){
			try{
				bi = ScreenShotFactory.screenShot(((JFrame) pan).getBounds(), frame.getSize(), "image.png", ScreenShotFactory.IMAGE_TYPE_PNG);
			label.setIcon(new ImageIcon(bi));
			frame.setSize(((JFrame) pan).getSize());
			
//			try {
//				Thread.sleep(20);
//			} catch (InterruptedException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			}catch(NullPointerException e){
				System.out.println("Acces refuse intercepte.... Continuité du programme...");
			}
			
		}
		
	}

	
	public static void sendFile(OutputStream os) throws Exception
	{
//		   File myFile = new File (fileName); 
//         byte [] mybytearray  = new byte [(int)myFile.length()];
//         FileInputStream fis = new FileInputStream(myFile);
//         BufferedInputStream bis = new BufferedInputStream(fis);
//         bis.read(mybytearray,0,mybytearray.length);
//         System.out.println("Sending...");
//         os.write(mybytearray,0,mybytearray.length);
//         System.out.println("Send...");
//         os.flush();	
		
		try{
		//ImageIO.write(bi, ScreenShotFactory.IMAGE_TYPE_PNG, os);
			byte[] by = imageToByteArray(bi);
			
			char[] valeurs = conversionto256base(by.length);
			os.write(valeurs.length);
			System.out.println(by.length+"  "+valeurs.length);
			for(char c: valeurs){
				os.write((int)c);
			}
		//	 socket = server.accept();
		os.write(by);
		System.out.println("Image envoyé...");
		}
		catch(IOException e){
			e.printStackTrace();
		}
	}
	
	public static byte[] imageToByteArray(BufferedImage image) throws IOException
	{
	    ByteArrayOutputStream baos = new ByteArrayOutputStream();
	    ImageIO.write(image, ScreenShotFactory.IMAGE_TYPE_PNG, baos);
	    return baos.toByteArray();
	}
	
	public static char[] conversionto256base(int nombre){
		int nomb = nombre;
		int i=0;
		while(nomb>0){
			i++;
			nomb/=256;
		}
		
		 nomb = nombre;
		 char result[] = new char[i];
		 
		while(nomb>0){
			
			result[i-1]=(char) (nomb%256);
			nomb/=256;
			i--;
		}
		
		return result;
	}
}



