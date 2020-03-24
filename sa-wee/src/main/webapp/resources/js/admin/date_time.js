function jsIsNew(date, isNewDay) {
    // 현재 시간 설정
    var nowTime = new Date().getTime();
    // 게시글 시간 설정
    date = date.replace(" ", "T");
    var inTime = new Date(date).getTime();
    
    // new가 붙을 기준 날짜 설정(day 기준)
    var newTime = nowTime - (86400000 * isNewDay);
    
    // 기준 시간 이후에 등록된 게시글이면 true 반환, 기준 시간 이전에 등록된 게시글면 false 반환
    if(inTime > newTime) {
        return true;
    } else {
        return false;
    }
 
}
