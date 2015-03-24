package com.polytech.tour_de_hanoi;



import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class Main extends Activity {
	
	
	Button jouer, reglage, aide;
	Intent intent_jouer, intent_reglage, intent_aide;
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        jouer=((Button)this.findViewById(R.id.jouer));
        reglage=((Button)this.findViewById(R.id.reglage));
        aide = ((Button)this.findViewById(R.id.aide));
        jouer.setOnClickListener(new jouer_listener());
        reglage.setOnClickListener(new reglage_listener());
        aide.setOnClickListener(new aide_listener());
        
        intent_jouer = new Intent(this, jouer_main.class);
        intent_reglage = new Intent(this, reglage_main.class);
        intent_aide = new Intent(this, aide_main.class);
    }
    
    public class jouer_listener implements OnClickListener {
    	public void onClick(View v) {
    		startActivityForResult(intent_jouer, 1001);		
    	}	
    }
    
    public class reglage_listener implements OnClickListener {
    	public void onClick(View v) {
    		startActivityForResult(intent_reglage, 1002);		
    	}	
    }
    
    public class aide_listener implements OnClickListener {
    	public void onClick(View v) {
    		startActivityForResult(intent_aide, 1003);		
    	}	
    }
}