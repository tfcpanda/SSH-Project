package cn.edu.hzvtc.converters;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import org.apache.struts2.util.StrutsTypeConverter;
public class DateConverter extends StrutsTypeConverter {
	private DateFormat[] dateFormats ={ new SimpleDateFormat("yyyy-MM-dd"),
			new SimpleDateFormat("yyyy.MM.dd"),
			new SimpleDateFormat("yyyy/MM/dd")};

	@Override
	public Object convertFromString(Map context, String[] values, Class
			toClass) {
		Object o =null;
		if (toClass == Date.class) {
			for(DateFormat dateFormat : dateFormats){
				try{
					if(o == null){
						o = dateFormat.parse(values[0]);
					}else{
						break;
					}
				}catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
		return o;
	}
	@Override
	public String convertToString(Map context, Object o) {
		if (o instanceof Date) {
			return dateFormats[0].format((Date) o);
		}
		return null;
	}
}

