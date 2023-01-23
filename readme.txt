flutter create --org com.amazon.amazon_customer -i swift -a java amazon_customer

Run with python GO TO BUILD/WEB
---------------------------------------------------------------------------------------------------------
>> python -m http.server 8000
>> flutter run -d chrome --web-hostname 192.168.1.xxx --web-port 64523
---------------------------------------------------------------------------------------------------------
Run WEB by specific IP address.
---------------------------------------------------------------------------------------------------------
>> Connect your PC to your mobile wifi hotspot.
>> flutter run -d chrome --web-hostname 192.168.136.52 --web-port 64523
>> Disable your firewall on your PC.
>> Open Internet Browser on mobile and run https://192.168.136.52:64523/merchant/
---------------------------------------------------------------------------------------------------------
Run with flutter IDE
---------------------------------------------------------------------------------------------------------
>> flutter run -d "chrome"

Deployed Apache
---------------------------------------------------------------------------------------------------------
>> flutter clean
>> flutter pub get
>> flutter build web
>> open "build/web/flutter_service_worker.js" file then edit "/" to "/merchant/"," on line 78.
>> save
>> upload to server.
>> https://dev-ca-storefront-pwa.azurewebsites.net/merchant/
---------------------------------------------------------------------------------------------------------
.htaccess (Example)
---------------------------------------------------------------------------------------------------------
DirectoryIndex index.html

<IfModule mod_rewrite.c>
 RewriteEngine On
 RewriteBase /merchant
 RewriteRule ^index\.html$ - [L]
 RewriteCond %{REQUEST_FILENAME} !-f
 RewriteCond %{REQUEST_FILENAME} !-d
 RewriteCond %{REQUEST_FILENAME} !-l
 RewriteRule . /merchant/index.html [L]
</IfModule>

---------------------------------------------------------------------------------------------------------