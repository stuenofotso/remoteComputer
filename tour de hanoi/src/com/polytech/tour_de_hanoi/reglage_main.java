package com.polytech.tour_de_hanoi;



import android.app.Activity;
import android.database.Cursor;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class reglage_main extends Activity {
	
	EditText nbre_disque, duree;
	Button enregistre;
	DBAdapter_settings db;
	final int NBRE_MAX_DISQUES = 11;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {		
		super.onCreate(savedInstanceState);
		setContentView(R.layout.setting_layout);
		
		
		nbre_disque=((EditText)this.findViewById(R.id.nbre_disques));
		 duree=((EditText)this.findViewById(R.id.duree));
		 enregistre = (Button) this.findViewById(R.id.enregistre);
		 
		 db = new DBAdapter_settings(this);
	        db.open();
	       Cursor cur = db.recupererreglage();
	        int id = 1;
	       if((cur!= null)&&cur.moveToNext()){
	       nbre_disque.setText(""+cur.getInt(cur.getColumnIndex("nbre_disques")));
	       duree.setText(""+cur.getInt(cur.getColumnIndex("duree")));
	       id = cur.getInt(cur.getColumnIndex("_id"));
	       
	       }
	       else{
				db.insererreglage( 4, 3000);
				 nbre_disque.setText(""+4);
			       duree.setText(""+3000);
			       id = 1;
 
	       }
	       final int id1 = id;
	       cur.close();
		 
		 
		 enregistre.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				if(!(duree.getText().toString().equalsIgnoreCase(""))&&!(nbre_disque.getText().toString().equalsIgnoreCase(""))){
					int dure = Integer.valueOf(duree.getText().toString()).intValue();
					int nbre_disk = Integer.valueOf(nbre_disque.getText().toString()).intValue();
					
					if(nbre_disk <NBRE_MAX_DISQUES){
						db.update(id1, nbre_disk, dure);
						reglage_main.this.finish();
					}
					
					else  		 Toast.makeText(reglage_main.this,"Le nombre de disque doit être inferieur à 6", Toast.LENGTH_LONG).show();

				
			}
				
				else  		 Toast.makeText(reglage_main.this,"Erreur: il ya des champs vides", Toast.LENGTH_SHORT).show();
 
			}
		});
	
	}
	
	 protected void onDestroy() {
	    	db.close();
	    	super.onDestroy();
	    }
}
