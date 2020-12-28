set HOST_NAME=%COMPUTERNAME%
::set HUGO_ENV=production
set HUGO_ENV=development
hugo server --bind=0.0.0.0 --port=3100 --baseURL=http://localhost:3100/
:: %cd%\hugo server --bind=0.0.0.0 --port=8083 --baseURL=http://%HOST_NAME%:8083/

:: Also run
:: npx