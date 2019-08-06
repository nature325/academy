function getSubjectSize(sdate,edate,day){
	var count=0;
	var d=new Date(sdate);	
	var week = new Array('일', '월', '화', '수', '목', '금', '토');
	var tod=new Date(edate);
	var tod_=tod.getFullYear()+'-'+tod.getMonth()+'-'+tod.getDate();	
	var d_='';
	var arr=new Array();
	var day=day;
	for(i=0;i<day.length;i++){
		arr[i]=day.substring(i,i+1);
	}	
	while(d_<=tod_){
		for(i=0; i<arr.length; i++){
			if(week[d.getDay()]==arr[i]){
				count+=1;				
			}
		}		
		d.setDate(d.getDate()+1);		
		d_=d.getFullYear()+'-'+d.getMonth()+'-'+d.getDate();		
	}
	if(count!=0){
	return count;
	}else{		
		return 1;
	}
}