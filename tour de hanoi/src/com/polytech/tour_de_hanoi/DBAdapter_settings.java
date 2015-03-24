package com.polytech.tour_de_hanoi;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.widget.Toast;

public class DBAdapter_settings {

	DatabaseHelper	DBHelper;
	Context			context;
	SQLiteDatabase	db;
	
	public DBAdapter_settings(Context context){
		this.context = context;
		DBHelper = new DatabaseHelper(context);
	}	
	
	public class DatabaseHelper extends SQLiteOpenHelper{

		Context			context;
		
		public DatabaseHelper(Context context) {
			super(context, "reglages", null, 1);
			this.context = context;
		}

		@Override
		public void onCreate(SQLiteDatabase db) {
			db.execSQL("create table reglages (_id integer primary key autoincrement, nbre_disques integer not null, duree integer not null);");
		
		}

		@Override
		public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
			Toast.makeText(context, "Mise à jour de la Base de données version "+oldVersion+" vers "+newVersion, Toast.LENGTH_SHORT).show();
			db.execSQL("DROP TABLE IF EXISTS reglages");
			onCreate(db);
		}
		
	}
	
	public DBAdapter_settings open(){
		db = DBHelper.getWritableDatabase();
		return this;
	}
	
	public void close(){
		db.close();
	}
	
	public void Truncate(){
		db.execSQL("DELETE FROM reglages");
	}
	
	public long insererreglage(int Nbre_disques, int duree){
		ContentValues values = new ContentValues();
		values.put("nbre_disques", Nbre_disques);
		values.put("duree", duree);
	
		return db.insert("reglages", null, values);
	}
	
	
	public boolean supprimerreglage(long id){
		return db.delete("reglages", "_id="+id, null)>0;
	}
	
	public Cursor recupererreglage(){
		return db.query("reglages", new String[]{
				"_id",
				"nbre_disques",
				"duree"}, null, null, null, null, null);
	}
	
public void update(long id, int nbre_disques, int duree){
	ContentValues values = new ContentValues();
	values.put("nbre_disques", nbre_disques);	
	values.put("duree", duree);
	
	db.update("reglages", values, "_id="+id, null);
}
	
}
