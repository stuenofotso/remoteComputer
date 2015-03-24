package com.polytech.tour_de_hanoi;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

public class jouer_main extends Activity {
	ImageButton[] disques_A, disques_B, disques_C;
	Thread  threadArrierePlan;
	ImageButton disque;
	String  messag = "Operation en cours: ";
	LinearLayout A, B, C;
	Button executer;
	TextView operation;

	final int NBRE_DISQUES = 6, TIME_TO_SLEEP = 3000;
	
	int nbre_A, nbre_B, nbre_C;
	
	
	 final Handler handler = new Handler() {
	      @Override
	      public void handleMessage(Message msg) {
	    	  int[] params = msg.getData().getIntArray("key");
	    	  messag = msg.getData().getString("key1");
	    	 actualise(params[0], params[1], params[2]);
	      }
	   };
	   
	@Override
	protected void onCreate(Bundle savedInstanceState) {		
		super.onCreate(savedInstanceState);
		setContentView(R.layout.jouer_layout);
		A = ((LinearLayout)this.findViewById(R.id.layout_gauche));
		B = ((LinearLayout)this.findViewById(R.id.layout_centre));
		C = ((LinearLayout)this.findViewById(R.id.layout_droite));
		disque  = ((ImageButton)this.findViewById(R.id.disques));
		executer = ((Button)this.findViewById(R.id.resoudre));
		operation = ((TextView)this.findViewById(R.id.operation));
		executer.setOnClickListener(new executer_listener());
		
		//recupere le nombre de disques dans le fichier puis...
		  nbre_A = NBRE_DISQUES;
		   nbre_B = 0;
		   nbre_C = 0;
		this.actualise(nbre_A, nbre_B, nbre_C);
	}
	
	
	public void onStart() {
	      super.onStart();
	     
	       threadArrierePlan = new Thread(new Runnable() {
	         public void run() {
	            try {
	            
	            	   moveTower (NBRE_DISQUES, 'A', 'B', 'C'); 
	            
	              threadArrierePlan.stop();
	                 
	               
	            } catch (Throwable t) { }
	         }
	      });
	
	   }
	
	public void onStop() {
	      super.onStop();
	}
	
	public class executer_listener implements OnClickListener {
    	public void onClick(View v) {
    			
    				 nbre_A = NBRE_DISQUES;
    				   nbre_B = 0;
    				   nbre_C = 0;
    				actualise(nbre_A, nbre_B, nbre_C);
    			
    				threadArrierePlan.start();
    				executer.setEnabled(false);
    			
    	}	
    }
	
	  
	   
	   public void moveTower (int ht, char f, char t, char i) 
	   { 
	     if (ht > 0) 
	     { 
	       moveTower (ht-1, f, i, t); 
	       moveRing (ht,f,t); 
	       moveTower (ht-1,i,t,f); 
	     }
	     
	 
	   } 
	    
	   public void moveRing (int d, char f, char t) 
	   { 
		  
	  messag = "Operation en Cours: "+"deplacement du disque " + d + " de " + f + " vers " + t;	
			
	 if(f=='A')	nbre_A--;
	 else if(f=='B') nbre_B--;
	 else if(f=='C') nbre_C--;
	 if(t=='A')	nbre_A++;
	 else if(t=='B') nbre_B++;
	 else if(t=='C') nbre_C++;
	
	 Message msg = handler.obtainMessage();
	 
	 Bundle data = new Bundle();
	 int[] params = {nbre_A, nbre_B, nbre_C};
	 data.putIntArray("key", params);
	 data.putString("key1", messag);
	msg.setData(data);
     // Envoi du message au handler
     handler.sendMessage(msg);
	
     try {
			Thread.sleep(TIME_TO_SLEEP);
			} catch (InterruptedException e) {
		}
	   
	   
	   
	   } 
	   
	   public void actualise(int nbr_A, int nbr_B, int nbr_C){
		   disques_A = new ImageButton[nbr_A];
			disques_B = new ImageButton[nbr_B];
			disques_C = new ImageButton[nbr_C];
			A.removeAllViewsInLayout();
			B.removeAllViewsInLayout();
			C.removeAllViewsInLayout();
			
			operation.setText(messag);
		
			for(int i=0; i<nbr_A; i++){
				
			
				disques_A[i] = new ImageButton(disque.getContext());
				disques_A[i].setImageDrawable(disque.getDrawable());
				disques_A[i].setMaxHeight(disque.getMeasuredHeight());
				disques_A[i].setMaxWidth(disque.getMeasuredWidth());
				disques_A[i].measure(50, 20);
			//	disques_A[i].resolveSize(disque., measureSpec)
				A.addView(disques_A[i]);
			}
			
			for(int i=0; i<nbr_B; i++){
				
				disques_B[i] = new ImageButton(disque.getContext());
				disques_B[i].setImageDrawable(disque.getDrawable());
				disques_B[i].setMaxHeight(disque.getMeasuredHeight());
				disques_B[i].setMaxWidth(disque.getMeasuredWidth());
				disques_B[i].measure(50, 20);
				B.addView(disques_B[i]);
			}

			for(int i=0; i<nbr_C; i++){

				disques_C[i] = new ImageButton(disque.getContext());
				disques_C[i].setImageDrawable(disque.getDrawable());
				disques_C[i].setMaxHeight(disque.getMeasuredHeight());
				disques_C[i].setMaxWidth(disque.getMeasuredWidth());
				disques_C[i].measure(50, 20);
				C.addView(disques_C[i]);
			}
			A.refreshDrawableState();
			B.refreshDrawableState();
			C.refreshDrawableState();
		
	   }


}
