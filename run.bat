set HOST_NAME=%COMPUTERNAME%
::set HUGO_ENV=production
set HUGO_ENV=development
%cd%\hugo server --bind=0.0.0.0 --port=8083 --baseURL=http://localhost:8083/
:: %cd%\hugo server --bind=0.0.0.0 --port=8083 --baseURL=http://%HOST_NAME%:8083/