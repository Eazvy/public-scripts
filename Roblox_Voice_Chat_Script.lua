_G.UIName="VoiceNigga"local a=loadstring(game:HttpGet('https://raw.githubusercontent.com/Eazvy/Eazvy-Hub/main/Content/UILibrary.lua'))()local b=game:GetService("VoiceChatInternal")local c=game:GetService("VoiceChatService")local d=game:GetService("HttpService")local function e(f)for g,h in pairs(game:GetService("CoreGui").ExperienceChat.bubbleChat:GetChildren())do if h:IsA("BillboardGui")and h.Name=="BubbleChat_"..f then if h:FindFirstChild("PlayerButtons")then return h.PlayerButtons end end end end;local function i(j,k)a:MakeNotification({Name="Voice Chat - Disabled",Content=j.."\n"..k,Image="rbxassetid://161551681",Time=4})end;local function l(j,k)a:MakeNotification({Name="Voice Chat - Error",Content=j.."\n"..k,Image="rbxassetid://161551681",Time=4})end;local function m(j,k)a:MakeNotification({Name="Voice Chat - Success",Content=j.."\n"..k,Image="rbxassetid://4914902889",Time=4})end;local function n(j,k,f)a:MakeNotification({Name="Voice Chat - State",Content=j.."\n"..k,Image="rbxassetid://"..tostring(f),Time=4})end;local o=a:MakeWindow({Name="Eazvy Hub | Voice Chat",HidePremium=true,SaveConfig=false,ConfigFolder="EazvyHub",IntroEnabled=false,IntroText="Eazvy Hub - Animations/Emotes",IntroIcon="rbxassetid://10932910166",Icon="rbxassetid://4914902889"})local p=o:MakeTab({Name="Main",Icon="rbxassetid://10507357657",PremiumOnly=false})local q=o:MakeTab({Name="Settings",Icon="rbxassetid://8382597378",PremiumOnly=false})local r=p:AddSection({Name=" // Voice Dropdowns"})local s={}local t={}local u={}local v={}local w={Toggle=false,Highlight=false,HighlightSelf=false,ClickToSelect=false,SpeakNotifications=false,Spy=false,Player}local function x(y)for g,h in pairs(b:GetParticipants())do if h==y then return true else return false end end end;for z,h in pairs(b:GetParticipants())do local A=game:GetService("Players"):GetNameFromUserIdAsync(h)if A then table.insert(s,game:GetService("Players")[tostring(game:GetService("Players"):GetNameFromUserIdAsync(h))])end end;local B,C,D=pcall(function()return b:GetSpeakerDevices()end)local u={}local t={}local E={}for g,F in pairs(b:GetMicDevices())do table.insert(u,F)end;if B then for z,G in ipairs(C)do t[G]=D[z]table.insert(E,G)end else warn("Failed to retrieve speaker devices.")end;local H={}for g,h in pairs(s)do table.insert(H,h.DisplayName.." @"..h.Name)end;local function I(J)for g,h in pairs(game.Players:GetChildren())do if h.DisplayName.." @"..h.Name==J then return h end end end;p:AddDropdown({Name="Set Player",Default="",Options=H,Callback=function(K)w.Player=I(K)end})local function L(M,G)for N,J in ipairs(M)do if J==G then return N end end;return nil end;p:AddDropdown({Name="Set Input Device",Default="",Options=u,Callback=function(O)local P=L(u,O)if P then print("Setting Mic Device:",O,"Index:",P)b:SetMicDevice(O,P)else print("Mic Device not found:",O)end end})p:AddDropdown({Name="Set Output Device",Default="",Options=E,Callback=function(O)local Q=t[O]if Q then b:SetSpeakerDevice(tostring(O),tostring(Q))end end})local r=p:AddSection({Name=" // Voice Toggles"})p:AddToggle({Name="Click to Select",Default=false,Callback=function(R)w.ClickToSelect=R;if w.ClickToSelect then a:MakeNotification({Name="Eazvy Hub - Success",Content='Click-to Select has been enabled; Keybind: CTRL + Click',Image="rbxassetid://4914902889",Time=10})end end})p:AddToggle({Name="Hear Anywhere",Default=false,Callback=function(R)if R==true then local S,T=game:GetService("SoundService"),game.Players.LocalPlayer;local U=T.Character or T.CharacterAdded:Wait()local V=U:WaitForChild("HumanoidRootPart")local W=Instance.new("Part",workspace)W.Name,W.Size,W.Anchored,W.CanCollide,W.Transparency,W.CFrame="SoundInf",Vector3.new(10e10,10e10,10e10),true,false,1,V.CFrame;S:SetListener(Enum.ListenerType.ObjectPosition,W)elseif workspace:FindFirstChild("SoundInf")and not R then workspace.SoundInf:Destroy()game:GetService("SoundService"):SetListener(Enum.ListenerType.Camera)end end})p:AddToggle({Name="Spy",Default=false,Callback=function(R)w.Spy=R;if w.Spy then a:MakeNotification({Name="Eazvy Hub - Success",Content="Spying on "..w.Player.DisplayName.." @"..w.Player.Name,Image="rbxassetid://4914902889",Time=3})game:GetService("SoundService"):SetListener(Enum.ListenerType.ObjectPosition,w.Player.Character.HumanoidRootPart)local X=Instance.new("Part",game.Lighting)X.Name="nigga3"elseif not w.Spy and game.Lighting:FindFirstChild("nigga3")then game:GetService("SoundService"):SetListener(Enum.ListenerType.Camera)end end})p:AddToggle({Name="Dark Mode",Callback=function(R)w.DarkMode=R;if w.DarkMode then local X=Instance.new("Part",game.Lighting)X.Name="NiggaDArk"if game.Players.LocalPlayer.PlayerGui:FindFirstChild("BubbleChat")then game.Players.LocalPlayer.PlayerGui:FindFirstChild("BubbleChat"):Destroy()end;game.Chat.BubbleChatEnabled=true;local Y={BubbleDuration=15,MaxBubbles=3,BackgroundColor3=Color3.fromRGB(1,1,1),TextColor3=Color3.fromRGB(255,255,255),TextSize=16,Font=Enum.Font.GothamSemibold,Transparency=.1,CornerRadius=UDim.new(0,12),TailVisible=true,Padding=8,MaxWidth=300,VerticalStudsOffset=0,BubblesSpacing=6,MinimizeDistance=40,MaxDistance=100}pcall(function()game:GetService("Chat"):SetBubbleChatSettings(Y)end)elseif game.Lighting:FindFirstChild("NiggaDArk")then game.Chat.BubbleChatEnabled=true;local Y={BubbleDuration=15,MaxBubbles=3,BackgroundColor3=Color3.fromRGB(255,255,255),TextColor3=Color3.fromRGB(1,1,1),TextSize=16,Font=Enum.Font.GothamSemibold,Transparency=.1,CornerRadius=UDim.new(0,12),TailVisible=true,Padding=8,MaxWidth=300,VerticalStudsOffset=0,BubblesSpacing=6,MinimizeDistance=40,MaxDistance=100}pcall(function()game:GetService("Chat"):SetBubbleChatSettings(Y)end)end;if not w.DarkMode and game.Lighting:FindFirstChild("NiggaDArk")then for g,h in pairs(game:GetService("CoreGui").ExperienceChat.bubbleChat:GetChildren())do if h:IsA("BillboardGui")then if h:FindFirstChild("PlayerButtons")then h.PlayerButtons.BackgroundColor3=Color3.fromRGB(255,255,255)h.PlayerButtons.Carat.ImageColor3=Color3.fromRGB(255,255,255)end end end;game.Lighting.NiggaDArk:Destroy()end;while w.DarkMode do task.wait()task.spawn(function()for g,h in pairs(game.Players.LocalPlayer.PlayerGui.BubbleChat:GetChildren())do if h:IsA("BillboardGui")and h:FindFirstChild("BillboardFrame")and h.BillboardFrame:FindFirstChild("SmallTalkBubble")then h.BillboardFrame.SmallTalkBubble.ChatBubbleTailFrame.BackgroundColor3=Color3.fromRGB(255,255,255)end end end)for g,h in pairs(game:GetService("CoreGui").ExperienceChat.bubbleChat:GetChildren())do if h:IsA("BillboardGui")then if h:FindFirstChild("PlayerButtons")then h.PlayerButtons.BackgroundColor3=Color3.fromRGB(1,1,1)h.PlayerButtons.Carat.ImageColor3=Color3.fromRGB(1,1,1)end end end end end})local function x()if c:IsVoiceEnabledForUserIdAsync(game:GetService("Players").LocalPlayer.UserId)then return true else return false end end;if not x()then game:GetService("Players").LocalPlayer:Kick("no voice chat bye nigga oopss!!")return end;local function Z(_)if not _:FindFirstChild("Highlight")and w.Highlight then local a0=Instance.new("Highlight")a0.Parent=_;a0.FillColor=Color3.fromRGB(255,0,0)a0.OutlineColor=Color3.fromRGB(255,0,0)else local a0=_:FindFirstChild("Highlight")if a0 then a0:Destroy()end end end;local function a1(T)local _=T.Character;if _ then Z(_)end;T.CharacterAdded:Connect(function(_)if w.Highlight and _ and not _:GetAttribute("Highlight")then _:SetAttribute("Highlight",true)Z(_)end end)end;local function a2()s={}for g,a3 in pairs(b:GetParticipants())do local a4=game:GetService("Players"):GetNameFromUserIdAsync(a3)local T=game:GetService("Players")[tostring(a4)]if T then table.insert(s,T)end end end;p:AddToggle({Name="Highlight VC Players",Callback=function(R)w.Highlight=R;task.spawn(function()a2()for g,T in ipairs(s)do a1(T)end end)end})p:AddToggle({Name="Speaking Notifications",Callback=function(R)if w.SpeakNotifications and not w.Highlight then l("Highlight VC Players","is not toggled this will not work!")return end;w.SpeakNotifications=R end})p:AddToggle({Name="Highlight Self",Callback=function(R)w.HighlightSelf=R;a1(game.Players.LocalPlayer)end})p:AddToggle({Name="Mute All",Callback=function(R)b:SubscribePauseAll(R)end})p:AddToggle({Name="Mute/Unmute",Callback=function(R)b:PublishPause(R)end})p:AddToggle({Name="Leave/Join",Callback=function(R)w.Toggle=R;if w.Toggle then b:Leave()local X=Instance.new("Part",game.Lighting)X.Name="Left"elseif game.Lighting:FindFirstChild("Left")and not w.Toggle then b:JoinByGroupIdToken("default",false,game:DefineFastFlag("DebugDefaultChannelStartMuted",true))end end})q:AddBind({Name="Toggle UI",Default=Enum.KeyCode.Q,Hold=false,Callback=function()local a5=game:GetService("CoreGui"):FindFirstChild(_G.UIName or"Orion")if a5 and a5.Enabled then a5.Enabled=false elseif a5 then a5.Enabled=true end end})game:GetService("UserInputService").InputBegan:connect(function(a6,a7)if a6.UserInputType==Enum.UserInputType.MouseButton1 and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl)and w.ClickToSelect then local a8=game.Players.LocalPlayer:GetMouse().Target;if a8 and a8.Parent then local a9=game.Players:GetPlayerFromCharacter(a8.Parent)if a9 and a9~=game.Players.LocalPlayer and w.ClickToSelect then if w.Player~=a9 then m("Selected:",a9.Name)else l(a9.Name,"has already been selected!")end;w.Player=a9 end end end end)b.PlayerMicActivitySignalChange:Connect(function(aa)local ab=aa.isActive;if w.HighlightSelf and game.Players.LocalPlayer and ab and game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Highlight")then game.Players.LocalPlayer.Character:FindFirstChildOfClass("Highlight").FillColor=Color3.fromRGB(0,255,0)game.Players.LocalPlayer.Character:FindFirstChildOfClass("Highlight").OutlineColor=Color3.fromRGB(0,255,0)elseif w.HighlightSelf and not ab and game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Highlight")then game.Players.LocalPlayer.Character:FindFirstChildOfClass("Highlight").FillColor=Color3.fromRGB(255,0,0)game.Players.LocalPlayer.Character:FindFirstChildOfClass("Highlight").OutlineColor=Color3.fromRGB(255,0,0)end end)local function I(f)for g,h in pairs(game.Players:GetChildren())do if h.UserId==f then return h end end end;b.ParticipantsStateChanged:Connect(function(ac,ad,ae)for z,h in pairs(ae)do local a3=h.userId;local ab=h.isSignalActive;local af=os.time()local ag=I(a3)if ag and ab and ag and ag.Character and ag.Character:FindFirstChild("Highlight")then ag.Character:FindFirstChildOfClass("Highlight").FillColor=Color3.fromRGB(0,255,0)ag.Character:FindFirstChildOfClass("Highlight").OutlineColor=Color3.fromRGB(0,255,0)elseif w.SpeakNotifications and not ab and ag and ag.Character and ag.Character:FindFirstChild("Highlight")then ag.Character:FindFirstChildOfClass("Highlight").FillColor=Color3.fromRGB(255,0,0)ag.Character:FindFirstChildOfClass("Highlight").OutlineColor=Color3.fromRGB(255,0,0)end end end)game.Players.PlayerAdded:Connect(function(T)if w.Highlight then a1(T)end end)
