package com.polytech.remotecomputer;



import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Enumeration;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.DhcpInfo;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.View;
import android.view.WindowManager;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;


public class FindServer extends Activity  {

	private static int TIMEOUT_RECEPTION_REPONSE = 10000;
	private static int mPort = 9994;
	private String ip = "";
	Button choix;
	TextView displaySelected;
	ProgressBar progress;
	Spinner select;
	ArrayAdapter<String> spinnerAdapter;
	 Handler handler;
	
	
	 


	@Override
	protected void onCreate(Bundle savedInstanceState) {		
		super.onCreate(savedInstanceState);
		setContentView(R.layout.find_server);
		getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
		
		choix = (Button)this.findViewById(R.id.button1);
		displaySelected = (TextView)this.findViewById(R.id.textView2);
		progress = (ProgressBar)this.findViewById(R.id.progressBar1);
		select = (Spinner)this.findViewById(R.id.spinner1);
		
		choix.setEnabled(false);
		
		choix.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				
				try{
				ip = displaySelected.getText().toString().substring(0, displaySelected.getText().toString().indexOf('|'));
				}catch(Exception e){
					Log.e("error", "erreur: "+e.getMessage());
					ip = "";
				}
				
				Intent data = new Intent();
				data.putExtra("ip", ip);
				setResult(RESULT_OK, data);
				Toast.makeText(FindServer.this, "ip: "+ip+" selectionne.", Toast.LENGTH_LONG).show();
				finish();
				
				
				
			}
		});
		
		
		select.setOnItemSelectedListener(new OnItemSelectedListener() {

			@Override
			public void onItemSelected(AdapterView<?> parent, View view,
					int position, long id) {
				TextView tv = (TextView)view;
				displaySelected.setText(tv.getText());
				
				
			}
			
			

			@Override
			public void onNothingSelected(AdapterView<?> parent) {
				// TODO Auto-generated method stub
				displaySelected.setText("");
			}
		});
		
		 spinnerAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, android.R.id.text1);
		spinnerAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		select.setAdapter(spinnerAdapter);
		
		
		 
		  handler = new Handler() {
		      @Override
		      public void handleMessage(Message msg) {
		    	  if(msg.getData().containsKey("1")){
						
						spinnerAdapter.add(msg.getData().getString("1")+"|"+msg.getData().getString("1.1"));
						spinnerAdapter.notifyDataSetChanged();

		    	  }
		    	  else if(msg.getData().containsKey("2")){
		    		  progress.setVisibility(ProgressBar.INVISIBLE);
		    		  choix.setEnabled(true);
		    	  }
		    	 
		    	
		      }
		   };
			

		Thread t2 = new Thread(new Runnable() {
			
			@Override
			public void run() {
				//implement searching server

				try {
					
					envoyerTrameUDP("je recherche un serveur remoteComputer", mPort);
					t2RunFinish();
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				

				//end implement searching server
				
			}
		});
		t2.start();
		
		
		

		//this.finish();
	}
	
	private void t2RunFinish(){
		Message msg = handler.obtainMessage();
		 
		 Bundle data = new Bundle();
		 
		 data.putInt("2", 0);
		
		
		 msg.setData(data);
	     // Envoi du message au handler
	     handler.sendMessage(msg);
	}

	private InetAddress getAdresseBroadcast() throws UnknownHostException
	{
		WifiManager wifiManager = (WifiManager) FindServer.this.getSystemService(Context.WIFI_SERVICE);
		DhcpInfo dhcp = wifiManager.getDhcpInfo();
		int broadcast = (dhcp.ipAddress & dhcp.netmask) | ~dhcp.netmask;
		byte[] quads = new byte[4];
		for (int k = 0; k < 4; k++)
			quads[k] = (byte) ((broadcast >> k * 8) & 0xFF);
		return InetAddress.getByAddress(quads);
	}

	private DatagramPacket envoyerTrameUDP(String requete, int port) throws Exception
	{
		DatagramSocket socket = new DatagramSocket(port);
		socket.setBroadcast(true);
		InetAddress broadcastAdress = getAdresseBroadcast();
		DatagramPacket packet = new DatagramPacket(requete.getBytes(), requete.length(), broadcastAdress,
				port);
		socket.send(packet);
		byte[] buf = new byte[1024];
		packet = new DatagramPacket(buf, buf.length);
		socket.setSoTimeout(TIMEOUT_RECEPTION_REPONSE);
		String monAdresse = getMonAdresseIP();  
		socket.receive(packet);
		try{
			while (true)
			{
				if(!packet.getAddress().getHostAddress().contains(monAdresse)){
					 String requeteRecu = new String(packet.getData());
					 if(requeteRecu.contains("Je suis un serveur remoteComputer")){
						 Message msg = handler.obtainMessage();
						 
						 Bundle data = new Bundle();
						 
						 data.putString("1", packet.getAddress().getHostAddress());
						 data.putString("1.1", packet.getAddress().getHostName());
						
						
						 msg.setData(data);
					     // Envoi du message au handler
					     handler.sendMessage(msg); 
					 }
					
					
					
				}
				socket.receive(packet);
			}
		}catch(Exception e){
			Log.e("finding server", "erreur :"+e.getMessage());
		}
		
		socket.close();
		return packet;
	}

	public String getMonAdresseIP()
	{
		try
		{
			for (Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces();
					en.hasMoreElements();) 
			{
				NetworkInterface intf = en.nextElement();
				for (Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses();
						enumIpAddr.hasMoreElements();) 
				{
					InetAddress inetAddress = enumIpAddr.nextElement();
					if (!inetAddress.isLoopbackAddress()) 
						return inetAddress.getHostAddress();
				}
			}
		}
		catch (SocketException e) 
		{
			e.printStackTrace();
		}
		return null;
	}





}
