<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<script type="text/javascript">
    function createXMLHttpRequest(){
        try {
            return new XMLHttpRequest();
        }catch (e) {
            try {
                return new ActiveXObject("Msxm12.XMLHTTP");
            }catch (e) {
                try {
                    return  new ActiveXObject("Microsoft.XMLHTTP");
                }catch (e) {
                    alert("您用的浏览器有问题");
                    throw e;
                }
            }
        }
    }

    window.onload=function () {
        var btn1=document.getElementById("btn1");
        btn1.onclick=function () {
            var xmlHttp=createXMLHttpRequest();
            var url="/AlibabaAjax/Servlet2";
            xmlHttp.open("GET",url,true);
            xmlHttp.send(null);
            xmlHttp.onreadystatechange=function() {
                if (xmlHttp.readyState===4&&xmlHttp.status===200){
                    var doc=xmlHttp.responseXML;
                    console.log(doc);
                    var stu =doc.getElementsByTagName("student")[0];
                    var number= stu.getAttribute("number");
                    var name=stu.getElementsByTagName("name")[0].textContent;   //ie用text
                    var age=stu.getElementsByTagName("age")[0].textContent;
                    var sex=stu.getElementsByTagName("sex")[0].textContent;
                    var text=number+":"+name+","+age+","+sex;
                    document.getElementById("h1").innerHTML=text;
                }
            }
        }
    }
</script>
</head>
<body>
<button id="btn1">确认</button>
<h1 id="h1"></h1>
</form>
</body>
</html>
