<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/6/1
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<script type="text/javascript">
    var xmlHttp;
    function createXMLHttpRequest() {
        try {
            xmlHttp = new XMLHttpRequest();
        } catch (tryMS) {
            try {
                xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (otherMS) {
                try {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (failed) {
                    xmlHttp = null;
                    // 这里可以报一个错误，无法获得 XMLHttpRequest对象
                }
            }
        }
        return xmlHttp;
    }
    function loadJSON() {
        //1.创建XMLHttpRequest对象
        xmlHttp = createXMLHttpRequest();

        //2.使用open方法建立与服务器的连接
        xmlHttp.open("post", "/Ajax6_1/Servlet");
        //3.将状态触发器绑定到一个函数
        xmlHttp.onreadystatechange = getJson;
        //4.向服务器端发送数据
        //xmlHttp.setRequestHeader("CONTENT-TYPE","application/x-www-form-urlencoded");
        xmlHttp.send(null);
    }
    //5.在回调函数中对返回数据进行处理
    function getJson() {
        if (xmlHttp.readyState == 4) {  //没有异常，没有错误
            if (xmlHttp.status == 200) {
                //将JSON字符串转为JS对象
                var obj = eval("(" + xmlHttp.responseText + ")");
                var msg = "<table><tr><th>用户编号</th><th>用户姓名</th><th>用户密码</th></tr>";
                for (var i = 0; i < obj.length; i++) {
                    msg += "<tr><td>" + obj[i].id + "</td>";
                    msg += "<td>" + obj[i].uanme + "</td>";
                    msg += "<td>" + obj[i].pwd + "</td>";
                    msg += "</tr>";
                }
                msg += "</table>";
                document.getElementById("myDiv").innerHTML = msg;
            } else if (xmlHttp.status == 404) {
            } else if (xmlHttp.status == 500) {
            }
        }
    }

</script>
<body>
<button></button>
</body>
</html>
