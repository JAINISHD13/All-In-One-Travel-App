package com.Bean;

import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import java.io.IOException;
import java.util.Iterator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class GoogleMatrixRequest {

    private static final String API_KEY = "AIzaSyCTFv50q5YUvRzwBxl9Mp7-BEwibPYMr3Y";

  OkHttpClient client = new OkHttpClient();

  public String run(String url) throws IOException {
    Request request = new Request.Builder()
        .url(url)
        .build();

    Response response = client.newCall(request).execute();
    return response.body().string();
  }

  public String getDistance(String org,String dest) throws IOException, ParseException {
    String dist=null;
	  GoogleMatrixRequest request = new GoogleMatrixRequest();
    String url_request = "https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins="+org+"&destinations="+dest+"&key="+ API_KEY;
    String response = request.run(url_request);
    JSONParser parser=new JSONParser();
    //System.out.println(response);
    Object obj=parser.parse(response);
    
    JSONObject jsonObject=(JSONObject) obj;
    JSONArray lang= (JSONArray) jsonObject.get("rows");
    for(int i=0;i<lang.size();i++)
    {
    	System.out.println(lang.get(i));
    }
    Iterator i=lang.iterator();
    while(i.hasNext())
    {
    	JSONObject innerobj=(JSONObject) i.next();
    	JSONArray lang2=(JSONArray) innerobj.get("elements");
    	Iterator i2=lang2.iterator();
    	while(i2.hasNext())
    	{
    		JSONObject innerobj1=(JSONObject) i2.next();
    		JSONObject obj1=(JSONObject) innerobj1.get("distance");
    		JSONObject obj2=(JSONObject)innerobj1.get("duration"); 
    		String temp=(String)(obj1.get("text"))+" "+(String)(obj2.get("text"));
    		dist=temp;
    		 System.out.println(dist);
    	}
    	
    }
    return dist;
    
    
  }
}
