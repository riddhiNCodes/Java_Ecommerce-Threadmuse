=============================
ThreadMuse – Setup Guide
=============================

Requirements:
- Eclipse IDE for Enterprise Java
- JDK 23
- Apache Tomcat 10
- XAMPP (MySQL only)

Steps After Import:
1. Install JDK 23
2. Install Apache Tomcat 10
3. Open Eclipse
4. File → Import → Existing Projects into Workspace
5. Select Archive File → Choose ZIP → Finish

IMPORTANT FIX (Mandatory):
6. Go to Servers tab
7. Add Apache Tomcat 10
8. Right-click project → Properties
9. Targeted Runtimes → Select Tomcat 10
10. Apply → OK
11. Project → Clean

Database Setup:
1. Start XAMPP → MySQL
2. Open http://localhost/phpmyadmin
3. Create DB: threadmuse
4. Import threadmuse.sql

DB Credentials:
user: root
password: (empty)

Admin Page(Login) Credential:
Email : adminpage@gmail.com
password : 0987

Note:
Servlet API is provided by Tomcat runtime and is not bundled
inside the project ZIP.
