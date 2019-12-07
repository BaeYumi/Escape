package univdb;

import java.text.SimpleDateFormat;

public class UtilToSqlConversion {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		 java.util.Date utilDate = new java.util.Date();
	     java.sql.Date sqlDate = convert(utilDate);
	     SimpleDateFormat df = new SimpleDateFormat("dd/MM/YYYY");
	}
	
	static java.sql.Date convert(java.util.Date uDate) {
        java.sql.Date sDate = new java.sql.Date(uDate.getTime());
        return sDate;
    }

}
