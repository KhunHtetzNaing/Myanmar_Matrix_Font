Type=Activity
Version=6.8
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: False
#End Region

Sub Process_Globals
	Dim ti,tr As Timer
	Dim ist,rst As Timer
End Sub

Sub Globals
	Dim ph As Phone
	Dim OS As String
	Dim b1,b2,b3,b4 As Button
	Dim b1bg,b2bg,b3bg,b4bg As ColorDrawable
	Dim ml As MLfiles
	
	Dim lb,lw As Label
	Dim mm As Typeface : mm = mm.LoadFromAssets("matrix.ttf")
	Dim ml As MLfiles
	Dim rooot As String
	
	Dim tb As Label
	Dim share,About As Button
	Dim sbg,abg As BitmapDrawable
	
	Dim B As AdView
	Dim I As InterstitialAd
End Sub

Sub Activity_Create(FirstTime As Boolean)
	Activity.Color = Colors.White
	tb.Initialize("")
	tb.Color = Colors.rgb(0, 150, 136)
	tb.Text = "All Android[#Root]"
	tb.TextColor = Colors.White
	tb.TextSize = 20
	tb.Gravity = Gravity.CENTER
	tb.Typeface = Typeface.DEFAULT_BOLD
	Activity.AddView(tb,0%x,0%y,100%x,55dip)
	
	About.Initialize("about")
	abg.Initialize(LoadBitmap(File.DirAssets,"about.png"))
	About.Background = abg
	About.Gravity = Gravity.FILL
	Activity.AddView(About,10dip,12.5dip,30dip,30dip)
	
	share.Initialize("share")
	sbg.Initialize(LoadBitmap(File.DirAssets,"share.png"))
	share.Background = sbg
	share.Gravity = Gravity.FILL
	Activity.AddView(share,100%x-40dip,12.5dip,30dip,30dip)
	
	Select ph.SdkVersion
		Case 2 : OS = "1.1"
		Case 3 : OS = "1.5"
		Case 4 : OS = "1.6"
		Case 5 : OS = "2.0"
		Case 6 : OS = "2.0.1"
		Case 7 : OS = "2.1"
		Case 8 : OS = "2.2"
		Case 9 : OS = "2.3 - 2.3.2"
		Case 10 : OS = "	2.3.3 - 2.3.7" ' 2.3.3 or 2.3.4
		Case 11 : OS = "3.0"
		Case 12 : OS = "3.1"
		Case 13 : OS = "3.2"
		Case 14 : OS = "	4.0.1 - 4.0.2"
		Case 15 : OS = "4.0.3 - 4.0.4"
		Case 16 : OS = "	4.1.x"
		Case 17 : OS = "	4.2.x"
		Case 18 : OS = 	"4.3.x"
		Case 19 : OS = "	4.4 - 4.4.4"
		Case 21: OS = "5.0"
		Case 22: OS = "5.1"
		Case 23: OS = "6.0"
		Case 24 : OS = "	7.0"
		Case 25 : OS = "	7.1"
		Case Else : OS = "?"
	End Select
	
	ml.GetRoot
	If ml.HaveRoot Then
		rooot = "Rooted"
	Else
		rooot = "Unroot"
	End If
	
	lw.Initialize("")
	lw.Text = "မည္သည့္ Android ဖုန္းကိုမဆို ျမန္မာစာထည့္သြင္းေပးနိုင္သည္။ :)"
	lw.TextColor = Colors.Red
	lw.Gravity = Gravity.CENTER
	lw.Typeface = mm
	Activity.AddView(lw,1%x,55dip,100%x,50dip)
	
	lb.Initialize("lb")
	lb.Gravity = Gravity.CENTER
	lb.Text = "Brand Name : " & ph.Manufacturer & CRLF & "Device Name : " & ph.Model & CRLF & "Android Version : " & OS & CRLF & "Root Status : " & rooot
	Activity.AddView(lb,0%x,(lw.Height+lw.Top)+1%y,100%x,100dip)
	lb.TextColor = Colors.Black
	lb.Typeface = mm
	
	b1bg.Initialize(Colors.rgb(33, 150, 243),15)
	b1.Initialize("b1")
	b1.TextSize = 15
	b1.Text = "ထည့္သြင္းမည္"
	b1.Typeface = mm
	b1.Background = b1bg
	Activity.AddView(b1,50%x-100dip,lb.Height+lb.Top+7dip,200dip,50dip)
	
	b2bg.Initialize(Colors.Black,15)
	b2.Initialize("b2")
	b2.Text = "မူလအတိုင္းျပန္လည္ထားရွိမည္"
	b2.TextSize = 15
	b2.Typeface = mm
	b2.Background = b2bg
	Activity.AddView(b2,50%x-100dip,b1.Top+b1.Height+7dip,200dip,50dip)
	
	b3bg.Initialize(Colors.rgb(233, 30, 99),15)
	b3.Initialize("b3")
	b3.Text = "ထည့္သြင္းအသုံးျပုနည္း"
	b3.Typeface = mm
	b3.TextSize = 15
	b3.Background = b3bg
	Activity.AddView(b3,50%x-100dip,b2.Top+b2.Height+7dip,200dip,50dip)
	
	b4bg.Initialize(Colors.rgb(63, 81, 181),15)
	b4.Initialize("b4")
	b4.Text = "အျခား App မ်ားရယူရန္"
	b4.TextSize = 15
	b4.Background = b4bg
	b4.Typeface = mm
	Activity.AddView(b4,50%x-100dip,b3.Top+b3.Height+7dip,200dip,50dip)
	
	
	ti.Initialize("ti",100)
	ti.Enabled = False
	tr.Initialize("tr",100)
	tr.Enabled = False
	
	ist.Initialize("ist",5000)
	ist.Enabled = False
	rst.Initialize("rst",5000)
	rst.Enabled = False
	
	B.Initialize("B","ca-app-pub-4173348573252986/5011893350")
	Dim height As Int
	If GetDeviceLayoutValues.ApproximateScreenSize < 6 Then
		If 100%x > 100%y Then height = 32dip Else height = 50dip
	Else
		height = 90dip
	End If
	Activity.AddView(B, 0dip, 100%y - height, 100%x, height)
	B.LoadAd
	Log(B)
	
	I.Initialize("I","ca-app-pub-4173348573252986/6488626550")
	I.LoadAd
