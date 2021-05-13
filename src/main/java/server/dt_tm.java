package server;

public class dt_tm {
	
	public String get_timeslot(String dys[] , int day)
	{
		String slots="";
		int start,end;
		int cnt=0;
		//System.out.println(java.time.LocalDateTime.now().getDayOfWeek().getValue());
		start=Integer.parseInt(dys[day].substring(0,2));
		end=Integer.parseInt(dys[day].substring(3,5));
		if(start == 0 && end == 0)
		{
			slots="No slots Available";
			return slots;
		}
		
		//start=Integer.parseInt(dys[day].substring(0,2));
		//end=Integer.parseInt(dys[day].substring(3,5));
		
		//DayOfWeek dow = DayOfWeek.from(java.time.LocalDate.now());
		int d = java.time.LocalDateTime.now().getDayOfWeek().getValue();
		
		//System.out.println("start : "+ start + " End  : "+end);
		if(d==day && start < java.time.LocalDateTime.now().getHour())
		{
			start=java.time.LocalDateTime.now().getHour()+1;
		}
		cnt=0;
		while(start < end)
		{
			if(cnt % 2 == 0)
				slots += (start + ":00/");
			else
			{
				slots += (start + ":30/");
				start++;
			}
			cnt++;
		}
		//System.out.println(slots);
		return slots;
	}
	
}
