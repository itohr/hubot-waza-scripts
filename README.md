# hubot-waza-scripts

## Usage
Mattermost should be running at any server. Using the official docker image is easy for that:
```
docker run -d -p 8065:8065 --name mattermost mattermost/mattermost-preview
```
Then create bot user from Mattermost GUI.

To initialize Hubot, do the following:
```
bash setup_hubot.sh <hubot_dir>
```
This script requires you to enter Hubot app data during execution.

After initialization, edit env.sh file according to your environment and run the hubot script:
```
cd <hubot_dir>
bash run.sh
```
