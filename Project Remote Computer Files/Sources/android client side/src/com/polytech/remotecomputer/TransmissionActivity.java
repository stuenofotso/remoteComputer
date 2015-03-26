/*
 * This is a simple Android mobile client
 * This application read any string messege typed on the text field and
 * send it to the server when the Send button is pressed
 * Author by Lak J Comspace
 */
 
package com.polytech.remotecomputer;
 
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.net.UnknownHostException;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.Editable;
import android.text.method.KeyListener;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

import com.purplebrain.adbuddiz.sdk.AdBuddiz;
 
public class TransmissionActivity extends Activity {
 
 private Socket client, client1;
 private EditText textField, textField1, clavier;
 private ObjectOutputStream oos;
 float point[];
 private Button button;
 private ImageView imv;
 boolean flag = false, flag1 = false;
 int taille=0, frequence = 300;
 private Thread t ;
 private static InputMethodManager imm;

 
 
 @Override
 public void onCreate(Bundle savedInstanceState) {
  super.onCreate(savedInstanceState);
  setContentView(R.layout.activity_transmission);
  getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
  
  
  //lancement du serveur dhcp
  
  
  
  
  imm = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
 
  textField = (EditText) findViewById(R.id.editText1); //reference to the text field
  textField1 = (EditText) findViewById(R.id.frequence); //reference to the text field
  button = (Button) findViewById(R.id.button1);   //reference to the send button
  clavier = (EditText) findViewById(R.id.clavier);   //reference to the clavier
  imv = (ImageView) findViewById(R.id.imageView1);   //reference to the image view
  
  
  clavier.setOnClickListener(new OnClickListener() {
	
	@Override
	public void onClick(View v) {
		imm.toggleSoftInput(InputMethodManager.SHOW_FORCED, 0);

		
	}
});
  
  clavier.setKeyListener(new KeyListener() {
	
	@Override
	public boolean onKeyUp(View view, Editable text, int keyCode, KeyEvent event) {
		
		return false;
	}
	
	@Override
	public boolean onKeyOther(View view, Editable text, KeyEvent event) {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public boolean onKeyDown(View view, Editable text, int keyCode,
			KeyEvent event) {
		// TODO Auto-generated method stub
			//sendCoordinate(event.getDisplayLabel());
		//Toast.makeText(TransmissionActivity.this, "keycode:'"+keyCode+"' label: '"+event.getDisplayLabel()+"'",Toast.LENGTH_SHORT).show();
		if((keyCode==event.KEYCODE_SPACE)||(keyCode>= event.KEYCODE_0 && keyCode<= event.KEYCODE_9) || (keyCode>= event.KEYCODE_A && keyCode<= event.KEYCODE_Z) ){
			sendCoordinate((int)event.getDisplayLabel());	
		}
		else if(keyCode==67){
			sendCoordinate(0);
		}
//		else if(keyCode==event.KEYCODE_ENTER){
//			sendCoordinate((int) -2);
//		}
//		
//		else if(keyCode==event.KEYCODE_APOSTROPHE){
//			sendCoordinate((int) -3);
//		}
//		else if(keyCode==event.KEYCODE_MINUS){
//			sendCoordinate((int) -4);
//		}
//		
//		else if(keyCode==event.KEYCODE_SEMICOLON){
//			sendCoordinate((int) -5);
//		}
//		
//		else if(keyCode==event.KEYCODE_SLASH){
//			sendCoordinate((int) -6);
//		}
//		
//		else if(keyCode==event.KEYCODE_SPACE){
//			sendCoordinate((int) -7);
//		}
//		
//		else if(keyCode==event.KEYCODE_PERIOD){
//			sendCoordinate((int) -8);
//		}
		return false;
	}
	
	@Override
	public int getInputType() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public void clearMetaKeyState(View view, Editable content, int states) {
		// TODO Auto-generated method stub
		
	}
});
  
  
  imv.setOnTouchListener(new OnTouchListener() {
	
	@Override
	public boolean onTouch(View v, MotionEvent event) {
		if(flag){
			if(!flag1){
		sendCoordinate(event.getX(), event.getY());
		flag1 = true;
			}
			else{
				flag1 = false;
			}
		}
		return true;
	}
});
  //textField.setText("192.168.1.3");
  textField1.setText(""+frequence);
  button.setText("Commencer");
  //Button press event listener
  
  //portion de code gerant les ads
  AdBuddiz.setPublisherKey("adc8d940-5512-4928-b667-d23aecf5fc98");
  AdBuddiz.cacheAds(this);
  AdBuddiz.showAd(TransmissionActivity.this);
  //fin ads
  button.setOnClickListener(new View.OnClickListener() {
 
   public void onClick(View v) {
	   AdBuddiz.showAd(TransmissionActivity.this);
	   if(!flag){
		   if(!textField.getText().toString().equals("")){
	//		   affiche("contenu du textField:"+textField.getText());
			   flag = true;
			   button.setText("Arreter");
			   t = new Thread(new Runnable() {

				   @Override
				   public void run() {
					   charge();

				   }
			   });
			   t.start();
		   }
		   else{
			   affiche("Veuillez svp soit renseigner l'ip d'un serveur, soit en choisir un en utilisant le menu.");
		   }
	   }
	   else{
		   flag = false;
		   button.setText("Commencer");
	   }
   
   }
  });
 
 
  if(savedInstanceState!=null){
	  onRestoreInstanceState(savedInstanceState);
  }
  
 }
 
 @Override
 public void onSaveInstanceState(Bundle savedInstanceState) {
   super.onSaveInstanceState(savedInstanceState);
   // Save UI state changes to the savedInstanceState.
   // This bundle will be passed to onCreate if the process is
   // killed and restarted.
   savedInstanceState.putBoolean("flag", flag);
   savedInstanceState.putString("ip", textField.getText().toString());
   
   
 }
 
 @Override
 public void onRestoreInstanceState(Bundle savedInstanceState) {
   super.onRestoreInstanceState(savedInstanceState);
   // Restore UI state from the savedInstanceState.
   // This bundle has also been passed to onCreate.
   flag = savedInstanceState.getBoolean("flag");
   textField.setText(savedInstanceState.getString("ip"));
   button.performClick();
 }
 
 
 
 public boolean onCreateOptionsMenu(Menu menu) {    	
 	menu.add(0,100,0,"Infos sur l'application");
 	menu.add(0,101,0,"Localiser les serveurs");
 	return true;
 }
 
 public void affiche(String message){
	 Toast.makeText(this,message, Toast.LENGTH_LONG).show();

 }
 
 public boolean onOptionsItemSelected(MenuItem item) {
	    
		switch(item.getItemId()){
 	case 100: 
 		affiche("Remote Computer V2.0.0\n\n   Développé par TUENO FOTSO STEVE 3GI ENSP\n Tous droits reservées.");
			break;
 	case 101:
 		Intent 	intent = new Intent(TransmissionActivity.this, FindServer.class);
			startActivityForResult(intent, 1001);	
			Toast.makeText(TransmissionActivity.this, "Searching Servers ...", Toast.LENGTH_SHORT).show();
 		
 		break;
 	}
 	return true;
 }
 
 @Override
 protected void onActivityResult(int requestCode, int resultCode, Intent data) {
     if (resultCode == RESULT_OK && requestCode == 1001) {
         if (data.hasExtra("ip")) {
             
             textField.setText(data.getExtras().getString("ip"));
             
         }
     }
 }
 
 
 
 
 
 
 final Handler handler = new Handler() {
     @Override
     public void handleMessage(Message msg) {
    	 BitmapFactory.Options opt = new BitmapFactory.Options();
    	 opt.inDither = true;
    	 opt.inPreferredConfig = Bitmap.Config.ARGB_8888;
    	// textField.setText(msg.getData().getInt("2"));
    imv.setImageBitmap(    	 BitmapFactory.decodeByteArray(msg.getData().getByteArray("1"), 0, msg.getData().getByteArray("1").length, opt));
   	
     }
  };
  
 
 public void charge(){
	 while(flag){
	 
	    try {
	    	String ip = textField.getText().toString();
	    	frequence = Integer.parseInt(textField1.getText().toString());
	    	
	     client = new Socket(ip, 9999);  //connect to server
//	     printwriter = new PrintWriter(client.getOutputStream(),true);
//	     printwriter.write(messsage);  //write the message to output stream
	// 
//	     printwriter.flush();
//	     printwriter.close();
	     
	     try
	     {
	    	taille = 0;
	    	int tailleTaille = client.getInputStream().read();
	    	while(tailleTaille>0){
	    		tailleTaille--;
	    		taille+=client.getInputStream().read()*Math.pow(256, tailleTaille);

	    	}
	    	
	    	 Thread.sleep(frequence);
	    	
	//	     client = new Socket(ip, 9999);  //connect to server
		     
	    	 
	    	 //textField.setText(taille);
	         receiveFile(client.getInputStream());
	        
	    	 
	     }
	     catch (Exception e)
	     {
	         e.printStackTrace();

	     }
	 
	    } catch (UnknownHostException e) {
	    } catch (IOException e) {
	    }
	 }
 }
 
 public void receiveFile(InputStream is) throws Exception
 {
	 
	
	 
	 byte[] imageByteArray = getImageByteArray(is);
	 Message msg = handler.obtainMessage();
	 
	 Bundle data = new Bundle();
	 
	 data.putByteArray("1", imageByteArray);
//	 data.putInt("2", taille);
	 
	msg.setData(data);
     // Envoi du message au handler
     handler.sendMessage(msg);
     
	
//	 int filesize = 6022386;
// String baseDir = Environment.getExternalStorageDirectory().getAbsolutePath();
//     String fileInES = baseDir + File.separator + fileName;
//     int bytesRead, current = 0;
//     byte[] mybytearray = new byte[filesize];
//     FileOutputStream fos = new FileOutputStream(fileInES); // destination
//                                                             // path and
//                                                             // name of
//                                                             // file
//     BufferedOutputStream bos = new BufferedOutputStream(fos);
//     bytesRead = is.read(mybytearray, 0, mybytearray.length);
//     current = bytesRead;
//
//     do {
//         bytesRead = is.read(mybytearray, current,
//                 (mybytearray.length - current));
//         if (bytesRead >= 0)
//             current += bytesRead;
//     } while (bytesRead > -1);
//
//     bos.write(mybytearray, 0, current);
//     bos.flush();
//    // long end = System.currentTimeMillis();
//   //  System.out.println(end - start);
//     bos.close();
//     
//     Bitmap bmp = null;
//     FileInputStream fis = new FileInputStream(fileInES);
//     try
//     {
//         bmp = BitmapFactory.decodeStream(fis);
//         return bmp;
//     }
//     finally
//     {
//         fis.close();
//     }
    
 }
 
 private byte[] getImageByteArray(InputStream is){
	 //Vector<byte[]> vect = new Vector<byte[]>();
	 
	 byte[] buf = new byte[taille];
//	 int i=0;
	 try{
//		 is.mark(TAILLE_MAX);
//	 while(is.read()!=-1){
////		 vect.add(buf);
////		 buf = new byte[1];
////		 textField.setText("lecture1..."+i);
//		 i++;
//	 }
	 
	// is.reset();
	 is.read(buf);
	 
	// textField.setText("dernier "+buf[buf.length-1]+"  "+buf.length);
//	 buf = new byte[vect.size()];
//	  i=0;
//	 for(byte[] byt: vect){
//		 buf[i] = byt[0];
//		 i++;
//		 textField.setText("lecture2..."+i);
//
//	 }
	 
	 return buf;
	 }catch(Exception e){
		 e.printStackTrace();
	 }
	 return null;
 }
 
 private Thread t2;
 static String ip = "";
 public void sendCoordinate(final float x, final float y){
	  ip = textField.getText().toString();
	 t2 = new Thread(new Runnable() {
		
		@Override
		public void run() {
			// TODO Auto-generated method stub
			 try {
					client1 = new Socket(ip, 9998);
					 point = new float[4];
					 point[0] = x;  point[1] = y;  point[2] = imv.getWidth();   point[3] = imv.getHeight(); 
					 oos = new ObjectOutputStream(client1.getOutputStream());
					 oos.writeObject(point);
				} catch (UnknownHostException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Agenerated catch block
					e.printStackTrace();
				}
		}
	});
	 t2.start();
	
	 
	 
 }
 
 public void sendCoordinate(final int c){
	  ip = textField.getText().toString();
	 t2 = new Thread(new Runnable() {
		
		@Override
		public void run() {
			// TODO Auto-generated method stub
			 try {
					client1 = new Socket(ip, 9998);
					 point = new float[1];
					 point[0] = c;
					 oos = new ObjectOutputStream(client1.getOutputStream());
					 oos.writeObject(point);
				} catch (UnknownHostException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
	});
	 t2.start();
	
	 
	 
 }
 
}