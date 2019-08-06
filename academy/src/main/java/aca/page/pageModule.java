package aca.page;

public class pageModule {
	
	
	public static String makePage(int count,int rowsize,int pagesize,int crpath) {		
		if(count==0) {
			count=1;
		}
		int pagecount=count/rowsize+(count%rowsize==0?0:1);
		int usergroup=crpath/pagesize-(crpath%pagesize==0?1:0);
		int startpage=(usergroup*pagesize)+1;
		int endpage=(usergroup*pagesize)+pagesize;
		
		
		
		StringBuffer sb=new StringBuffer();
		
		if(usergroup!=0) {
			sb.append("<a href='javascript:notice(");					
			int  priGroup=(usergroup-1)*pagesize+pagesize;
			sb.append(priGroup);			
			sb.append(")'>&lt;&lt;</a>");
		}
		for(int i=startpage; i<=endpage; i++) {
			if(i==crpath) {
				sb.append("&nbsp;&nbsp;");
				sb.append("<a href='javascript:notice(");			
				sb.append(i);
				sb.append(")'><b>");
				sb.append(i);
				sb.append("</b></a>");
				sb.append("&nbsp;&nbsp;");
				
			}else {
				sb.append("&nbsp;&nbsp;");
				sb.append("<a href='javascript:notice(");			
				sb.append(i);
				sb.append(")'>");
				sb.append(i);
				sb.append("</a>");
				sb.append("&nbsp;&nbsp;");				
			}
			
			if(i==pagecount) {
				break;
			}
		}
		if(usergroup!=(pagecount/pagesize-(pagecount%pagesize==0?1:0))) {
			sb.append("<a href='javascript:notice(");			
			int nextGroup=(usergroup+1)*pagesize+1;
			sb.append(nextGroup);			
			sb.append(")'>&gt;&gt;</a>");
		}
		return sb.toString();
		
		
	}
}
