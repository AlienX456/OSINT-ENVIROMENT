sed -i 's+dspace.dir = /dspace+dspace.dir = /opt/dspace+g' /opt/dspace/config/local.cfg
sed -i 's+http://localhost:8080+http://200.69.103.29:26237+g' /opt/dspace/config/local.cfg
sed -i 's+dspace.hostname = localhost+dspace.hostname = ${dspace.baseUrl}+g' /opt/dspace/config/local.cfg
sed -i 's+dspace.ui = xmlui+dspace.ui = jspui+g' /opt/dspace/config/local.cfg
sed -i 's+#mail.server = smtp.example.com+mail.server = smtp.gmail.com+g' /opt/dspace/config/local.cfg
sed -i 's+#mail.server.username = myusername+mail.server.username = osintudfjc@gmail.com+g' /opt/dspace/config/local.cfg
sed -i 's+#mail.server.password = mypassword+mail.server.password = osintosintosint1+g' /opt/dspace/config/local.cfg
sed -i 's+#mail.server.port = 25+mail.server.port = 587+g' /opt/dspace/config/local.cfg
sed -i 's+#mail.from.address = dspace-noreply@myu.edu+mail.from.address = osintudfjc@gmail.com+g' /opt/dspace/config/local.cfg
sed -i 's+#feedback.recipient = dspace-help@myu.edu+feedback.recipient = osintudfjc@gmail.com+g' /opt/dspace/config/local.cfg
sed -i 's+#mail.admin = dspace-help@myu.edu+mail.admin = osintudfjc@gmail.com+g' /opt/dspace/config/local.cfg
sed -i 's+dspace.name = DSpace at My University+dspace.name = DSpace en Universidad Distrital FJC+g' /opt/dspace/config/local.cfg
echo 'mail.extraproperties = mail.smtp.socketFactory.port=587, \' >> /opt/dspace/config/dspace.cfg
echo '                       mail.smtp.starttls.enable = true, \' >> /opt/dspace/config/dspace.cfg
echo '                       mail.smtp.socketFactory.fallback=false, \' >> /opt/dspace/config/dspace.cfg
echo '                       mail.smtp.starttls.required = true' >> /opt/dspace/config/dspace.cfg