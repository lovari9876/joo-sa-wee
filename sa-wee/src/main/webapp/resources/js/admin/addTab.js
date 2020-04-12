$(document).ready(function(){
	//미완...
	var category;
	
	 //On Click Event
    $(".btn").click(function() {

    	category = $(this).val();
    	//클릭한 .btn 클래스의 value를 받아와 변수에 담는다 
    	
    	if (category == 'rank' ){
    		$( '#rank' ).addClass( 'active' );
    	}

    	
    	console.log('category : ' + category);
    	
    
    });		
    

	
});