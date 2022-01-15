<%--
  Created by IntelliJ IDEA.
  User: 1216916137
  Date: 2022-01-09
  Time: 20:52
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
                var url="/AlibabaAjax/Json2";
                xmlHttp.open("GET",url,true);
                xmlHttp.send(null);
                xmlHttp.onreadystatechange=function() {
                    if (xmlHttp.readyState===4&&xmlHttp.status===200){
                        var text=xmlHttp.responseText;
                        var person=eval("("+text+")");
                        var s=person.name + "," + person.age+","+person.sex;
                        document.getElementById("h3").innerHTML=s;
                    }
                }
            }
        }
    </script>
</head>
<body>
<button id="btn1">确定</button>
<h1>JSON</h1>
<h3 id="h3"></h3>
</body>
</html>
