<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${themesPath}/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${themesPath}/oldcss/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${scriptsPath}/system/calendar.js"></script>
    <script type="text/javascript" src="${scriptsPath}/system/function.js"></script>
</head>
<body>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="table_line">
    <tr>
        <td colspan="3" class="line_td_title" align="center">个人考勤</td>
    </tr>
    <form action="user-attendance!save" method="post">
    <tr>
        <td colspan="3" class="line_td_search" align="center">
                <a href="user-attendance!day?day=${beforeday}">←${beforeday}</a>
            日期：
            <input name="day" id="day" class="input_one2" type="text" value="${day}"/>&nbsp;
            <img src="${themesPath}/oldimages/calendar.gif"  width="13" height="12" onClick="calendar(day,'date');" style="cursor:pointer">
            <input type="submit" name="button" id="button" value="搜索" class="search_but" />
            <a href="user-attendance!day?day=${afterday}">${afterday}→</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" name="submit" id="save" value="保存" class="confirm_but" onclick="return confirm('是否保存?');"/>
        </td>
    </tr>
    <tr>
        <td class="line_td_head">部门</td>
        <td class="line_td_head">姓名</td>
        <td class="line_td_head">考勤状态</td>
    </tr>
    <c:forEach items="${attendances}" var="attendance" varStatus="status">
        <tr>
            <input type="hidden" name="attid" value="${attendance.id}"/>
            <td class="line_td_light">&nbsp;&nbsp;&nbsp;&nbsp;${attendance.user.sysdept.name}</td>
            <td class="line_td_light">&nbsp;&nbsp;&nbsp;&nbsp;${attendance.user.displayname}</td>
            <td class="line_td_light">&nbsp;&nbsp;&nbsp;&nbsp;
                <select name="atttype" id="atttype">
                    <option value="1" <c:if test='${attendance.type == 1}'>selected</c:if>>出勤</option>
                    <option value="2" <c:if test='${attendance.type == 2}'>selected</c:if>>调休</option>
                    <option value="3" <c:if test='${attendance.type == 3}'>selected</c:if>>事假</option>
                    <option value="4" <c:if test='${attendance.type == 4}'>selected</c:if>>病假</option>
                    <option value="0" <c:if test='${attendance.type == 5}'>selected</c:if>>缺勤</option>
                </select>
            </td>
        </tr>
    </c:forEach>
    </form>
</table>
</body>
</html>