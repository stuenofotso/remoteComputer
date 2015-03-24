package com.polytech.tour_de_hanoi;



import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.database.Cursor;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;

public class jouer_main extends Activity {
	Button[] disques;
	Thread  threadArrierePlan;
	ToggleButton deplace_gauche, deplace_centre, deplace_droite;
	DBAdapter_settings db;
	LinearLayout A, B, C;
	Button executer;
	TextView operation, duree;
	

	 int NBRE_DISQUES = 4, TIME_TO_SLEEP = 3000;
	
	int temps = 0;
	
	
	 final Handler handler = new Handler() {
	      @Override
	      public void handleMessage(Message msg) {
	    	  actualise(msg.getData().getInt("1"), msg.getData().getChar("2"), msg.getData().getChar("3"));

	    	
	      }
	   };
	   
		
	   
	@Override
	protected void onCreate(Bundle savedInstanceState) {		
		super.onCreate(savedInstanceState);
		setContentView(R.layout.jouer_layout);
		A = ((LinearLayout)this.findViewById(R.id.layout_gauche));
		B = ((LinearLayout)this.findViewById(R.id.layout_centre));
		C = ((LinearLayout)this.findViewById(R.id.layout_droite));
		
		deplace_gauche = ((ToggleButton)this.findViewById(R.id.deplace_gauche));
		deplace_centre = ((ToggleButton)this.findViewById(R.id.deplace_centre));
		deplace_droite = ((ToggleButton)this.findViewById(R.id.deplace_droite));
		
		deplace_gauche.setOnCheckedChangeListener(new deplace_gauche_listener());
		deplace_centre.setOnCheckedChangeListener(new deplace_centre_listener());
		deplace_droite.setOnCheckedChangeListener(new deplace_droite_listener());
	
		executer = ((Button)this.findViewById(R.id.resoudre));
		
		 threadArrierePlan = new Thread(new Runnable() {
	         public void run() {
	            try {
	            
	            	   moveTower (NBRE_DISQUES, 'A', 'B', 'C'); 
	            
	              threadArrierePlan.stop();
	                 
	               
	            } catch (Throwable t) { }
	         }
	      });
		 
		 duree = ((TextView)this.findViewById(R.id.dure_ecoule));
		
		
		operation = ((TextView)this.findViewById(R.id.operation));
		executer.setOnClickListener(new executer_listener());
		operation.setVisibility(operation.INVISIBLE);
		
		
		
		//recupere le nombre de disques dans le fichier puis...
		db = new DBAdapter_settings(this);
        db.open();
       Cursor cur = db.recupererreglage();
    
       if((cur!= null)&&cur.moveToNext()){
       NBRE_DISQUES = cur.getInt(cur.getColumnIndex("nbre_disques"));
       TIME_TO_SLEEP = cur.getInt(cur.getColumnIndex("duree"));
      
       
       }
       else{
			db.insererreglage( 4, 3000);
			NBRE_DISQUES = 4;
			TIME_TO_SLEEP = 3000;
       }
       cur.close();
		this.initialise(NBRE_DISQUES);
		temps = 0;
	}
	
	 protected void onDestroy() {
	    	db.close();
	    	super.onDestroy();
	    }
	
	public void onStart() {
	      super.onStart();
	     
	      
	
	   }
	
	public void onStop() {
	      super.onStop();
	      
	}
	
	public class executer_listener implements OnClickListener {
    	public void onClick(View v) {
    		
	AlertDialog.Builder ad = new AlertDialog.Builder(jouer_main.this);
        	
    		ad.setTitle("Confirmation");
    		ad.setMessage("Etes vous sûr de vouloir abandonner la partie en cours et laisser android resoudre la tour de "+NBRE_DISQUES+" disques?");
    		ad.setNegativeButton("non", 
    				new android.content.DialogInterface.OnClickListener() {
    					public void onClick(DialogInterface dialog, int arg1) {
    					
    					}
    				}
    			);
    		ad.setPositiveButton("oui", new android.content.DialogInterface.OnClickListener() {
    			public void onClick(DialogInterface dialog, int arg1) {
    				
    	    		operation.setVisibility(operation.VISIBLE);
    	    		
    	    				initialise(NBRE_DISQUES);
    	    				
    	    				temps=0;
    	    				duree.setText("Nbre de deplacements: "+temps);
    	    				
    	    				executer.setEnabled(false);
    	    				deplace_droite.setEnabled(false);
    	    				deplace_centre.setEnabled(false);
    	    				deplace_gauche.setEnabled(false);
    	    				threadArrierePlan.start();
    				
    			}
    		}
    		);
    		ad.show();
    		
    		
    		
    		
    		
    	
    			
    	}	
    }
	
	public void check(){
		
		if(B.getChildCount() == NBRE_DISQUES){
			deplace_droite.setEnabled(false);
			deplace_centre.setEnabled(false);
			deplace_gauche.setEnabled(false);
			deplace_centre.setChecked(false);
			 deplace_gauche.setChecked(false);
			 deplace_droite.setChecked(false);
			 
			 
		 Toast.makeText(this," jeu  terminé en "+(temps)+" deplacements ", Toast.LENGTH_LONG).show();

		}
		
	}
	
