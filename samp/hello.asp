<%@ LANGUAGE = JScript %>
<%
  // Load the XML source
  var xml = Server.CreateObject("Microsoft.XMLDOM");
  xml.async = false;
  xml.load(Server.MapPath("hello.xml"));
  // Load the stylesheet file
  var xsl = Server.CreateObject("Microsoft.XMLDOM");
  xsl.async = false;
  xsl.load(Server.MapPath("hello.xsl"));
  // Process it
  var result = xml.transformNode(xsl);
  Response.Write(result);
%>
