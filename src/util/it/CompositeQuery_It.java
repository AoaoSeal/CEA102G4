package util.it;

import java.util.Map;
import java.util.Set;

public class CompositeQuery_It {

	public static String getCondition(Map<String, String[]> map) {
		Set<String> keys = map.keySet();
System.out.println(keys);
		StringBuffer condition = new StringBuffer();
		int count = 0;
		for(String key : keys) {
			String value = map.get(key)[0];
			if(value != null && value.trim().length() !=0 && !"action".equals(key)) {
				count++;
				String aCondition = get_aCondition(key, value.trim());				
System.out.println(key + value);				
				if (count == 1)
					condition.append(" where " + aCondition);
				else
					condition.append(" and " + aCondition);

			}
		}
		
		
		return condition.toString();		
	}

	private static String get_aCondition(String columnName, String value) {
System.out.println(columnName + value);
		String aCondition = null;
		
		if("it_no".equals(columnName) || "ld_no".equals(columnName) || "itc_no".equals(columnName))
			aCondition = columnName + "=" + value;
		else if("it_name".equals(columnName))
			aCondition = columnName + " like '%" + value + "%'";
		else if("it_date".equals(columnName) || "it_startdate".equalsIgnoreCase(columnName) || "it_enddate".equals(columnName))
			aCondition = columnName + "=" + "'" + value + "'";
			return aCondition + " ";
	}
}
