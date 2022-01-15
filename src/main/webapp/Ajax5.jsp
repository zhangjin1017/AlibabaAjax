<%--
  Created by IntelliJ IDEA.
  User: 1216916137
  Date: 2022-01-09
  Time: 17:27
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
            var xmlHttp=createXMLHttpRequest();
                var url="/AlibabaAjax/ProvinceServlet";
                xmlHttp.open("GET",url,true);
                xmlHttp.send(null);
                xmlHttp.onreadystatechange=function() {
                    if (xmlHttp.readyState===4&&xmlHttp.status===200){
                        var text=xmlHttp.responseText;
                        var arr=text.split(",");
                        for (var i = 0; i < arr.length; i++) {
                            var op=document.createElement("option");
                            op.value=arr[i];
                            var textNode=document.createTextNode(arr[i]);
                            op.appendChild(textNode);
                            document.getElementById("province").appendChild(op);
                        }
                    }
                }

            var province=document.getElementById("province");
                province.onchange=function (){

                    var xmlHttp=createXMLHttpRequest();
                    var url="/AlibabaAjax/CityServlet";
                    xmlHttp.open("POST",url,true);
                    xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
                    console.log(province.value);

                    xmlHttp.send("province="+province.value);
                    xmlHttp.onreadystatechange=function() {
                        if (xmlHttp.readyState===4&&xmlHttp.status===200){
                            var citySelect=document.getElementById("city");
                            var optionList=citySelect.getElementsByTagName("option");
                            while (optionList.length>1){
                                citySelect.removeChild(optionList[1]);
                            }

                            var doc=xmlHttp.responseXML;
                          var cityList= doc.getElementsByTagName("City");
                            for (var i = 0; i < cityList.length; i++) {
                                var city=cityList[i];
                                var cityName;
                                if(window.addEventListener){
                                    cityName=city.textContent;
                                }else {
                                    cityName=city.text;
                                }
                                var op=document.createElement("option");
                                op.value=cityName;
                                var textNode=document.createTextNode(cityName);
                                op.appendChild(textNode);
                                citySelect.appendChild(op);
                            }
                        }
                    }
                }

        }
    </script>
</head>
<body>
<h1>省市联动</h1>
<select name ="province" id="province">
    <option>===请选择省份===</option>
</select>
<select name="city" id="city">
    <option>===请选择城市===</option>
</select>
</body>
</html>