End Sub

Sub b1_Click
	ml.GetRoot
	If ml.HaveRoot Then
		File.Copy(File.DirAssets,"Matrix.ttf",File.DirRootExternal,"MyanmarHeart.ttf")
		ProgressDialogShow("Installing...")
		ti.Enabled = True
	Else
		Msgbox("Your device not have Root Access!","Attention!")
	End If
End Sub

Sub ti_Tick
	ml.RootCmd("mount -o rw,remount /system","",Null,Null,False)
	If ml.Exists("/system/Ht3tzN4ing.ttf") = False Then
		ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/Ht3tzN4ing.ttf","",Null,Null,False)
		'Padauk
		If ml.Exists("/system/fonts/Padauk.ttf") = True Then
			ml.mv("/system/fonts/Padauk.ttf","/system/fonts/Padauk.ttf.bak")
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/Padauk.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/Padauk.ttf",644)
		End If
		
		'Padauk-book
		If ml.Exists("/system/fonts/Padauk-book.ttf") = True Then
			ml.mv("/system/fonts/Padauk-book.ttf","/system/fonts/Padauk-book.ttf.bak")
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/Padauk-book.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/Padauk-book.ttf",644)
		End If
		
		'Padauk-bookbold
		If ml.Exists("/system/fonts/Padauk-bookbold.ttf") = True Then
			ml.mv("/system/fonts/Padauk-bookbold.ttf","/system/fonts/Padauk-bookbold.ttf.bak")
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/Padauk-bookbold.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/Padauk-bookbold.ttf",644)
		End If
		
		'NotoSansMyanmar-Bold
		If ml.Exists("/system/fonts/NotoSansMyanmar-Bold.ttf") = True Then
			ml.mv("/system/fonts/NotoSansMyanmar-Bold.ttf","/system/fonts/NotoSansMyanmar-Bold.ttf.bak")
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/NotoSansMyanmar-Bold.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/NotoSansMyanmar-Bold.ttf",644)
		End If
		
		'NotoSansMyanmar-Regular
		If ml.Exists("/system/fonts/NotoSansMyanmar-Regular.ttf") = True Then
			ml.mv("/system/fonts/NotoSansMyanmar-Regular.ttf","/system/fonts/NotoSansMyanmar-Regular.ttf.bak")
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/NotoSansMyanmar-Regular.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/NotoSansMyanmar-Regular.ttf",644)
		End If
		
		'NotoSansMyanmarUI-Bold
		If ml.Exists("/system/fonts/NotoSansMyanmarUI-Bold.ttf") = True Then
			ml.mv("/system/fonts/NotoSansMyanmarUI-Bold.ttf","/system/fonts/NotoSansMyanmarUI-Bold.ttf.bak")
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/NotoSansMyanmarUI-Bold.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/NotoSansMyanmarUI-Bold.ttf",644)
		End If
		
		'NotoSansMyanmarUI-Regular
		If ml.Exists("/system/fonts/NotoSansMyanmarUI-Regular.ttf") = True Then
			ml.mv("/system/fonts/NotoSansMyanmarUI-Regular.ttf","/system/fonts/NotoSansMyanmarUI-Regular.ttf.bak")
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/NotoSansMyanmarUI-Regular.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/NotoSansMyanmarUI-Regular.ttf",644)
			
		End If
		
		'NotoSansMyanmarZawgyi-Bold
		If ml.Exists("/system/fonts/NotoSansMyanmarZawgyi-Bold.ttf") = True Then
			ml.mv("/system/fonts/NotoSansMyanmarZawgyi-Bold.ttf","/system/fonts/NotoSansMyanmarZawgyi-Bold.ttf.bak")
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/NotoSansMyanmarZawgyi-Bold.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/NotoSansMyanmarZawgyi-Bold.ttf",644)
		End If
		
		'NotoSansMyanmarZawgyi-Regular
		If ml.Exists("/system/fonts/NotoSansMyanmarZawgyi-Regular.ttf") = True Then
			ml.mv("/system/fonts/NotoSansMyanmarZawgyi-Regular.ttf","/system/fonts/NotoSansMyanmarZawgyi-Regular.ttf.bak")
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/NotoSansMyanmarZawgyi-Regular.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/NotoSansMyanmarZawgyi-Regular.ttf",644)
		End If
		
		'SamsungMyanmar
		If ml.Exists("/system/fonts/SamsungMyanmar.ttf") = True Then
			ml.mv("/system/fonts/SamsungMyanmar.ttf","/system/fonts/SamsungMyanmar.ttf.bak")
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/SamsungMyanmar.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/SamsungMyanmar.ttf",644)
		End If
		
		'ZawgyiOne
		If ml.Exists("/system/fonts/ZawgyiOne.ttf") = True Then
			ml.mv("/system/fonts/ZawgyiOne.ttf","/system/fonts/ZawgyiOne.ttf.bak")
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/ZawgyiOne.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/ZawgyiOne.ttf",644)
		End If
	
		'ZawgyiOne2008
		If ml.Exists("/system/fonts/ZawgyiOne2008.ttf") = True Then
			ml.mv("/system/fonts/ZawgyiOne2008.ttf","/system/fonts/ZawgyiOne2008.ttf.bak")
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/ZawgyiOne2008.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/ZawgyiOne2008.ttf",644)
		End If
		
		'mmsd
		If ml.Exists("/system/fonts/mmsd.ttf") = True Then
			ml.mv("/system/fonts/mmsd.ttf","/system/fonts/mmsd.ttf.bak")
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/mmsd.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/mmsd.ttf",644)
		End If
	
		'Roboto
		If ml.Exists("/system/fonts/Roboto-Regular.ttf") = True Then
			ml.mv("/system/fonts/Roboto-Regular.ttf","/system/fonts/Roboto-Regular.ttf.bak")
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/Roboto-Regular.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/Roboto-Regular.ttf",644)
		End If
			
		If ml.Exists("/system/fonts/Roboto-Light.ttf") = True Then
			ml.mv("/system/fonts/Roboto-Light.ttf","/system/fonts/Roboto-Light.ttf.bak")
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/Roboto-Light.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/Roboto-Light.ttf",644)
		End If
			
		If ml.Exists("/system/fonts/Roboto-Bold.ttf") = True Then
			ml.mv("/system/fonts/Roboto-Bold.ttf","/system/fonts/Roboto-Bold.ttf.bak")
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/Roboto-Bold.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/Roboto-Bold.ttf",644)
		End If
		'INSTALLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
		ist.Enabled = True
		ti.Enabled = False
		
	Else
		'JGKLDJEIGUEOPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPJ
		'Padauk
		If ml.Exists("/system/fonts/Padauk.ttf") = True Then
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/Padauk.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/Padauk.ttf",644)
		End If
		
		'Padauk-book
		If ml.Exists("/system/fonts/Padauk-book.ttf") = True Then
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/Padauk-book.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/Padauk-book.ttf",644)
		End If
		
		'Padauk-bookbold
		If ml.Exists("/system/fonts/Padauk-bookbold.ttf") = True Then
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/Padauk-bookbold.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/Padauk-bookbold.ttf",644)
		End If
		
		'NotoSansMyanmar-Bold
		If ml.Exists("/system/fonts/NotoSansMyanmar-Bold.ttf") = True Then
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/NotoSansMyanmar-Bold.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/NotoSansMyanmar-Bold.ttf",644)
		End If
		
		'NotoSansMyanmar-Regular
		If ml.Exists("/system/fonts/NotoSansMyanmar-Regular.ttf") = True Then
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/NotoSansMyanmar-Regular.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/NotoSansMyanmar-Regular.ttf",644)
		End If
		
		'NotoSansMyanmarUI-Bold
		If ml.Exists("/system/fonts/NotoSansMyanmarUI-Bold.ttf") = True Then
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/NotoSansMyanmarUI-Bold.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/NotoSansMyanmarUI-Bold.ttf",644)
		End If
		
		'NotoSansMyanmarUI-Regular
		If ml.Exists("/system/fonts/NotoSansMyanmarUI-Regular.ttf") = True Then
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/NotoSansMyanmarUI-Regular.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/NotoSansMyanmarUI-Regular.ttf",644)
			
		End If
		
		'NotoSansMyanmarZawgyi-Bold
		If ml.Exists("/system/fonts/NotoSansMyanmarZawgyi-Bold.ttf") = True Then
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/NotoSansMyanmarZawgyi-Bold.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/NotoSansMyanmarZawgyi-Bold.ttf",644)
		End If
		
		'NotoSansMyanmarZawgyi-Regular
		If ml.Exists("/system/fonts/NotoSansMyanmarZawgyi-Regular.ttf") = True Then
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/NotoSansMyanmarZawgyi-Regular.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/NotoSansMyanmarZawgyi-Regular.ttf",644)
		End If
		
		'SamsungMyanmar
		If ml.Exists("/system/fonts/SamsungMyanmar.ttf") = True Then
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/SamsungMyanmar.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/SamsungMyanmar.ttf",644)
		End If
		
		'ZawgyiOne
		If ml.Exists("/system/fonts/ZawgyiOne.ttf") = True Then
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/ZawgyiOne.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/ZawgyiOne.ttf",644)
		End If
	
		'ZawgyiOne2008
		If ml.Exists("/system/fonts/ZawgyiOne2008.ttf") = True Then
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/ZawgyiOne2008.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/ZawgyiOne2008.ttf",644)
		End If
		
		'mmsd
		If ml.Exists("/system/fonts/mmsd.ttf") = True Then
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/mmsd.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/mmsd.ttf",644)
		End If
	
		'Roboto
		If ml.Exists("/system/fonts/Roboto-Regular.ttf") = True Then
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/Roboto-Regular.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/Roboto-Regular.ttf",644)
		End If
			
		If ml.Exists("/system/fonts/Roboto-Light.ttf") = True Then
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/Roboto-Light.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/Roboto-Light.ttf",644)
		End If
			
		If ml.Exists("/system/fonts/Roboto-Bold.ttf") = True Then
			ml.RootCmd("cp -r /sdcard/MyanmarHeart.ttf /system/fonts/Roboto-Bold.ttf","",Null,Null,False)
			ml.chmod("/system/fonts/Roboto-Bold.ttf",644)
		End If
		'INSTALLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
		ist.Enabled = True
		ti.Enabled = False
	End If
