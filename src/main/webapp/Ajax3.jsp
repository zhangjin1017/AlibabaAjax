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
        var username=document.getElementById("username");
        username.onblur=function () {
            var xmlHttp=createXMLHttpRequest();
            var url="/AlibabaAjax/ValidateUsernameServlet";
            xmlHttp.open("POST",url,true);
            xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
            xmlHttp.send("username="+username.value);
            xmlHttp.onreadystatechange=function() {
                if (xmlHttp.readyState===4&&xmlHttp.status===200){
                    var errorSpan=document.getElementById("errorSpan");
                    var resp=xmlHttp.responseText;
                    console.log(resp);
                    if(resp==1){
                        errorSpan.innerHTML="用户名已被注册！";
                    }else{
                        errorSpan.innerHTML="";
                    }

                }
            }
        }
    }
</script>
</head>
<body>
<h1 id="h1">用户名是否被注册</h1>
<form action="" method="post">
    用户名：<input type="text" name="username" id="username"><span id="errorSpan">aa</span><br>
    密码：<input type="password" name="password" id="password"><br>
    <button type="submit">注册</button>
</form>
</body>
</html>
