A nice look to Subversion a.k.a SVN default web page.

To enable styling of the SVN page in Apache Web Server(Ubuntu)
  
  1. Go to the Apache folder "sites-available" where is yor SVN.conf file located.
  2. In the conf file add:
  ```
  <Location /svn>
      DAV svn
      SVNParentPath /var/lib/svn
      SVNListParentPath on
      
      # To enable styling add this row  
      SVNIndexXSLT "/index.xsl" # or name of your choise
   
      ### other settings ###   
   </Location>
   ```
      
  3. Add the `index.xsl` and `svnstyle.css` to the web root folder of your Apache,
    for example in `/var/www/html`
    
  4. Open http://your_domain_name.com/svn to see the changes.
  
  5. Modify those 2 files to change the page style by your taste.
     