End Sub
		
Sub ist_Tick
	ProgressDialogHide
	Msgbox("Congratulations! Myanmar Installed in your device" & CRLF& "Now, your device will be reboot!","Completed")
	ml.GetRoot
	If ml.HaveRoot Then
		ml.RootCmd("reboot","",Null,Null,False)
	End If
	ist.Enabled = False
End Sub

Sub b2_Click
	ml.GetRoot
	If ml.HaveRoot Then
		ProgressDialogShow("Please Wait...")
		tr.Enabled = True
	Else
		Msgbox("Your device not have Root Access!","Attention!")
	End If
End Sub

Sub tr_Tick
	ml.RootCmd("mount -o rw,remount /system","",Null,Null,False)
	'INSTALLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
	'Padauk
	If ml.Exists("/system/fonts/Padauk.ttf.bak") = True Then
		ml.rm("/system/fonts/Padauk.ttf")
		ml.mv("/system/fonts/Padauk.ttf.bak","/system/fonts/Padauk.ttf")
		ml.chmod("/system/fonts/Padauk.ttf",644)
	End If
		
	'Padauk-book
	If ml.Exists("/system/fonts/Padauk-book.ttf.bak") = True Then
		ml.rm("/system/fonts/Padauk-book.ttf")
		ml.mv("/system/fonts/Padauk-book.ttf.bak","/system/fonts/Padauk-book.ttf")
		ml.chmod("/system/fonts/Padauk-book.ttf",644)
	End If
		
	'Padauk-bookbold
	If ml.Exists("/system/fonts/Padauk-bookbold.ttf.bak") = True Then
		ml.rm("/system/fonts/Padauk-bookbold.ttf")
		ml.mv("/system/fonts/Padauk-bookbold.ttf.bak","/system/fonts/Padauk-bookbold.ttf")
		ml.chmod("/system/fonts/Padauk-bookbold.ttf",644)
	End If
		
	'NotoSansMyanmar-Bold
	If ml.Exists("/system/fonts/NotoSansMyanmar-Bold.ttf.bak") = True Then
		ml.rm("/system/fonts/NotoSansMyanmar-Bold.ttf")
		ml.mv("/system/fonts/NotoSansMyanmar-Bold.ttf.bak","/system/fonts/NotoSansMyanmar-Bold.ttf")
		ml.chmod("/system/fonts/NotoSansMyanmar-Bold.ttf",644)
	End If
		
	'NotoSansMyanmar-Regular
	If ml.Exists("/system/fonts/NotoSansMyanmar-Regular.ttf.bak") = True Then
		ml.rm("/system/fonts/NotoSansMyanmar-Regular.ttf")
		ml.mv("/system/fonts/NotoSansMyanmar-Regular.ttf.bak","/system/fonts/NotoSansMyanmar-Regular.ttf")
		ml.chmod("/system/fonts/NotoSansMyanmar-Regular.ttf",644)
	End If
		
	'NotoSansMyanmarUI-Bold
	If ml.Exists("/system/fonts/NotoSansMyanmarUI-Bold.ttf.bak") = True Then
		ml.rm("/system/fonts/NotoSansMyanmarUI-Bold.ttf")
		ml.mv("/system/fonts/NotoSansMyanmarUI-Bold.ttf.bak","/system/fonts/NotoSansMyanmarUI-Bold.ttf")
		ml.chmod("/system/fonts/NotoSansMyanmarUI-Bold.ttf",644)
	End If
		
	'NotoSansMyanmarUI-Regular
	If ml.Exists("/system/fonts/NotoSansMyanmarUI-Regular.ttf.bak") = True Then
		ml.rm("/system/fonts/NotoSansMyanmarUI-Regular.ttf")
		ml.mv("/system/fonts/NotoSansMyanmarUI-Regular.ttf.bak","/system/fonts/NotoSansMyanmarUI-Regular.ttf")
		ml.chmod("/system/fonts/NotoSansMyanmarUI-Regular.ttf",644)
	End If
		
	'NotoSansMyanmarZawgyi-Bold
	If ml.Exists("/system/fonts/NotoSansMyanmarZawgyi-Bold.ttf.bak") = True Then
		ml.rm("/system/fonts/NotoSansMyanmarZawgyi-Bold.ttf")
		ml.mv("/system/fonts/NotoSansMyanmarZawgyi-Bold.ttf.bak","/system/fonts/NotoSansMyanmarZawgyi-Bold.ttf")
		ml.chmod("/system/fonts/NotoSansMyanmarZawgyi-Bold.ttf",644)
	End If
		
	'NotoSansMyanmarZawgyi-Regular
	If ml.Exists("/system/fonts/NotoSansMyanmarZawgyi-Regular.ttf.bak") = True Then
		ml.rm("/system/fonts/NotoSansMyanmarZawgyi-Regular.ttf")
		ml.mv("/system/fonts/NotoSansMyanmarZawgyi-Regular.ttf.bak","/system/fonts/NotoSansMyanmarZawgyi-Regular.ttf")
		ml.chmod("/system/fonts/NotoSansMyanmarZawgyi-Regular.ttf",644)
	End If
		
	'SamsungMyanmar
	If ml.Exists("/system/fonts/SamsungMyanmar.ttf.bak") = True Then
		ml.rm("/system/fonts/SamsungMyanmar.ttf")
		ml.mv("/system/fonts/SamsungMyanmar.ttf.bak","/system/fonts/SamsungMyanmar.ttf")
		ml.chmod("/system/fonts/SamsungMyanmar.ttf",644)
	End If
		
	'ZawgyiOne
	If ml.Exists("/system/fonts/ZawgyiOne.ttf.bak") = True Then
		ml.rm("/system/fonts/ZawgyiOne.ttf")
		ml.mv("/system/fonts/ZawgyiOne.ttf.bak","/system/fonts/ZawgyiOne.ttf")
		ml.chmod("/system/fonts/ZawgyiOne.ttf",644)
	End If
	
	'ZawgyiOne2008
	If ml.Exists("/system/fonts/ZawgyiOne2008.ttf.bak") = True Then
		ml.rm("/system/fonts/ZawgyiOne2008.ttf")
		ml.mv("/system/fonts/ZawgyiOne2008.ttf.bak","/system/fonts/ZawgyiOne2008.ttf")
		ml.chmod("/system/fonts/ZawgyiOne2008.ttf",644)
	End If
		
	'mmsd
	If ml.Exists("/system/fonts/mmsd.ttf.bak") = True Then
		ml.rm("/system/fonts/mmsd.ttf")
		ml.mv("/system/fonts/mmsd.ttf.bak","/system/fonts/mmsd.ttf")
		ml.chmod("/system/fonts/mmsd.ttf",644)
	End If
	
	'Roboto
	If ml.Exists("/system/fonts/Roboto-Bold.ttf.bak") = True Then
		ml.rm("/system/fonts/Roboto-Bold.ttf")
		ml.mv("/system/fonts/Roboto-Bold.ttf.bak","/system/fonts/Roboto-Bold.ttf")
		ml.chmod("/system/fonts/Roboto-Bold.ttf",644)
	End If
		
	If ml.Exists("/system/fonts/Roboto-Light.ttf.bak") = True Then
		ml.rm("/system/fonts/Roboto-Light.ttf")
		ml.mv("/system/fonts/Roboto-Light.ttf.bak","/system/fonts/Roboto-Light.ttf")
		ml.chmod("/system/fonts/Roboto-Light.ttf",644)
	End If
		
	If ml.Exists("/system/fonts/Roboto-Regular.ttf.bak") = True Then
		ml.rm("/system/fonts/Roboto-Regular.ttf")
		ml.mv("/system/fonts/Roboto-Regular.ttf.bak","/system/fonts/Roboto-Regular.ttf")
		ml.chmod("/system/fonts/Roboto-Regular.ttf",644)
	End If
	
	If ml.Exists("/system/Ht3tzN4ing.ttf") = True Then
		ml.rm("/system/Ht3tzN4ing.ttf")
	End If
	'INSTALLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
	rst.Enabled = True
	tr.Enabled = False
