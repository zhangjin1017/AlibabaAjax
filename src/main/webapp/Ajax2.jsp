<%--
  Created by IntelliJ IDEA.
  User: 1216916137
  Date: 2022-01-08
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
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
           var url="/AlibabaAjax/Servlet1";
           xmlHttp.open("POST",url,true);
           xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
           xmlHttp.send("username=zj张锦");
           xmlHttp.onreadystatechange=function() {
            if (xmlHttp.readyState==4&&xmlHttp.status==200){
                    var text=xmlHttp.responseText;
                    var h1=document.getElementById("h1");
                    h1.innerHTML=text;
                }
            }
        }
    }
</script>
</head>
<body>
<button id="btn1">确认</button>
<h1 id="h1"></h1>
</body>
</html>
