# Log your Batch file using a Discord Bot or Webhook.

# #1 Discord Webhook - (Easiest Difficulty) 

**(Webhook Setup)**
1. Create your desired logging channel, then open the **settings** of that **channel** and go to **Integrations**. 
2. Then create, name and copy the **WebHook**.

**(Python Setup)**
1. Go to the [Python Website](https://www.python.org/downloads/), download the lastest version, check "**Add python.exe to PATH**" upon installation.
2. Once installed open **CMD** and type "**python --version**" if the version shows up you're good to go!
3. Now open **Notepad** and copy & paste the **following code** ↓ naming it E.g. **logger_bot.py**
```Python
import requests

# Replace with your actual webhook URL
WEBHOOK_URL = 'https://discord.com/api/webhooks/your-webhook-id/your-webhook-token'

def send_log(message: str):
    payload = {
        "content": message  # You can also customize username or avatar_url if needed
    }

    response = requests.post(WEBHOOK_URL, json=payload)

    if response.status_code == 204:
        print("✅ Log sent successfully.")
    else:
        print(f"❌ Failed to send log. Status code: {response.status_code} - {response.text}")

# Example log message (replace with dynamic content if desired)
send_log("📝 UUID: Example_UUID ran Option 1.")
```
4. Now edit "**logger_bot.py**" or the **.py file** you created and change the **WEBHOOK_URL** with you copied from your **Discord Channel**.
5. Now open **CMD** and copy & paste the **following code**. ↓ - **(Replace Path with your Python Script Path)**
```Bat
:: Replace Path with your Python Script Path
python "C:\logger_bot.py
```
6. If **successful**, you're **discord bot** should send the **log** to your **desired discord channel**.

**(Batch Implementation)**
> [!CAUTION]
> If the **logger_bot.py** is shared, others will have **access** to you're **discord bot**, etc. In order to prevent this you can try **encrypting the token, compiling an exe from the .py script or hosting a server cotaining the token privately**.
The **last option** in theory should be the **safest**, learn here **[Server Hosting](https://github.com/QuakedK/Scripting-Station/blob/main/Discord%20Bot%20Logging/Discord%20Batch%20Logging.md#3-server-hosting---hardest-difficulty)**.

1. Re-edit your "**logger_bot.py**" with the **following code**. ↓ - **(Don't forget to replace the Webhook)**
```Python
import sys
import requests

# Replace with your actual webhook URL
WEBHOOK_URL = 'https://discord.com/api/webhooks/YOUR_WEBHOOK_ID/YOUR_WEBHOOK_TOKEN'

def send_log(message: str):
    payload = {
        "content": message
    }

    response = requests.post(WEBHOOK_URL, json=payload)

    if response.status_code == 204:
        print("✅ Log sent successfully.")
    else:
        print(f"❌ Failed to send log. Status: {response.status_code} - {response.text}")

def main():
    try:
        UUID = sys.argv[1]
        User_Choice = sys.argv[2]
        send_log(f"📝 UUID `{UUID}` selected Option `{User_Choice}`.")
    except IndexError:
        send_log("⚠️ Log ran, but no UUID or option provided.")

if __name__ == "__main__":
    main()
```
2. Now open **Notepad** and lets create a **batch/.bat** that not only gets a **UUID** but also the **Users Choice**. - **(Python must be installed and don't forget to change the batch's path of the .py script)**
```bat
@echo off
setlocal enabledelayedexpansion

:: UUID Detection/Creation.
set "UUID_FILE=UUID.txt"
if exist "%UUID_FILE%" (
    set /p UUID=<%UUID_FILE%
    echo Your UUID: !UUID!
) else (
    Powershell -NoProfile -Command "[guid]::NewGuid().ToString()" > %UUID_FILE%
    set /p UUID=<%UUID_FILE%
    echo Your UUID: !UUID!
)
echo.

:: Example Question.
echo Do you like Mommy Asmr?
echo.

:: User Choice (Asking the user options.)
:AskOption
echo Choose an option:
echo 1. Yes
echo 2. No
set /p option="Enter option number: "
echo.
if "%option%"=="1" (
set User_Choice=Yes
echo Great Answear!
call :Py_log 
) else if "%option%"=="2" (
set User_Choice=No
echo Bad Answear!
call :Py_log 
) else (
cls
chcp 437 >nul
powershell -Command "Write-Host 'Invalid choice, Please choose options 1-2.' -ForegroundColor White -BackgroundColor Red"
timeout 1 > nul
goto :AskOption
)
endlocal

:: Call Python script to send data. (Python must be installed or compile the .py into an exe and run it that way)
:Py_log
python "C:\MyProject\tools\send_log.py" !UUID! !User_Choice!
pause
```
3. Once done run the **bat file** and see if the bot responds!

# #2 Discord Bot - (Medium Difficulty)

**(Bot Setup)**
1. Go to the **[Discord Developer Portal](https://discord.com/developers/applications)**, login into your **Discord** than click **New Application** (top right).
3. On the **left sidebar**, click **Bot** and change the **icon** and **name** how you see fit.
4. Now navigate to **OAuth2**, then scroll down to **OAuth2 URL Generator** and **select Bot**, and under **Bot Permissions** give it **Administrator**.
5. While in **OAuth2**, you should now see **Generated URL** at the **very bottom** and now paste that **link** into your **browser** and have your **bot** join your **discord Server**.
6. Go back to **Bot** and click **Reset Token** and keep it ready and handy. - **(DO NOT SHARE)**

**(Python Setup)**
1. Go to the **[Python Website](https://www.python.org/downloads/)**, download the lastest version, check "**Add python.exe to PATH**" upon installion.
2. Once installed open **CMD** and type "**python --version**" if it shows up now type "**pip install discord.py**". 
3. Now open **Notepad** and copy & paste the following code. ↓ naming it E.g. **logger_bot.py**
```Python
import discord
import asyncio

# Replace with your bot token and channel ID
TOKEN = 'YOUR_BOT_TOKEN_HERE'    # Replace with your bot token
CHANNEL_ID = 123456789012345678  # Replace with your channel ID

intents = discord.Intents.default()
client = discord.Client(intents=intents)

async def send_log(message: str):
    await client.wait_until_ready()
    channel = client.get_channel(CHANNEL_ID)
    if channel:
        await channel.send(message)
    else:
        print("❌ Channel not found.")

@client.event
async def on_ready():
    print(f"✅ Bot logged in as {client.user}")
    
    # Example log message (you can replace this with dynamic input or file reads)
    await send_log("📝 UUID: Example_UUID ran Option 1.")

    # Optionally stop the bot after logging
    await client.close()

client.run(TOKEN)
```
4. Now go into your **Discord Setting**, under **Advanced** enable **Developer Mode**, then create the **logging channel** and right click the **channel** clicking "**Copy Channel ID**".
5. Now edit "**logger_bot.py**" or the **.py file** you created and change the **channel ID** with your copied one and do the same with your **bot token**.
5. Now open **CMD** and copy & paste the **following code**. ↓ - **(Replace Path with your Python Script Path)**
```Bat
:: Replace Path with your Python Script Path
python "C:\logger_bot.py
```
8. If successful, you're discord bot should send the data to your desired discord channel.

(Batch)
> [!CAUTION]
> If the **logger_bot.py** is shared, others will have **access** to you're **discord bot**, etc. In order to prevent this you can try **encrypting the token, compiling an exe from the .py script or hosting a server cotaining the token privately**.
The **last option** in theory should be the **safest**, learn here **[Server Hosting](https://github.com/QuakedK/Scripting-Station/blob/main/Discord%20Bot%20Logging/Discord%20Batch%20Logging.md#3-server-hosting---hardest-difficulty)**.

1. Re-edit your "**logger_bot.py**" with the **following code** ↓ - (**Don't forget to replace Bot Token and Channel ID**)
```Python
import discord
import sys
import asyncio

# Replace with your bot token and channel ID
TOKEN = 'YOUR_BOT_TOKEN_HERE'    # Replace with your bot token
CHANNEL_ID = 123456789012345678  # Replace with your real channel ID

intents = discord.Intents.default()
client = discord.Client(intents=intents)

async def send_log(message: str):
    await client.wait_until_ready()
    channel = client.get_channel(CHANNEL_ID)
    if channel:
        await channel.send(message)
    else:
        print("❌ Channel not found.")

@client.event
async def on_ready():
    print(f"✅ Bot logged in as {client.user}")

    # Grab UUID and option from command line
    try:
        UUID = sys.argv[1]
        User_Choice = sys.argv[2]
        await send_log(f"📝 UUID `{UUID}` selected Option `{User_Choice}`.")
    except IndexError:
        await send_log("⚠️ Log ran, but no UUID or option provided.")
    
    await client.close()

client.run(TOKEN)
```
2. Now open **Notepad** and lets create a **batch/.bat** that not only gets a **UUID** but also the **Users Choice**. - **(Python must be installed and don't forget to change the batch's path of the .py script)**
```bat
@echo off
setlocal enabledelayedexpansion

:: UUID Detection/Creation.
set "UUID_FILE=UUID.txt"
if exist "%UUID_FILE%" (
    set /p UUID=<%UUID_FILE%
    echo Your UUID: !UUID!
) else (
    Powershell -NoProfile -Command "[guid]::NewGuid().ToString()" > %UUID_FILE%
    set /p UUID=<%UUID_FILE%
    echo Your UUID: !UUID!
)
echo.

:: Example Question.
echo Do you like Mommy Asmr?
echo.

:: User Choice (Asking the user options.)
:AskOption
echo Choose an option:
echo 1. Yes
echo 2. No
set /p option="Enter option number: "
echo.
if "%option%"=="1" (
set User_Choice=Yes
echo Great Answear!
call :Py_log 
) else if "%option%"=="2" (
set User_Choice=No
echo Bad Answear!
call :Py_log 
) else (
cls
chcp 437 >nul
powershell -Command "Write-Host 'Invalid choice, Please choose options 1-2.' -ForegroundColor White -BackgroundColor Red"
timeout 1 > nul
goto :AskOption
)
endlocal

:: Call Python script to send data. (Python must be installed or compile the .py into an exe and run it that way)
:Py_log
python "C:\MyProject\tools\send_log.py" !UUID! !User_Choice!
pause
```
3. Once done run the **bat file** and see if the bot responds!

# #3 Server Hosting - (Hardest Difficulty)
**Server Hosting Method** is used in order to keep **Bot Tokens** and **WebHooks** private within **Open Source environments**.
Effectively hosting the **WebHook** or **Bot Token** safely **server side**, and after sending the logs to the **server**, the **server** hands off the info to **discord**!

**(Github Setup)**
1. Create a **[Github](https://github.com/) account** then make a **Private Repository**. 
2. Open the **Repository**, click **Add File**, Create **New File** then in the **top left** name it **app.py** and copy & paste the **following code**. ↓
```Python
from flask import Flask, request
import requests
import os

app = Flask(__name__)

DISCORD_WEBHOOK_URL = os.getenv("DISCORD_WEBHOOK_URL")

@app.route('/log', methods=['POST'])
def log():
    data = request.json
    uuid = data.get("uuid")
    choice = data.get("choice")
    if not uuid or not choice:
        return {"error": "Invalid data"}, 400

    message = f"📝 Log received:\n• UUID: `{uuid}`\n• Choice: `{choice}`"
    response = requests.post(DISCORD_WEBHOOK_URL, json={"content": message})
    return {"status": "success"} if response.status_code == 204 else {"error": "Failed to post"}, 500

# ⬇️ THIS is what keeps the app running on the correct port:
if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
```
3. Create a new file called **requirements.txt**, and copy & paste the **following code**. ↓
```bat
flask
requests
```
4. Github Repository Example ↓ - **(The Readme.md can be ignored)**
<img width="938" height="313" alt="Github Repository Example" src="https://github.com/user-attachments/assets/ada6fe1d-048a-4572-a014-a3ecf67a3df4" />

**(Free Server Setup)**
> [!CAUTION]
> Render's **Free Tier** has limitations go to [Render's Docs](https://render.com/docs/free) to learn more.
>
> Web Services (e.g., Node.js, Python, Rails)
> 
> - 750 free instance-hours/month across all Free services
>   
> - Spins down after ~15 minutes idle (cold start on wake)
>   
> - Risk of suspension for high outbound traffic (e.g., external APIs)

1. Go to **[Render](https://render.com/)** and create an **account** by using you're **github**.
2. Once logged in click **New**, **Web Service** and connect it your previously made **Private Repository**.
3. Now fill out the the **following settings**. ↓
```bat
:: Important & Example Setting
Name: Log Server
Language: Python 3
Region: Virginia (US East)
Build Command: pip install -r requirements.txt
Start Command: python app.py
Instance Type: Free

:: Environment Variables Settings
NAME_OF_VARIABLE: DISCORD_WEBHOOK_URL
Value: your Discord webhook URL (Keep this secret, no one should see it)     
```
4. Now click **Deploy Web Service**, if successful it should **build** and **deploy** the **server**, reporting it's **live**.
5. In the **events section**, slightly below by your **Github Name/Repository**, you'll see you're **Render URL** make sure to copy it.

**(Python Testing)**
1. Open notepad, create a **Local Python Test File** E.g. **test_log.py**, then copy & paste the **following code**. ↓
```Python
import requests
import uuid

# Replace with YOUR actual Render URL
url = "https://log-server-xxxx.onrender.com/log"

# Random UUID for testing
user_uuid = str(uuid.uuid4())

# Simulated user input (like option 1 or 2)
log_data = {
    "uuid": user_uuid,
    "choice": "Option 2 - Continue Anyway"
}

response = requests.post(url, json=log_data)
print("Status:", response.status_code)
print("Response:", response.text)
```
2. Make sure to **replace** the **Render Url** in your **Python script**. - **(don't forget /log at the end)**
3. Now open **CMD** and copy & paste the **following code**. ↓ - **(Replace Path with your Python Script Path)**
```Bat
:: Replace Path with your Python Script Path
python "C:\logger_bot.py
```  
4. If successful, you're **Discord WebHook** should send the **Log** to your desired **discord channel**.

**(Batch)**
1. Re-edit your **app.py** from the **Github Repository** and  copy & paste the **following code**. ↓
```Python
from flask import Flask, request
import requests
import os

app = Flask(__name__)

DISCORD_WEBHOOK_URL = os.getenv("DISCORD_WEBHOOK_URL")

@app.route('/log', methods=['POST'])
def log():
    data = request.json
    uuid = data.get("uuid")
    choice = data.get("choice")
    if not uuid or not choice:
        return {"error": "Invalid data"}, 400

    message = f"📝 Log received:\n• UUID: `{uuid}`\n• Choice: `{choice}`"
    response = requests.post(DISCORD_WEBHOOK_URL, json={"content": message})

    if response.status_code == 204:
        return {"status": "success"}, 200
    else:
        # Log the error server-side for debugging
        print(f"Failed to post to Discord: {response.status_code} - {response.text}")
        return {"error": "Failed to post to Discord", "details": response.text}, 500

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
```
2. Re-edit your **Local Python Test File** with the the **following code**. ↓
```Python
# send_log.py

import sys
import requests

# Get the UUID and user choice from command-line arguments
uuid = sys.argv[1]
choice = sys.argv[2]

# The endpoint of your Flask server (which forwards to Discord)
url = "https://log-server-xxxx.onrender.com/log"  # replace with your actual URL

# Payload to send
payload = {
    "uuid": uuid,
    "choice": choice
}

# Send the POST request
try:
    response = requests.post(url, json=payload)
    print("Status:", response.status_code)
    print("Response:", response.text)
except Exception as e:
    print("Failed to send log:", e)
```
3. Now open **Notepad** and lets create a **batch/.bat** that not only gets a **UUID** but also the **Users Choice**. - **(Python must be installed and don't forget to change the batch's path of the .py script)**
```bat
@echo off
setlocal enabledelayedexpansion

:: UUID Detection/Creation.
set "UUID_FILE=UUID.txt"
if exist "%UUID_FILE%" (
    set /p UUID=<%UUID_FILE%
    echo Your UUID: !UUID!
) else (
    Powershell -NoProfile -Command "[guid]::NewGuid().ToString()" > %UUID_FILE%
    set /p UUID=<%UUID_FILE%
    echo Your UUID: !UUID!
)
echo.

:: Example Question.
echo Do you like Mommy Asmr?
echo.

:: User Choice (Asking the user options.)
:AskOption
echo Choose an option:
echo 1. Yes
echo 2. No
set /p option="Enter option number: "
echo.
if "%option%"=="1" (
set User_Choice=Yes
echo Great Answear!
call :Py_log 
) else if "%option%"=="2" (
set User_Choice=No
echo Bad Answear!
call :Py_log 
) else (
cls
chcp 437 >nul
powershell -Command "Write-Host 'Invalid choice, Please choose options 1-2.' -ForegroundColor White -BackgroundColor Red"
timeout 1 > nul
goto :AskOption
)
endlocal

:: Call Python script to send data. (Python must be installed or compile the .py into an exe and run it that way)
:Py_log
python "C:\...\...\logger_bot.py" !UUID! !User_Choice!
pause
```
3.  Once done run the **bat file** and see if the bot responds!