End Sub

Sub rst_Tick
	ml.GetRoot
	If ml.HaveRoot Then
		ProgressDialogHide
		Msgbox("Congratulations! Original Restored" & CRLF& "Now, your device will be reboot!","Completed")
		ml.RootCmd("reboot","",Null,Null,False)
	Else
		Msgbox("Your device not have Root Access!","Attention!")
	End If
	rst.Enabled = False
End Sub

Sub b3_Click
	StartActivity(Guide)
	If I.Ready Then I.Show Else I.LoadAd
End Sub

Sub b4_Click
	Dim pb As PhoneIntents
	StartActivity(pb.OpenBrowser("http://www.myanmarandroidapp.com/p/we-apps.html"))
	If I.Ready Then I.Show Else I.LoadAd
End Sub


'Banner Ads
Sub B_FailedToReceiveAd (ErrorCode As String)
	Log("B failed: " & ErrorCode)
End Sub
Sub B_ReceiveAd
	Log("B received")
End Sub

Sub B_AdScreenDismissed
	Log("B Dismissed")
End Sub

'Interstitial Ads
Sub I_AdClosed
	I.LoadAd
End Sub

Sub I_ReceiveAd
	Log("I Received")
End Sub

Sub I_FailedToReceiveAd (ErrorCode As String)
	Log("I not Received - " &"Error Code: "&ErrorCode)
	I.LoadAd
End Sub

Sub I_adopened
	Log("I Opened")
	I.LoadAd
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub


Sub about_Click
	StartActivity(Ab0ut)
End Sub

Sub share_Click
	Dim ShareIt As Intent
	Dim copy As BClipboard
	copy.clrText
	copy.setText("#MyanmarMatrixFont App! Beautiful Myanmar Zawgyi Font Style!	You can Use in Samung, Oppo,Vivo, Huawei (EMUI) and Xiaomi (MIUI) without Root Access!!!! Download Free at : http://www.MyanmarAndroidApp.com/search?q=Myanmar+Matrix+Font")
	ShareIt.Initialize (ShareIt.ACTION_SEND,"")
	ShareIt.SetType ("text/plain")
	ShareIt.PutExtra ("android.intent.extra.TEXT",copy.getText)
	ShareIt.PutExtra ("android.intent.extra.SUBJECT","Get Free!!")
	ShareIt.WrapAsIntentChooser("Share App Via...")
	StartActivity (ShareIt)
End Sub