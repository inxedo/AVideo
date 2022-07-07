-- ### Credit
-- 
-- Discovered by Claudio Bozzato of Cisco Talos.
-- 
-- TALOS-2022-1534
-- 
-- Now the userUpdate.json.php requires a request from the same domain as the AVideo site
-- in aditional all save and delete database calls requires the same by default (a whitelist can be builded hardcoding it in the objects/Object.php file)
-- 
-- TALOS-2022-1535 
-- 
-- Session ID will only change if you are not logged in
-- In case the session ID changed we will regenerate it with a new name avoiding reuse it
-- 
-- TALOS-2022-1536
-- 
-- plugin/Live/view/Live_schedule/add.json.php and objects/playlistAddNew.json.php will deny to update if the users_id is not = as the original record when it is editing
-- 
-- TALOS-2022-1537  
-- 
-- Add a sanitize rule on the security file
-- 
-- 
-- TALOS-2022-1539
-- 
-- Add a sanitize rule on the view/img/image403.php file itself
-- 
-- TALOS-2022-1540
-- 
-- Video title and filename will always be sanitized on the setTitle method (sometimes more than once)
-- 
-- 
-- TALOS-2022-1542   
-- 
-- httponly set to true
-- we are now using the passhash instead of the database pass in all site
-- the passhash is totally different than the original DB password, it a encrypted json and has an expiration time and also will be automatically rejected if the original password is updated
-- the login with the pass hash (database password field) directly will be disabled soon, for now it is only enabled to buy some time to update the other third parties apps
-- 
-- TALOS-2022-1545 
-- 
-- Fixed on TALOS-2022-1542  
-- 
-- TALOS-2022-1546  
-- 
-- Filename is now sanitized with escapeshellarg(safeString($filename,true));
-- 
-- TALOS-2022-1538   
-- 
-- all 4 parameters are sanitized now
-- also if the request does not come from the same site, the showAlertMessage() function will not be executed
-- 
-- TALOS-2022-1547 
-- 
-- Now every time the admin login we will check if the new videos/.htaccess is there, and create it if it is not
-- <IfModule !authz_core_module>
--     Order Allow,Deny
--     Deny from all
-- </IfModule>
-- <IfModule authz_core_module>
--     Require all denied
-- </IfModule>
-- <filesMatch "\.(ico|pdf|flv|jpg|jpeg|png|gif|swf|ts|txt|mp4|mp3|m3u8|webp|key|css|tff|woff|woff2)$">
--     <IfModule !authz_core_module>
--         Order Allow,Deny
--         Allow from all
--     </IfModule>
--     <IfModule authz_core_module>
--         Require all granted
--     </IfModule>
-- </filesMatch>
-- 
-- this will only allow access to only some specific file types inside videos folder
-- 
-- TALOS-2022-1548 
-- 
-- we now verify if is a valid URL properly, also we are using the escapeshellarg for URL and destination filename
-- 
-- TALOS-2022-1549 
-- 
-- We now only download the downloadURL_image if it is a valid URL NOT localfiles any more
-- 
-- TALOS-2022-1551   
-- 
-- All our classes were updated using the prepare statement to avoid sql injection
-- also  `videoDownloadedLink` and `duration` are now sanitized
-- if you are editing anything we now "forbidIfItIsNotMyUsersId"
-- key and URL are now sanitized Clone plugin
-- 
-- TALOS-2022-1550  
-- 
-- the url_get_contents now only download files from valid URLs or files from inside the cache folder


UPDATE configurations SET  version = '12.0', modified = now() WHERE id = 1;