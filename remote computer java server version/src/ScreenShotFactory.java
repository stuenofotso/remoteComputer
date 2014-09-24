import java.awt.AWTException;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.MouseInfo;
import java.awt.Point;
import java.awt.Rectangle;
import java.awt.RenderingHints;
import java.awt.Robot;
import java.awt.image.BufferedImage;

public class ScreenShotFactory {

    public final static String IMAGE_TYPE_JPEG = "jpeg";

    public final static String IMAGE_TYPE_GIF = "gif";

    public final static String IMAGE_TYPE_PNG = "png";

    public static BufferedImage screenShot(Rectangle screenArea,
            Dimension screenshotFinalDimension, String pictureName,
            String compressionType) {
        BufferedImage buf = null; // Notre capture d'écran originale
        BufferedImage bufFinal = null; // Notre capture d'écran redimensionnée

        try {
            // Création de notre capture d'écran
            buf = new Robot().createScreenCapture(screenArea);
        } catch (AWTException e) {
            e.printStackTrace();
        }
        // Création de la capture finale
        bufFinal = new BufferedImage(screenshotFinalDimension.width,
                screenshotFinalDimension.height, BufferedImage.TYPE_INT_RGB);
        // Redimensionnement de la capture originale
        Graphics2D g = (Graphics2D) bufFinal.getGraphics();
        g.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
                RenderingHints.VALUE_INTERPOLATION_BILINEAR);
        Point location = MouseInfo.getPointerInfo().getLocation();
        
  
    	Graphics g1 = buf.getGraphics();
    	g1.setColor(Color.RED);
    	g1.fillRect(location.x, location.y, 16, 16);
    	g1.dispose();
        g.drawImage(buf, 0, 0, screenshotFinalDimension.width,
                screenshotFinalDimension.height, null);
        g.dispose();
        
       
        

//       //  Ecriture de notre capture d'écran redimensionnée
//        try {
//            ImageIO.write(bufFinal, compressionType, new File(pictureName));
//        } catch (IOException e) {
//       //    e.printStackTrace();
//        }
        
        return buf;
    }

    public static void main(String[] args) {
        ScreenShotFactory.screenShot(new Rectangle(0, 0, 100, 100),
                new Dimension(50, 50), "test.png",
                ScreenShotFactory.IMAGE_TYPE_PNG);
    }
}