	public void transfert(LinearLayout D, LinearLayout F){
		Button temp = new Button(this);
		temp = (Button) D.getChildAt(0);
		if(F.getChildAt(0)!=null){
		int remplaceur = Integer.valueOf((String) temp.getText()).intValue();
		int remplace = Integer.valueOf((String) ((Button)F.getChildAt(0)).getText()).intValue();
		
		if(remplaceur<remplace){
			D.removeView(temp);
			F.addView(temp, 0);
			temps++;
			duree.setText("Nbre de deplacements: "+temps);
		}
		
		else{
			
			 deplace_centre.setChecked(false);
			 deplace_gauche.setChecked(false);
			 deplace_droite.setChecked(false);
			Toast.makeText(this,"Erreur: le disque à déplacer est plus lourd que celui qui va le recevoir", Toast.LENGTH_LONG).show();
		}
		
		}
		
		else{
		
		D.removeView(temp);
		F.addView(temp, 0);
		temps++;
		duree.setText("Nbre de deplacements: "+temps);
		
		}
		check();
	}
	
	public class deplace_gauche_listener implements OnCheckedChangeListener {
    

		@Override
		public void onCheckedChanged(CompoundButton arg0, boolean arg1) {
			
			if(arg1){
				if(deplace_centre.isChecked()){
					transfert(B, A);	
				 deplace_centre.setChecked(false);
				 deplace_gauche.setChecked(false);
				 deplace_droite.setChecked(false);
    				
    			}
				
				else{
					if(deplace_droite.isChecked()){
						transfert(C, A);	
						deplace_centre.setChecked(false);
						 deplace_gauche.setChecked(false);
						 deplace_droite.setChecked(false);
						 
						
	    			}
					
					 else if(A.getChildAt(0)==null){
						
						 deplace_gauche.setChecked(false);
						 
							Toast.makeText(jouer_main.this,"Erreur: Aucun disque à transferer ici!!!", Toast.LENGTH_LONG).show();

						 
					 }
					
					
					
				}
				
						
			}
			
		}	
    }
	
	public class deplace_centre_listener implements OnCheckedChangeListener {
    	

		@Override
		public void onCheckedChanged(CompoundButton arg0, boolean arg1) {
			
			if(arg1){
				if(deplace_gauche.isChecked()){
					transfert(A, B);
					deplace_centre.setChecked(false);
					 deplace_gauche.setChecked(false);
					 deplace_droite.setChecked(false);
    				
    			}
				
				else{
					if(deplace_droite.isChecked()){
						transfert(C, B);			
						deplace_centre.setChecked(false);
						 deplace_gauche.setChecked(false);
						 deplace_droite.setChecked(false);
	    			}
					
					 else if(B.getChildAt(0)==null){
						 deplace_centre.setChecked(false);
							Toast.makeText(jouer_main.this,"Erreur: Aucun disque à transferer ici!!!", Toast.LENGTH_LONG).show();

						 
					 }
					
				}
				
						
			}
			
		}	
    }
	
	public class deplace_droite_listener implements OnCheckedChangeListener {
    
		@Override
		public void onCheckedChanged(CompoundButton arg0, boolean arg1) {
			if(arg1){
				if(deplace_centre.isChecked()){
					transfert(B, C);	
					deplace_centre.setChecked(false);
					 deplace_gauche.setChecked(false);
					 deplace_droite.setChecked(false);
    				
    			}
				
				else{
					if(deplace_gauche.isChecked()){
						transfert(A, C);			
						deplace_centre.setChecked(false);
						 deplace_gauche.setChecked(false);
						 deplace_droite.setChecked(false);
	    			}
					
					 else if(C.getChildAt(0)==null){
							Toast.makeText(jouer_main.this,"Erreur: Aucun disque à transferer ici!!!", Toast.LENGTH_LONG).show();

						 deplace_droite.setChecked(false);
						 
					 }
					
				}
				
						
			}
			
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
		  
	
	
	 Message msg = handler.obtainMessage();
	 
	 Bundle data = new Bundle();
	 
	 data.putInt("1", d);
	 data.putChar("2", f);
	 data.putChar("3", t);
	
	msg.setData(data);
     // Envoi du message au handler
     handler.sendMessage(msg);
	
     try {
			Thread.sleep(TIME_TO_SLEEP);
			} catch (InterruptedException e) {
		}
	   
	   
	   
	   } 
	   public void initialise(int n){
		   disques = new Button[n];
	
			
			A.removeAllViewsInLayout();
			B.removeAllViewsInLayout();
			C.removeAllViewsInLayout();
			
			
			
			for(int i=0; i<n; i++){
				
				
				disques[i] = new Button(this);
				disques[i].setHeight(5);
				disques[i].setText(""+(i+1));
				
		
				
				
				A.addView(disques[i]);
			}
			
			A.refreshDrawableState();
			B.refreshDrawableState();
			C.refreshDrawableState();
			 operation.setText(  "Operation en Cours: ");
			 
			 try {
					Thread.sleep(TIME_TO_SLEEP);
					} catch (InterruptedException e) {
				}
	   }
	   
	   public void actualise(int n, char f, char t){			
			
		   
		 	
		   
		   operation.setText(  "Operation en Cours: "+"deplacement du disque " + n + " de " + f + " vers " + t);
		   
			 if(f=='A')	A.removeView(disques[n-1]);
			 else if(f=='B') B.removeView(disques[n-1]);
			 else if(f=='C') C.removeView(disques[n-1]);
		
			 if(t=='A')	A.addView(disques[n-1], 0);
			 else if(t=='B') B.addView(disques[n-1], 0);
			 else if(t=='C') C.addView(disques[n-1], 0);
		   
			 temps++;
				duree.setText("Nbre de deplacements: "+temps);
		 
			A.refreshDrawableState();
			B.refreshDrawableState();
			C.refreshDrawableState();
		check();
	   }


}
