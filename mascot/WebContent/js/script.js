$(document).ready(function () {
    $(".menu_1").hover(function () {
        $(".menu_1_content").slideToggle("fast");
    });
    
    $(".menu_2").hover(function () {
        $(".menu_2_content").slideToggle("fast");
    });
    
    $(".menu_3").hover(function () {
        $(".menu_3_content").slideToggle("fast");
    });
});

function runAjax(sort){
 //비동기통신을 할 수 있는 객체를 생성 - XMLHttpRequest
console.log(sort);
 var xhr = new XMLHttpRequest();
 xhr.onreadystatechange = function(){
 console.log("정상출력:"+xhr.readyState); 

  if(xhr.readyState==4 && xhr.status==200){
       document.getElementById("mydiv").innerHTML  = xhr.responseText;
    }

}
 //Get방식으로 요청하기
 xhr.open("GET", "ajax.jsp?id="+sort, true);
 xhr.send();
}
