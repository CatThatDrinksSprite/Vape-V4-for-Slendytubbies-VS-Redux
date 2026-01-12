<div align='center'>

# 💨 Vape V4 for Slendytubbies VS Redux

**A simple mod for Xylex's Vape V4 Remake for Roblox**

</div>

---

## 📦 Installation

### Manual

<details>
<summary><b>Step-by-step guide</b> (Click to expand)</summary>

1. **Run the Vape V4 Script in-game to make sure you have the workspace folder**
   ```lua
   loadstring(game:HttpGet('https://github.com/7GrandDadPGN/VapeV4ForRoblox/raw/main/NewMainScript.lua', true))()
   ```

2. **Going to the 'newvape' games Folder**
   - Locate your executor and goto workspace\newvape\games
  
3. **Installing the Modification**
   - Drag the modification into newvape\games or Create a file named '99532682718459.lua' and paste the modification contents into the new file
  
2. **Rejoining**
   - Rejoin if Vape V4 was already Running

</details>

### Automatic

<details>
<summary><b>Step-by-step guide</b> (Click to expand)</summary>

1. **Run the Automatic Installer**
   ```lua
   if not isfolder('newvape') then
      makefolder('newvape')
   end
   if not isfolder('newvape/games') then
      makefolder('newvape/games')
   end
   writefile('newvape/games/99532682718459.lua', game:HttpGet('https://github.com/CatThatDrinksSprite/Vape-V4-for-Slendytubbies-VS-Redux/raw/main/newvape/games/99532682718459.lua', true))
   ```

2. **Rejoining**
   - Rejoin if Vape V4 was already Running

</details>
