<%-- 
    Document   : Payment
    Created on : 13 Feb, 2018, 10:05:26 PM
    Author     : AkHiLeSh
--%>
<%@page import="java.sql.*"%>
<jsp:useBean id="obj" class="DB.ConnectionClass"></jsp:useBean>
<%
     if (request.getParameter("id") != null) {
             session.setAttribute("buyid", request.getParameter("id"));
         }
         String id = request.getParameter("id");
         String pr = request.getParameter("pr");
         String q = request.getParameter("q");
         int Tot = 0;
         Tot = Integer.parseInt(pr) * Integer.parseInt(q);
         String up = "update tbl_cart set cart_quantity='" + q + "',cart_unittotal='" + Tot + "' where cart_id='" + id + "'";
         boolean b = obj.executeCommand(up);
         if (b) {

         } else {
             out.println(up);
         }

         String SelQry = "select pdt_totalno as c from tbl_product where product_id='" + request.getParameter("pdtid") + "'";
         ResultSet rq = obj.selectCommand(SelQry);
         if (rq.next()) {
             int pcount = Integer.parseInt(rq.getString("c"));
             int quantity = pcount - Integer.parseInt(q);

             String upQ = "update tbl_product set pdt_totalno='" + quantity + "' where product_id='" + request.getParameter("pdtid") + "'";
             boolean d = obj.executeCommand(upQ);
             if (d) {
                 out.println("Stock Updated!..");
             } else {
                 out.println(up);
             }
         }
         String Ins="insert into tbl_sale(user_id,product_id,sale_quantity,total,sale_date) values('"+session.getAttribute("id")+"','"+request.getParameter("pdtid")+"','"+q+"','"+Tot+"',curdate())";
         boolean exe=obj.executeCommand(Ins);
         if(exe)
         {
             out.println("Inserted!..");
         }
         else
         {
             out.println(Ins);
         }
%>
