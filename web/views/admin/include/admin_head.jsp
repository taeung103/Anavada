<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="member.model.vo.Member, java.util.ArrayList"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> 
<title>Anavada 관리자</title>
<link rel="stylesheet" type="text/css" href="/anavada/resources/admin/css/common.css">
<script src="/anavada/resources/js/jquery-1.12.4.js"></script>
<% Member loginMember = (Member)session.getAttribute("loginMember"); %>
<% Member member = (Member)request.getAttribute("member"); %>
<% ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list"); %>